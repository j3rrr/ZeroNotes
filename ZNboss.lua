local _, ZN, L = ...

local selectedTemplate = nil

-- Boss Sidebar
BossSidebar = ZNSidebarFrame.Subframes.Boss 
BossSidebar.TemplateSelectButton = ZN.CreateGenericButton("ZNBossTemplateSelectButton", BossSidebar, "TOPLEFT", BossSidebar, "TOPLEFT", 240, 30, 0, -40,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, "Select Template", "Select Template..", "LEFT",true )
BossSidebar.TemplateSelectButton.doOnUpdate = true
BossSidebar.TemplateSelectButton.OnUpdate = function(_,_,_,newValue) selectedTemplate = newValue end
BossSidebar.TemplatePreviewButton = ZN.CreateGenericButton("ZNBossTemplatePreviewButton", BossSidebar, "TOPLEFT", BossSidebar.TemplateSelectButton, "BOTTOMLEFT", 240, 30, 0, -20,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Preview Note", "CENTER",true )
BossSidebar.TemplatePreviewFrame = ZN.createSubFrame("ZNBossTemplatePreviewFrame", BossSidebar, 240, 350, nil, 1, "BOTTOMLEFT", "DIALOG", false, 0, 50)
BossSidebar.TemplatePreviewFrame.Scroll = ZN.createScrollFrame("ZNBossTemplatePreviewScrollFrame", BossSidebar.TemplatePreviewFrame, 240, 350, nil, 1, "CENTER","DIALOG", false, false, ZN.Colors.SBButtonBG)

-- Boss Sidebar Functions
BossSidebar.TemplateSelectButton:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN:getTableKeys(ZNotes.BossTemplates), ZN:getTableOrder(ZNotes.BossTemplates), 240, ZN.Colors.BG, "LEFT", 10, nil, "TOOLTIP") end)
BossSidebar.TemplatePreviewButton:SetScript("OnClick", function(self) 
  if selectedTemplate == nil or selectedTemplate == "Select Template.." then
    ZN:Print("You need to select a Boss Template")
    return
  end
  ZN:showPreview(ZN:printPreviewNote(selectedTemplate), BossSidebar.TemplatePreviewFrame.Scroll.scrollChild)
 end)

-- Boss Sidebar Buttons


-- BossSidebar.btnAdd = ZN.CreateIconButton(ZNSidebarFrame.btnCollapseSidebar, "BOTTOM", ZNSidebarFrame.btnCollapseSidebar, "TOP", 20, 20, 0, 20, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\plus_nobg", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
-- BossSidebar.btnUpdate = ZN.CreateIconButton(ZNSidebarFrame.btnCollapseSidebar, "BOTTOM", BossSidebar.btnAdd, "TOP", 20, 20, 0, 20, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\update", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
-- BossSidebar.btnReset = ZN.CreateIconButton(ZNSidebarFrame.btnCollapseSidebar, "BOTTOM", BossSidebar.btnUpdate, "TOP", 20, 20, 0, 20, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\reset", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
