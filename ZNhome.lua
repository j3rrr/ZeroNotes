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
HomeContent = ZNBodyFrame.Subframes.Home
HomeContent.UrlButton = ZN.CreateGenericButton("HomeUrlButton", HomeContent, "BOTTOM", HomeContent, "BOTTOM", 640, 30, 0, 0,0,0, 10, ZN.Colors.INACTIVE, ZN.Colors.BG, nil, "www.zero-wow.de", "CENTER",false )
HomeContent.UrlButton:SetScript("OnClick", function(self) ZN:ToggleInfo(self) end)
HomeContent.MainTitle = ZN.CreateText(HomeContent, "TOP", HomeContent, "TOP", 640, 30, 0, -10, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNVers.ttf", 18, ZN.Colors.ACTIVE, "Welcome to Zero Notes", "LEFT", "TOP")
HomeContent.MainIntro = ZN.CreateText(HomeContent, "TOP", HomeContent.MainTitle, "BOTTOM", 640, 60, 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNTitle.ttf", 14, ZN.Colors.ACTIVE, 
"This addon is designed to automatically create notes, populated with heal / immunity / utility spells, depending on your current raidsetup."
, "LEFT", "TOP",8)
HomeContent.HowToTitle = ZN.CreateText(HomeContent, "TOP", HomeContent.MainIntro, "BOTTOM", 640, 30, 0, -20, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 18, ZN.Colors.ACTIVE, "How to use", "LEFT", "TOP")
HomeContent.Paragraph = ZN.CreateText(HomeContent, "TOP", HomeContent.HowToTitle, "BOTTOM", 640, 250, 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNTitle.ttf", 14, ZN.Colors.ACTIVE, 
"* Use the editor to set ratings, types, etc for all playerspells, you want to assign during encounters\n"
.."* Use the editor to create a template for each boss\n"
.."* Create the note or send it directly to all raidmembers using Exorsus Raid Tools\n"
.."Playerspells with the highest rating will be assigned to the highest priority spells in an encounter first to make sure that all important spells will be covered.\n"
.."Spells will be blocked when they have been used until they are off cooldown.\n"
.."If you don't have any more useable spells, there will be a notification in the note.\n"
.."Define how many healing cooldowns, utility spells or immunities you want to use each time.\nSee the default template to get an idea.\n"

, "LEFT", "TOP",8)