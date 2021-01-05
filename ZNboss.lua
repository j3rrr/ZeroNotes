local _, ZN, L = ...
--boss id tooltip: true, ZN:getEncounterIDs(), ZN.Colors.ACTIVE, "ANCHOR_BOTTOMRIGHT"

local selectedTemplate = nil


local BossSidebar = ZNSidebarFrame.Subframes.Boss 
local BossFrame = ZNBodyFrame.Subframes["BossSpellHead"]

local BossTemplateSelectButtonHead = ZN.CreateGenericButton("ZNBossTemplateSelectButton", ZNBodyFrame.Subframes.BossSpellHead, "LEFT", ZNHeaderFrame.Version, "LEFT", 240, 30, 50, 0,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Select Template..", "LEFT",true )
BossTemplateSelectButtonHead.doOnUpdate = true
BossTemplateSelectButtonHead.OnUpdate = function(_,_,_,newValue) 
    selectedTemplate = newValue 
    ZN:ReloadBossSpellTable(newValue)
    ZN:ReloadBossTrennerTable(newValue)
    ZNotes.lastTemplates.lastBossTemplate = newValue
    ZNBodyFrame.Subframes.BossNote.EditBox:SetShown(true)
    ZNBodyFrame.Subframes.BossNote.EditBox.editbox.boss=newValue
    ZNBodyFrame.Subframes.BossNote.EditBox.editbox:SetText(ZNotes.BossTemplates[newValue].NoteEnd and ZNotes.BossTemplates[newValue].NoteEnd or "")

    ZN:showPreview(ZN:printPreviewNote(selectedTemplate), ZNBodyFrame.Subframes.PreviewTemplateContent.ScrollNote.scrollChild,selectedTemplate)
end
BossTemplateSelectButtonHead:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN:getTableKeys(ZNotes.BossTemplates), ZN:getTableOrder(ZNotes.BossTemplates), 240, ZN.Colors.BG, "LEFT", 10, nil, "TOOLTIP") end)

