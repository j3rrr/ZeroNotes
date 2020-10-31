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

local function CreateGroupMemberRow(index)
  local parent = GroupTemplates.GroupTemplatesLeft
  local yOffsset = 0  
  -- if index > 1 then 
 
      yOffsset = -(42*((index-1)%10))
    if index == 6 or index == 16 or index == 26 then
      yOffsset = yOffsset - 8
    end
  --end
  if index > 10 then
    parent = GroupTemplates.GroupTemplatesMiddle
  end
    if index > 20 then
    parent = GroupTemplates.GroupTemplatesRight
  end
  local MemberRow = ZN.createSubFrame("ZNGroupMemberRow"..index, parent, 300, 40, ZN.Colors.ROWBG, 1, "TOPLEFT", "HIGH", false, 0, yOffsset)

  MemberRow.Class = ZN.CreateIconButton(MemberRow, "LEFT", MemberRow, "LEFT", 26, 26, 14, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\class\\druid", nil, nil, true, nil)
  MemberRow.Spec = ZN.CreateGenericButton("GroupMemberSpec"..index, MemberRow, "LEFT", MemberRow.Class, "RIGHT", 80, 40, 0, 0,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.ROWBG, nil, "Spec", "LEFT",true )
  MemberRow.Name = ZN.SingleLineEditBox("GroupMember"..index, MemberRow, "LEFT", MemberRow.Spec, "RIGHT", 180, 40, 0, 0, 0, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.ROWBG, nil, "Name", "LEFT")

  MemberRow.Class:SetScript("OnClick", function(self) print("test "..index) end)

  return MemberRow
end

for i = 1, 30 do
  ZN.GroupMemberRows[i] = CreateGroupMemberRow(i)
end

