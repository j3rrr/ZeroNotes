local _, ZN, L = ...
local function onUILoad(text)
    if text=="ZeroNotes" or IsAddOnLoaded("ZeroNotes") then
      ZNLoaded = true
    end
  
    if ZNLoaded then
    ZNotes = ZNotes or {}
    ZN.initMinimapButton()
    ZN.initPlayerSpells()
    ZN.initBossTemplates()
    ZNEventHandler:Unregister('ADDON_LOADED', 'onUILoad')
    ZNEventHandler:Unregister('PLAYER_LOGIN', 'onUILoad')
    ZN.icon:Register("ZNLDB", ZN.ZNLDB, ZNotes.minimap)
    ZN:UpdateMinimapButton()
    end
end
ZNEventHandler:Register('ADDON_LOADED', onUILoad, 'onUILoad')
ZNEventHandler:Register('PLAYER_LOGIN', onUILoad, 'onUILoad')