BossFrame.btnNewTemplate = ZN.CreateIconButton(BossFrame, "LEFT", BossTemplateSelectButtonHead, "RIGHT", 18, 18, 8, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\newtempl", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, ZN.Colors.ACTIVE, true, "Create New Template", ZN.Colors.ACTIVE)
BossFrame.btnCopyTemplate = ZN.CreateIconButton(BossFrame, "LEFT", BossFrame.btnNewTemplate, "RIGHT", 18, 18, 8, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\copy", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, ZN.Colors.ACTIVE, true, "Copy selected Template", ZN.Colors.ACTIVE)
BossFrame.btnEditTemplate = ZN.CreateIconButton(BossFrame, "RIGHT", BossTemplateSelectButtonHead, "RIGHT", 16, 16, -8, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\edit", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, ZN.Colors.ACTIVE, true, "Edit Template", ZN.Colors.ACTIVE)
BossFrame.btnDeleteTemplate = ZN.CreateIconButton(BossFrame, "LEFT", BossFrame.btnCopyTemplate, "RIGHT", 18, 18, 8, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\delete2", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, ZN.Colors.ACTIVE, true, "Delete selected Template", ZN.Colors.ACTIVE)
BossFrame.btnEditTemplate:SetFrameStrata("DIALOG")

local ZNDeleteBossFrame = ZN.createSubFrame("ZNDeleteBossFrame",ZNFrame, 302, 202, ZN.Colors.HD, 1, 'CENTER', 'TOOLTIP', true)
ZNDeleteBossFrame:SetScript("OnMouseDown", function(self, button)end)
ZNDeleteBossFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
  edgeFile = [[Interface\Buttons\WHITE8x8]],
  edgeSize = 1,
});
ZNDeleteBossFrame:SetBackdropColor(tonumber("0x"..ZN.Colors.HD:sub(1,2))/255, tonumber("0x"..ZN.Colors.HD:sub(3,4))/255, tonumber("0x"..ZN.Colors.HD:sub(5,6))/255, 1);
ZNDeleteBossFrame:SetBackdropBorderColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1);
ZNDeleteBossFrame.btnClose = ZN.CreateIconButton(ZNDeleteBossFrame, "TOPRIGHT", ZNDeleteBossFrame, "TOPRIGHT", 16, 16, -11, -11, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
ZNDeleteBossFrame.Message = ZN.CreateText(ZNDeleteBossFrame, "TOP", ZNDeleteBossFrame, "TOP", 250, 60, 0, -41, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 12, ZN.Colors.ACTIVE, "", "CENTER")
ZNDeleteBossFrame.ConfirmButton = ZN.CreateGenericButton("ZNnewGroupConfirmButton", ZNDeleteBossFrame, "BOTTOMLEFT", ZNDeleteBossFrame, "BOTTOMLEFT", 125, 30, 20, 20,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Delete", "CENTER",true, ZN.Colors.BG )
ZNDeleteBossFrame.CancelButton = ZN.CreateGenericButton("ZNnewGroupCancelButton", ZNDeleteBossFrame, "BOTTOMRIGHT", ZNDeleteBossFrame, "BOTTOMRIGHT", 125, 30, -20, 20,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Cancel", "CENTER",true, ZN.Colors.BG )

table.insert(ZN.DropDownsEdit,ZNDeleteBossFrame)

ZNDeleteBossFrame.ConfirmButton:SetScript("OnClick", function(self)
  ZNotes.BossTemplates[selectedTemplate] = nil
  ZN:Print("Deleted "..selectedTemplate)
  selectedTemplate=""
  for k,v in pairs(ZNotes.BossTemplates) do
    selectedTemplate = k
  end
  ZNotes.lastTemplates.lastBossTemplate = selectedTemplate
  BossTemplateSelectButtonHead.ZNText:SetText(selectedTemplate:upper())
  ZN:ReloadBossSpellTable(selectedTemplate)
  ZN:ReloadBossTrennerTable(selectedTemplate)
  ZNDeleteBossFrame:Hide()    
  ZNBodyFrame.Subframes.BossNote.EditBox:SetShown(true)
  ZNBodyFrame.Subframes.BossNote.EditBox.editbox.boss=selectedTemplate
  if selectedTemplate~="" then
    ZNBodyFrame.Subframes.BossNote.EditBox.editbox:SetText(ZNotes.BossTemplates[selectedTemplate].NoteEnd and ZNotes.BossTemplates[selectedTemplate].NoteEnd or "")
    ZN:showPreview(ZN:printPreviewNote(selectedTemplate), ZNBodyFrame.Subframes.PreviewTemplateContent.ScrollNote.scrollChild,selectedTemplate)
  else
    ZNBodyFrame.Subframes.BossNote.EditBox.editbox:SetText("")
  end

  
end)
ZNDeleteBossFrame.btnClose:SetScript("OnClick", function(self) ZNDeleteBossFrame:Hide() end)
ZNDeleteBossFrame.CancelButton:SetScript("OnClick", function(self) ZNDeleteBossFrame:Hide() end)


local ZNTemperBossFrame = ZN.createSubFrame("ZNTemperBossFrame",ZNFrame, 302, 202, ZN.Colors.HD, 1, 'CENTER', 'DIALOG', true)
ZNTemperBossFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
  edgeFile = [[Interface\Buttons\WHITE8x8]],
  edgeSize = 1,
});
ZNTemperBossFrame:SetBackdropColor(tonumber("0x"..ZN.Colors.HD:sub(1,2))/255, tonumber("0x"..ZN.Colors.HD:sub(3,4))/255, tonumber("0x"..ZN.Colors.HD:sub(5,6))/255, 1);
ZNTemperBossFrame:SetBackdropBorderColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1);
ZNTemperBossFrame.btnClose = ZN.CreateIconButton(ZNTemperBossFrame, "TOPRIGHT", ZNTemperBossFrame, "TOPRIGHT", 16, 16, -11, -11, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
ZNTemperBossFrame.BossidTitle = ZN.CreateText(ZNTemperBossFrame, "TOP", ZNTemperBossFrame, "TOP", 250, 20, 0, -10, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 12, ZN.Colors.ACTIVE, "Boss ID", "LEFT", nil, nil, true, ZN:getEncounterIDs(), ZN.Colors.ACTIVE, "ANCHOR_BOTTOMRIGHT")
ZNTemperBossFrame.Bossid = ZN.SingleLineEditBox("newBossID", ZNTemperBossFrame, "TOP", ZNTemperBossFrame.BossidTitle, "BOTTOM", 250, 30, 0, -5, 20, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "", "LEFT", true, ZN:getEncounterIDs(), ZN.Colors.ACTIVE, "ANCHOR_BOTTOMRIGHT")
ZNTemperBossFrame.Message = ZN.CreateText(ZNTemperBossFrame, "TOP", ZNTemperBossFrame.Bossid, "BOTTOM", 250, 30, 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 12, ZN.Colors.ACTIVE, "Template Name", "LEFT")
ZNTemperBossFrame.newBossName = ZN.SingleLineEditBox("newBossName", ZNTemperBossFrame, "TOP", ZNTemperBossFrame.Message, "BOTTOM", 250, 30, 0, -5, 20, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "", "LEFT")
ZNTemperBossFrame.ErrorMessage = ZN.CreateText(ZNTemperBossFrame, "TOP", ZNTemperBossFrame.newBossName, "BOTTOM", 250, 10, 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNVers.ttf", 10, ZN.Colors.chatYell, "dummy", "CENTER")
ZNTemperBossFrame.ConfirmButton = ZN.CreateGenericButton("ZNnewGroupConfirmButton", ZNTemperBossFrame, "BOTTOMLEFT", ZNTemperBossFrame, "BOTTOMLEFT", 125, 30, 20, 20,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Create", "CENTER",true, ZN.Colors.BG )
ZNTemperBossFrame.CancelButton = ZN.CreateGenericButton("ZNnewGroupCancelButton", ZNTemperBossFrame, "BOTTOMRIGHT", ZNTemperBossFrame, "BOTTOMRIGHT", 125, 30, -20, 20,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Cancel", "CENTER",true, ZN.Colors.BG )
ZNTemperBossFrame.ErrorMessage:Hide()
ZNTemperBossFrame.btnClose:SetScript("OnClick", function(self) ZNTemperBossFrame:Hide() end)
ZNTemperBossFrame.CancelButton:SetScript("OnClick", function(self) ZNTemperBossFrame:Hide() end)
ZNTemperBossFrame:SetScript("OnMouseDown", function(self, button)end)
ZNTemperBossFrame.BossidTitle.button:SetScript("OnMouseDown", function(self, button)end)
table.insert(ZN.DropDownsEdit,ZNTemperBossFrame)

ZNTemperBossFrame.newBossName:SetScript("OnEditFocusLost", function(self)
  self:ClearFocus()
end)
ZNTemperBossFrame.Bossid:SetScript("OnEditFocusLost", function(self)
  self:ClearFocus()
end)

BossFrame.btnDeleteTemplate:SetScript("OnClick", function(self)
  for i=1, #ZN.DropDownsEdit do
		ZN.DropDownsEdit[i]:SetShown(false)
	end
  if not selectedTemplate then
    ZN:Print("Please select a template first.")
    UIErrorsFrame:AddMessage("Please select a template first.", 0.8, 0.07, 0.2, 5.0)
  else
    ZNDeleteBossFrame.Message:SetText("This will delete "..selectedTemplate.."\nAre you sure?")
    local countTemplates = 0

    for k,v in pairs(ZNotes.BossTemplates) do
      countTemplates = countTemplates +1
    end
    if countTemplates == 0 then
      ZN:Print("You have no templates to delete.")
      UIErrorsFrame:AddMessage("You have no templates to delete.", 0.8, 0.07, 0.2, 5.0)
    else
      ZNDeleteBossFrame:Show()
    end
  end
end)

local function checkNameIsLegit(name, sameAllowed)
  if ZNotes.BossTemplates[name] and not sameAllowed then
    ZNTemperBossFrame.ErrorMessage:SetText("Name already exists") 
    ZNTemperBossFrame.ErrorMessage:Show()
    C_Timer.After(3, function() ZNTemperBossFrame.ErrorMessage:Hide() end)
    return false
  end
  -- Check if Name is empty
  if name == nil or name == "" then
    ZNTemperBossFrame.ErrorMessage:SetText("Please enter a name for your Template")
    ZNTemperBossFrame.ErrorMessage:Show()
    C_Timer.After(3, function() ZNTemperBossFrame.ErrorMessage:Hide() end)
    return false
  end
  return true
end

local function checkBossIDIsLegit(bossid)
  local numericBossid = tonumber(bossid)

  if string.len(bossid)>0 and not numericBossid then
    ZNTemperBossFrame.ErrorMessage:SetText("BossID has to be a number")
    ZNTemperBossFrame.ErrorMessage:Show()
    C_Timer.After(3, function() ZNTemperBossFrame.ErrorMessage:Hide() end)
    return false
  end
  return true
end

BossFrame.btnNewTemplate:SetScript("OnClick", function(self)
  for i=1, #ZN.DropDownsEdit do
		ZN.DropDownsEdit[i]:SetShown(false)
	end
  ZNTemperBossFrame.ConfirmButton:SetScript("OnClick", function(self)
    local name = ZNTemperBossFrame.newBossName:GetText():lower():match("^%s*(.-)%s*$")
    local bossid = ZNTemperBossFrame.Bossid:GetText()
     if checkBossIDIsLegit(bossid) and checkNameIsLegit(name) then
      bossid=tonumber(bossid)
      ZNotes.BossTemplates[name] = {}
      selectedTemplate=name
      ZNotes.BossTemplates[selectedTemplate].bossid=bossid
      ZNotes.lastTemplates.lastBossTemplate = selectedTemplate
      BossTemplateSelectButtonHead.ZNText:SetText(selectedTemplate:upper())
      ZN:ReloadBossSpellTable(selectedTemplate)
      ZN:ReloadBossTrennerTable(selectedTemplate)
      ZNTemperBossFrame:Hide()    
      ZNBodyFrame.Subframes.BossNote.EditBox:SetShown(true)
      ZNBodyFrame.Subframes.BossNote.EditBox.editbox.boss=selectedTemplate
      ZNBodyFrame.Subframes.BossNote.EditBox.editbox:SetText(ZNotes.BossTemplates[selectedTemplate].NoteEnd and ZNotes.BossTemplates[selectedTemplate].NoteEnd or "")
  
      ZN:showPreview(ZN:printPreviewNote(selectedTemplate), ZNBodyFrame.Subframes.PreviewTemplateContent.ScrollNote.scrollChild,selectedTemplate)
    end
  end)
  ZNTemperBossFrame.Bossid:SetText("")
  ZNTemperBossFrame.newBossName:SetText("")
  ZNTemperBossFrame.ConfirmButton.ZNText:SetText("Create")
  ZNTemperBossFrame:Show()
end)

BossFrame.btnEditTemplate:SetScript("OnClick", function(self)
  for i=1, #ZN.DropDownsEdit do
		ZN.DropDownsEdit[i]:SetShown(false)
	end
  ZNTemperBossFrame.ConfirmButton:SetScript("OnClick", function(self)
    local name = ZNTemperBossFrame.newBossName:GetText():lower():match("^%s*(.-)%s*$")
    local bossid = ZNTemperBossFrame.Bossid:GetText()
    if checkBossIDIsLegit(bossid) and checkNameIsLegit(name, true) then
      bossid=tonumber(bossid)
      if name~=selectedTemplate then
        ZNotes.BossTemplates[name] = ZNotes.BossTemplates[selectedTemplate]
        ZNotes.BossTemplates[selectedTemplate]=nil
        selectedTemplate=name
      end
      ZNotes.BossTemplates[selectedTemplate].bossid=bossid
      ZNotes.lastTemplates.lastBossTemplate = selectedTemplate
      BossTemplateSelectButtonHead.ZNText:SetText(selectedTemplate:upper())
      ZN:ReloadBossSpellTable(selectedTemplate)
      ZN:ReloadBossTrennerTable(selectedTemplate)
      ZNBodyFrame.Subframes.BossNote.EditBox:SetShown(true)
      ZNBodyFrame.Subframes.BossNote.EditBox.editbox.boss=selectedTemplate
      ZNBodyFrame.Subframes.BossNote.EditBox.editbox:SetText(ZNotes.BossTemplates[selectedTemplate].NoteEnd and ZNotes.BossTemplates[selectedTemplate].NoteEnd or "")
  
      ZN:showPreview(ZN:printPreviewNote(selectedTemplate), ZNBodyFrame.Subframes.PreviewTemplateContent.ScrollNote.scrollChild,selectedTemplate)
      ZNTemperBossFrame:Hide()    
    end
  end)
  if not selectedTemplate then
    ZN:Print("Please select a template first.")
    UIErrorsFrame:AddMessage("Please select a template first.", 0.8, 0.07, 0.2, 5.0)
  else
    ZNTemperBossFrame.newBossName:SetText(selectedTemplate)
    ZNTemperBossFrame.Bossid:SetText(ZNotes.BossTemplates[selectedTemplate].bossid and ZNotes.BossTemplates[selectedTemplate].bossid or "")
    ZNTemperBossFrame.ConfirmButton.ZNText:SetText("Save")
    ZNTemperBossFrame:Show()
  end
end)

BossFrame.btnCopyTemplate:SetScript("OnClick", function(self)
  for i=1, #ZN.DropDownsEdit do
		ZN.DropDownsEdit[i]:SetShown(false)
	end
  ZNTemperBossFrame.ConfirmButton:SetScript("OnClick", function(self)
    local name = ZNTemperBossFrame.newBossName:GetText():lower():match("^%s*(.-)%s*$")
    local bossid = ZNTemperBossFrame.Bossid:GetText()
    if checkBossIDIsLegit(bossid) and checkNameIsLegit(name) then
     bossid=tonumber(bossid)
      ZNotes.BossTemplates[name] = table.deepcopy(ZNotes.BossTemplates[selectedTemplate])
      selectedTemplate=name
      ZNotes.BossTemplates[selectedTemplate].bossid=bossid
      ZNotes.lastTemplates.lastBossTemplate = selectedTemplate
      BossTemplateSelectButtonHead.ZNText:SetText(selectedTemplate:upper())
      ZN:ReloadBossSpellTable(selectedTemplate)
      ZN:ReloadBossTrennerTable(selectedTemplate)
      ZNTemperBossFrame:Hide() 
      ZNBodyFrame.Subframes.BossNote.EditBox:SetShown(true)
      ZNBodyFrame.Subframes.BossNote.EditBox.editbox.boss=selectedTemplate
      ZNBodyFrame.Subframes.BossNote.EditBox.editbox:SetText(ZNotes.BossTemplates[selectedTemplate].NoteEnd and ZNotes.BossTemplates[selectedTemplate].NoteEnd or "")
  
      ZN:showPreview(ZN:printPreviewNote(selectedTemplate), ZNBodyFrame.Subframes.PreviewTemplateContent.ScrollNote.scrollChild,selectedTemplate)   
    end
  end)
  if not selectedTemplate or selectedTemplate=="" then
    ZN:Print("Please select a template first.")
    UIErrorsFrame:AddMessage("Please select a template first.", 0.8, 0.07, 0.2, 5.0)
  else
    ZNTemperBossFrame.Bossid:SetText(ZNotes.BossTemplates[selectedTemplate].bossid and ZNotes.BossTemplates[selectedTemplate].bossid or "")
    ZNTemperBossFrame.newBossName:SetText(selectedTemplate.."2")
    ZNTemperBossFrame.ConfirmButton.ZNText:SetText("Copy")
    ZNTemperBossFrame:Show()
  end
end)

ZN.BossTableRows = {
  ["title"] = 30,
  ["row"] = 40,
  ["rowgap"] = 2,
  }
ZN.BossSpellTableColumnHeaderNames = {
    ["spellid"] = "ID",
    ["spellname"] = "Spellname",
    ["time"] = "Time",
    ["prio"] = "Prio",
    ["station"] = "Station",
    ["aoe"] = "AOE",
    ["repeatX"] = "x Times",
    ["repeatAfter"] = "Interval",
    ["heal"] = "Heal",
    ["imun"] = "Immun",
    ["util"] = "Util",
    ["edit"] = "Edit",
    ["delete"] = "Delete",
    ["phase"] = "Phase",
  }
  ZN.BossSpellTableColumnHeaders = {
    "phase",
    "spellid",
    "spellname",
    "time",
    "prio",
    "station",
    "aoe",
    "repeatX",
    "repeatAfter",
    "heal",
    "util",
    "imun",
    "edit",
    "delete",
  }
  ZN.BossSpellTableColumns = {
    ["phase"] = 50,
    ["spellid"] = 80,
    ["spellname"] = 200,
    ["time"] = 60,
    ["prio"] = 60,
    ["station"] = 60,
    ["aoe"] = 60,
    ["repeatX"] = 55,
    ["repeatAfter"] = 55,
    ["heal"]=50,
    ["imun"]=50,
    ["util"]=50,
    ["edit"]= 50,
    ["delete"] = 50,
  }
 ZN.BossTrennerTableColumnHeaderNames = {
    ["no"]="Order",
    ["phase"] = "Phase",
    ["text"] = "Divider Text",
    ["duration"] = "Duration",
    ["raidicon"] = "Icon",
    ["delete"]= "Delete",
  }
ZN.BossTrennerTableColumnHeaders = {
  "no",
  "phase",
  "text",
  "duration",
  "raidicon",
  "delete",
  }
ZN.BossTrennerTableColumns = {
  ["no"]=50,
  ["phase"]=50,
  ["text"] = 190,
  ["duration"] = 70,
  ["raidicon"] = 50,
  ["delete"] = 50,
  }
ZN.BossDropdowns = {
  ["raidicon"] = {["content"]=ZN.TrennerIconsList, ["order"]=ZN.TrennerIconsListOrder},
  ["role"] = {["content"]=ZN.RoleSelectionColor, ["order"]=ZN.RoleSelectionOrder},
  ["class"] = {["content"]=ZN.PlayerClassesColored, ["order"]=ZN.PlayerClassesColoredOrder},
  ["phase"] = {["content"]={["dummy"]=""}, ["order"]={"dummy"}}
  }
ZN.BossAttributeMapping = {
  ["time"] = "time",
  ["repeatAfter"] = "repeatAfter",
  ["spellid"] = "id",
  ["spellname"] = "name",
  ["need"] = "need",
  ["aoe"] = "aoe",
  ["station"] = "station",
  ["repeatX"] = "repeatX",
  ["prio"] = "prio",
  ["trenner"] = "trenner",
  ["raidicon"] = "raidicon",
  ["heal"] = "heal",
  ["util"] = "util",
  ["imun"] = "imun",
  ["text"] = "text",
  ["class"] = "class",
  ["role"] = "role",
  ["value"] = "value",
  ["playername"]="playername",
  ["phase"] = "phase",
  ["duration"] = "duration",
  ["no"] = "no",
}
ZN.BossPrioTableColumnHeaders = {
  "type",
  "role",
  "class",
  "playername",
  "value",
  }
ZN.BossPrioTableColumns = {
  ["type"] = 75,
  ["role"] = 75,
  ["class"] = 100,
  ["playername"]=150,
  ["value"] = 60,
  }
ZN.BossPrioTableColumnHeaderNames = {
  ["type"] = "Need Type",
  ["role"] = "Role",
  ["class"] = "Class",
  ["playername"] = "Player Name",
  ["value"]= "+ Rating",
}

ZN.BossTableIconButton = {
  ["aoe"]= {["size"]= 16, ["xOffset"]=44, ["type"]="checkBox"},
  ["station"]= {["size"]= 16, ["xOffset"]=22, ["type"]="checkBox"},
  ["edit"]= {["size"]= 16, ["xOffset"]=19, ["type"]="edit", ["texture"]="Interface\\AddOns\\ZeroNotes\\Media\\Texture\\edit"},
  ["delete"]= {["size"]= 16, ["xOffset"]=32, ["type"]="delete", ["texture"]="Interface\\AddOns\\ZeroNotes\\Media\\Texture\\delete2"}
}

ZNSidebarFrame.btnReloadBossTrenner = ZN.CreateIconButton(ZNSidebarFrame, "BOTTOMRIGHT", ZNSidebarFrame, "BOTTOMRIGHT", 20, 20, -14, 20, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\update", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, nil, true, "Update Divider Table", ZN.Colors.ACTIVE)
ZNSidebarFrame.btnAddBossTrenner = ZN.CreateIconButton(ZNSidebarFrame, "BOTTOM", ZNSidebarFrame.btnReloadBossTrenner, "TOP", 20, 20, 0, 20, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\plus_nobg", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, nil, true, "Add Boss Divider", ZN.Colors.ACTIVE)

ZNSidebarFrame.btnReloadBossSpell = ZN.CreateIconButton(ZNSidebarFrame, "BOTTOM", ZNSidebarFrame.btnReloadBossTrenner, "BOTTOM", 20, 20, 0, 200, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\update", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, nil, true, "Update Boss Table", ZN.Colors.ACTIVE)
ZNSidebarFrame.btnAddBossSpell = ZN.CreateIconButton(ZNSidebarFrame, "BOTTOM", ZNSidebarFrame.btnReloadBossSpell, "TOP", 20, 20, 0, 20, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\plus_nobg", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, nil, true, "Add Boss Spell", ZN.Colors.ACTIVE)

ZNSidebarFrame.btnReloadBossSpell:SetShown(false)
ZNSidebarFrame.btnAddBossSpell:SetShown(false)

ZNSidebarFrame.btnReloadBossSpell:SetScript("OnClick",function(self)  ZN:ReloadBossSpellTable(selectedTemplate)  end)
ZNSidebarFrame.btnAddBossSpell:SetScript("OnClick",function(self)  ZN:addNewBossSpell(selectedTemplate)  end)

ZNSidebarFrame.btnReloadBossTrenner:SetShown(false)
ZNSidebarFrame.btnAddBossTrenner:SetShown(false)

ZNSidebarFrame.btnReloadBossTrenner:SetScript("OnClick",function(self)  ZN:ReloadBossTrennerTable(selectedTemplate)  end)
ZNSidebarFrame.btnAddBossTrenner:SetScript("OnClick",function(self)   ZN:addNewBossTrenner(selectedTemplate)  end)

--ZNBodyFrame.Subframes.BossNote
ZNBodyFrame.Subframes.BossNote.TitleRow = ZN.createSubFrame("ZNBossNoteTitleRow", ZNBodyFrame.Subframes.BossNote, 460, ZN.BossTableRows.title, ZN.Colors.BG, 1, "TOP", "HIGH", false, 0,0)
ZNBodyFrame.Subframes.BossNote.TitleRow.Header = ZN.CreateGenericButton("ZNBossNoteTitleRowHeader", ZNBodyFrame.Subframes.BossNote.TitleRow, "TOP", ZNBodyFrame.Subframes.BossNote.TitleRow, "TOP", 460, ZN.PlayerTableRows.title, 0, 0, 0, 0 ,10, ZN.Colors.INACTIVE, ZN.Colors.BG, nil, "Add custom text below note, e.g. interrupt rotation", "CENTER", false)
ZNBodyFrame.Subframes.BossNote.EditBox = ZN.MultiLineEditBox("ZNBossNoteEditBox", ZNBodyFrame.Subframes.BossNote, "BOTTOMLEFT", ZNBodyFrame.Subframes.BossNote, "BOTTOMLEFT", 459, 170, 1, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.HD, nil, "", "LEFT")
ZNBodyFrame.Subframes.BossNote.EditBox:SetShown(false)
ZNBodyFrame.Subframes.BossNote.EditBox.editbox.doOnUpdate=true
ZNBodyFrame.Subframes.BossNote.EditBox.editbox.OnUpdate = function(_,_,_,newValue,eb)
  ZNotes.BossTemplates[eb.boss].NoteEnd=newValue
  ZN:showPreview(ZN:printPreviewNote(selectedTemplate), ZNBodyFrame.Subframes.PreviewTemplateContent.ScrollNote.scrollChild,selectedTemplate)
end
ZNBodyFrame.Subframes.BossNote.EditBox.editbox.hintText = ZN.CreateText(ZNBodyFrame.Subframes.BossNote.EditBox, "BOTTOMRIGHT", ZNBodyFrame.Subframes.BossNote.EditBox, "BOTTOMRIGHT", 225, 10, 0, 3, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 10, ZN.Colors.INACTIVE, "Press Enter to save, Shift+Enter for new line", "LEFT", "CENTER")
ZNBodyFrame.Subframes.BossNote.EditBox.editbox.hintText:SetShown(false)
ZNBodyFrame.Subframes.BossNote.EditBox.editbox:SetScript("OnEditFocusGained", function(self)
  self.oldText = self:GetText()
  ZNBodyFrame.Subframes.BossNote.EditBox.editbox.hintText:SetShown(true)
  self:SetTextColor(tonumber("0x"..ZN.Colors.ACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.ACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.ACTIVE:sub(5,6))/255, 1);
end)
ZNBodyFrame.Subframes.BossNote.EditBox.editbox:SetScript("OnEditFocusLost", function(self)
  self:ClearFocus()
  ZNBodyFrame.Subframes.BossNote.EditBox.editbox.hintText:SetShown(false)
  self:SetTextColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1);
end)
ZNBodyFrame.Subframes.BossNote.EditBox.editbox:SetScript("OnEnterPressed", function(self)
  if not IsShiftKeyDown() then
    self.oldText = self:GetText()
    if self.doOnUpdate then
      self.OnUpdate(self.tableType,self.Row,self.Column, self:GetText(),self)
    end
    self:ClearFocus()		
  else
    self:Insert("\n")
  end
end)

ZNBodyFrame.Subframes.PrioDropdown = ZN.createSubFrame("ZNBossPrioDropDown", ZNFrame, 472, 202, ZN.Colors.BG, 1, "CENTER", "DIALOG", true)
ZNBodyFrame.Subframes.PrioDropdown:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
  edgeFile = [[Interface\Buttons\WHITE8x8]],
  edgeSize = 1,
});
ZNBodyFrame.Subframes.PrioDropdown:SetBackdropColor(tonumber("0x"..ZN.Colors.BG:sub(1,2))/255, tonumber("0x"..ZN.Colors.BG:sub(3,4))/255, tonumber("0x"..ZN.Colors.BG:sub(5,6))/255, 1);
ZNBodyFrame.Subframes.PrioDropdown:SetBackdropBorderColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1);
ZNBodyFrame.Subframes.PrioDropdown.ScrollFrame = ZN.createScrollFrame("ZNBossPrioContent", ZNBodyFrame.Subframes.PrioDropdown, 470, 170, nil, 1, "TOP","DIALOG", false)
ZNBodyFrame.Subframes.PrioDropdown.ScrollFrame:SetPoint("TOPLEFT", ZNBodyFrame.Subframes.PrioDropdown, "TOPLEFT",1,-31)
ZNBodyFrame.Subframes.PrioDropdown.ScrollFrame.ScrollBar:SetPoint("TOPRIGHT", ZNBodyFrame.Subframes.PrioDropdown.ScrollFrame, "TOPRIGHT", 0, 0);
ZNBodyFrame.Subframes.PrioDropdown.ScrollFrame.ScrollBar:SetPoint("BOTTOMRIGHT", ZNBodyFrame.Subframes.PrioDropdown.ScrollFrame, "BOTTOMRIGHT", 0, 0);
table.insert(ZN.DropDownsEdit,ZNBodyFrame.Subframes.PrioDropdown)
ZNBodyFrame.Subframes.PrioDropdown:SetScript("OnMouseDown", function(self, button)
  if button == "LeftButton" then
    for i=1, #ZN.DropDowns do
      ZN.DropDowns[i]:SetShown(false)
    end
  end
end)
ZNBodyFrame.Subframes.PrioDropdown.ScrollFrame:SetScript("OnMouseDown", function(self, button)
  if button == "LeftButton" then
    for i=1, #ZN.DropDowns do
      ZN.DropDowns[i]:SetShown(false)
    end
  end
end)



local function CreateGenericButton (name, parent, point, anchor, anchorPoint, width, type, text,row, boss, fontoffset)
  local btn = ZN.CreateGenericButton(name, parent, point, anchor, anchorPoint, width, ZN.PlayerTableRows.row, 0, 0, 0, fontoffset and fontoffset or 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, text, "CENTER", false)
  if type=="class" then
    width=width+30
  end
  btn:SetScript("OnClick", function(self) 
    ZN:CreateDropdown(self, ZN.BossDropdowns[type].content, ZN.BossDropdowns[type].order, width, ZN.Colors.SBButtonBG, "CENTER",0, ZN.Colors.HD ) 
    if self.Column=="class" then
      self.dropdown:ClearAllPoints()
      self.dropdown:SetPoint("TOP",self,"BOTTOM")
    end
  end)
  btn.Row = row
  btn.boss=boss
  btn.Column = ZN.BossAttributeMapping[type]
  btn.OnUpdate=function(_, row, column, newvalue)
     ZNotes.BossTemplates[btn.boss][btn.Row][btn.Column]=newvalue
     ZN:showPreview(ZN:printPreviewNote(selectedTemplate), ZNBodyFrame.Subframes.PreviewTemplateContent.ScrollNote.scrollChild,selectedTemplate)
  end
  btn.doOnUpdate=true
  
  return btn
end

local function CreateGenericIconDropdownButton (name, parent, point, anchor, anchorPoint, width, type, text,row, boss, fontoffset)
  local btn = ZN.CreateGenericButton(name, parent, point, anchor, anchorPoint, width, ZN.PlayerTableRows.row, 0, 0, 0, fontoffset and fontoffset or 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, text, "CENTER", false)
  btn:SetScript("OnClick", function(self) 
    ZN:CreateIconDropdown(self, ZN.BossDropdowns[type].content, ZN.BossDropdowns[type].order, width, ZN.Colors.SBButtonBG, "CENTER",0, ZN.Colors.HD,nil, 30, -8, 2, 4, false ) 
    btn.dropdown:ClearAllPoints()
    btn.dropdown:SetPoint("TOP", btn, "BOTTOM")
  end)
  
  btn.Row = row
  btn.boss=boss
  btn.Column = ZN.BossAttributeMapping[type]
  btn.OnUpdate=function(_, row, column, newvalue)
     ZNotes.BossTemplates[btn.boss][btn.Row][btn.Column]=newvalue
     ZN:showPreview(ZN:printPreviewNote(selectedTemplate), ZNBodyFrame.Subframes.PreviewTemplateContent.ScrollNote.scrollChild,selectedTemplate)
  end
  btn.doOnUpdate=true
  
  return btn
end

local function CreateSingleLineEditBox(name, parent, point, anchor, anchorPoint, width, type, text, xOffSet, row, boss)
  local tb = ZN.SingleLineEditBox(name, parent, point, anchor, anchorPoint, width, ZN.PlayerTableRows.row, xOffSet and xOffSet or 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, text, "CENTER")
  tb.Row = row
  tb.boss=boss
  tb.Column = ZN.BossAttributeMapping[type]
  tb.refersTo=nil
  tb.OnUpdate=function(_, row, column, newvalue)
    newvalue = tonumber(newvalue)
    if newvalue == nil then
      UIErrorsFrame:AddMessage("You need to enter a numeric value", 0.8, 0.07, 0.2, 5.0)
      tb:SetText(ZNotes.BossTemplates[tb.boss][tb.Row][tb.Column])
    else
      ZNotes.BossTemplates[tb.boss][tb.Row][tb.Column]=newvalue
    end
    if tb.Column=="id" then
      tb.refersTo:SetText((GetSpellInfo(newvalue) and GetSpellInfo(newvalue) or "|cffff3f40Invalid Spell ID|r"):upper())
      ZNotes.BossTemplates[tb.boss][tb.Row]["name"]=GetSpellInfo(newvalue)
    end
    ZN:showPreview(ZN:printPreviewNote(selectedTemplate), ZNBodyFrame.Subframes.PreviewTemplateContent.ScrollNote.scrollChild,selectedTemplate)
  end
  tb.doOnUpdate=true
  return tb
end

local function CreateCheckBox(parent, point, anchor, anchorPoint, type, row, checked, boss)
  local cb = ZN.CreateIconButton(parent, point, anchor, anchorPoint, ZN.BossTableIconButton[type].size, ZN.BossTableIconButton[type].size, ZN.BossTableIconButton[type].xOffset, 0, ZN.CheckBoxTextures.checked, ZN.CheckBoxTextures.checkedColor, ZN.CheckBoxTextures.uncheckedColor, true, ZN.Colors.ACTIVE)
  cb.toggleChecked = function()
    if cb.active then
      cb.active=false
      cb:SetNormalTexture(ZN.CheckBoxTextures.unchecked)
      cb:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.CheckBoxTextures.uncheckedColor:sub(1,2))/255, tonumber("0x"..ZN.CheckBoxTextures.uncheckedColor:sub(3,4))/255, tonumber("0x"..ZN.CheckBoxTextures.uncheckedColor:sub(5,6))/255, 1)
    else
      cb.active=true
      cb:SetNormalTexture(ZN.CheckBoxTextures.checked)
      cb:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.CheckBoxTextures.checkedColor:sub(1,2))/255, tonumber("0x"..ZN.CheckBoxTextures.checkedColor:sub(3,4))/255, tonumber("0x"..ZN.CheckBoxTextures.checkedColor:sub(5,6))/255, 1)
    end
  end
  if not checked then
    cb.toggleChecked()
    cb:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.CheckBoxTextures.uncheckedColor:sub(1,2))/255, tonumber("0x"..ZN.CheckBoxTextures.uncheckedColor:sub(3,4))/255, tonumber("0x"..ZN.CheckBoxTextures.uncheckedColor:sub(5,6))/255, 1)
  end
  cb.Row = row
  cb.boss=boss
  cb.Column = ZN.BossAttributeMapping[type]
  return cb
