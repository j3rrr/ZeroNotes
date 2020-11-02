local _, ZN, L = ...
local function onUILoad(text)
    if text=="ZeroNotes" or IsAddOnLoaded("ZeroNotes") then
      ZNLoaded = true
    end
  
    if ZNLoaded then
      ZNotes = ZNotes or {}
      ZN.initMinimapButton()
      if not ZNotes.PlayerSpells then
        ZN.initPlayerSpells()
      end
      if not ZNotes.DebugMode then
        ZNotes.DebugMode = false
      end
      ZN.initBossTemplates()
      ZN.initGroupTemplates()
      ZN.initLastTemplates()
      ZN:createGroupTemplateFrames()
      ZN:Config()
      ZNEventHandler:Unregister('ADDON_LOADED', 'onUILoad')
      ZNEventHandler:Unregister('PLAYER_LOGIN', 'onUILoad')
      ZN.icon:Register("ZNLDB", ZN.ZNLDB, ZNotes.minimap)
      ZN:UpdateMinimapButton()
      if ZNotes.DebugMode then ZNFrame:Show() end
    end
end
ZNEventHandler:Register('ADDON_LOADED', onUILoad, 'onUILoad')
ZNEventHandler:Register('PLAYER_LOGIN', onUILoad, 'onUILoad')