local _, ZN, L = ...

-- Home Sidebar
HomeSidebar = ZNSidebarFrame.Subframes.Home
HomeSidebar.ClassSelectButton = ZN.CreateGenericButton("ZNClassSelectButton", HomeSidebar, "TOPLEFT", HomeSidebar, "TOPLEFT", 240, 30, 0, -30,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, "Filter by Class", "Select Class..", "LEFT",true )
HomeSidebar.SendToExRTButton = ZN.CreateGenericButton("SendToExRTButton", HomeSidebar, "BOTTOMLEFT", HomeSidebar, "BOTTOMLEFT", 240, 30, 0, 80,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Send Note to ExRT", "CENTER",true )
HomeSidebar.ShowNoteInEditorButton = ZN.CreateGenericButton("ShowNoteInEditorButton", HomeSidebar, "TOPLEFT", HomeSidebar.SendToExRTButton, "BOTTOMLEFT", 240, 30, 0, -10,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Show Note", "CENTER",true )

-- Home Sidebar Functions
HomeSidebar.ClassSelectButton:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN.PlayerClassesColored, ZN.PlayerClassesColoredOrder, 240, ZN.Colors.BG, "LEFT", 10) end)
HomeSidebar.SendToExRTButton:SetScript("OnClick", function(self) ZN:SendToExRT("Send to ExRT Button") end)
HomeSidebar.ShowNoteInEditorButton:SetScript("OnClick", function(self) ZN:ShowNoteInEditor("Show Note Button") end)

-- Home Body
HomeContent = ZNBodyFrame.Subframes.Home
HomeContent.UrlButton = ZN.CreateGenericButton("HomeUrlButton", HomeContent, "BOTTOM", HomeContent, "BOTTOM", 640, 30, 0, 0,0,0, 10, ZN.Colors.INACTIVE, ZN.Colors.BG, nil, "www.zero-wow.de", "CENTER",false )
HomeContent.UrlButton:SetScript("OnClick", function(self) ZN:ToggleInfo(self) end)
HomeContent.MainTitle = ZN.CreateText(HomeContent, "TOP", HomeContent, "TOP", 640, 30, 0, -30, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNVers.ttf", 18, ZN.Colors.ACTIVE, "Welcome to Zero Notes", "LEFT", "TOP")
HomeContent.MainIntro = ZN.CreateText(HomeContent, "TOP", HomeContent.MainTitle, "BOTTOM", 640, 60, 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNTitle.ttf", 14, ZN.Colors.ACTIVE, 
"This addon is designed to automatically create notes, populated with heal / immunity / utility spells, depending on your current raidsetup."
, "LEFT", "TOP",8)
HomeContent.HowToTitle = ZN.CreateText(HomeContent, "TOP", HomeContent.MainIntro, "BOTTOM", 640, 30, 0, -20, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 18, ZN.Colors.ACTIVE, "How to use", "LEFT", "TOP")
HomeContent.Paragraph = ZN.CreateText(HomeContent, "TOP", HomeContent.HowToTitle, "BOTTOM", 640, 250, 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNTitle.ttf", 14, ZN.Colors.ACTIVE, 
"* Use the editor to set ratings, types, etc for all playerspells, you want to assign during encounters\n"
.."* Use the editor to create a template for each boss\n"
.."* Create the note or send it directly to all raidmembers using Exorsus Raid Tools\n\n"
.."Playerspells with the highest rating will be assigned to the highest priority spells in an encounter first to make sure that all important spells will be covered.\n"
.."Spells will be blocked when they have been used until they are off cooldown.\n"
.."If you don't have any more useable spells, there will be a notification in the note.\n"
.."Define how many healing cooldowns, utility spells or immunities you want to use each time.\nSee the default template to get an idea.\n"

, "LEFT", "TOP",8)