end


local function CreateText(parent, point, anchor, anchorPoint, width, type, text, xOffset)
  local txt = ZN.CreateText(parent, point, anchor, anchorPoint, width, ZN.PlayerTableRows.row, xOffset and xOffset or 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 12, ZN.Colors.INACTIVE, text, "CENTER", "CENTER")
  return txt
end

local function CreateIconButton(parent, point, anchor, anchorPoint, type, row, boss, xoffset)
  local btn =ZN.CreateIconButton(parent, point, anchor, anchorPoint, ZN.BossTableIconButton[type].size, ZN.BossTableIconButton[type].size, xoffset and xoffset or ZN.BossTableIconButton[type].xOffset, 0, ZN.BossTableIconButton[type].texture, ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
  btn.Row = row
  btn.boss=boss
  btn.Column = ZN.BossAttributeMapping[type]
  return btn
end

function ZN:CreatePrioTitleRow()
  local TitleRow = ZN.createSubFrame("ZNBossPrioTitleRow", ZNBodyFrame.Subframes.PrioDropdown, 360, ZN.BossTableRows.title, ZN.Colors.BG, 1, "TOPLEFT", "TOOLTIP", false, 1,-1)
  local anchor = TitleRow
  for i=1, #ZN.BossPrioTableColumnHeaders do
      local header = ZN.BossPrioTableColumnHeaders[i]
      local text = ZN.BossPrioTableColumnHeaderNames[header]
      local width = ZN.BossPrioTableColumns[header]
      local height = ZN.BossTableRows.title
      local headerButton = ZN.CreateGenericButton(nil, TitleRow, "LEFT", anchor, anchor==TitleRow and "LEFT" or "RIGHT", width, height, 0, 0, 0, 0 ,10, ZN.Colors.INACTIVE, ZN.Colors.BG, nil, text, "CENTER", false)
      anchor = headerButton
  end
  return TitleRow
end

local function CreateSpellTitleRow()
  local TitleRow = ZN.createSubFrame("ZNBossSpellTitleRow", ZNBodyFrame.Subframes.BossSpellHead, 930, ZN.BossTableRows.title, ZN.Colors.BG, 1, "TOP", "HIGH", false, -5,0)
  local anchor = TitleRow
  for i=1, #ZN.BossSpellTableColumnHeaders do
    local header = ZN.BossSpellTableColumnHeaders[i]
    local text = ZN.BossSpellTableColumnHeaderNames[header]
    local width = ZN.BossSpellTableColumns[header]
    local height = ZN.BossTableRows.title
    local tooltip = false
    local tooltipText = ""
    if ZN.HeadersToolTips["boss"..header] then
      tooltip = ZN.HeadersToolTips["boss"..header]["tooltip"]
      tooltipText = ZN.HeadersToolTips["boss"..header]["text"]
    end
    local tooltipColor = ZN.Colors.ACTIVE
    local headerButton = ZN.CreateGenericButton(nil, TitleRow, "LEFT", anchor, anchor==TitleRow and "LEFT" or "RIGHT", width, height, 0, 0, 0, 0 ,10, ZN.Colors.INACTIVE, ZN.Colors.BG, nil, text, "CENTER", false, nil, tooltip, tooltipText, tooltipColor)
    anchor = headerButton
  end
  return TitleRow
end

local function CreateTrennerTitleRow()
    local TitleRow = ZN.createSubFrame("ZNBossTrennerTitleRow", ZNBodyFrame.Subframes.BossTrennerHead, 460, ZN.BossTableRows.title, ZN.Colors.BG, 1, "TOP", "HIGH", false, -5,0)
    local anchor = TitleRow
    for i=1, #ZN.BossTrennerTableColumnHeaders do
      local header = ZN.BossTrennerTableColumnHeaders[i]
      local text = ZN.BossTrennerTableColumnHeaderNames[header]
      local width = ZN.BossTrennerTableColumns[header]
      local height = ZN.BossTableRows.title
      local tooltipText = ""
      if ZN.HeadersToolTips["trenner"..header] then
        tooltip = ZN.HeadersToolTips["trenner"..header]["tooltip"]
        tooltipText = ZN.HeadersToolTips["trenner"..header]["text"]
      end
      local tooltipColor = ZN.Colors.ACTIVE
      local headerButton = ZN.CreateGenericButton(nil, TitleRow, "LEFT", anchor, anchor==TitleRow and "LEFT" or "RIGHT", width, height, 0, 0, 0, 0 ,10, ZN.Colors.INACTIVE, ZN.Colors.BG, nil, text, "CENTER", false, nil, tooltip, tooltipText, tooltipColor)
      anchor = headerButton
    end
    return TitleRow
end

local function CreateBossSpellRow(BossSpellID, BossSpell, AnchorFrame, boss)
    local ContentRow = ZN.createSubFrame("ZNBossSpellRow"..BossSpellID, ZNBodyFrame.Subframes.BossSpells.scrollChild, 930, ZN.BossTableRows.row, ZN.Colors.ROWBG, 1, "TOPLEFT", "HIGH", false, 0,-ZN.BossTableRows.rowgap, AnchorFrame, "BOTTOMLEFT")
    
    ContentRow.Phase = CreateGenericButton ("Phase"..BossSpellID, ContentRow, "LEFT", ContentRow, "LEFT", ZN.BossSpellTableColumns["phase"], "phase", BossSpell.phase and "P"..BossSpell.phase or "P0" ,BossSpellID,boss)
    ContentRow.SpellId = CreateSingleLineEditBox("Spellid"..BossSpellID, ContentRow, "LEFT", ContentRow.Phase, "RIGHT",ZN.BossSpellTableColumns["spellid"], "spellid", BossSpell.id,0,BossSpellID, boss)
    ContentRow.SpellName = CreateText(ContentRow, "LEFT", ContentRow.SpellId, "RIGHT",ZN.BossSpellTableColumns["spellname"], "spellname", (GetSpellInfo(BossSpell.id) and GetSpellInfo(BossSpell.id) or "|cffff3f40Invalid Spell ID|r"):upper())
    ContentRow.Time = CreateSingleLineEditBox("Time"..BossSpellID, ContentRow, "LEFT", ContentRow.SpellName, "RIGHT",ZN.BossSpellTableColumns["time"], "time", BossSpell.time,0,BossSpellID, boss)
    ContentRow.Prio = CreateSingleLineEditBox("Prio"..BossSpellID, ContentRow, "LEFT", ContentRow.Time, "RIGHT",ZN.BossSpellTableColumns["prio"], "prio", BossSpell.prio,0,BossSpellID, boss)
    ContentRow.Station = CreateCheckBox(ContentRow, "LEFT", ContentRow.Prio, "RIGHT", "station", BossSpellID, BossSpell.station, boss)
    ContentRow.Aoe = CreateCheckBox(ContentRow, "LEFT", ContentRow.Station, "RIGHT", "aoe", BossSpellID, BossSpell.aoe, boss)
    ContentRow.repeatX = CreateSingleLineEditBox("RepeatX"..BossSpellID, ContentRow, "LEFT", ContentRow.Aoe, "RIGHT",ZN.BossSpellTableColumns["repeatX"], "repeatX", BossSpell.repeatX,22,BossSpellID, boss)
    ContentRow.repeatAfter = CreateSingleLineEditBox("RepeatAfter"..BossSpellID, ContentRow, "LEFT", ContentRow.repeatX, "RIGHT",ZN.BossSpellTableColumns["repeatAfter"], "repeatAfter", BossSpell.repeatAfter,0,BossSpellID, boss)
    ContentRow.heal = CreateSingleLineEditBox("heal"..BossSpellID, ContentRow, "LEFT", ContentRow.repeatAfter, "RIGHT",ZN.BossSpellTableColumns["heal"], "heal", ZN:CountBossSpellNeeds(boss, BossSpellID, "heal"),0,BossSpellID, boss)
    ContentRow.util = CreateSingleLineEditBox("util"..BossSpellID, ContentRow, "LEFT", ContentRow.heal, "RIGHT",ZN.BossSpellTableColumns["util"], "util", ZN:CountBossSpellNeeds(boss, BossSpellID, "util"),0,BossSpellID, boss)
    ContentRow.imun = CreateSingleLineEditBox("imun"..BossSpellID, ContentRow, "LEFT", ContentRow.util, "RIGHT",ZN.BossSpellTableColumns["imun"], "imun", ZN:CountBossSpellNeeds(boss, BossSpellID, "imun"),0,BossSpellID, boss)
    ContentRow.edit = CreateIconButton(ContentRow, "LEFT", ContentRow.imun, "RIGHT", "edit", BossSpellID,boss)
    ContentRow.Delete = CreateIconButton(ContentRow, "LEFT", ContentRow.edit, "RIGHT", "delete", BossSpellID,boss)

    ContentRow.SpellId.refersTo=ContentRow.SpellName

    ContentRow.heal.OnUpdate=function(_, row, column, newvalue, self)
        newvalue = tonumber(newvalue)
        if newvalue == nil then
          UIErrorsFrame:AddMessage("You need to enter a numeric value", 0.8, 0.07, 0.2, 5.0)
          self:SetText(ZN:CountBossSpellNeeds(self.boss, self.Row, self.Column))
        else
            ZN:SetBossSpellNeeds(self.boss, self.Row, self.parent)
            ZN:showPreview(ZN:printPreviewNote(selectedTemplate), ZNBodyFrame.Subframes.PreviewTemplateContent.ScrollNote.scrollChild,selectedTemplate)
        end
      end
    ContentRow.util.OnUpdate = ContentRow.heal.OnUpdate
    ContentRow.imun.OnUpdate = ContentRow.heal.OnUpdate

    ContentRow.Aoe:SetScript("OnClick",function(self)
      self.toggleChecked()
      ZN:DebugPrint("boss: "..self.boss)
      ZN:DebugPrint("Row: "..self.Row)
      ZN:DebugPrint("Column: "..self.Column)
      ZNotes.BossTemplates[self.boss][self.Row][self.Column] = self.active
      ZN:showPreview(ZN:printPreviewNote(selectedTemplate), ZNBodyFrame.Subframes.PreviewTemplateContent.ScrollNote.scrollChild,selectedTemplate)
    end)

    ContentRow.Station:SetScript("OnClick",function(self)
      self.toggleChecked()
      ZNotes.BossTemplates[self.boss][self.Row][self.Column] = self.active
      ZN:showPreview(ZN:printPreviewNote(selectedTemplate), ZNBodyFrame.Subframes.PreviewTemplateContent.ScrollNote.scrollChild,selectedTemplate)
    end)

    ContentRow.Delete:SetScript("OnClick", function(self)
      table.remove(ZNotes.BossTemplates[self.boss],self.Row)
      ZN:ReloadBossSpellTable(self.boss)
      ZN:showPreview(ZN:printPreviewNote(selectedTemplate), ZNBodyFrame.Subframes.PreviewTemplateContent.ScrollNote.scrollChild,selectedTemplate)
    end)

    ContentRow.edit:SetScript("OnClick", function(self)
      ZN:ReloadBossPrioTable(self.boss, self.Row)
      local _,parent = ZNBodyFrame.Subframes.PrioDropdown:GetPoint()
      if parent ~= self or not ZNBodyFrame.Subframes.PrioDropdown:IsShown() then 
        ZNBodyFrame.Subframes.PrioDropdown:ClearAllPoints()
        ZNBodyFrame.Subframes.PrioDropdown:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT",0,-14)
        ZNBodyFrame.Subframes.PrioDropdown:SetShown(true)
      else
        ZNBodyFrame.Subframes.PrioDropdown:SetShown(false)
      end
    end)

    return ContentRow
end

local function CreateBossTrennerRow(BossSpellID, BossSpell, AnchorFrame, boss)
  local ContentRow = ZN.createSubFrame("ZNBossTrennerRow"..BossSpellID, ZNBodyFrame.Subframes.BossTrenner.scrollChild, 460, ZN.BossTableRows.row, ZN.Colors.ROWBG, 1, "TOPLEFT", "HIGH", false, 0,-ZN.BossTableRows.rowgap, AnchorFrame, "BOTTOMLEFT")
  
  ContentRow.No = CreateSingleLineEditBox ("no"..BossSpellID, ContentRow, "LEFT", ContentRow, "LEFT", ZN.BossTrennerTableColumns["no"], "no", BossSpell.no and BossSpell.no or "0" ,0,BossSpellID,boss)
  ContentRow.Phase = CreateSingleLineEditBox ("Phase"..BossSpellID, ContentRow, "LEFT", ContentRow.No, "RIGHT", ZN.BossTrennerTableColumns["phase"], "phase", BossSpell.phase and BossSpell.phase or "0" ,0,BossSpellID,boss)
  ContentRow.Text = CreateSingleLineEditBox("Text"..BossSpellID, ContentRow, "LEFT", ContentRow.Phase, "RIGHT",ZN.BossTrennerTableColumns["text"], "text", BossSpell.text,0,BossSpellID, boss)
  ContentRow.Time = CreateSingleLineEditBox("Time"..BossSpellID, ContentRow, "LEFT", ContentRow.Text, "RIGHT",ZN.BossTrennerTableColumns["duration"], "duration", BossSpell.duration,0,BossSpellID, boss)
  ContentRow.Icon = CreateGenericIconDropdownButton("Icon"..BossSpellID, ContentRow, "LEFT", ContentRow.Time, "RIGHT", ZN.BossTrennerTableColumns["raidicon"], "raidicon", ZN.TrennerIconsList[BossSpell.raidicon],BossSpellID,boss,-12)
  ContentRow.Delete = CreateIconButton(ContentRow, "LEFT", ContentRow.Icon, "RIGHT", "delete", BossSpellID,boss,19)

  ContentRow.Delete:SetScript("OnClick", function(self)
    table.remove(ZNotes.BossTemplates[self.boss],self.Row)
    ZN:ReloadBossTrennerTable(self.boss)
    ZN:showPreview(ZN:printPreviewNote(selectedTemplate), ZNBodyFrame.Subframes.PreviewTemplateContent.ScrollNote.scrollChild,selectedTemplate)
    ZN:getPhases()
  end)

  ContentRow.Text.OnUpdate=function(_, row, column, newvalue)
    ZNotes.BossTemplates[ ContentRow.Text.boss][ ContentRow.Text.Row][ ContentRow.Text.Column]=newvalue
    ZN:showPreview(ZN:printPreviewNote(selectedTemplate), ZNBodyFrame.Subframes.PreviewTemplateContent.ScrollNote.scrollChild,selectedTemplate)
  end

  ContentRow.Phase.OnUpdate=function(_, row, column, newvalue,self)
    newvalue = tonumber(newvalue)
    if newvalue == nil then
      UIErrorsFrame:AddMessage("You need to enter a numeric value", 0.8, 0.07, 0.2, 5.0)
      self:SetText(ZNotes.BossTemplates[self.boss][self.Row][self.Column])
    else
      ZNotes.BossTemplates[self.boss][self.Row][self.Column]=newvalue
    end
    ZN:getPhases()
    ZN:showPreview(ZN:printPreviewNote(selectedTemplate), ZNBodyFrame.Subframes.PreviewTemplateContent.ScrollNote.scrollChild,selectedTemplate)
  end

  return ContentRow
end

local function CreateBossPrioRow(BossSpellID, BossSpell, AnchorFrame, boss, needindex)
  local ContentRow = ZN.createSubFrame("ZNBossPrioRow"..BossSpellID, ZNBodyFrame.Subframes.PrioDropdown.ScrollFrame.scrollChild, 360, ZN.BossTableRows.row, ZN.Colors.ROWBG, 1, "TOPLEFT", "TOOLTIP", false, 0,-ZN.BossTableRows.rowgap, AnchorFrame, "BOTTOMLEFT")
  local role = ZNotes.BossTemplates[boss][BossSpellID]["need"][needindex].role and ZNotes.BossTemplates[boss][BossSpellID]["need"][needindex].role or "all"
  local class = ZNotes.BossTemplates[boss][BossSpellID]["need"][needindex].class and ZNotes.BossTemplates[boss][BossSpellID]["need"][needindex].class or "all"
  local playername = ZNotes.BossTemplates[boss][BossSpellID]["need"][needindex].playername and ZNotes.BossTemplates[boss][BossSpellID]["need"][needindex].playername or "all"
  local value = ZNotes.BossTemplates[boss][BossSpellID]["need"][needindex].value and ZNotes.BossTemplates[boss][BossSpellID]["need"][needindex].value or "0"
  ContentRow.Type = CreateText(ContentRow, "LEFT", ContentRow, "LEFT", ZN.BossPrioTableColumns["type"], "type", ZNotes.BossTemplates[boss][BossSpellID]["need"][needindex].type:upper())
  ContentRow.Role = CreateGenericButton ("Role"..BossSpellID, ContentRow, "LEFT", ContentRow.Type, "RIGHT", ZN.BossPrioTableColumns["role"], "role", ZN.RoleSelectionColor[role],BossSpellID,boss)
  ContentRow.Class = CreateGenericButton ("Class"..BossSpellID, ContentRow, "LEFT", ContentRow.Role, "RIGHT", ZN.BossPrioTableColumns["class"], "class", ZN.PlayerClassesColored[class],BossSpellID,boss)
  ContentRow.Playername = CreateSingleLineEditBox("playername", ContentRow, "LEFT", ContentRow.Class, "RIGHT", ZN.BossPrioTableColumns["playername"], "playername", playername, 0, BossSpellID, boss)
  ContentRow.Value = CreateSingleLineEditBox("Value", ContentRow, "LEFT", ContentRow.Playername, "RIGHT", ZN.BossPrioTableColumns["value"], "value", value, 0, BossSpellID, boss)

  ContentRow.Role.needindex=needindex
  ContentRow.Class.needindex=needindex
  ContentRow.Value.needindex=needindex
  ContentRow.Playername.needindex=needindex

  ContentRow.Role.OnUpdate=function(_, row, column, newvalue,self)
    ZNotes.BossTemplates[self.boss][row]["need"][self.needindex][column]=newvalue
    ZN:showPreview(ZN:printPreviewNote(selectedTemplate), ZNBodyFrame.Subframes.PreviewTemplateContent.ScrollNote.scrollChild,selectedTemplate)
  end
  ContentRow.Class.OnUpdate=function(_, row, column, newvalue,self)
    ZNotes.BossTemplates[self.boss][row]["need"][self.needindex][column]=newvalue
    ZN:showPreview(ZN:printPreviewNote(selectedTemplate), ZNBodyFrame.Subframes.PreviewTemplateContent.ScrollNote.scrollChild,selectedTemplate)
  end

  ContentRow.Value.OnUpdate=function(_, row, column, newvalue,self)
    newvalue = tonumber(newvalue)
    if newvalue == nil then
      UIErrorsFrame:AddMessage("You need to enter a numeric value", 0.8, 0.07, 0.2, 5.0)
      ContentRow.Value:SetText(ZNotes.BossTemplates[self.boss][row]["need"][self.needindex][column] and ZNotes.BossTemplates[self.boss][row]["need"][self.needindex][column] or 0)
    else
      ZNotes.BossTemplates[self.boss][row]["need"][self.needindex][column]=newvalue
    end
    ZN:showPreview(ZN:printPreviewNote(selectedTemplate), ZNBodyFrame.Subframes.PreviewTemplateContent.ScrollNote.scrollChild,selectedTemplate)
  end

  ContentRow.Playername.OnUpdate=function(_, row, column, newvalue,self)
    
    ZNotes.BossTemplates[self.boss][row]["need"][self.needindex][column]=newvalue
    ZN:showPreview(ZN:printPreviewNote(selectedTemplate), ZNBodyFrame.Subframes.PreviewTemplateContent.ScrollNote.scrollChild,selectedTemplate)
  end

  ContentRow:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" then
      for i=1, #ZN.DropDowns do
        ZN.DropDowns[i]:SetShown(false)
      end
    end
  end)

  return ContentRow
