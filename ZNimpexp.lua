local _, ZN, L = ...

ImpExpSidebar = ZNSidebarFrame.Subframes.ImpExp
ImpExpContent = ZNBodyFrame.Subframes.ImpExp

ImpExpSidebar.ImpExpPlayerDbButton = ZN.CreateGenericButton("ImpExpPlayerDbButton", ImpExpSidebar, "TOPLEFT", ImpExpSidebar, "TOPLEFT", 240, 30, 0, -30,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Playerspell DB", "CENTER",true )
ImpExpSidebar.ImpExpBossTemplateButton = ZN.CreateGenericButton("ImpExpBossTemplateButton", ImpExpSidebar, "TOPLEFT", ImpExpSidebar.ImpExpPlayerDbButton, "BOTTOMLEFT", 240, 30, 0, -10,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Boss Templates", "CENTER",true )
ImpExpSidebar.ImpExpBossWeakaurasButton = ZN.CreateGenericButton("ImpExpBossWeakaurasButton", ImpExpSidebar, "TOPLEFT", ImpExpSidebar.ImpExpBossTemplateButton, "BOTTOMLEFT", 240, 30, 0, -10,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Weakauras", "CENTER",true )

ImpExpContent.PlayerDbSubframe = ZN.createSubFrame("PlayerDbSubframe", ImpExpContent, 680, 530, ZN.Colors.BG, 1, "TOP","HIGH", true, 0, 0)
ImpExpContent.BossTemplateSubframe = ZN.createSubFrame("BossTemplateSubframe", ImpExpContent, 680, 530, ZN.Colors.dk, 1, "TOP","HIGH", true, 0, 0)
ImpExpContent.WeakaurasSubframe = ZN.createSubFrame("WeakaurasSubframe", ImpExpContent, 680, 530, ZN.Colors.hunter, 1, "TOP","HIGH", true, 0, 0)

ImpExpSidebar.ImpExpPlayerDbButton:SetScript("OnClick", function(self) ZN:ToggleImpExpView("ImpExpContent.PlayerDbSubframe") end)
ImpExpSidebar.ImpExpBossTemplateButton:SetScript("OnClick", function(self) ZN:ToggleImpExpView("ImpExpContent.BossTemplateSubframe") end)
ImpExpSidebar.ImpExpBossWeakaurasButton:SetScript("OnClick", function(self) ZN:ToggleImpExpView("ImpExpContent.WeakaurasSubframe") end)

PlayerDbSubframe = ImpExpContent.PlayerDbSubframe
local introText = 'Insert an import string or click the "Export" button to share your DB with others'
PlayerDbSubframe.Intro = ZN.CreateText(PlayerDbSubframe, "TOP", PlayerDbSubframe, "TOP", 640, 30, 0, -30, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 12, ZN.Colors.ACTIVE, introText, "LEFT", "TOP")

local sample = "Wyp5VvYlyisjCcgbCiQll6XJhrT7WNsgGS2GkQ3ikiabNipyA8mHpJTmRxJI3wcdCYK2pvpWCg6gQf6ePxy3PN9YZp7iQmvVpnDRxQRMDFlf4SbWfgO71mPiziA8K4th79F9D5H6p8gmz37HbxFxI4jdR44OI14IzPnJOMluRBT8lBnSRT2pVz1J4cA2ogjy7kdZjyym0luAQ0y9UMI16HUwjDchINpGcdeCAPpYXt070yHHhoOdibv6T30qhnrnapgIX8asjNGDX8ql8A6Hzy0b7YnHrUKAPJc7bEL47EAdPt6iOJvGRSzrqqsLqSIeiJ9EXCw3pvWHDVpGar5X5FNvEE5VTgBuhZaBc01H6QWTBfH3Mfg5RWo5rUpkvBQiOnGOTrOLjboJMO5n4HC97zjlezgYQ7UvOxCzvVtyXtNBdUdpW8OpPVuHZrUzHaiEWNNpF6CVjOXbt1OjOip2wHChrgoPhCIqoPwncVatgBGVfRLdwVx5"
PlayerDbSubframe.EditBox = ZN.MultiLineEditBox("PlayerDbEditBox", PlayerDbSubframe, "TOP", PlayerDbSubframe.Intro, "TOP", 660, 250, 0, -30, 0, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.HD, nil, "", "LEFT")
PlayerDbSubframe.PlayerDbImportButton = ZN.CreateGenericButton("PlayerDbImportButton", PlayerDbSubframe, "TOPLEFT", PlayerDbSubframe.EditBox, "BOTTOMRIGHT", 200, 30, -200, -10,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Import Spell DB", "CENTER",true )
PlayerDbSubframe.PlayerDbExportButton = ZN.CreateGenericButton("PlayerDbExportButton", PlayerDbSubframe, "RIGHT", PlayerDbSubframe.PlayerDbImportButton, "LEFT", 200, 30, -10, 0,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Export Spell DB", "CENTER",true )

PlayerDbSubframe.PlayerDbExportButton:SetScript("OnClick", function(self) PlayerDbSubframe.EditBox.editbox:SetText(sample) end)