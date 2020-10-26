local _, ZN, L = ...
--930
ZN.PlayerTableColumns = {
  ["role"] = 100,
  ["class"] = 200,
  ["spellid"] = 80,
  ["spellname"] = 200,
  ["spelltype"] = 100,
  ["aoe"] = 50,
  ["station"] = 50,
  ["spellcd"] = 50,
  ["spellrating"] = 50,
  ["delete"] = 50,
}

ZN.PlayerTableColumnHeaders = {
  "role",
  "class",
  "spellid",
  "spellname",
  "spelltype",
  "aoe",
  "station",
  "spellcd",
  "spellrating",
  "delete",
}

ZN.PlayerTableColumnHeaderNames = {
  ["role"] = "Role",
  ["class"] = "Class",
  ["spellid"] = "ID",
  ["spellname"] = "Spellname",
  ["spelltype"] = "Type",
  ["aoe"] = "AOE",
  ["station"] = "Station",
  ["spellcd"] = "CD",
  ["spellrating"] = "Rating",
  ["delete"] = "Delete",
}

ZN.PlayerTableColumnButtonTypes = {
  ["role"] = "GenericButton",
  ["class"] = "GenericButton",
  ["spellid"] = "SingleLineEditBox",
  ["spellname"] = "SingleLineEditBox",
  ["spelltype"] = "GenericButton",
  ["aoe"] = "IconButton",
  ["station"] = "IconButton",
  ["spellcd"] = "SingleLineEditBox",
  ["spellrating"] = "SingleLineEditBox",
  ["delete"] = "IconButton",
}
ZN.PlayerTableIconButton = {
  ["aoe"]= {["size"]= 12, ["xOffset"]=19, ["type"]="checkBox"},
  ["station"]= {["size"]= 16, ["xOffset"]=36, ["type"]="checkBox"},
  ["delete"]= {["size"]= 16, ["xOffset"]=17, ["type"]="delete", ["texture"]="Interface\\AddOns\\ZeroNotes\\Media\\Texture\\delete2"}
}

ZN.PlayerTableCheckBoxTextures = {
  ["checked"] = "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\checkmark",
  ["checkedColor"] = ZN.Colors.hunter,
  ["unchecked"] = "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active",
  ["uncheckedColor"] = ZN.Colors.dk,
}

ZN.PlayerTableRows = {
  ["title"] = 30,
  ["row"] = 40,
  ["rowgap"] = 2,
}

--##############################################################################
local function CreateTitleRow()
  local TitleRow = ZN.createSubFrame("ZNPlayerTitleRow", ZNBodyFrame.Subframes.Player.scrollChild, 930, ZN.PlayerTableRows.title, ZN.Colors.BG, 1, "TOP", "HIGH", false, -5,0)
  local anchor = TitleRow
  for i=1, #ZN.PlayerTableColumnHeaders do
    local header = ZN.PlayerTableColumnHeaders[i]
    local text = ZN.PlayerTableColumnHeaderNames[header]
    local width = ZN.PlayerTableColumns[header]
    local height = ZN.PlayerTableRows.title
    local headerButton = ZN.CreateGenericButton("RoleTitle", TitleRow, "LEFT", anchor, anchor==TitleRow and "LEFT" or "RIGHT", width, height, 0, 0, 0, 0 ,10, ZN.Colors.INACTIVE, ZN.Colors.BG, nil, text, "CENTER", false)
    anchor = headerButton
  end
  return TitleRow
end

local function CreateContentRow(PlayerSpellID, PlayerSpell, AnchorFrame)
  local ContentRow = ZN.createSubFrame("ZNPlayerRow"..PlayerSpellID, ZNBodyFrame.Subframes.Player.scrollChild, 930, ZN.PlayerTableRows.row, ZN.Colors.ROWBG, 1, "TOP", "HIGH", false, 0,-ZN.PlayerTableRows.rowgap, AnchorFrame, "BOTTOM")
  --iconbutton on click setzen für onupdate
  return ContentRow
