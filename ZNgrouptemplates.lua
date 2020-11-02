local _, ZN, L = ...

function ZN:createGroupTemplateFrames()
  GroupTemplates = ZNBodyFrame.Subframes.GroupTemplates

  GroupTemplateSelectButtonHead = ZN.CreateGenericButton("ZNGroupTemplateSelectButton", GroupTemplates, "LEFT", ZNHeaderFrame.Version, "LEFT", 240, 30, 50, 0,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, ZN.selectedGroupTemplate , "LEFT",true )
  GroupTemplateSelectButtonHead.doOnUpdate = true
  GroupTemplateSelectButtonHead.OnUpdate = function(_,_,_,newValue) 
      ZN.selectedGroupTemplate = newValue 
      ZNotes.lastTemplates.lastGroupTemplate = newValue
      ZN:BuildGroupTemplateSortArray()
      ZN:updateGroupView()
  end
  GroupTemplateSelectButtonHead:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN:getTableKeys(ZNotes.GroupTemplates), ZN:getTemplateTableWithoutCurrentOrder(ZNotes.GroupTemplates), 240, ZN.Colors.BG, "LEFT", 10, nil, "TOOLTIP") end)

  GroupTemplates.GroupTemplatesLeft = ZN.createSubFrame("GroupTemplatesLeft", GroupTemplates, 300, 530, ZN.Colors.BG, 1, "TOPLEFT", "HIGH", false, 0, 0)
  GroupTemplates.GroupTemplatesMiddle = ZN.createSubFrame("GroupTemplatesMiddle", GroupTemplates, 300, 530, ZN.Colors.BG, 1, "TOPLEFT", "HIGH", false, 10, 0, GroupTemplates.GroupTemplatesLeft, "TOPRIGHT")
  GroupTemplates.GroupTemplatesRight = ZN.createSubFrame("GroupTemplatesRight", GroupTemplates, 300, 530, ZN.Colors.BG, 1, "TOPLEFT", "HIGH", false, 10, 0, GroupTemplates.GroupTemplatesMiddle, "TOPRIGHT")

  GroupTemplates.btnNewTemplate = ZN.CreateIconButton(GroupTemplates, "LEFT", GroupTemplateSelectButtonHead, "RIGHT", 18, 18, 8, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\newtempl", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, ZN.Colors.ACTIVE, true, "Create New Template", ZN.Colors.ACTIVE)
  GroupTemplates.btnCopyTemplate  = ZN.CreateIconButton(GroupTemplates, "LEFT", GroupTemplates.btnNewTemplate, "RIGHT", 18, 18, 8, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\copy", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, ZN.Colors.ACTIVE, true, "Copy Template", ZN.Colors.ACTIVE)
  GroupTemplates.btnEditTemplate = ZN.CreateIconButton(GroupTemplates, "RIGHT", GroupTemplateSelectButtonHead, "RIGHT", 16, 16, -8, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\edit", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, ZN.Colors.ACTIVE, true, "Edit Template", ZN.Colors.ACTIVE)
  GroupTemplates.btnEditTemplate:SetFrameStrata("DIALOG")

  GroupTemplates.btnNewTemplate:SetScript("OnClick", function(self) ZN:createNewGroupTemplate() end)

  -- Edit Group Popup
  ZNeditGroupFrame = ZN.createSubFrame("ZNeditGroupFrame",ZNFrame, 302, 202, ZN.Colors.HD, 1, 'CENTER', 'TOOLTIP', true)
  table.insert(ZN.DropDownsEdit, ZNeditGroupFrame)
  ZNeditGroupFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
    edgeFile = [[Interface\Buttons\WHITE8x8]],
    edgeSize = 1,
  });
  ZNeditGroupFrame:SetBackdropColor(tonumber("0x"..ZN.Colors.HD:sub(1,2))/255, tonumber("0x"..ZN.Colors.HD:sub(3,4))/255, tonumber("0x"..ZN.Colors.HD:sub(5,6))/255, 1);
  ZNeditGroupFrame:SetBackdropBorderColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1);
  ZNeditGroupFrame.btnClose = ZN.CreateIconButton(ZNeditGroupFrame, "TOPRIGHT", ZNeditGroupFrame, "TOPRIGHT", 16, 16, -11, -11, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
  ZNeditGroupFrame.Message = ZN.CreateText(ZNeditGroupFrame, "TOP", ZNeditGroupFrame, "TOP", 250, 30, 0, -41, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 12, ZN.Colors.ACTIVE, "Edit Template Name", "LEFT")
  ZNeditGroupFrame.newGroupName = ZN.SingleLineEditBox("newGroupName", ZNeditGroupFrame, "TOP", ZNeditGroupFrame.Message, "BOTTOM", 250, 30, 0, -10, 20, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "", "LEFT")
  ZNeditGroupFrame.ErrorMessage = ZN.CreateText(ZNeditGroupFrame, "TOP", ZNeditGroupFrame.newGroupName, "BOTTOM", 250, 20, 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNVers.ttf", 10, ZN.Colors.chatYell, "", "CENTER")
  ZNeditGroupFrame.ConfirmButton = ZN.CreateGenericButton("ZNnewGroupConfirmButton", ZNeditGroupFrame, "BOTTOMLEFT", ZNeditGroupFrame, "BOTTOMLEFT", 125, 30, 20, 20,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Rename", "CENTER",true, ZN.Colors.BG )
  ZNeditGroupFrame.CancelButton = ZN.CreateGenericButton("ZNnewGroupCancelButton", ZNeditGroupFrame, "BOTTOMRIGHT", ZNeditGroupFrame, "BOTTOMRIGHT", 125, 30, -20, 20,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Cancel", "CENTER",true, ZN.Colors.BG )
  ZNeditGroupFrame.ErrorMessage:Hide()
  ZNeditGroupFrame.newGroupName.doOnUpdate = true
  ZNeditGroupFrame.newGroupName.OnUpdate = function(_,_,_,newValue)     
    -- Check if Name exists 
    if ZNotes.GroupTemplates[newValue:lower():match("^%s*(.-)%s*$")] then 
      ZNeditGroupFrame.ErrorMessage:SetText("Name already exists") 
      ZNeditGroupFrame.ErrorMessage:Show()
      C_Timer.After(3, function() ZNeditGroupFrame.ErrorMessage:Hide() end)
      return
    end
    -- Check if Name is empty
    if newValue == nil or newValue == "" then 
      ZNeditGroupFrame.ErrorMessage:SetText("Please enter a name for your Template") 
      ZNeditGroupFrame.ErrorMessage:Show()
      C_Timer.After(3, function() ZNeditGroupFrame.ErrorMessage:Hide() end)
      return
    end 
  end 
  ZNeditGroupFrame.newGroupName:SetScript("OnEditFocusLost", function(self)
		self:ClearFocus()
	end) 
  ZNeditGroupFrame.ConfirmButton:SetScript("OnClick", function(self)
    local name = ZNeditGroupFrame.newGroupName:GetText():lower():match("^%s*(.-)%s*$") 
    -- Check if Name is empty
    if name == nil or name == "" then 
      ZNeditGroupFrame.ErrorMessage:SetText("Please enter a name for your Template") 
      ZNeditGroupFrame.ErrorMessage:Show()
      C_Timer.After(3, function() ZNeditGroupFrame.ErrorMessage:Hide() end)
      return
    end 
    -- Check if Name exists 
    if ZNotes.GroupTemplates[name] then 
      ZNeditGroupFrame.ErrorMessage:SetText("Name already exists") 
      ZNeditGroupFrame.ErrorMessage:Show()
      C_Timer.After(3, function() ZNeditGroupFrame.ErrorMessage:Hide() end)
      return
    end
    -- If Name does not exist, copy template, delete old
    ZNotes.GroupTemplates[name] = ZNotes.GroupTemplates[ZN.selectedGroupTemplate]
    ZNotes.GroupTemplates[ZN.selectedGroupTemplate] = nil
    ZN:Print("Renamed "..ZN.selectedGroupTemplate.." to "..name) 
    ZN:Print("Please /reload before creating / editing a new Template")   
    ZN.selectedGroupTemplate = name
    -- Reset Button / SavedVariables / Rebuild Frames
    ZNotes.lastTemplates.lastGroupTemplate = ZN.selectedGroupTemplate
    GroupTemplateSelectButtonHead.ZNText:SetText(ZN.selectedGroupTemplate:upper())
    ZN:BuildGroupTemplateSortArray()
    ZN:updateGroupView()
    ZNeditGroupFrame:Hide()    
  end)
  ZNeditGroupFrame.btnClose:SetScript("OnClick", function(self) ZNeditGroupFrame:Hide() end)
  ZNeditGroupFrame.CancelButton:SetScript("OnClick", function(self) ZNeditGroupFrame:Hide() end)

  GroupTemplates.btnEditTemplate:SetScript("OnClick", function(self)    
    ZNeditGroupFrame:Show() 
    ZNeditGroupFrame.newGroupName:SetText(ZN.selectedGroupTemplate)
  end)

  -- New Group Popup
  ZNnewGroupFrame = ZN.createSubFrame("ZNnewGroupFrame",ZNFrame, 302, 202, ZN.Colors.HD, 1, 'CENTER', 'TOOLTIP', true)
  table.insert(ZN.DropDownsEdit, ZNnewGroupFrame)
  ZNnewGroupFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
    edgeFile = [[Interface\Buttons\WHITE8x8]],
    edgeSize = 1,
  });
  ZNnewGroupFrame:SetBackdropColor(tonumber("0x"..ZN.Colors.HD:sub(1,2))/255, tonumber("0x"..ZN.Colors.HD:sub(3,4))/255, tonumber("0x"..ZN.Colors.HD:sub(5,6))/255, 1);
  ZNnewGroupFrame:SetBackdropBorderColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1);
  ZNnewGroupFrame.btnClose = ZN.CreateIconButton(ZNnewGroupFrame, "TOPRIGHT", ZNnewGroupFrame, "TOPRIGHT", 16, 16, -11, -11, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
  ZNnewGroupFrame.ZeroTemplate = ZN:createCheckBox(ZNnewGroupFrame, "TOPLEFT", ZNnewGroupFrame, "TOPLEFT", 20, -20, "Zero Template", 12, ZN.Colors.ACTIVE, 200, false) 
  ZNnewGroupFrame.ZeroTemplate:SetScript("OnClick",function(self)
    self.toggleChecked()
  end)
  local guildName,_,_ = GetGuildInfo("player")
  if (IsInGuild() and not guildName == "Zero") or not IsInGuild() then
    ZNnewGroupFrame.ZeroTemplate:Hide()
    ZNnewGroupFrame.ZeroTemplate.label:Hide()
  end
  ZNnewGroupFrame.Message = ZN.CreateText(ZNnewGroupFrame, "TOP", ZNnewGroupFrame, "TOP", 250, 30, 0, -41, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 12, ZN.Colors.ACTIVE, "Template Name", "LEFT")
  ZNnewGroupFrame.newGroupName = ZN.SingleLineEditBox("newGroupName", ZNnewGroupFrame, "TOP", ZNnewGroupFrame.Message, "BOTTOM", 250, 30, 0, -10, 20, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "", "LEFT")
  ZNnewGroupFrame.ErrorMessage = ZN.CreateText(ZNnewGroupFrame, "TOP", ZNnewGroupFrame.newGroupName, "BOTTOM", 250, 20, 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNVers.ttf", 10, ZN.Colors.chatYell, "", "CENTER")
  ZNnewGroupFrame.ConfirmButton = ZN.CreateGenericButton("ZNnewGroupConfirmButton", ZNnewGroupFrame, "BOTTOMLEFT", ZNnewGroupFrame, "BOTTOMLEFT", 125, 30, 20, 20,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Create", "CENTER",true, ZN.Colors.BG )
  ZNnewGroupFrame.CancelButton = ZN.CreateGenericButton("ZNnewGroupCancelButton", ZNnewGroupFrame, "BOTTOMRIGHT", ZNnewGroupFrame, "BOTTOMRIGHT", 125, 30, -20, 20,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Cancel", "CENTER",true, ZN.Colors.BG )
  ZNnewGroupFrame.ErrorMessage:Hide()
  -- Check if Name exists 
  ZNnewGroupFrame.newGroupName.doOnUpdate = true
  ZNnewGroupFrame.newGroupName.OnUpdate = function(_,_,_,newValue) 
    -- Check if Name exists 
    if ZNotes.GroupTemplates[newValue:lower():match("^%s*(.-)%s*$")] then 
      ZNnewGroupFrame.ErrorMessage:SetText("Name already exists") 
      ZNnewGroupFrame.ErrorMessage:Show()
      C_Timer.After(3, function() ZNnewGroupFrame.ErrorMessage:Hide() end)
      return
    end
    -- Check if Name is empty
     if newValue == nil or newValue == "" then 
      ZNnewGroupFrame.ErrorMessage:SetText("Please enter a name for your Template") 
      ZNnewGroupFrame.ErrorMessage:Show()
      C_Timer.After(3, function() ZNnewGroupFrame.ErrorMessage:Hide() end)
      return
    end
  end  
  ZNnewGroupFrame.newGroupName:SetScript("OnEditFocusLost", function(self)
		self:ClearFocus()
	end) 
  ZNnewGroupFrame.ConfirmButton:SetScript("OnClick", function(self)
    local name = ZNnewGroupFrame.newGroupName:GetText():lower():match("^%s*(.-)%s*$")
     -- Check if Name exists 
    if ZNotes.GroupTemplates[name] then
      ZNnewGroupFrame.ErrorMessage:SetText("Name already exists") 
      ZNnewGroupFrame.ErrorMessage:Show()
      C_Timer.After(3, function() ZNnewGroupFrame.ErrorMessage:Hide() end)
      return
    end
    -- Check if Name is empty
    if name == nil or name == "" then
      ZNnewGroupFrame.ErrorMessage:SetText("Please enter a name for your Template")
      ZNnewGroupFrame.ErrorMessage:Show()
      C_Timer.After(3, function() ZNnewGroupFrame.ErrorMessage:Hide() end)
    -- If Name does not exist, create new template
    else
      if ZNnewGroupFrame.ZeroTemplate.active then
        ZNotes.GroupTemplates[name] = ZN.ZeroGroupTemplate
      else
        ZNotes.GroupTemplates[name] = {}
        for i = 1, 30 do
          ZNotes.GroupTemplates[name][i] = {
            ["name"] = "Name",
            ["class"] = "zzz",
            ["spec"] = "empty",
          }
        end
      end
      -- Reset Button / SavedVariables / Rebuild Frames
      ZNotes.lastTemplates.lastGroupTemplate = name
      ZN.selectedGroupTemplate = name
      ZN:Print("Created new Template: "..ZN.selectedGroupTemplate) 
      ZN:Print("Please /reload before creating / editing a new Template") 
      GroupTemplateSelectButtonHead.ZNText:SetText(ZN.selectedGroupTemplate:upper())
      ZNnewGroupFrame:Hide()
      ZN:updateGroupView()
      --ReloadUI()      
    end
  end)
  ZNnewGroupFrame.btnClose:SetScript("OnClick", function(self) ZNnewGroupFrame:Hide() end)
  ZNnewGroupFrame.CancelButton:SetScript("OnClick", function(self) ZNnewGroupFrame:Hide() end)

  -- Delete Group Popup
  ZNdeleteGroupFrame = ZN.createSubFrame("ZNdeleteGroupFrame",ZNFrame, 302, 202, ZN.Colors.HD, 1, 'CENTER', 'TOOLTIP', true)
  table.insert(ZN.DropDownsEdit, ZNdeleteGroupFrame)
  ZNdeleteGroupFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
    edgeFile = [[Interface\Buttons\WHITE8x8]],
    edgeSize = 1,
  });
  ZNdeleteGroupFrame:SetBackdropColor(tonumber("0x"..ZN.Colors.HD:sub(1,2))/255, tonumber("0x"..ZN.Colors.HD:sub(3,4))/255, tonumber("0x"..ZN.Colors.HD:sub(5,6))/255, 1);
  ZNdeleteGroupFrame:SetBackdropBorderColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1);
  ZNdeleteGroupFrame.btnClose = ZN.CreateIconButton(ZNdeleteGroupFrame, "TOPRIGHT", ZNdeleteGroupFrame, "TOPRIGHT", 16, 16, -11, -11, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
  ZNdeleteGroupFrame.Message = ZN.CreateText(ZNdeleteGroupFrame, "TOP", ZNdeleteGroupFrame, "TOP", 250, 60, 0, -41, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 12, ZN.Colors.ACTIVE, "", "CENTER")
  ZNdeleteGroupFrame.ConfirmButton = ZN.CreateGenericButton("ZNnewGroupConfirmButton", ZNdeleteGroupFrame, "BOTTOMLEFT", ZNdeleteGroupFrame, "BOTTOMLEFT", 125, 30, 20, 20,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Delete", "CENTER",true, ZN.Colors.BG )
  ZNdeleteGroupFrame.CancelButton = ZN.CreateGenericButton("ZNnewGroupCancelButton", ZNdeleteGroupFrame, "BOTTOMRIGHT", ZNdeleteGroupFrame, "BOTTOMRIGHT", 125, 30, -20, 20,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Cancel", "CENTER",true, ZN.Colors.BG )

  ZNdeleteGroupFrame.ConfirmButton:SetScript("OnClick", function(self)
    ZNotes.GroupTemplates[ZN.selectedGroupTemplate] = nil
    ZN:Print("Deleted "..ZN.selectedGroupTemplate)
    ZN:Print("Please /reload before creating / editing a new Template")
    for k,v in pairs(ZNotes.GroupTemplates) do
      ZN.selectedGroupTemplate = k
    end
    ZNotes.lastTemplates.lastGroupTemplate = ZN.selectedGroupTemplate
    GroupTemplateSelectButtonHead.ZNText:SetText(ZN.selectedGroupTemplate:upper())
    ZN:BuildGroupTemplateSortArray()
    ZN:updateGroupView()
    ZNdeleteGroupFrame:Hide()    
  end)
  ZNdeleteGroupFrame.btnClose:SetScript("OnClick", function(self) ZNdeleteGroupFrame:Hide() end)
  ZNdeleteGroupFrame.CancelButton:SetScript("OnClick", function(self) ZNdeleteGroupFrame:Hide() end)

  -- Copy Group Popup
  ZNcopyGroupFrame = ZN.createSubFrame("ZNcopyGroupFrame",ZNFrame, 302, 202, ZN.Colors.HD, 1, 'CENTER', 'TOOLTIP', true)
  table.insert(ZN.DropDownsEdit, ZNcopyGroupFrame)
  ZNcopyGroupFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
    edgeFile = [[Interface\Buttons\WHITE8x8]],
    edgeSize = 1,
  });
  ZNcopyGroupFrame:SetBackdropColor(tonumber("0x"..ZN.Colors.HD:sub(1,2))/255, tonumber("0x"..ZN.Colors.HD:sub(3,4))/255, tonumber("0x"..ZN.Colors.HD:sub(5,6))/255, 1);
  ZNcopyGroupFrame:SetBackdropBorderColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1);
  ZNcopyGroupFrame.btnClose = ZN.CreateIconButton(ZNcopyGroupFrame, "TOPRIGHT", ZNcopyGroupFrame, "TOPRIGHT", 16, 16, -11, -11, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
  ZNcopyGroupFrame.Message = ZN.CreateText(ZNcopyGroupFrame, "TOP", ZNcopyGroupFrame, "TOP", 250, 30, 0, -41, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 12, ZN.Colors.ACTIVE, "New Template Name", "LEFT")
  ZNcopyGroupFrame.newGroupName = ZN.SingleLineEditBox("newGroupName", ZNcopyGroupFrame, "TOP", ZNcopyGroupFrame.Message, "BOTTOM", 250, 30, 0, -10, 20, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "", "LEFT")
  ZNcopyGroupFrame.ErrorMessage = ZN.CreateText(ZNcopyGroupFrame, "TOP", ZNcopyGroupFrame.newGroupName, "BOTTOM", 250, 20, 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNVers.ttf", 10, ZN.Colors.chatYell, "", "CENTER")
  ZNcopyGroupFrame.ConfirmButton = ZN.CreateGenericButton("ZNnewGroupConfirmButton", ZNcopyGroupFrame, "BOTTOMLEFT", ZNcopyGroupFrame, "BOTTOMLEFT", 125, 30, 20, 20,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Rename", "CENTER",true, ZN.Colors.BG )
  ZNcopyGroupFrame.CancelButton = ZN.CreateGenericButton("ZNnewGroupCancelButton", ZNcopyGroupFrame, "BOTTOMRIGHT", ZNcopyGroupFrame, "BOTTOMRIGHT", 125, 30, -20, 20,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Cancel", "CENTER",true, ZN.Colors.BG )
  ZNcopyGroupFrame.ErrorMessage:Hide()
  ZNcopyGroupFrame.newGroupName.doOnUpdate = true
  ZNcopyGroupFrame.newGroupName.OnUpdate = function(_,_,_,newValue)     
    -- Check if Name exists 
    if ZNotes.GroupTemplates[newValue:lower():match("^%s*(.-)%s*$")] then 
      ZNcopyGroupFrame.ErrorMessage:SetText("Name already exists") 
      ZNcopyGroupFrame.ErrorMessage:Show()
      C_Timer.After(3, function() ZNcopyGroupFrame.ErrorMessage:Hide() end)
      return
    end
    -- Check if Name is empty
    if newValue == nil or newValue == "" then 
      ZNcopyGroupFrame.ErrorMessage:SetText("Please enter a name for your Template") 
      ZNcopyGroupFrame.ErrorMessage:Show()
      C_Timer.After(3, function() ZNcopyGroupFrame.ErrorMessage:Hide() end)
      return
    end 
  end 
  ZNcopyGroupFrame.newGroupName:SetScript("OnEditFocusLost", function(self)
		self:ClearFocus()
	end) 
  ZNcopyGroupFrame.ConfirmButton:SetScript("OnClick", function(self)
    local name = ZNcopyGroupFrame.newGroupName:GetText():lower():match("^%s*(.-)%s*$") 
    -- Check if Name is empty
    if name == nil or name == "" then 
      ZNcopyGroupFrame.ErrorMessage:SetText("Please enter a name for your Template") 
      ZNcopyGroupFrame.ErrorMessage:Show()
      C_Timer.After(3, function() ZNcopyGroupFrame.ErrorMessage:Hide() end)
      return
    end 
    -- Check if Name exists 
    if ZNotes.GroupTemplates[name] then 
      ZNcopyGroupFrame.ErrorMessage:SetText("Name already exists") 
      ZNcopyGroupFrame.ErrorMessage:Show()
      C_Timer.After(3, function() ZNcopyGroupFrame.ErrorMessage:Hide() end)
      return
    end
    -- If Name does not exist, copy template, delete old
    ZNotes.GroupTemplates[name] = ZNotes.GroupTemplates[ZN.selectedGroupTemplate]
    ZN:Print("Copied "..ZN.selectedGroupTemplate.." to "..name) 
    ZN:Print("Please /reload before creating / editing a new Template")   
    ZN.selectedGroupTemplate = name
    -- Reset Button / SavedVariables / Rebuild Frames
    ZNotes.lastTemplates.lastGroupTemplate = ZN.selectedGroupTemplate
    GroupTemplateSelectButtonHead.ZNText:SetText(ZN.selectedGroupTemplate:upper())
    ZN:BuildGroupTemplateSortArray()
    ZN:updateGroupView()
    ZNcopyGroupFrame:Hide()    
  end)
  ZNcopyGroupFrame.btnClose:SetScript("OnClick", function(self) ZNcopyGroupFrame:Hide() end)
  ZNcopyGroupFrame.CancelButton:SetScript("OnClick", function(self) ZNcopyGroupFrame:Hide() end)

  GroupTemplates.btnCopyTemplate:SetScript("OnClick", function(self)    
    ZNcopyGroupFrame:Show() 
    ZNcopyGroupFrame.newGroupName:SetText(ZN.selectedGroupTemplate)
  end)

  -- Sidebar
  ZNSidebarFrame.btnDeleteGroupTemplate = ZN.CreateIconButton(ZNSidebarFrame, "BOTTOMRIGHT", ZNSidebarFrame, "BOTTOMRIGHT", 20, 20, -14, 20, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\delete2", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, nil, true, "Delete Template", ZN.Colors.ACTIVE)
  ZNSidebarFrame.btnDeleteGroupTemplate:SetShown(false)

  ZNSidebarFrame.btnReloadGroupTemplate = ZN.CreateIconButton(ZNSidebarFrame, "BOTTOM", ZNSidebarFrame.btnDeleteGroupTemplate, "TOP", 20, 20, 0, 20, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\update", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, nil, true, "Reload Template", ZN.Colors.ACTIVE)
  ZNSidebarFrame.btnReloadGroupTemplate:SetShown(false)

  ZNSidebarFrame.btnDeleteGroupTemplate:SetScript("OnClick", function(self)
    -- ZN.selectedGroupTemplate = GroupTemplateSelectButtonHead.ZNText:GetText()
    ZNdeleteGroupFrame.Message:SetText("This will delete "..ZN.selectedGroupTemplate.."\nAre you sure?")
    ZNdeleteGroupFrame:Show()
  end)

  ZNSidebarFrame.btnReloadGroupTemplate:SetScript("OnClick", function(self)
    ZN:BuildGroupTemplateSortArray()
    ZN:updateGroupView()
  end)
end

ZN.GroupMemberRows = {}
ZN.GroupMemberRowsSelectedClass = {}

function ZN:createNewGroupTemplate()
  ZNnewGroupFrame:Show()
end

function ZN:CreateGroupMemberRow(index, anchorFrame, template)

  local parent = GroupTemplates.GroupTemplatesLeft
  local yOffsset = 0
  if index > 1 then  
      yOffsset = -2
    if index == 6 or index == 16 or index == 26 then
      yOffsset = yOffsset - 8
    end
  end
  if index > 10 then
    parent = GroupTemplates.GroupTemplatesMiddle
  end
    if index > 20 then
    parent = GroupTemplates.GroupTemplatesRight    
  end
  if index == 11 or index == 21 then
    anchorFrame = parent
  end
  local MemberRow = ZN.createSubFrame("ZNGroupMemberRow"..index, parent, 300, 40, ZN.Colors.ROWBG, 1, "TOPLEFT", "HIGH", false, 0, yOffsset, anchorFrame, "BOTTOMLEFT")

  MemberRow.specList = ZN.Specs[template["class"]]
  MemberRow.specListOrder = ZN:getTableOrder(ZN.Specs[template["class"]])

  MemberRow.Class = ZN.CreateGenericButton("GroupMemberClass"..index, MemberRow, "LEFT", MemberRow, "LEFT", 40, 40, 0, 0 ,0 ,-8, 12, nil, ZN.Colors.ROWBG, nil, ZN.ClassIconsList[template["class"]], "CENTER",true)
  MemberRow.Spec = ZN.CreateGenericButton("GroupMemberSpec"..index, MemberRow, "LEFT", MemberRow.Class, "RIGHT", 90, 40, 0, 0,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.ROWBG, nil, ZN.Specs[template["class"]][template["spec"]], "LEFT",true )
  MemberRow.Name = ZN.SingleLineEditBox("GroupMember"..index, MemberRow, "LEFT", MemberRow.Spec, "RIGHT", 170, 40, 0, 0, 0, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.ROWBG, nil, template["name"], "LEFT")
  
  MemberRow.Class.Row = index
  MemberRow.Spec.Row = index
  MemberRow.Name.Row = index

  if not ZNotes.GroupTemplates[ZN.selectedGroupTemplate][index] then
    ZNotes.GroupTemplates[ZN.selectedGroupTemplate][index] = {
      ["name"] = "Name",
      ["class"] = "zzz",
      ["spec"] = "empty",
    }
  end
  
  MemberRow.Class.doOnUpdate = true
  MemberRow.Class.OnUpdate = function(_,row,_,newValue) 
    ZN.GroupMemberRowsSelectedClass[index] = newValue
    MemberRow.specList = ZN.Specs[ZN.GroupMemberRowsSelectedClass[index]]
    MemberRow.specListOrder = ZN:getTableOrder(ZN.Specs[ZN.GroupMemberRowsSelectedClass[index]])
    if MemberRow.specList == ZN.Specs["none"] then
      MemberRow.Spec.ZNText:SetText("-")
    else
      MemberRow.Spec.ZNText:SetText("SPEC")
    end
    ZNotes.GroupTemplates[ZN.selectedGroupTemplate][ZN.GroupTemplateSortArray[row]]["class"] = newValue
  end  
  MemberRow.Spec.doOnUpdate = true
  MemberRow.Spec.OnUpdate = function(_,row,_,newValue) 
   ZNotes.GroupTemplates[ZN.selectedGroupTemplate][ZN.GroupTemplateSortArray[row]]["spec"] = newValue
  end  
  MemberRow.Name.doOnUpdate = true
  MemberRow.Name.OnUpdate = function(_,row,_,newValue) 
   ZNotes.GroupTemplates[ZN.selectedGroupTemplate][ZN.GroupTemplateSortArray[row]]["name"] = newValue
  end  

  MemberRow.Class:SetScript("OnClick", function(self)
    ZN:CreateDropdown(self, ZN.ClassIconsList, ZN.ClassIconsListOrder, 40, ZN.Colors.SBButtonBG, "CENTER", 0, ZN.Colors.HD, nil, 40, -8)
  end)
  MemberRow.Spec:SetScript("OnClick", function(self)
    if MemberRow.specList == nil then
      ZN:CreateDropdown(self, {["empty"] = "-"}, ZN:getTableKeys({["empty"] = "-"}), 80, ZN.Colors.SBButtonBG, "LEFT", 10,ZN.Colors.HD)
    else
      ZN:CreateDropdown(self, MemberRow.specList, MemberRow.specListOrder , 80, ZN.Colors.SBButtonBG, "LEFT", 10,ZN.Colors.HD)
    end
  end)
  return MemberRow
end

function ZN:updateGroupMemberRow(dummy, MemberRow)
  MemberRow.specList = ZN.Specs[dummy["class"]]
  MemberRow.specListOrder = ZN:getTableOrder(ZN.Specs[dummy["class"]])
  MemberRow.Class.ZNText:SetText(ZN.ClassIconsList[dummy["class"]])  
  MemberRow.Spec.ZNText:SetText(ZN.Specs[dummy["class"]][dummy["spec"]]:upper())
  MemberRow.Name:SetText(dummy["name"])
end

local template = {}

function ZN:updateGroupView()
  local anchor = GroupTemplates.GroupTemplatesLeft
  if ZN.selectedGroupTemplate ~= nil then 
    template = ZNotes.GroupTemplates[ZN.selectedGroupTemplate]
  end

  for i = 1, 30 do
    local dummy = {
      ["name"] = "Name",
      ["class"] = "zzz",
      ["spec"] = "empty",
    }
    if template[ZN.GroupTemplateSortArray[i]] then
      dummy = template[ZN.GroupTemplateSortArray[i]]
    end
    if i > #ZN.GroupMemberRows then
      ZN.GroupMemberRows[i] = ZN:CreateGroupMemberRow(i, anchor, dummy)
    else
      ZN:updateGroupMemberRow(dummy, ZN.GroupMemberRows[i])
    end
    
    if i == 1 or i == 11 or i == 21 then
      _,parent = ZN.GroupMemberRows[i]:GetPoint()
      ZN.GroupMemberRows[i]:ClearAllPoints()
      ZN.GroupMemberRows[i]:SetPoint("TOPLEFT", parent,"TOPLEFT")
    end
    anchor = ZN.GroupMemberRows[i]
  end
end

ZN.GroupTemplateSortArray={}
function ZN:BuildGroupTemplateSortArray()
  ZN.GroupTemplateSortArray={}
  local template = ZNotes.GroupTemplates[ZN.selectedGroupTemplate]
  for i=1, #template do
    ZN.GroupTemplateSortArray[i]=i
  end

  for k=1,#template do
    for i=1,#template do
      local pivot = template[ZN.GroupTemplateSortArray[i]]["class"]
      for j=i+1,#template do
        local comp = template[ZN.GroupTemplateSortArray[j]]["class"]
        if comp<pivot then
          local saveUnit = ZN.GroupTemplateSortArray[i]
          ZN.GroupTemplateSortArray[i] = ZN.GroupTemplateSortArray[j]
          ZN.GroupTemplateSortArray[j] = saveUnit
        end
      end 
    end 
  end 
end