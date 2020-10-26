local _, ZN, L = ...
local function onUILoad(text)
    if text=="ZeroNotes" or IsAddOnLoaded("ZeroNotes") then
      ZNLoaded = true
    end
  
    if ZNLoaded then
      ZNotes = ZNotes or {}
      ZN.initPlayerSpells()
      ZNEventHandler:Unregister('ADDON_LOADED', 'onUILoad')
          ZNEventHandler:Unregister('PLAYER_LOGIN', 'onUILoad')
    end
end
ZNEventHandler:Register('ADDON_LOADED', onUILoad, 'onUILoad')
ZNEventHandler:Register('PLAYER_LOGIN', onUILoad, 'onUILoad')