end

function ZN:addNewBossSpell(boss)
  if not boss then
    ZN:Print("Please select a template first.")
    UIErrorsFrame:AddMessage("Please select a template first.", 0.8, 0.07, 0.2, 5.0)
  elseif boss=="" then
    ZN:Print("Please create a template first.")
    UIErrorsFrame:AddMessage("Please create a template first.", 0.8, 0.07, 0.2, 5.0)
  else
    table.insert(ZNotes.BossTemplates[boss],
    {
      ["id"] = 0,
      ["name"] = "",
      ["time"] = 0,
      ["prio"] = 0,
      ["station"] = true,
      ["aoe"] = true,
      ["repeatX"] = 1,
      ["repeatAfter"] = 0,
      ["need"] = {}
    })
    ZN:ReloadBossSpellTable(boss)
  end
end

function ZN:addNewBossTrenner(boss)
  if not boss then
    ZN:Print("Please select a template first.")
    UIErrorsFrame:AddMessage("Please select a template first.", 0.8, 0.07, 0.2, 5.0)
  elseif boss=="" then
    ZN:Print("Please create a template first.")
    UIErrorsFrame:AddMessage("Please create a template first.", 0.8, 0.07, 0.2, 5.0)
  else
    table.insert(ZNotes.BossTemplates[boss],
    {
      ["no"]=0,
      ["trenner"] = true,
      ["text"] = "",
      ["time"] = 0,
      ["duration"]=0,
      ["prio"] = 9000,
      ["raidicon"] = "{rt1}",
    })
    ZN:ReloadBossTrennerTable(boss)
  end
