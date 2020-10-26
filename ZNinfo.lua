local _, ZN, L = ...

-- Info Frame
ZNInfoFrame.btnClose = ZN.CreateIconButton(ZNInfoFrame, "TOPRIGHT", ZNInfoFrame, "TOPRIGHT", 16, 16, -10, -10, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
ZNInfoFrame.Title = ZN.CreateText(ZNInfoFrame, "CENTER", ZNInfoFrame, "TOP", 250, 30, 0, -30, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 18, ZN.Colors.ACTIVE, ZN.Title.." "..ZN.Version)
ZNInfoFrame.UrlBox = ZN.SingleLineEditBox("UrlBox", ZNInfoFrame, "TOPLEFT", ZNInfoFrame.Title, "BOTTOMLEFT", 250, 30, 0, -30, 20, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "www.zero-wow.de", "CENTER")
ZNInfoFrame.GICredits = ZN.CreateGenericButton("ZNGICredits", ZNInfoFrame, "BOTTOM", ZNInfoFrame, "BOTTOM", 300, 30, 0, 0,0,0, 10, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, "Kraken' & 'Monk' Icons by www.game-icons.net", "CENTER",false )
-- Info Frame Functions
ZNInfoFrame.btnClose:SetScript("OnClick", function(self) ZNInfoFrame:Hide() end)