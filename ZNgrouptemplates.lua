local _, ZN, L = ...

local selectedGroupTemplate = "Sample Group"
GroupTemplates = ZNBodyFrame.Subframes.GroupTemplates

GroupTemplateSelectButtonHead = ZN.CreateGenericButton("ZNGroupTemplateSelectButton", GroupTemplates, "LEFT", ZNHeaderFrame.Version, "LEFT", 240, 30, 50, 0,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Select Template..", "LEFT",true )
GroupTemplateSelectButtonHead.doOnUpdate = true
GroupTemplateSelectButtonHead.OnUpdate = function(_,_,_,newValue) 
    selectedGroupTemplate = newValue 
    print(selectedGroupTemplate)
    --savedvariable
    ZN:updateGroupView()
end
GroupTemplateSelectButtonHead:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN:getTableKeys(ZNotes.GroupTemplates), ZN:getTableOrder(ZNotes.GroupTemplates), 240, ZN.Colors.BG, "LEFT", 10, nil, "TOOLTIP") end)

GroupTemplates.GroupTemplatesLeft = ZN.createSubFrame("GroupTemplatesLeft", GroupTemplates, 300, 530, ZN.Colors.BG, 1, "TOPLEFT", "HIGH", false, 0, 0)
GroupTemplates.GroupTemplatesMiddle = ZN.createSubFrame("GroupTemplatesMiddle", GroupTemplates, 300, 530, ZN.Colors.BG, 1, "TOPLEFT", "HIGH", false, 10, 0, GroupTemplates.GroupTemplatesLeft, "TOPRIGHT")
GroupTemplates.GroupTemplatesRight = ZN.createSubFrame("GroupTemplatesRight", GroupTemplates, 300, 530, ZN.Colors.BG, 1, "TOPLEFT", "HIGH", false, 10, 0, GroupTemplates.GroupTemplatesMiddle, "TOPRIGHT")



ZN.GroupMemberRows = {}
ZN.GroupMemberRowsSelectedClass = {}

local function CreateGroupMemberRow(index, anchorFrame, template)

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

  if not ZNotes.GroupTemplates[selectedGroupTemplate][index] then
    ZNotes.GroupTemplates[selectedGroupTemplate][index] = {
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
    ZNotes.GroupTemplates[selectedGroupTemplate][row]["class"] = newValue
  end  
  MemberRow.Spec.doOnUpdate = true
  MemberRow.Spec.OnUpdate = function(_,row,_,newValue) 
   ZNotes.GroupTemplates[selectedGroupTemplate][row]["spec"] = newValue
  end  
  MemberRow.Name.doOnUpdate = true
  MemberRow.Name.OnUpdate = function(_,row,_,newValue) 
   ZNotes.GroupTemplates[selectedGroupTemplate][row]["name"] = newValue
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

local anchor = GroupTemplates.GroupTemplatesLeft
local template = {}

function ZN:updateGroupView()
  if selectedGroupTemplate ~= nil then 
    template = ZNotes.GroupTemplates[selectedGroupTemplate]
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
      ZN.GroupMemberRows[i] = CreateGroupMemberRow(i, anchor, dummy)
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
