local _, ZN, L = ...

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
BossSidebar.TemplatePreviewButton:SetScript("OnClick", function(self) ZN:showPreview(ZN:printPreviewNote(selectedTemplate), BossSidebar.TemplatePreviewFrame.Scroll.scrollChild) end)


