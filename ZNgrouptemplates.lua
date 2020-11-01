local _, ZN, L = ...

function ZN:createGroupTemplateFrames()
  GroupTemplates = ZNBodyFrame.Subframes.GroupTemplates

  GroupTemplateSelectButtonHead = ZN.CreateGenericButton("ZNGroupTemplateSelectButton", GroupTemplates, "LEFT", ZNHeaderFrame.Version, "LEFT", 240, 30, 50, 0,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, ZN.selectedGroupTemplate , "LEFT",true )
  GroupTemplateSelectButtonHead.doOnUpdate = true
  GroupTemplateSelectButtonHead.OnUpdate = function(_,_,_,newValue) 
      ZN.selectedGroupTemplate = newValue 
      print(ZN.selectedGroupTemplate)
      ZNotes.lastTemplates.lastGroupTemplate = newValue
      ZN:updateGroupView()
  end
  GroupTemplateSelectButtonHead:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN:getTableKeys(ZNotes.GroupTemplates), ZN:getTableOrder(ZNotes.GroupTemplates), 240, ZN.Colors.BG, "LEFT", 10, nil, "TOOLTIP") end)

  GroupTemplates.GroupTemplatesLeft = ZN.createSubFrame("GroupTemplatesLeft", GroupTemplates, 300, 530, ZN.Colors.BG, 1, "TOPLEFT", "HIGH", false, 0, 0)
  GroupTemplates.GroupTemplatesMiddle = ZN.createSubFrame("GroupTemplatesMiddle", GroupTemplates, 300, 530, ZN.Colors.BG, 1, "TOPLEFT", "HIGH", false, 10, 0, GroupTemplates.GroupTemplatesLeft, "TOPRIGHT")
  GroupTemplates.GroupTemplatesRight = ZN.createSubFrame("GroupTemplatesRight", GroupTemplates, 300, 530, ZN.Colors.BG, 1, "TOPLEFT", "HIGH", false, 10, 0, GroupTemplates.GroupTemplatesMiddle, "TOPRIGHT")

  GroupTemplates.btnNewTemplate = ZN.CreateIconButton(GroupTemplates, "LEFT", GroupTemplateSelectButtonHead, "RIGHT", 18, 18, 8, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\newtempl", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, ZN.Colors.ACTIVE, true, "Create New Template", ZN.Colors.ACTIVE)
  GroupTemplates.btnEditTemplate = ZN.CreateIconButton(GroupTemplates, "RIGHT", GroupTemplateSelectButtonHead, "RIGHT", 16, 16, -8, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\edit", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, ZN.Colors.ACTIVE, true, "Edit Template", ZN.Colors.ACTIVE)
  GroupTemplates.btnEditTemplate:SetFrameStrata("DIALOG")

  GroupTemplates.btnNewTemplate:SetScript("OnClick", function(self) ZN:createNewGroupTemplate() end)
  GroupTemplates.btnEditTemplate:SetScript("OnClick", function(self) print("Edit Template") end)

  ZNnewGroupFrame = ZN.createSubFrame("ZNnewGroupFrame",ZNFrame, 300, 200, ZN.Colors.HD, 1, 'CENTER', 'TOOLTIP', true)
  ZNnewGroupFrame.btnClose = ZN.CreateIconButton(ZNnewGroupFrame, "TOPRIGHT", ZNnewGroupFrame, "TOPRIGHT", 16, 16, -10, -10, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
  ZNnewGroupFrame.Message = ZN.CreateText(ZNnewGroupFrame, "TOP", ZNnewGroupFrame, "TOP", 250, 30, 0, -40, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 12, ZN.Colors.ACTIVE, "Template Name", "LEFT")
  ZNnewGroupFrame.newGroupName = ZN.SingleLineEditBox("newGroupName", ZNnewGroupFrame, "TOP", ZNnewGroupFrame.Message, "BOTTOM", 250, 30, 0, -10, 20, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "", "LEFT")
  ZNnewGroupFrame.ReloadMessage = ZN.CreateText(ZNnewGroupFrame, "TOP", ZNnewGroupFrame.newGroupName, "TOP", 250, 20, 0, -20, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNVers.ttf", 10, ZN.Colors.ACTIVE, "'Create' will reload your ui", "LEFT")
  ZNnewGroupFrame.ConfirmButton = ZN.CreateGenericButton("ZNnewGroupConfirmButton", ZNnewGroupFrame, "BOTTOMLEFT", ZNnewGroupFrame, "BOTTOMLEFT", 125, 30, 20, 20,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Create", "CENTER",true, ZN.Colors.BG )
  ZNnewGroupFrame.CancelButton = ZN.CreateGenericButton("ZNnewGroupCancelButton", ZNnewGroupFrame, "BOTTOMRIGHT", ZNnewGroupFrame, "BOTTOMRIGHT", 125, 30, -20, 20,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Cancel", "CENTER",true, ZN.Colors.BG )

  ZNnewGroupFrame.ConfirmButton:SetScript("OnClick", function(self)
    local name = ZNnewGroupFrame.newGroupName:GetText()
    if name == nil or name == "" then
      ZN:Print("Please enter a name for your Template")
    else
        ZNotes.GroupTemplates[name] = {}
        for i = 1, 30 do
          ZNotes.GroupTemplates[name][i] = {
            ["name"] = "Name",
            ["class"] = "none",
            ["spec"] = "empty",
          }
        end
        ZNotes.lastTemplates.lastGroupTemplate = name
        ZN.selectedGroupTemplate = name
        GroupTemplateSelectButtonHead.ZNText:SetText(ZN.selectedGroupTemplate:upper())
        ZNnewGroupFrame:Hide()
        ZN:updateGroupView()
        --ReloadUI()
    end
  end)
  ZNnewGroupFrame.btnClose:SetScript("OnClick", function(self) ZNnewGroupFrame:Hide() end)
  ZNnewGroupFrame.CancelButton:SetScript("OnClick", function(self) ZNnewGroupFrame:Hide() end)

  ZNSidebarFrame.btnDeleteGroupTemplate = ZN.CreateIconButton(ZNSidebarFrame, "BOTTOMRIGHT", ZNSidebarFrame, "BOTTOMRIGHT", 20, 20, -14, 20, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\delete2", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, nil, true, "Delete Template", ZN.Colors.ACTIVE)
	ZNSidebarFrame.btnDeleteGroupTemplate:SetShown(false)
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
      ["class"] = "none",
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
    print(ZN.GroupMemberRowsSelectedClass[index])
    ZNotes.GroupTemplates[ZN.selectedGroupTemplate][row]["class"] = newValue
  end  
  MemberRow.Spec.doOnUpdate = true
  MemberRow.Spec.OnUpdate = function(_,row,_,newValue) 
   ZNotes.GroupTemplates[ZN.selectedGroupTemplate][row]["spec"] = newValue
  end  
  MemberRow.Name.doOnUpdate = true
  MemberRow.Name.OnUpdate = function(_,row,_,newValue) 
   ZNotes.GroupTemplates[ZN.selectedGroupTemplate][row]["name"] = newValue
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
      ["class"] = "none",
      ["spec"] = "empty",
    }
    if template[i] then
      dummy = template[i]
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