end

local function UpdateBossPrioRow(BossSpellID, BossSpell, AnchorFrame, ContentRow, boss, needindex)
  ContentRow:SetPoint("TOP", AnchorFrame, "BOTTOM",0,-ZN.BossTableRows.rowgap)
  local role = ZNotes.BossTemplates[boss][BossSpellID]["need"][needindex].role and ZNotes.BossTemplates[boss][BossSpellID]["need"][needindex].role or "all"
  local class = ZNotes.BossTemplates[boss][BossSpellID]["need"][needindex].class and ZNotes.BossTemplates[boss][BossSpellID]["need"][needindex].class or "all"
  local playername = ZNotes.BossTemplates[boss][BossSpellID]["need"][needindex].playername and ZNotes.BossTemplates[boss][BossSpellID]["need"][needindex].playername or "all"
  local value = ZNotes.BossTemplates[boss][BossSpellID]["need"][needindex].value and ZNotes.BossTemplates[boss][BossSpellID]["need"][needindex].value or "0"
  
  ContentRow.Type:SetText(ZNotes.BossTemplates[boss][BossSpellID]["need"][needindex].type:upper())
  ContentRow.Role.Row=BossSpellID
  ContentRow.Role.boss=boss
  ContentRow.Role.needindex=needindex
  ContentRow.Role.ZNText:SetText(ZN.RoleSelectionColor[role]:upper())
  ContentRow.Class.Row=BossSpellID
  ContentRow.Class.boss=boss
  ContentRow.Class.needindex=needindex
  ContentRow.Class.ZNText:SetText(ZN.PlayerClassesColored[class]:upper())
  ContentRow.Playername.Row=BossSpellID
  ContentRow.Playername.boss=boss
  ContentRow.Playername.needindex=needindex
  ContentRow.Playername:SetText(playername)
  ContentRow.Value.Row=BossSpellID
  ContentRow.Value.boss=boss
  ContentRow.Value.needindex=needindex
  ContentRow.Value:SetText(value)

  return ContentRow
