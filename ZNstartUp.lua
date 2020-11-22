local _, ZN, L = ...
local function onUILoad(text)
    if text=="ZeroNotes" or IsAddOnLoaded("ZeroNotes") then
      ZNLoaded = true
    end
    
    if ZNLoaded then
      ZNotes = ZNotes or {}
      ZN.initMinimapButton()
      if not ZNotes.PlayerSpells or not ZNotes.PlayerSpellsMigrated then
        ZN.initPlayerSpells()
      end
      if not ZNotes.DebugMode then
        ZNotes.DebugMode = false
      end
      C_ChatInfo.RegisterAddonMessagePrefix('ZERONOTE')
      ZN.initBossTemplates()
      ZN.initGroupTemplates()
      ZN.initLastTemplates()
      ZN.initSavedNotes()
      ZN:initHome()
      ZN:createGroupTemplateFrames()
      ZN:Config()
      if ZNotes.DebugMode then
        ZNSidebarFrame.Subframes.Home.btnConfig:SetShown(true)
      end
      ZNEventHandler:Unregister('ADDON_LOADED', 'onUILoad')
      ZNEventHandler:Unregister('PLAYER_LOGIN', 'onUILoad')
      ZN.icon:Register("ZNLDB", ZN.ZNLDB, ZNotes.minimap)
      ZN:UpdateMinimapButton()
      if ZNotes.DebugMode then ZNFrame:Show() end
    end
end

local function enterWorld()
  ZN:getEncounterIDs()
  ZNEventHandler:Unregister('PLAYER_ENTERING_WORLD', 'enterWorld')
end
ZNEventHandler:Register('ADDON_LOADED', onUILoad, 'onUILoad')
ZNEventHandler:Register('PLAYER_ENTERING_WORLD', enterWorld, 'enterWorld')
ZNEventHandler:Register('PLAYER_LOGIN', onUILoad, 'onUILoad')