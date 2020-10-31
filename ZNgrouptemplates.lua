local _, ZN, L = ...

local selectedGroupTemplate = nil
GroupTemplates = ZNBodyFrame.Subframes.GroupTemplates

GroupTemplateSelectButtonHead = ZN.CreateGenericButton("ZNGroupTemplateSelectButton", GroupTemplates, "LEFT", ZNHeaderFrame.Version, "LEFT", 240, 30, 50, 0,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Select Template..", "LEFT",true )
GroupTemplateSelectButtonHead.doOnUpdate = true
GroupTemplateSelectButtonHead.OnUpdate = function(_,_,_,newValue) 
    selectedGroupTemplate = newValue 
    print(selectedGroupTemplate)
end
GroupTemplateSelectButtonHead:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN:getTableKeys(ZNotes.GroupTemplates), ZN:getTableOrder(ZNotes.GroupTemplates), 240, ZN.Colors.BG, "LEFT", 10, nil, "TOOLTIP") end)

GroupTemplates.GroupTemplatesLeft = ZN.createSubFrame("GroupTemplatesLeft", GroupTemplates, 300, 530, ZN.Colors.BG, 1, "TOPLEFT", "HIGH", false, 0, 0)
GroupTemplates.GroupTemplatesMiddle = ZN.createSubFrame("GroupTemplatesMiddle", GroupTemplates, 300, 530, ZN.Colors.BG, 1, "TOPLEFT", "HIGH", false, 10, 0, GroupTemplates.GroupTemplatesLeft, "TOPRIGHT")
GroupTemplates.GroupTemplatesRight = ZN.createSubFrame("GroupTemplatesRight", GroupTemplates, 300, 530, ZN.Colors.BG, 1, "TOPLEFT", "HIGH", false, 10, 0, GroupTemplates.GroupTemplatesMiddle, "TOPRIGHT")



ZN.GroupMemberRows = {}
ZN.GroupMemberRowsSelectedClass = {}


local function CreateGroupMemberRow(index, anchorFrame)
  local specList = nil
  local specListOrder = nil
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

  MemberRow.Class = ZN.CreateGenericButton("GroupMemberClass"..index, MemberRow, "LEFT", MemberRow, "LEFT", 40, 40, 0, 0 ,0 ,-8, 12, nil, ZN.Colors.ROWBG, nil, CreateTextureMarkup("Interface\\Addons\\ZeroNotes\\Media\\Texture\\class\\hunter", 0, 0, 24, 24, 0, 0, 0, 0, 0, 0), "CENTER",true)
  MemberRow.Class.doOnUpdate = true
  MemberRow.Class.OnUpdate = function(_,_,_,newValue) 
    ZN.GroupMemberRowsSelectedClass[index] = newValue
    specList = ZN.Specs[ZN.GroupMemberRowsSelectedClass[index]]
    specListOrder = ZN:getTableOrder(ZN.Specs[ZN.GroupMemberRowsSelectedClass[index]])
    print(ZN.GroupMemberRowsSelectedClass[index])
  end
  MemberRow.Spec = ZN.CreateGenericButton("GroupMemberSpec"..index, MemberRow, "LEFT", MemberRow.Class, "RIGHT", 80, 40, 0, 0,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.ROWBG, nil, "Spec", "LEFT",true )
  MemberRow.Name = ZN.SingleLineEditBox("GroupMember"..index, MemberRow, "LEFT", MemberRow.Spec, "RIGHT", 180, 40, 0, 0, 0, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.ROWBG, nil, "Name", "LEFT")

  MemberRow.Class:SetScript("OnClick", function(self)
    ZN:CreateDropdown(self, ZN.ClassIconsList, ZN.ClassIconsListOrder, 40, ZN.Colors.SBButtonBG, "CENTER", 0, ZN.Colors.HD, nil, 40, -8)
  end)
  MemberRow.Spec:SetScript("OnClick", function(self)
    ZN:CreateDropdown(self, specList, specListOrder , 240, ZN.Colors.SBButtonBG, "LEFT", 10,ZN.Colors.HD)
  end)


  return MemberRow
end

local anchor = GroupTemplates.GroupTemplatesLeft

for i = 1, 30 do
  ZN.GroupMemberRows[i] = CreateGroupMemberRow(i, anchor)
  if i == 1 or i == 11 or i == 21 then
    _,parent = ZN.GroupMemberRows[i]:GetPoint()
    ZN.GroupMemberRows[i]:ClearAllPoints()
    ZN.GroupMemberRows[i]:SetPoint("TOPLEFT", parent,"TOPLEFT")
  end
  anchor = ZN.GroupMemberRows[i]
end