end

local function UpdateBossTrennerRow(BossSpellID, BossSpell, AnchorFrame,ContentRow,boss)
  ContentRow:SetPoint("TOP", AnchorFrame, "BOTTOM",0,-ZN.BossTableRows.rowgap)
  
  ContentRow.No.Row = BossSpellID
  ContentRow.No:SetText(BossSpell.no and BossSpell.no or "0")
  ContentRow.No.boss=boss
  ContentRow.Phase.Row = BossSpellID
  ContentRow.Phase:SetText(BossSpell.phase and BossSpell.phase or "0")
  ContentRow.Phase.boss=boss
  ContentRow.Text.Row = BossSpellID
  ContentRow.Text:SetText(BossSpell.text)
  ContentRow.Text.boss=boss
  ContentRow.Time.Row = BossSpellID
  ContentRow.Time:SetText(BossSpell.duration)
  ContentRow.Time.boss=boss
  ContentRow.Icon.Row = BossSpellID
  ContentRow.Icon.ZNText:SetText(ZN.TrennerIconsList[BossSpell.raidicon])
  ContentRow.Icon.boss=boss
  ContentRow.Delete.Row = BossSpellID
  ContentRow.Delete.boss = boss


end

local function UpdateBossSpellRow(BossSpellID, BossSpell, AnchorFrame,ContentRow,boss)
  ContentRow:SetPoint("TOP", AnchorFrame, "BOTTOM",0,-ZN.BossTableRows.rowgap)
  
  ContentRow.Phase.Row = BossSpellID
  ContentRow.Phase.ZNText:SetText(BossSpell.phase and "P"..BossSpell.phase or "0")
  ContentRow.Phase.boss=boss
  ContentRow.SpellId.Row = BossSpellID
  ContentRow.SpellId:SetText(BossSpell.id)
  ContentRow.SpellId.boss=boss
  ContentRow.SpellName:SetText((GetSpellInfo(BossSpell.id) and GetSpellInfo(BossSpell.id) or "|cffff3f40Invalid Spell ID|r"):upper())
  ContentRow.Time.Row = BossSpellID
  ContentRow.Time:SetText(BossSpell.time)
  ContentRow.Time.boss=boss
  ContentRow.Prio.Row = BossSpellID
  ContentRow.Prio:SetText(BossSpell.prio)
  ContentRow.Prio.boss=boss
  ContentRow.Aoe.Row=BossSpellID
  if ContentRow.Aoe.active ~= BossSpell.aoe then ContentRow.Aoe.toggleChecked() end
  ContentRow.Aoe.boss=boss
  ContentRow.Station.Row=BossSpellID
  if ContentRow.Station.active ~= BossSpell.station then ContentRow.Station.toggleChecked() end
  ContentRow.Station.boss=boss
  ContentRow.repeatX.Row = BossSpellID
  ContentRow.repeatX:SetText(BossSpell.repeatX)
  ContentRow.repeatX.boss=boss
  ContentRow.repeatAfter.Row = BossSpellID
  ContentRow.repeatAfter:SetText(BossSpell.repeatAfter)
  ContentRow.repeatAfter.boss=boss
  ContentRow.heal.Row = BossSpellID
  ContentRow.heal:SetText(ZN:CountBossSpellNeeds(boss, BossSpellID, "heal"))
  ContentRow.heal.boss=boss
  ContentRow.util.Row = BossSpellID
  ContentRow.util:SetText(ZN:CountBossSpellNeeds(boss, BossSpellID, "util"))
  ContentRow.util.boss=boss
  ContentRow.imun.Row = BossSpellID
  ContentRow.imun:SetText(ZN:CountBossSpellNeeds(boss, BossSpellID, "imun"))
  ContentRow.imun.boss=boss
  ContentRow.edit.Row = BossSpellID
  ContentRow.edit.boss = boss
  ContentRow.Delete.Row = BossSpellID
  ContentRow.Delete.boss = boss

