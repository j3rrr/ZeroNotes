local _, ZN, L = ...

function ZN:Config()
  ZNBodyFrame.Subframes.Home.ConfigFrame = ZN.createSubFrame("ZNConfig", HomeContent, 680 , 530, ZN.Colors.BG, 1, "TOP", "DIALOG", true, 0, 0, nil, nil, nil)
  ConfigFrame = HomeContent.ConfigFrame
  ConfigFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
    edgeFile = [[Interface\Buttons\WHITE8x8]],
    edgeSize = 1,
  });
  ConfigFrame:SetBackdropColor(tonumber("0x"..ZN.Colors.HD:sub(1,2))/255, tonumber("0x"..ZN.Colors.HD:sub(3,4))/255, tonumber("0x"..ZN.Colors.HD:sub(5,6))/255, 1);
  ConfigFrame:SetBackdropBorderColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1);

  ConfigFrame.btnClose = ZN.CreateIconButton(ConfigFrame, "TOPRIGHT", ConfigFrame, "TOPRIGHT", 16, 16, -10, -10, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
  ConfigFrame.btnClose:SetScript("OnClick", function(self) ConfigFrame:Hide() end)

  ConfigFrame.DebugModeCheckBox = ZN:createCheckBox(ConfigFrame, "TOPLEFT", ConfigFrame, "TOPLEFT", 20, -20, "Debug Mode", 14, ZN.Colors.ACTIVE, 200, ZNotes.DebugMode) 
  ConfigFrame.DebugModeCheckBox:SetScript("OnClick",function(self)
    self.toggleChecked()
    ZNotes.DebugMode = self.active
    ZN:DebugModeToggle()
  end)

  ConfigFrame.DebugModeCheckBox.button:SetScript("OnMouseDown",function()
    ConfigFrame.DebugModeCheckBox.toggleChecked()
    ZNotes.DebugMode = ConfigFrame.DebugModeCheckBox
    ZN:DebugModeToggle()
  end)
  ZNDebugMode = {}
  ZNDebugMode.btnReload = ZN.CreateGenericButton("ZNDebugReloadButton", ZNFrame, "BOTTOMRIGHT", ZNFrame, "TOPRIGHT", 240, 30, 0,20,0,0, 12, ZN.Colors.black, ZN.Colors.chatGeneral, nil, "/reload", "CENTER",true, ZN.Colors.SBButtonBG )
  ZNDebugMode.btnReload:SetScript("OnClick", function() ReloadUI() end)

  if not ConfigFrame.DebugModeCheckBox.active then
    ZNDebugMode.btnReload:Hide()
  end

  function ZN:DebugModeToggle()
    ZNDebugMode.btnReload:SetShown(not ZNDebugMode.btnReload:IsShown());
  end
end