end

-- Player Body
local PlayerTable = ZNBodyFrame.Subframes.Player
-- Title Row
PlayerTable.TitleRow = CreateTitleRow()
-- Row 1
--PlayerTable.FirstRow = ZN.createSubFrame("ZNPlayerFirstRow", ZNBodyFrame.Subframes.Player.scrollChild, 930, ZN.PlayerTableRows.row, ZN.Colors.ROWBG, 1, "TOP", "HIGH", false, -5,-32)
PlayerTable.FirstRow = CreateContentRow(1, nil, PlayerTable.TitleRow)
PlayerTable.FirstRow.Role = ZN.CreateGenericButton("RoleTitle", PlayerTable.FirstRow, "LEFT", PlayerTable.FirstRow, "LEFT", ZN.PlayerTableColumns.role, ZN.PlayerTableRows.row, 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, "Role", "CENTER", false)
PlayerTable.FirstRow.Class = ZN.CreateGenericButton("ClassTitle", PlayerTable.FirstRow, "LEFT", PlayerTable.FirstRow.Role, "RIGHT", ZN.PlayerTableColumns.class, ZN.PlayerTableRows.row, 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, "Class", "CENTER", false)
PlayerTable.FirstRow.SpellId = ZN.SingleLineEditBox("SpellId", PlayerTable.FirstRow, "LEFT", PlayerTable.FirstRow.Class, "RIGHT", ZN.PlayerTableColumns.spellid, ZN.PlayerTableRows.row, 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, "186265", "CENTER")
PlayerTable.FirstRow.SpellName = ZN.SingleLineEditBox("SpellName", PlayerTable.FirstRow, "LEFT", PlayerTable.FirstRow.SpellId, "RIGHT", ZN.PlayerTableColumns.spellname, ZN.PlayerTableRows.row, 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, GetSpellInfo(PlayerTable.FirstRow.SpellId:GetText()):upper(), "CENTER")
PlayerTable.FirstRow.SpellType = ZN.CreateGenericButton("SpellIdTitle", PlayerTable.FirstRow, "LEFT", PlayerTable.FirstRow.SpellName, "RIGHT", ZN.PlayerTableColumns.spelltype, ZN.PlayerTableRows.row, 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, "Type", "CENTER", false)
PlayerTable.FirstRow.Aoe = ZN.CreateIconButton(PlayerTable.FirstRow, "LEFT", PlayerTable.FirstRow.SpellType, "RIGHT", 12, 12, 19, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active", ZN.Colors.ACTIVE, ZN.Colors.dk, false)
PlayerTable.FirstRow.Station = ZN.CreateIconButton(PlayerTable.FirstRow, "LEFT", PlayerTable.FirstRow.Aoe, "RIGHT", 16, 16, 36, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\checkmark", ZN.Colors.ACTIVE, ZN.Colors.hunter, false)
PlayerTable.FirstRow.SpellCd = ZN.SingleLineEditBox("SpellCd", PlayerTable.FirstRow, "LEFT", PlayerTable.FirstRow.Station, "RIGHT", ZN.PlayerTableColumns.spellcd, ZN.PlayerTableRows.row, 17, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, "180", "CENTER")
PlayerTable.FirstRow.SpellRating = ZN.SingleLineEditBox("SpellCd", PlayerTable.FirstRow, "LEFT", PlayerTable.FirstRow.SpellCd, "RIGHT", ZN.PlayerTableColumns.spellrating, ZN.PlayerTableRows.row, 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, "500", "CENTER")
PlayerTable.FirstRow.Delete = ZN.CreateIconButton(PlayerTable.FirstRow, "LEFT", PlayerTable.FirstRow.SpellRating, "RIGHT", 16, 16, 17, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\delete2", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
-- Row 2
PlayerTable.SecondRow = ZN.createSubFrame("ZNPlayerSecondRow", ZNBodyFrame.Subframes.Player.scrollChild, 930, ZN.PlayerTableRows.row, ZN.Colors.ROWBG, 1, "TOP", "HIGH", false, -5,-74)
PlayerTable.SecondRow.Role = ZN.CreateGenericButton("RoleTitle", PlayerTable.SecondRow, "LEFT", PlayerTable.SecondRow, "LEFT", ZN.PlayerTableColumns.role, ZN.PlayerTableRows.row, 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, "Role", "CENTER", false)
PlayerTable.SecondRow.Class = ZN.CreateGenericButton("ClassTitle", PlayerTable.SecondRow, "LEFT", PlayerTable.SecondRow.Role, "RIGHT", ZN.PlayerTableColumns.class, ZN.PlayerTableRows.row, 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, "Class", "CENTER", false)
PlayerTable.SecondRow.SpellId = ZN.CreateGenericButton("SpellIdTitle", PlayerTable.SecondRow, "LEFT", PlayerTable.SecondRow.Class, "RIGHT", ZN.PlayerTableColumns.spellid, ZN.PlayerTableRows.row, 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, "ID", "CENTER", false)
PlayerTable.SecondRow.SpellName = ZN.CreateGenericButton("SpellIdTitle", PlayerTable.SecondRow, "LEFT", PlayerTable.SecondRow.SpellId, "RIGHT", ZN.PlayerTableColumns.spellname, ZN.PlayerTableRows.row, 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, "Spellname", "CENTER", false)
PlayerTable.SecondRow.SpellType = ZN.CreateGenericButton("SpellIdTitle", PlayerTable.SecondRow, "LEFT", PlayerTable.SecondRow.SpellName, "RIGHT", ZN.PlayerTableColumns.spelltype, ZN.PlayerTableRows.row, 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, "Type", "CENTER", false)
PlayerTable.SecondRow.Aoe = ZN.CreateGenericButton("SpellIdTitle", PlayerTable.SecondRow, "LEFT", PlayerTable.SecondRow.SpellType, "RIGHT", ZN.PlayerTableColumns.aoe, ZN.PlayerTableRows.row, 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, "AoE", "CENTER", false)
PlayerTable.SecondRow.Station = ZN.CreateGenericButton("SpellIdTitle", PlayerTable.SecondRow, "LEFT", PlayerTable.SecondRow.Aoe, "RIGHT", ZN.PlayerTableColumns.station, ZN.PlayerTableRows.row, 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, "Station", "CENTER", false)
PlayerTable.SecondRow.SpellCd = ZN.CreateGenericButton("SpellIdTitle", PlayerTable.SecondRow, "LEFT", PlayerTable.SecondRow.Station, "RIGHT", ZN.PlayerTableColumns.spellcd, ZN.PlayerTableRows.row, 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, "CD", "CENTER", false)
PlayerTable.SecondRow.SpellRating = ZN.CreateGenericButton("SpellIdTitle", PlayerTable.SecondRow, "LEFT", PlayerTable.SecondRow.SpellCd, "RIGHT", ZN.PlayerTableColumns.spellrating, ZN.PlayerTableRows.row, 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, "Rating", "CENTER", false)
PlayerTable.SecondRow.Delete = ZN.CreateGenericButton("DeleteTitle", PlayerTable.SecondRow, "LEFT", PlayerTable.SecondRow.SpellRating, "RIGHT", ZN.PlayerTableColumns.delete, ZN.PlayerTableRows.row, 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, "Delete", "CENTER", false)

-- TEST
PlayerTable.FirstRow.Role:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN.Roles, ZN.RolesOrder, ZN.PlayerTableColumns.role, ZN.Colors.SBButtonBG, "CENTER",0) end)
PlayerTable.FirstRow.Class:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN.DropdownFake, ZN.DropdownFakeOrder, ZN.PlayerTableColumns.class, ZN.Colors.SBButtonBG, "CENTER",0) end)
PlayerTable.FirstRow.SpellType:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN.Types, ZN.TypesOrder, ZN.PlayerTableColumns.spelltype, ZN.Colors.SBButtonBG, "CENTER", 0) end)