end

ZN.BossSpellsIndex = {}
ZN.BossTrennerIndex = {}
ZN.BossSpellRows = {}
ZN.BossTrennerRows = {}
ZN.BossPrioRows = {}
function ZN:InitBoss()
    -- Player Body
    local BossSpellTable = ZNBodyFrame.Subframes.BossSpells
    local BossTrennerTable = ZNBodyFrame.Subframes.BossTrenner
    -- Title Row
    BossSpellTable.TitleRow = CreateSpellTitleRow()
    BossTrennerTable.TitleRow = CreateTrennerTitleRow()
    ZNBodyFrame.Subframes.PrioDropdown.TitleRow = ZN:CreatePrioTitleRow()

    ZNTemperBossFrame.BossidTitle.button:SetScript('OnEnter', function(self)
      ZN:ShowToolTip(ZN:getEncounterIDs(), ZN.Colors.ACTIVE, self, "ANCHOR_BOTTOMRIGHT")
    end)
    ZNTemperBossFrame.BossidTitle.button:SetScript('OnLeave', function(self)
        GameTooltip:Hide()
    end)
    ZNTemperBossFrame.Bossid:SetScript('OnEnter', function(self)
      ZN:ShowToolTip(ZN:getEncounterIDs(), ZN.Colors.ACTIVE, self, "ANCHOR_BOTTOMRIGHT")
    end)
    ZNTemperBossFrame.Bossid:SetScript('OnLeave', function(self)
      GameTooltip:Hide()
    end)
    ZNBodyFrame.Subframes.BossNote.EditBox:SetShown(true)
    if ZNotes and ZNotes.lastTemplates and ZNotes.lastTemplates.lastBossTemplate and ZNotes.lastTemplates.lastBossTemplate~="" then
      BossTemplateSelectButtonHead.ZNText:SetText(ZNotes.lastTemplates.lastBossTemplate:upper())
      selectedTemplate=ZNotes.lastTemplates.lastBossTemplate
      ZN:ReloadBossTrennerTable(selectedTemplate)
      ZN:ReloadBossSpellTable(selectedTemplate)
      ZNBodyFrame.Subframes.BossNote.EditBox:SetShown(true)
      ZNBodyFrame.Subframes.BossNote.EditBox.editbox.boss=selectedTemplate
      ZNBodyFrame.Subframes.BossNote.EditBox.editbox:SetText(ZNotes.BossTemplates[selectedTemplate].NoteEnd and ZNotes.BossTemplates[selectedTemplate].NoteEnd or "")
  
      ZN:showPreview(ZN:printPreviewNote(selectedTemplate), ZNBodyFrame.Subframes.PreviewTemplateContent.ScrollNote.scrollChild,selectedTemplate)
    end
    ZN:getPhases()
end

