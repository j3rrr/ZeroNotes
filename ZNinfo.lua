local _, ZN, L = ...

-- Info Frame
ZNInfoFrame.btnClose = ZN.CreateIconButton(ZNInfoFrame, "TOPRIGHT", ZNInfoFrame, "TOPRIGHT", 16, 16, -9, -9, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
ZNInfoFrame.Title = ZN.CreateText(ZNInfoFrame, "CENTER", ZNInfoFrame, "TOP", 250, 30, 0, -29, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 18, ZN.Colors.ACTIVE, ZN.Title.." "..ZN.Version)
ZNInfoFrame.UrlBox = ZN.SingleLineEditBox("UrlBox", ZNInfoFrame, "TOPLEFT", ZNInfoFrame.Title, "BOTTOMLEFT", 250, 30, 0, -22, 20, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "www.zero-wow.de", "CENTER")
ZNInfoFrame.CreatedBy = ZN.CreateText(ZNInfoFrame, "TOP", ZNInfoFrame.UrlBox, "BOTTOM", 250, 40, 0, -12, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 12, ZN.Colors.INACTIVE, "Created by\nBambule#21598 & Serafno#2492", "CENTER")
ZNInfoFrame.GICredits = ZN.CreateText(ZNInfoFrame, "BOTTOM", ZNInfoFrame, "BOTTOM", 250, 30, 0, 10, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 10, ZN.Colors.INACTIVE, "'Kraken' & 'Monk' Icons by www.game-icons.net", "CENTER")


-- Info Frame Functions
ZNInfoFrame.btnClose:SetScript("OnClick", function(self) ZNInfoFrame:Hide() end)

ZNInfoFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
  edgeFile = [[Interface\Buttons\WHITE8x8]],
  edgeSize = 1,
});
ZNInfoFrame:SetBackdropColor(tonumber("0x"..ZN.Colors.HD:sub(1,2))/255, tonumber("0x"..ZN.Colors.HD:sub(3,4))/255, tonumber("0x"..ZN.Colors.HD:sub(5,6))/255, 1);
ZNInfoFrame:SetBackdropBorderColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1);