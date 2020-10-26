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

-- Home Body Text
HomeTitle = "Welcome to Zero Notes"
HomeParagraph = "This addon is designed to automatically create notes, populated with heal / immunity / utility spells, depending on your current raidsetup.\n"
HomeParagraph = HomeParagraph .. "Blablabal"

-- Home Body
HomeContent = ZNBodyFrame.Subframes.Home
HomeContent.Text = ZN.CreateText(HomeContent, "TOP", HomeContent, "TOP", 680, 30, 0, -10, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNVers.ttf", 18, ZN.Colors.ACTIVE, HomeTitle, "LEFT", "TOP")
HomeContent.Paragraph = ZN.CreateText(HomeContent, "TOP", HomeContent.Text, "BOTTOM", 680, 100, 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 12, ZN.Colors.ACTIVE, HomeParagraph, "LEFT", "TOP",24)
HomeContent.UrlButton = ZN.CreateGenericButton("HomeUrlButton", HomeContent, "BOTTOM", HomeContent, "BOTTOM", 680, 30, 0, 0,0,0, 10, ZN.Colors.INACTIVE, ZN.Colors.BG, nil, "www.zero-wow.de", "CENTER",false )
-- Functions
HomeContent.UrlButton:SetScript("OnClick", function(self) ZN:ToggleInfo(self) end)