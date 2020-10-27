local _, ZN, L = ...

-- Boss Sidebar
BossSidebar = ZNSidebarFrame.Subframes.Boss 
BossSidebar.TemplateSelectButton = ZN.CreateGenericButton("ZNBossTemplateSelectButton", BossSidebar, "TOPLEFT", BossSidebar, "TOPLEFT", 240, 30, 0, -40,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, "Preview Template", "Select Template..", "LEFT",true )
BossSidebar.TemplateSelectButton.doOnUpdate = true
BossSidebar.TemplateSelectButton.OnUpdate = function(_,_,_,newValue) print(newValue) end
-- Boss Sidebar Functions
BossSidebar.TemplateSelectButton:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN:getTableKeys(ZNotes.BossTemplates), ZN:getTableOrder(ZNotes.BossTemplates), 240, ZN.Colors.BG, "LEFT", 10) end)

