local _, ZN, L = ...

local specNames           = ZN.SpecNames
local regionString        = ZN.RegionString
local roleTable           = ZN.RoleTable
local classTable          = ZN.ClassTable
local templateClassTable  = ZN.SpecIdToTemplateClass

-- lib / roster building code largely adapted from ZenTracker https://wago.io/r14U746B7
--[[ ##############################################################################
  Callback functions for libGroupInspecT for updating/removing members
############################################################################## --]]
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
  if not GUID or not self.members then return end
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
--[[ ##############################################################################
  Build Roster
############################################################################## --]]
function ZN:templateToRoster(group)
  local tmp = {}
  for i = 1, #ZNotes.GroupTemplates[group] do
    if ZNotes.GroupTemplates[group][i]["class"] ~= "zzz" and ZNotes.GroupTemplates[group][i]["spec"] ~= "empty" then
      local tmpObj = {}
      tmpObj["name"] = ZNotes.GroupTemplates[group][i]["name"]
      tmpObj["class"] = ZNotes.GroupTemplates[group][i]["class"]
      tmpObj["role"] = ZN.SpecsToRole[ZNotes.GroupTemplates[group][i]["class"]][ZNotes.GroupTemplates[group][i]["spec"]]
      if ZNotes.GroupTemplates[group][i]["spec"] == "diszi" then
        tmpObj["class"] = "diszi"
      end
      if ZNotes.GroupTemplates[group][i]["spec"] == "shadow" then
        tmpObj["class"] = "shadow"
      end
      table.insert( tmp,tmpObj )
    end
  end
  return tmp
end

function ZN:BuildRaidRosterGroupTemplate()
  if not IsInGroup() then
    ZN:Print("You need to join a group or raid")
    return
  end
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
          tmp["spec"] = templateClassTable[memberInfo.specID]
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

function ZN:BuildRaidRoster(group)
  if group ~= "Use Current Group" and ZNotes.GroupTemplates[group] then
    --znroster = ZN:templateToRoster(group)
    return ZN:templateToRoster(group)
  end
  local RaidSize = GetNumGroupMembers()
  local RaidRoster = {}
  local unitprefix = "raid"
  local unit = ""

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
--[[ ##############################################################################
  Spell Stuff
############################################################################## --]]
function ZN:addPlayerToSpell(name, availableSpells, spellname)
  for i,spell in ipairs(availableSpells["spells"]) do
    if spell["name"] == spellname then
      table.insert(spell["player"] , {["name"] = name})
    end
  end  
end

function ZN:getAvailableSpells(group)
  local currentSetup = ZN:BuildRaidRoster(group)
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
    for _,spell in ipairs(db) do
        if player.role == spell.role and player.class == spell.class then
          local tmp = {}
          -- if seen[spell["id"]..spell["role"]] then
          --   ZN:addPlayerToSpell(player["name"], availableSpells, spell["name"])
          -- else
            tmp = table.copy(spell)
            tmp["color"] = ZN.Colors[player.class]
            --tmp["player"] = {}
            tmp["PlayerName"] = player["name"]
            tmp.baseRating = tmp.rating
            --table.insert(tmp["player"], {["name"]= player["name"]})
            --seen[spell["id"]..spell["role"]] = true
          -- end
          --if tmp["name"] then 
            table.insert(availableSpells["spells"], tmp)
          --end
        end
      end      
  end
  return availableSpells
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

function ZN:ShiftSpellRatings(needs,sortedAvailableSpells)
  local role = needs.role and needs.role or nil
  local class = needs.class and needs.class or nil
  local value = needs.value and needs.value or nil
  local playername = needs.playername and needs.playername or nil
  local type = needs.type and needs.type or nil

  if role == "all" then role = nil end
  if class == "all" then class = nil end 
  if value == 0 then value = nil end 
  if playername =="" or playername =="all" then playername = nil end
  if playername and playername:lower()=="all" then playername = nil end
 
  

  --print("spell type: "..type..", role: ".. (role and role or "leer")..", class: "..(class and class or "leer")..", rating: "..(value and value or "leer"))
  for i,spell in pairs(sortedAvailableSpells) do 
    --print("player type: "..spell.type..", role: "..spell.role..", class: "..spell.class)
    if value and spell.type==type and
     (
       (role and not class and not playername and spell.role==role) or
       (class and not role and not playername and spell.class==class) or
       (class and role and not playername and spell.class==class and spell.role==role) or 
       (playername and not role and not class and spell.PlayerName==playername) or 
       (playername and role and not class and spell.PlayerName==playername and spell.role==role) or 
       (playername and not role and class and spell.PlayerName==playername and spell.class==class) or 
       (playername and  role and class and spell.PlayerName==playername and spell.class==class and spell.role==role)
    ) then
      spell.rating= spell.baseRating+value
       --print("enhanced rating: "..spell.rating)
    else
      spell.rating= spell.baseRating
      --print("normal rating: "..spell.rating)
    end
  end
end
--[[ ##############################################################################
  Build Note String
############################################################################## --]]
function ZN:createNoteTemplate(boss)
  local template = ZNotes.BossTemplates[boss]
  local noteTemplate = {
    ["bossid"] = template.bossid,
    ["spells"] = {}
  }

  if not template then
    ZN:Print("You need to choose a Boss / Raid")
  else
    local tIndex, tSort =ZN:indexTrenner(template)
    local maxPhase=0

    for i=1, #tSort do
      if template[tIndex[tSort[i-1]]] then
        template[tIndex[tSort[i]]].time = template[tIndex[tSort[i-1]]].time + template[tIndex[tSort[i-1]]].duration
      else
        template[tIndex[tSort[i]]].time = 0
      end
      table.insert(noteTemplate["spells"], template[tIndex[tSort[i]]])

      if template[tIndex[tSort[i]]].phase ~=0 then
        for _,spell in ipairs(template) do
          if not spell["trenner"] and spell.phase == template[tIndex[tSort[i]]].phase then
            tmp = {}
            for k = 1, spell["repeatX"] do
              tmp = table.copy(spell)
              tmp["time"] = spell["time"]+(spell["repeatAfter"]*(k-1))+template[tIndex[tSort[i]]].time
              tmp["repeatX"] = nil
              tmp["repeatAfter"] = nil
              tmp["counter"] = k
              table.insert(noteTemplate["spells"], tmp)
            end      
          end
        end
      end
    end

    for _,spell in ipairs(template) do
      if not spell["trenner"] and spell.phase == 0 then
        tmp = {}
        for i = 1, spell["repeatX"] do
          tmp = table.copy(spell)
          tmp["time"] = spell["time"]+(spell["repeatAfter"]*(i-1))
          tmp["repeatX"] = nil
          tmp["repeatAfter"] = nil
          tmp["counter"] = i
          table.insert(noteTemplate["spells"], tmp)
        end      
      end
    end
    -- for _,spell in ipairs(template) do
    --   if spell["trenner"] then
    --     table.insert(noteTemplate["spells"], spell)
    --   else
    --     tmp = {}
    --     for i = 1, spell["repeatX"] do
    --       tmp = table.copy(spell)
    --       --tmp["need"] = table.copy(spell["need"])
    --       tmp["time"] = spell["time"]+(spell["repeatAfter"]*(i-1))
    --       tmp["repeatX"] = nil
    --       tmp["repeatAfter"] = nil
    --       table.insert(noteTemplate["spells"], tmp)
    --     end      
    --   end
    -- end
  end
  return noteTemplate
end

function ZN:createRawNote(boss, group)
  local RaidRoster = ZN:BuildRaidRoster(group)
  if RaidRoster == nil then
    return
  end
  local availableSpells = ZN:getAvailableSpells(group)
  noteTemplate = ZN:createNoteTemplate(boss)

  prioNote = {
    ["bossid"] = noteTemplate.bossid,
    ["lines"] = {},
    ["missing"]={}
  }

  local spellsUsed = {
    ["used"] = {}
  }

  
  table.sort(noteTemplate["spells"], function(a,b) return a.prio > b.prio or (a.prio == b.prio and a.time < b.time) end)
  table.sort(availableSpells["spells"], function(a,b) return a.rating > b.rating or (a.rating == b.rating and a.PlayerName > b.PlayerName)end)

  local sortedPrioTemplate = noteTemplate["spells"]
  local sortedAvailableSpells = availableSpells["spells"]

  for _,spell in ipairs(sortedPrioTemplate) do
    if spell["trenner"] then
      if not prioNote["lines"][spell.time] then prioNote["lines"][spell.time]={} end
      if not prioNote["lines"][spell.time]["trenner"] then prioNote["lines"][spell.time]["trenner"] = {} end
      if not prioNote["lines"][spell.time]["trenner"]["trenner"] then prioNote["lines"][spell.time]["trenner"]["trenner"] = {} end
      table.insert(prioNote["lines"][spell.time]["trenner"]["trenner"], spell)
    else
      if not spell["need"] or #spell["need"]==0 then
        if not prioNote["lines"][spell.time] then prioNote["lines"][spell.time]={} end
        if not prioNote["lines"][spell.time]["trenner"] then prioNote["lines"][spell.time]["trenner"] = {} end
        if not prioNote["lines"][spell.time]["trenner"]["trenner"] then prioNote["lines"][spell.time]["trenner"]["trenner"] = {} end
        spell.text=spell.name
        table.insert(prioNote["lines"][spell.time]["trenner"]["trenner"], spell)
      else
        local playerSpellUsed = {}
        for _,needs in ipairs(spell["need"]) do
          ZN:ShiftSpellRatings(needs,sortedAvailableSpells)
          table.sort(availableSpells["spells"], function(a,b) return a.rating > b.rating or (a.rating == b.rating and a.PlayerName > b.PlayerName)end)
          local spellSet = false

          for _,playerSpell in ipairs(sortedAvailableSpells) do
            --for i = 1, table.getn(playerSpell["player"]) do
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
                if spellUseable and needs.type ~="imun" and not playerSpell.stackable and playerSpellUsed[playerSpell.id] then
                  spellUseable=false
                end

                if spellUseable then
                  --local spellalias = playerSpell["id"].."_"..playerSpell["player"][i]["name"]
                  local spellalias = playerSpell["id"].."_"..playerSpell["PlayerName"]
                  spellUseable = ZN:isSpellAvailable(spellsUsed, spellalias, playerSpell["cd"], spell["time"])
                end
                if spellUseable then
                  tmpLine.time = spell.time
                  playerSpellUsed[playerSpell.id]=true
                  --tmpLine.player = playerSpell.player[i].name
                  tmpLine.player = playerSpell.PlayerName
                  tmpLine.color = playerSpell.color              
                  tmpLine.playerSpellName = playerSpell.name
                  tmpLine.playerSpellId = playerSpell.id
                  tmpLine.bossSpellName = spell.name
                  tmpLine.bossSpellId = spell.id
                  tmpLine.counter=spell.counter
                  if not prioNote["lines"][tmpLine.time] then prioNote["lines"][tmpLine.time]={} end
                  if not prioNote["lines"][tmpLine.time][spell.id] then prioNote["lines"][tmpLine.time][spell.id] = {} end
                  if not prioNote["lines"][tmpLine.time][spell.id][playerSpell["type"]] then prioNote["lines"][tmpLine.time][spell.id][playerSpell["type"]] = {} end
                  table.insert(prioNote["lines"][tmpLine.time][spell.id][playerSpell["type"]], tmpLine)
                  spellSet = true
                end
              end
            --end          
          end   
          if not spellSet then
            local tmp = {}
            tmp.time = spell.time
            tmp.bossSpellName = spell.name
            tmp.bossSpellId = spell.id
            tmp.missing = 'Missing: '..needs.type
            if not prioNote["missing"][tmp.time] then prioNote["missing"][tmp.time]={} end
            if not prioNote["missing"][tmp.time][spell.id] then prioNote["missing"][tmp.time][spell.id] = {} end
            if not prioNote["missing"][tmp.time][spell.id][needs.type] then prioNote["missing"][tmp.time][spell.id][needs.type] = {} end
            table.insert(prioNote["missing"][tmp.time][spell.id][needs.type], tmp)
          end
        end   
      end   
    end
  end
  
  --table.sort(prioNote["lines"], function(a,b) return a.time < b.time end)
  return prioNote
end

function ZN:PrintNote(boss, inclMissing, group)
  rawNoteData = ZN:createRawNote(boss, group)  
  if rawNoteData == nil then
    return
  end



  local rtNote = ""
  local znNote = ""
  if rawNoteData.bossid then
    rtNote = "{id:"..rawNoteData.bossid.."}"
    znNote = "{id:"..rawNoteData.bossid.."}"
  end
  local missingNote = "Missing:"
  local linesTimes={}
  local missingTimes={}


  for k,v in pairs(rawNoteData["lines"]) do 
    table.insert(linesTimes,k)
  end

  for k,v in pairs(rawNoteData["missing"]) do 
    table.insert(missingTimes,k)
  end
  table.sort(linesTimes, function(a,b) return a < b end)
  table.sort(missingTimes, function(a,b) return a < b end)
  
  for k=1, #linesTimes do

    local currTime = rawNoteData["lines"][linesTimes[k]]
    for _,bossSpell in pairs(currTime) do
      if bossSpell.trenner then
        for _,trenner in ipairs(bossSpell.trenner) do
          local convertedTime = ZN:SecondsToClock(trenner["time"])
          if trenner["raidicon"] then
            rtNote = rtNote.."\n \n{time:"..convertedTime.."} "..trenner["raidicon"].." ||cffff00ff"..trenner["text"].."||r "..trenner["raidicon"]
            znNote = znNote.."\n \n{time:"..convertedTime.."} "..trenner["raidicon"].." ||cffff00ff"..trenner["text"].."||r "..trenner["raidicon"]
          elseif trenner["id"] then
            rtNote = rtNote.."\n \n{time:"..convertedTime.."} {spell:"..trenner["id"].."}".." ||cffff00ff"..trenner["text"].."||r "
            znNote = znNote.."\n \n{time:"..convertedTime.."} {spell:"..trenner["id"].."}".." ||cffff00ff"..trenner["text"].."||r "

          end
        end
      end
      local lineInit = false
      if bossSpell.heal then
        for _,spell in ipairs(bossSpell.heal) do
          if not lineInit then
            local convertedTime = ZN:SecondsToClock(spell["time"])
            rtNote = rtNote.."\n{time:"..convertedTime.."} {spell:"..spell["bossSpellId"].."} -"
            znNote = znNote.."\n{time:"..convertedTime.."}{count:"..spell["counter"].."} {spell:"..spell["bossSpellId"].."} -"
            lineInit=true
          end
          rtNote = rtNote.." ||cff"..spell["color"]..spell["player"].."||r{spell:"..spell["playerSpellId"].."}"
          znNote = znNote.." ||cff"..spell["color"]..spell["player"].."||r{spell:"..spell["playerSpellId"].."}"
        end
      end
      if bossSpell.util then
        for _,spell in ipairs(bossSpell.util) do
          if not lineInit then
            local convertedTime = ZN:SecondsToClock(spell["time"])
            rtNote = rtNote.."\n{time:"..convertedTime.."} {spell:"..spell["bossSpellId"].."} -"
            znNote = znNote.."\n{time:"..convertedTime.."}{count:"..spell["counter"].."} {spell:"..spell["bossSpellId"].."} -"
            lineInit=true
          end
          rtNote = rtNote.." ||cff"..spell["color"]..spell["player"].."||r{spell:"..spell["playerSpellId"].."}"
          znNote = znNote.." ||cff"..spell["color"]..spell["player"].."||r{spell:"..spell["playerSpellId"].."}"
        end
      end
      if bossSpell.imun then
        for _,spell in ipairs(bossSpell.imun) do
          if not lineInit then
            local convertedTime = ZN:SecondsToClock(spell["time"])
            rtNote = rtNote.."\n{time:"..convertedTime.."} {spell:"..spell["bossSpellId"].."} -"
            znNote = znNote.."\n{time:"..convertedTime.."}{count:"..spell["counter"].."} {spell:"..spell["bossSpellId"].."} -"
            lineInit=true
          end
          rtNote = rtNote.." ||cff"..spell["color"]..spell["player"].."||r{spell:"..spell["playerSpellId"].."}"
          znNote = znNote.." ||cff"..spell["color"]..spell["player"].."||r{spell:"..spell["playerSpellId"].."}"
        end
      end
    end
  end

  for k=1, #missingTimes do
    local currTime = rawNoteData["missing"][missingTimes[k]]
    for _,bossSpell in pairs(currTime) do
      local lineInit = false
      if bossSpell.heal then
        if not lineInit then
          local convertedTime = ZN:SecondsToClock(bossSpell.heal[1]["time"])
          missingNote = missingNote.."\n{time:"..convertedTime.."} {spell:"..bossSpell.heal[1]["bossSpellId"].."} "
          lineInit=true
        end
        missingNote = missingNote.."- Heal: "..#bossSpell.heal.." "
      end
      if bossSpell.util then
        if not lineInit then
          local convertedTime = ZN:SecondsToClock(bossSpell.util[1]["time"])
          missingNote = missingNote.."\n{time:"..convertedTime.."} {spell:"..bossSpell.util[1]["bossSpellId"].."} "
          lineInit=true
        end
        missingNote = missingNote.."- Util: "..#bossSpell.util.." "
      end
      if bossSpell.imun then
        if not lineInit then
          local convertedTime = ZN:SecondsToClock(bossSpell.imun[1]["time"])
          missingNote = missingNote.."\n{time:"..convertedTime.."} {spell:"..bossSpell.imun[1]["bossSpellId"].."} "
          lineInit=true
        end
        missingNote = missingNote.."- Imun: "..#bossSpell.imun.." "
      end
    end
  end


  if ZNotes.BossTemplates[boss].NoteEnd then
    rtNote = rtNote .. "\n \n" .. ZNotes.BossTemplates[boss].NoteEnd
    znNote = znNote .. "\n \n" .. ZNotes.BossTemplates[boss].NoteEnd
  end

  if  inclMissing == true then
    if missingNote =="Missing:" then missingNote=missingNote.."\nNo unassigned spells!" end
    rtNote = rtNote .. "\n \n \n" .. missingNote
    znNote = znNote .. "\n \n \n" .. missingNote
  end
  
  return rtNote, znNote
end