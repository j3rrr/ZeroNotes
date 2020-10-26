local _, ZN, L = ...

-- local ZNLDB = LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("ZeroNotes", {
-- 	type = "launcher",
--   icon = "Interface\\Addons\\ZeroNotes\\Media\\Texture\\zero_logo",
-- 	OnClick = function(clickedframe, button)
-- 		ZN:Toggle()
-- 	end,
-- })

-- local icon = LibStub("LibDBIcon-1.0")
-- icon:Register("ZNLDB", ZNLDB, ZNotes.blab)


-- local addon = LibStub("AceAddon-3.0"):NewAddon("Bunnies", "AceConsole-3.0")
-- local bunnyLDB = LibStub("LibDataBroker-1.1"):NewDataObject("Bunnies!", {
-- type = "data source",
-- text = "Bunnies!",
-- icon = "Interface\Icons\INV_Chest_Cloth_17",
-- OnClick = function() print("BUNNIES ARE TAKING OVER THE WORLD") end,
-- })
-- local icon = LibStub("LibDBIcon-1.0")

-- function addon:OnInitialize() -- Obviously you'll need a ## SavedVariables: BunniesDB line in your TOC, duh! self.db = LibStub("AceDB-3.0"):New("BunniesDB", { profile = { minimap = { hide = false, }, }, }) icon:Register("Bunnies!", bunnyLDB, self.db.profile.minimap) self:RegisterChatCommand("bunnies", "CommandTheBunnies") end

-- function addon:CommandTheBunnies() self.db.profile.minimap.hide = not self.db.profile.minimap.hide if self.db.profile.minimap.hide then icon:Hide("Bunnies!") else icon:Show("Bunnies!") end end 