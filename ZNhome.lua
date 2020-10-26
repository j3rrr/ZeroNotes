local _, ZN, L = ...

-- Home Sidebar
ZNSidebarFrame.Subframes.Home.ClassSelectButton = ZN.CreateGenericButton("ZNClassSelectButton", ZNSidebarFrame.Subframes.Home, "TOPLEFT", ZNSidebarFrame.Subframes.Home, "TOPLEFT", 240, 30, 0, -40,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, "Filter by Class", "Select Class..", "LEFT",true )
ZNSidebarFrame.Subframes.Home.TemplateSelectButton = ZN.CreateGenericButton("ZNTemplateSelectButton", ZNSidebarFrame.Subframes.Home, "TOPLEFT", ZNSidebarFrame.Subframes.Home.ClassSelectButton, "BOTTOMLEFT", 240, 30, 0, -40,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, "Select Encounter Template", "Select Template...", "LEFT",true )
ZNSidebarFrame.Subframes.Home.ShowNoteInEditorButton = ZN.CreateGenericButton("ShowNoteInEditorButton", ZNSidebarFrame.Subframes.Home, "BOTTOMLEFT", ZNSidebarFrame.Subframes.Home, "BOTTOMLEFT", 240, 30, 0, 70,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Show Note", "CENTER",true )
ZNSidebarFrame.Subframes.Home.SendToExRTButton = ZN.CreateGenericButton("SendToExRTButton", ZNSidebarFrame.Subframes.Home, "TOPLEFT", ZNSidebarFrame.Subframes.Home.ShowNoteInEditorButton, "BOTTOMLEFT", 240, 30, 0, 70,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Send Note to ExRT", "CENTER",true )
-- Home Sidebar Functions
ZNSidebarFrame.Subframes.Home.ClassSelectButton:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN.DropdownFake, ZN.DropdownFakeOrder, 240, ZN.Colors.BG, "LEFT", 10) end)
ZNSidebarFrame.Subframes.Home.TemplateSelectButton:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN.DropdownFake2, ZN.DropdownFake2Order, 240, ZN.Colors.BG, "LEFT", 10) end)
ZNSidebarFrame.Subframes.Home.SendToExRTButton:SetScript("OnClick", function(self) ZN:SendToExRT("Send to ExRT Button") end)
ZNSidebarFrame.Subframes.Home.ShowNoteInEditorButton:SetScript("OnClick", function(self) ZN:ShowNoteInEditor("Show Note Button") end)

-- Home Body
