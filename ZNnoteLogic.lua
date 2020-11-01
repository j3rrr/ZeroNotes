local _, ZN, L = ...

local specNames           = ZN.SpecNames
local regionString        = ZN.RegionString
local roleTable           = ZN.RoleTable
local classTable          = ZN.ClassTable


--##############################################################################
-- Callback functions for libGroupInspecT for updating/removing members

ZN.delayedUpdates = {}

function ZN:libInspectUpdate(event, GUID, unit, info)
  if not IsInGroup() then return end
  local specID = info.global_spec_id
  if specID == 0 then
      specID = nil
  end
  
  local talents = nil
  local talentsMap = {}
  if info.talents then
      for _,talentInfo in pairs(info.talents) do
          local index = (talentInfo.tier * 10) + talentInfo.column
          if not talents then
              talents = ""..index
          else
              talents = talents..","..index
          end
          
          talentsMap[index] = true
      end
  end
  
    memberInfo = {
      GUID = GUID,        
      specID = specID,
      talents = talents,
      talentsMap = talentsMap,
      name = info.name,
      class = info.class,
      classID = info.class_id,
    }
  
  if not self.delayedUpdates then
      self:addOrUpdateMember(memberInfo)
  else
      self.delayedUpdates[#self.delayedUpdates + 1] = memberInfo
  end
end

members = {}

function ZN:libInspectRemove(event, GUID)
  if not IsInGroup() then return end
  local member = self.members[GUID]
  if not member then
      return
  end
  
  for _,watchInfo in pairs(member.watching) do
      self:unwatch(watchInfo.spellInfo, member)
  end
  self.members[GUID] = nil
end

function ZN:handleDelayedUpdates()
  if not IsInGroup() then return end
  if self.delayedUpdates then
      for _,memberInfo in ipairs(self.delayedUpdates) do
          self:addOrUpdateMember(memberInfo)
      end
      self.delayedUpdates = nil
  end
end

ZN.inspectLib = LibStub:GetLibrary("LibGroupInSpecT-1.1", true)

ZN.inspectLib.RegisterCallback(ZN, "GroupInSpecT_Update", "libInspectUpdate")
ZN.inspectLib.RegisterCallback(ZN, "GroupInSpecT_Remove", "libInspectRemove")

function ZN:BuildRaidRoster()
  local RaidSize = GetNumGroupMembers()
  local RaidRoster = {}
  local unitprefix = "raid"

  if IsInGroup() and not IsInRaid() then
    unitprefix = "party"
  end

  if ZN.inspectLib then
    if RaidSize ~= 0 then
      local u = CreateFrame("Frame")
      for i = 1, RaidSize do
        unit = unitprefix..i       
        if i == RaidSize and not IsInRaid() then 
          unit = "player"
        end
        local GUID = UnitGUID(unit)
        if GUID then
          local info = ZN.inspectLib:GetCachedInfo(GUID)
          if info then
            ZN:libInspectUpdate("Init", GUID, unit, info)
          else
            ZN.inspectLib:Rescan(GUID)
          end
        end

        local tmp = {}
        if memberInfo.name then 
          tmp["name"] = memberInfo.name
        else
          ZN:Print("Group Inspect Error: Try /reload or wait until all Groupmembers are online")
          --UIErrorsFrame:AddMessage("Group Inspect not finished (names)", 0.8, 0.07, 0.2, 5.0)
          return
        end
        if memberInfo.specID then 
          tmp["class"] = classTable[memberInfo.specID]
          tmp["role"] = roleTable[memberInfo.specID]
        else
          ZN:Print("Group Inspect Error: Try /reload or wait until all Groupmembers are online")
          --UIErrorsFrame:AddMessage("Group Inspect not finished (class / role))", 0.8, 0.07, 0.2, 5.0)
          return
        end
        table.insert(RaidRoster, tmp)
      end
    end
  else
  ZN:Print("LibGroupInSpecT-1.1 not found")
  end
  return RaidRoster
end

function ZN:addPlayerToSpell(name, availableSpells, spellname)
  for i,spell in ipairs(availableSpells["spells"]) do
    if spell["name"] == spellname then
      table.insert(spell["player"] , {["name"] = name})
    end
  end  
end

function ZN:getAvailableSpells()
  local currentSetup = ZN:BuildRaidRoster()
  local db = ZNotes.PlayerSpells
  
  local availableSpells = {
    ["gesu"] = false,
    ["healpot"] = true,
    ["spells"] = {}
  }

  for i = 1, table.getn(currentSetup) do
    if currentSetup[i]["klasse"] == "warlock" then
      availableSpells["gesu"] = true
    else
      availableSpells["gesu"] = false
    end
  end
  
  local seen = {}

  for i,player in ipairs(currentSetup) do
    --if ( db[player["rolle"]] and db[player["rolle"]][player["klasse"]] ) then
      for _,spell in ipairs(db) do
        if player.role == spell.role and player.class == spell.class then
          local tmp = {}
          if seen[spell["name"]] then
            ZN:addPlayerToSpell(player["name"], availableSpells, spell["name"])
          else
            tmp = spell
            tmp["color"] = ZN.Colors[player.class]
            tmp["player"] = {}
            table.insert(tmp["player"], {["name"]= player["name"]})
            seen[spell["name"]] = true
          end
          if tmp["name"] then 
            table.insert(availableSpells["spells"], tmp)
          end
        end
      end      
    --end
  end
  return availableSpells
end

function ZN:createNoteTemplate(boss)
  local template = ZNotes.BossTemplates[boss]
  local noteTemplate = {
    ["bossid"] = template.bossid,
    ["spells"] = {}
  }

  if not template then
    ZN:Print("You need to choose a Boss / Raid")
  else
    for _,spell in ipairs(template) do
      if spell["trenner"] then
        table.insert(noteTemplate["spells"], spell)
      else
        tmp = {}
        for i = 1, spell["repeatX"] do
          tmp = table.copy(spell)
          --tmp["need"] = table.copy(spell["need"])
          tmp["time"] = spell["time"]+(spell["repeatAfter"]*(i-1))
          tmp["repeatX"] = nil
          tmp["repeatAfter"] = nil
          table.insert(noteTemplate["spells"], tmp)
        end      
      end
    end
  end
  return noteTemplate
end

function ZN:blockTimeframe(arr, spellalias, spellCd, time)
  if not arr["used"][spellalias] then
    arr["used"][spellalias] = {}
  end
  table.insert(arr["used"][spellalias], {["start"]= time, ["end"]= time+spellCd})
end

function ZN:isSpellAvailable(arr, spellalias, spellCd, time) 
  if not arr["used"][spellalias] then
    ZN:blockTimeframe(arr, spellalias, spellCd, time)
    return true
  else
    local isUsed = false
    
    for _,timeframe in ipairs(arr["used"][spellalias]) do
      if ( ( timeframe["start"] <= time and timeframe["end"] >= time ) or
      ( timeframe["start"] <= time+spellCd and timeframe["end"] >= time+spellCd ) ) then
        isUsed = true      
      end
    end

    if not isUsed then
      ZN:blockTimeframe(arr, spellalias, spellCd, time)
      return true
    end
  end
  return false
end

function ZN:createRawNote(boss)
  local RaidRoster = ZN:BuildRaidRoster()
  if RaidRoster == nil then
    return
  end
  local availableSpells = ZN:getAvailableSpells()
  noteTemplate = ZN:createNoteTemplate(boss)

  prioNote = {
    ["bossid"] = noteTemplate.bossid,
    ["lines"] = {}
  }

  local spellsUsed = {
    ["used"] = {}
  }

  
  table.sort(noteTemplate["spells"], function(a,b) return a.prio > b.prio or (a.prio == b.prio and a.time < b.time) end)
  table.sort(availableSpells["spells"], function(a,b) return a.rating > b.rating end)

  local sortedPrioTemplate = noteTemplate["spells"]
  local sortedAvailableSpells = availableSpells["spells"]

  for _,spell in ipairs(sortedPrioTemplate) do
    if spell["trenner"] then
      table.insert(prioNote["lines"], spell)
    else
      for _,needs in ipairs(spell["need"]) do
        local spellSet = false
        for _,playerSpell in ipairs(sortedAvailableSpells) do
          for i = 1, table.getn(playerSpell["player"]) do
            if not spellSet then
              local tmpLine = {}
              local spellUseable = false
              if (spell["station"] == false and playerSpell["station"] == false) or spell["station"] == true then
                if needs["type"] == playerSpell["type"] then
                  if needs["type"] ~= "util" or spell["aoe"] == playerSpell["aoe"] then
                    spellUseable = true
                  end
                end
              end
              if spellUseable then
                --playerSpell["id"]
                local spellalias = playerSpell["id"].."_"..playerSpell["player"][i]["name"]
                spellUseable = ZN:isSpellAvailable(spellsUsed, spellalias, playerSpell["cd"], spell["time"])
              end
              if spellUseable then
                tmpLine.time = spell.time
                tmpLine.player = playerSpell.player[i].name
                tmpLine.color = playerSpell.color              
                tmpLine.playerSpellName = playerSpell.name
                tmpLine.playerSpellId = playerSpell.id
                tmpLine.bossSpellName = spell.name
                tmpLine.bossSpellId = spell.id
                table.insert(prioNote["lines"], tmpLine)
                spellSet = true
              end
            end
          end          
        end   
        if not spellSet then
          local tmp = {}
          tmp.time = spell.time
          tmp.bossSpellName = spell.name
          tmp.bossSpellId = spell.id
          tmp.missing = 'Missing: '..needs.type
          table.insert(prioNote["lines"], tmp)
        end
      end      
    end
  end
  
  table.sort(prioNote["lines"], function(a,b) return a.time < b.time end)
  return prioNote
end

function ZN:PrintNote(boss, inclMissing)
  rawNoteData = ZN:createRawNote(boss)  
  if rawNoteData == nil then
    return
  end

  local rtNote = "{id:"..rawNoteData.bossid.."}"
  local missingNote = ""

  for k = 1, table.getn(rawNoteData["lines"]) do
    if rawNoteData["lines"][k]["trenner"] then
      local convertedTime = ZN:SecondsToClock(rawNoteData["lines"][k]["time"])
      rtNote = rtNote.."\n\n{time:"..convertedTime.."} "..rawNoteData["lines"][k]["raidicon"].." ||cffff00ff"..rawNoteData["lines"][k]["text"].."||r "..rawNoteData["lines"][k]["raidicon"]
    --goto continue
    else
      if rawNoteData["lines"][k]["missing"] then
        local convertedTime = ZN:SecondsToClock(rawNoteData["lines"][k]["time"])
        missingNote = missingNote.."\n{time:"..convertedTime.."} {spell:"..rawNoteData["lines"][k]["bossSpellId"].."} -"..rawNoteData["lines"][k]["missing"].." "
      --goto continue
      else
        if (k == 1 or (k > 1 and rawNoteData["lines"][k-1]["missing"]) or ( k > 1 and (rawNoteData["lines"][k]["time"] ~= rawNoteData["lines"][k-1]["time"] or 
        rawNoteData["lines"][k]["bossSpellId"] ~= rawNoteData["lines"][k-1]["bossSpellId"]))) then
          local convertedTime = ZN:SecondsToClock(rawNoteData["lines"][k]["time"])
          rtNote = rtNote.."\n{time:"..convertedTime.."} {spell:"..rawNoteData["lines"][k]["bossSpellId"].."} -"
        end
        rtNote = rtNote.." ||cff"..rawNoteData["lines"][k]["color"]..rawNoteData["lines"][k]["player"].."||r{spell:"..rawNoteData["lines"][k]["playerSpellId"].."}"
        --::continue::
      end
    end
  end  

  if  inclMissing == true then
    rtNote = rtNote .. "\n\n\n" .. missingNote
  end
  return rtNote
end