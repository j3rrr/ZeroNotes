local _, ZN, L = ...

function ZN:showPreview(arr, parent, selectedTemplate)
  local anchor = parent
  local height = 0
  local anchorPoint = "TOPLEFT"
  local yOffset = 0
  if not parent.Text then
    parent.Text = {}
  end
  if #parent.Text > #arr then
    for i = #arr+1, #parent.Text do
      parent.Text[i]:Hide()
    end    
  end
  for i = 1, #arr do
    if parent.Text[i] then
      parent.Text[i]:SetText(arr[i])
    else
      parent.Text[i] = ZN.CreateText(ZNBodyFrame.Subframes.PreviewTemplateContent.ScrollNote.scrollChild, "TOPLEFT", anchor, anchorPoint, 900, 0, 0, yOffset, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNVers.ttf", 12, ZN.Colors.ACTIVE, arr[i], "LEFT", "TOP")
    end
    parent.Text[i]:Show(true)
    anchor = parent.Text[i]
    anchorPoint = "BOTTOMLEFT"
    yOffset = -12
  end
  local i = #arr+1
  if not ZNotes.BossTemplates[selectedTemplate]["NoteEnd"] then return end
  if parent.Text[i] then
    parent.Text[i]:SetText(ZNotes.BossTemplates[selectedTemplate]["NoteEnd"])
  else
    parent.Text[i] = ZN.CreateText(ZNBodyFrame.Subframes.PreviewTemplateContent.ScrollNote.scrollChild, "TOPLEFT", anchor, anchorPoint, 900, 0, 0, yOffset, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNVers.ttf", 12, ZN.Colors.ACTIVE, ZNotes.BossTemplates[selectedTemplate]["NoteEnd"], "LEFT", "TOP")
  end
  parent.Text[i]:Show(true)
 
  
end

function ZN:createPreviewTemplateTable(arr)
  local template = ZNotes.BossTemplates[arr]
  local noteTemplate = {
    ["spells"] = {}
  }

  if not template then
    UIErrorsFrame:AddMessage("You need to choose a Template", 0.8, 0.07, 0.2, 5.0)
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
          table.insert(noteTemplate["spells"], tmp)
        end      
      end
    end


    -- for _,spell in ipairs(template) do
    --   if spell["trenner"] then
    --     --table.insert(noteTemplate["spells"], spell)
    --   else
    --     tmp = {}
    --     for i = 1, spell["repeatX"] do
    --       tmp = table.copy(spell)
    --       tmp["time"] = spell["time"]+(spell["repeatAfter"]*(i-1))
    --       tmp["repeatX"] = nil
    --       tmp["repeatAfter"] = nil
    --       table.insert(noteTemplate["spells"], tmp)
    --     end      
    --   end
    -- end
  end
  local prioNote = {
    ["lines"] = {}
  }

  table.sort(noteTemplate["spells"], function(a,b) return a.prio > b.prio or (a.prio == b.prio and a.time < b.time) end)

  local sortedPrioTemplate = noteTemplate["spells"] 

  for _,spell in ipairs(sortedPrioTemplate) do
    if spell["trenner"] then
      table.insert(prioNote["lines"], spell)
    else 
      local needHeal = 0
      local needUtil = 0
      local needImun = 0
      for _,needs in ipairs(spell["need"]) do        
        if needs["type"] == "heal" then
          needHeal = needHeal + 1
        elseif needs["type"] == "util" then
          needUtil = needUtil + 1
        elseif needs["type"] == "imun" then
          needImun = needImun + 1
        end
      end
      local spellSet = false
      if not spellSet then
        local tmpLine = {}
        tmpLine.time = spell.time
        tmpLine.bossSpellName = spell.name
        tmpLine.bossSpellId = spell.id
        tmpLine.needHeal = needHeal
        tmpLine.needUtil = needUtil
        tmpLine.needImun = needImun
        table.insert(prioNote["lines"], tmpLine)
        spellSet = true
      end      
    end
  end

  table.sort(prioNote["lines"], function(a,b) return a.time < b.time end)
  return prioNote
end

function ZN:printPreviewNote(arr)
  local rawNoteData = ZN:createPreviewTemplateTable(arr)
  if rawNoteData == nil then
    return
  end

  local notePreview = {}
  notePreview[1] = ""
  local y = 1

  for i = 1, table.getn(rawNoteData["lines"]) do
    if rawNoteData["lines"][i]["trenner"] then
      local raidicon = ""
      if rawNoteData["lines"][i]["raidicon"] == "{rt1}" then
        raidicon = CreateTextureMarkup(ZN.RaidIconsList[1], 0, 0, 0, 0, 0, 0, 0, 0, 0, -12)
      elseif rawNoteData["lines"][i]["raidicon"] == "{rt2}" then
        raidicon = CreateTextureMarkup(ZN.RaidIconsList[2], 0, 0, 0, 0, 0, 0, 0, 0, 0, -12)
      elseif rawNoteData["lines"][i]["raidicon"] == "{rt3}" then
        raidicon = CreateTextureMarkup(ZN.RaidIconsList[3], 0, 0, 0, 0, 0, 0, 0, 0, 0, -12)
      elseif rawNoteData["lines"][i]["raidicon"] == "{rt4}" then
        raidicon = CreateTextureMarkup(ZN.RaidIconsList[4], 0, 0, 0, 0, 0, 0, 0, 0, 0, -12)
      elseif rawNoteData["lines"][i]["raidicon"] == "{rt5}" then
        raidicon = CreateTextureMarkup(ZN.RaidIconsList[5], 0, 0, 0, 0, 0, 0, 0, 0, 0, -12)
      elseif rawNoteData["lines"][i]["raidicon"] == "{rt6}" then
        raidicon = CreateTextureMarkup(ZN.RaidIconsList[6], 0, 0, 0, 0, 0, 0, 0, 0, 0, -12)
      elseif rawNoteData["lines"][i]["raidicon"] == "{rt7}" then
        raidicon = CreateTextureMarkup(ZN.RaidIconsList[7], 0, 0, 0, 0, 0, 0, 0, 0, 0, -12)
      elseif rawNoteData["lines"][i]["raidicon"] == "{rt8}" then
        raidicon = CreateTextureMarkup(ZN.RaidIconsList[8], 0, 0, 0, 0, 0, 0, 0, 0, 0, -12)
      end
      local convertedTime = ZN:SecondsToClock(rawNoteData["lines"][i]["time"])
      local tmpStrDiv = "|cfffec1c0"..convertedTime.."|r "..raidicon.." |cffff00ff"..rawNoteData["lines"][i]["text"].."|r "..raidicon.."\n"
      if string.len(notePreview[y])+string.len(tmpStrDiv) > 3500 then 
        y = y + 1
        notePreview[y] = ""
      end
      notePreview[y] = notePreview[y]..tmpStrDiv
      --goto continue
    else
      local convertedTime = ZN:SecondsToClock(rawNoteData["lines"][i]["time"])
      local iconPath = select(3,GetSpellInfo(rawNoteData["lines"][i]["bossSpellId"]))
      local spellIcon = CreateTextureMarkup(iconPath and iconPath or "Interface\\Icons\\INV_MISC_QUESTIONMARK", 0, 0, 16, 16, 0, 0, 0, 0, 0, -8)
      local healIcon  = CreateTextureMarkup("Interface\\Addons\\ZeroNotes\\Media\\Texture\\h", 0, 0, 16, 16, 0, 0, 0, 0, 0, -8)
      local healNeeds = rawNoteData["lines"][i]["needHeal"]
      local healString = ""
      local utilIcon  = CreateTextureMarkup("Interface\\Addons\\ZeroNotes\\Media\\Texture\\u", 0, 0, 16, 16, 0, 0, 0, 0, 0, -8)
      local utilNeeds = rawNoteData["lines"][i]["needUtil"]
      local utilString = ""
      local imunIcon  = CreateTextureMarkup("Interface\\Addons\\ZeroNotes\\Media\\Texture\\i", 0, 0, 16, 16, 0, 0, 0, 0, 0, -8)
      local imunNeeds = rawNoteData["lines"][i]["needImun"]
      local imunString = ""
      for k = 1, healNeeds do
        healString = healString..healIcon.." "
      end
      for l = 1, utilNeeds do
        utilString = utilString..utilIcon.." "
      end
      for m = 1, imunNeeds do
        imunString = imunString..imunIcon.." "
      end
      local tmpStr = "|cfffec1c0"..convertedTime.."|r "..(spellIcon or "|TInterface\\Icons\\INV_MISC_QUESTIONMARK:12|t").." "..rawNoteData["lines"][i]["bossSpellName"].." "..healString..utilString..imunString.."\n"
      if string.len(notePreview[y])+string.len(tmpStr) > 3500 then 
        y = y + 1
        notePreview[y] = ""
      end
      notePreview[y] = notePreview[y]..tmpStr
    end

  end
  
  -- print(string.len(notePreview..notePreview2))
  return notePreview

end