function ZN:ReloadBossPrioTable(boss, BossSpellID, needindex)
  local PrioTable = ZNBodyFrame.Subframes.PrioDropdown.ScrollFrame

  local scrollHeight = (ZN.BossTableRows.row+ZN.BossTableRows.rowgap)*#ZNotes.BossTemplates[boss][BossSpellID].need
  PrioTable.scrollChild:SetHeight(scrollHeight)

  for i=1, #ZN.BossPrioRows do
    ZN.BossPrioRows[i]:SetShown(false)
  end

  local anchor=PrioTable
  
  for i=1, #ZNotes.BossTemplates[boss][BossSpellID].need do
    if i >#ZN.BossPrioRows then
      ZN.BossPrioRows[i] = CreateBossPrioRow(BossSpellID, ZNotes.BossTemplates[boss][BossSpellID], anchor, boss, i)
    else 
      UpdateBossPrioRow(BossSpellID, ZNotes.BossTemplates[boss][BossSpellID], anchor, ZN.BossPrioRows[i], boss, i)
    end
    if i==1 then
      ZN.BossPrioRows[i]:ClearAllPoints()
      ZN.BossPrioRows[i]:SetPoint("TOPLEFT", PrioTable.scrollChild,"TOPLEFT")
    end
    ZN.BossPrioRows[i]:SetShown(true)
    anchor = ZN.BossPrioRows[i]
  end  
  
end

function ZN:ReloadBossTrennerTable(boss)
  ZN.BossTrennerIndex = {}
  local BossSpellTable = ZNBodyFrame.Subframes.BossTrenner

  local spellI=1
  --local boss="SampleBoss"
  for i=1, #ZN.BossTrennerRows do
    ZN.BossTrennerRows[i]:SetShown(false)
  end
  if  boss and ZNotes.BossTemplates[boss] then
    for i=1, #ZNotes.BossTemplates[boss] do
        if ZNotes.BossTemplates[boss][i].trenner then
            ZN.BossTrennerIndex[spellI]=i
            spellI = spellI + 1
        end
    end
    ZN:BuildBossTrennerSortArray (boss)
    local scrollHeight = (ZN.BossTableRows.row+ZN.BossTableRows.rowgap)*#ZN.BossTrennerIndex
    BossSpellTable.scrollChild:SetHeight(scrollHeight)

    local anchor=BossSpellTable.TitleRow
    
    for i=1, #ZN.BossTrennerSortArray do
      if i >#ZN.BossTrennerRows then
        ZN.BossTrennerRows[i] = CreateBossTrennerRow(ZN.BossTrennerIndex[ZN.BossTrennerSortArray[i]], ZNotes.BossTemplates[boss][ZN.BossTrennerIndex[ZN.BossTrennerSortArray[i]]], anchor,boss)
      else 
        UpdateBossTrennerRow(ZN.BossTrennerIndex[ZN.BossTrennerSortArray[i]], ZNotes.BossTemplates[boss][ZN.BossTrennerIndex[ZN.BossTrennerSortArray[i]]], anchor,ZN.BossTrennerRows[i],boss)
      end
      if i==1 then
        ZN.BossTrennerRows[i]:ClearAllPoints()
        ZN.BossTrennerRows[i]:SetPoint("TOPLEFT", ZNBodyFrame.Subframes.BossTrenner.scrollChild,"TOPLEFT")
      end
      ZN.BossTrennerRows[i]:SetShown(true)
      anchor = ZN.BossTrennerRows[i]
    end  
  end
end

function ZN:ReloadBossSpellTable(boss)
  ZN.BossSpellsIndex = {}
  local BossSpellTable = ZNBodyFrame.Subframes.BossSpells

  local spellI=1
  --local boss="SampleBoss"
  for i=1, #ZN.BossSpellRows do
    ZN.BossSpellRows[i]:SetShown(false)
  end

  if boss and ZNotes.BossTemplates[boss] then
    for i=1, #ZNotes.BossTemplates[boss] do
        if not ZNotes.BossTemplates[boss][i].trenner then
            ZN.BossSpellsIndex[spellI]=i
            spellI = spellI + 1
        end
    end
    ZN:BuildBossSpellSortArray (boss)
    local scrollHeight = (ZN.BossTableRows.row+ZN.BossTableRows.rowgap)*#ZN.BossSpellsIndex
    BossSpellTable.scrollChild:SetHeight(scrollHeight)
  

    local anchor=BossSpellTable.TitleRow
    
    for i=1, #ZN.BossSpellSortArray do
      if i >#ZN.BossSpellRows then
        ZN.BossSpellRows[i] = CreateBossSpellRow(ZN.BossSpellsIndex[ZN.BossSpellSortArray[i]], ZNotes.BossTemplates[boss][ZN.BossSpellsIndex[ZN.BossSpellSortArray[i]]], anchor,boss)
      else 
        UpdateBossSpellRow(ZN.BossSpellsIndex[ZN.BossSpellSortArray[i]], ZNotes.BossTemplates[boss][ZN.BossSpellsIndex[ZN.BossSpellSortArray[i]]], anchor,ZN.BossSpellRows[i],boss)
      end
      if i==1 then
        ZN.BossSpellRows[i]:ClearAllPoints()
        ZN.BossSpellRows[i]:SetPoint("TOPLEFT", ZNBodyFrame.Subframes.BossSpells.scrollChild,"TOPLEFT")
      end
      ZN.BossSpellRows[i]:SetShown(true)
      anchor = ZN.BossSpellRows[i]
    end  
  end
  ZN:getPhases()
end

function ZN:getPhases()
  local phaseSort = {}
  local phaseDisplay = {}

  for i=1, #ZNotes.BossTemplates[selectedTemplate] do
      if ZNotes.BossTemplates[selectedTemplate][i].trenner then
        if ZNotes.BossTemplates[selectedTemplate][i].phase then
          if not phaseDisplay[ZNotes.BossTemplates[selectedTemplate][i].phase] then
            phaseDisplay[ZNotes.BossTemplates[selectedTemplate][i].phase] = "P"..ZNotes.BossTemplates[selectedTemplate][i].phase
            table.insert(phaseSort,ZNotes.BossTemplates[selectedTemplate][i].phase)
          end
        end
      end
  end
  if #phaseSort>0 then
    table.sort(phaseSort, function(a,b) return a<b end)

  else
    phaseDisplay["dummy"]=""
    table.insert(phaseSort,"dummy")
  end

  ZN.BossDropdowns["phase"]["content"]=phaseDisplay
  ZN.BossDropdowns["phase"]["order"]=phaseSort

end

ZN.BossSpellSortArray={}
function ZN:BuildBossSpellSortArray (boss)
  ZN.BossSpellSortArray={}
  for i=1, #ZN.BossSpellsIndex do
    ZN.BossSpellSortArray[i]=i
  end

  for k=1,#ZN.BossSpellsIndex do
    for i=1,#ZN.BossSpellsIndex do
      local pivot = ZNotes.BossTemplates[boss][ZN.BossSpellsIndex[ZN.BossSpellSortArray[i]]]["phase"]
      local pivot2 = ZNotes.BossTemplates[boss][ZN.BossSpellsIndex[ZN.BossSpellSortArray[i]]]["time"]
      for j=i+1,#ZN.BossSpellsIndex do
        local comp = ZNotes.BossTemplates[boss][ZN.BossSpellsIndex[ZN.BossSpellSortArray[j]]]["phase"]
        local comp2 = ZNotes.BossTemplates[boss][ZN.BossSpellsIndex[ZN.BossSpellSortArray[j]]]["time"]
        if  type(comp)=="number"  and (comp<pivot or comp==pivot and comp2<pivot2) then
          local saveUnit = ZN.BossSpellSortArray[i]
          ZN.BossSpellSortArray[i] = ZN.BossSpellSortArray[j]
          ZN.BossSpellSortArray[j] = saveUnit
        end
      end 
    end 
  end 
end

ZN.BossTrennerSortArray={}
function ZN:BuildBossTrennerSortArray (boss)
  ZN.BossTrennerSortArray={}
  for i=1, #ZN.BossTrennerIndex do
    ZN.BossTrennerSortArray[i]=i
  end

  for k=1,#ZN.BossTrennerIndex do
    for i=1,#ZN.BossTrennerIndex do
      local pivot = ZNotes.BossTemplates[boss][ZN.BossTrennerIndex[ZN.BossTrennerSortArray[i]]]["no"]
      for j=i+1,#ZN.BossTrennerIndex do
        local comp = ZNotes.BossTemplates[boss][ZN.BossTrennerIndex[ZN.BossTrennerSortArray[j]]]["no"]
        if  type(comp)=="number"  and comp<pivot then
          local saveUnit = ZN.BossTrennerSortArray[i]
          ZN.BossTrennerSortArray[i] = ZN.BossTrennerSortArray[j]
          ZN.BossTrennerSortArray[j] = saveUnit
        end
      end 
    end 
  end 
end

  function ZN:CountBossSpellNeeds(boss, spellID, needtype)
    if not ZNotes.BossTemplates[boss][spellID]["need"] then return end
    local count = 0
    for i=1, #ZNotes.BossTemplates[boss][spellID]["need"] do
        if ZNotes.BossTemplates[boss][spellID]["need"][i]["type"]==needtype then
            count = count +1
        end
    end
    return count
  end

  function ZN:SetBossSpellNeeds(boss, spellID, row)
    ZNotes.BossTemplates[boss][spellID]["need"]={}

    for i=1, tonumber(row.heal:GetText()) do
        table.insert(ZNotes.BossTemplates[boss][spellID]["need"], {["type"] = "heal"})
    end
    for i=1, tonumber(row.util:GetText()) do
        table.insert(ZNotes.BossTemplates[boss][spellID]["need"], {["type"] = "util"})
    end
    for i=1, tonumber(row.imun:GetText()) do
        table.insert(ZNotes.BossTemplates[boss][spellID]["need"], {["type"] = "imun"})
    end
    return count
  end