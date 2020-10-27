local _, ZN, L = ...
--930
ZN.PlayerInit=false

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
  ["aoe"]= {["size"]= 16, ["xOffset"]=17, ["type"]="checkBox"},
  ["station"]= {["size"]= 16, ["xOffset"]=34, ["type"]="checkBox"},
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

ZN.PlayerDropdowns = {
  ["role"] = {["content"]=ZN.ColoredRoles, ["order"]=ZN.ColoredRolesOrder},
  ["class"] = {["content"]=ZN.PlayerClassesColored, ["order"]=ZN.PlayerClassesColoredOrder},
  ["spelltype"] = {["content"]=ZN.Types, ["order"]=ZN.TypesOrder}
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
    local headerButton = ZN.CreateGenericButton(nil, TitleRow, "LEFT", anchor, anchor==TitleRow and "LEFT" or "RIGHT", width, height, 0, 0, 0, 0 ,10, ZN.Colors.INACTIVE, ZN.Colors.BG, nil, text, "CENTER", false)
    anchor = headerButton
  end
  return TitleRow
end

local function CreateGenericButton (name, parent, point, anchor, anchorPoint, type, text)
  local btn = ZN.CreateGenericButton(name, parent, point, anchor, anchorPoint, ZN.PlayerTableColumns[type], ZN.PlayerTableRows.row, 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, text, "CENTER", false)
  btn:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN.PlayerDropdowns[type].content, ZN.PlayerDropdowns[type].order, ZN.PlayerTableColumns[type], ZN.Colors.SBButtonBG, "CENTER",0, ZN.Colors.HD) end)
  return btn
end

local function CreateSingleLIneEditBox(name, parent, point, anchor, anchorPoint, type, text, xOffSet)
  local tb = ZN.SingleLineEditBox(name, parent, point, anchor, anchorPoint, ZN.PlayerTableColumns[type], ZN.PlayerTableRows.row, xOffSet and xOffSet or 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, text, "CENTER")
  return tb
end

local function CreateCheckBox(parent, point, anchor, anchorPoint, type, row, checked)
  local cb = ZN.CreateIconButton(parent, point, anchor, anchorPoint, ZN.PlayerTableIconButton[type].size, ZN.PlayerTableIconButton[type].size, ZN.PlayerTableIconButton[type].xOffset, 0, ZN.PlayerTableCheckBoxTextures.checked, ZN.PlayerTableCheckBoxTextures.checkedColor, ZN.PlayerTableCheckBoxTextures.uncheckedColor, true, ZN.Colors.ACTIVE)
  cb.toggleChecked = function()
    if cb.active then
      cb.active=false
      cb:SetNormalTexture(ZN.PlayerTableCheckBoxTextures.unchecked)
    else
      cb.active=true
      cb:SetNormalTexture(ZN.PlayerTableCheckBoxTextures.checked)
    end
  end
  if not checked then
    cb.toggleChecked()
    cb:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.PlayerTableCheckBoxTextures.uncheckedColor:sub(1,2))/255, tonumber("0x"..ZN.PlayerTableCheckBoxTextures.uncheckedColor:sub(3,4))/255, tonumber("0x"..ZN.PlayerTableCheckBoxTextures.uncheckedColor:sub(5,6))/255, 1)
  end
  cb.Row = row
  cb.Column = type
  return cb
end


local function CreateText(parent, point, anchor, anchorPoint, type, text, xOffset)
  local txt = ZN.CreateText(parent, point, anchor, anchorPoint, ZN.PlayerTableColumns[type], ZN.PlayerTableRows.row, xOffset and xOffset or 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 12, ZN.Colors.INACTIVE, text, "CENTER", "CENTER")
  return txt
end

local function CreateIconButton(parent, point, anchor, anchorPoint, type, row)
  local btn =ZN.CreateIconButton(parent, point, anchor, anchorPoint, 16, 16, 17, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\delete2", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
  btn.Row = row
  btn.Column = type
  return btn
end

local function CreateContentRow(PlayerSpellID, PlayerSpell, AnchorFrame)
  local ContentRow = ZN.createSubFrame("ZNPlayerRow"..PlayerSpellID, ZNBodyFrame.Subframes.Player.scrollChild, 930, ZN.PlayerTableRows.row, ZN.Colors.ROWBG, 1, "TOP", "HIGH", false, 0,-ZN.PlayerTableRows.rowgap, AnchorFrame, "BOTTOM")
  --iconbutton on click setzen für onupdate
  ContentRow.Role = CreateGenericButton ("Role"..PlayerSpellID, ContentRow, "LEFT", ContentRow, "LEFT", "role", ZN.ColoredRoles[PlayerSpell.role])
  ContentRow.Class = CreateGenericButton ("Class"..PlayerSpellID, ContentRow, "LEFT", ContentRow.Role, "RIGHT", "class", ZN.PlayerClassesColored[PlayerSpell.class])
  ContentRow.SpellId = CreateSingleLIneEditBox("Spellid"..PlayerSpellID, ContentRow, "LEFT", ContentRow.Class, "RIGHT", "spellid", PlayerSpell.id)
  ContentRow.SpellName = CreateText(ContentRow, "LEFT", ContentRow.SpellId, "RIGHT", "spellname", GetSpellInfo(PlayerSpell.id):upper())
  ContentRow.SpellType = CreateGenericButton ("Type"..PlayerSpellID, ContentRow, "LEFT", ContentRow.SpellName, "RIGHT", "spelltype", ZN.Types[PlayerSpell.type])
  ContentRow.Aoe = CreateCheckBox(ContentRow, "LEFT", ContentRow.SpellType, "RIGHT", "aoe", PlayerSpellID, PlayerSpell.aoe)
  ContentRow.Station = CreateCheckBox(ContentRow, "LEFT", ContentRow.Aoe, "RIGHT", "station", PlayerSpellID, PlayerSpell.station)
  --ContentRow.SpellCd = CreateText(ContentRow, "LEFT", ContentRow.Station, "RIGHT", "spellcd", select(1,GetSpellBaseCooldown(PlayerSpell.id))/1000, 17)
  ContentRow.SpellCd = CreateSingleLIneEditBox("Spellcd"..PlayerSpellID, ContentRow, "LEFT", ContentRow.Station, "RIGHT", "spellcd", PlayerSpell.cd, 17)
  ContentRow.SpellRating = CreateSingleLIneEditBox("Spellrating"..PlayerSpellID, ContentRow, "LEFT", ContentRow.SpellCd, "RIGHT", "spellrating", PlayerSpell.rating)
  ContentRow.Delete = CreateIconButton(ContentRow, "LEFT", ContentRow.SpellRating, "RIGHT", "delete", PlayerSpellID)


  ContentRow.Aoe:SetScript("OnClick",function(self)
    self.toggleChecked()
    ZNotes.PlayerSpells[self.Row][self.Column] = self.active
  end)
  ContentRow.Station:SetScript("OnClick",function(self)
    self.toggleChecked()
    ZNotes.PlayerSpells[self.Row][self.Column] = self.active
  end)
  return ContentRow
end

function ZN:InitPlayer()
  -- Player Body
  local PlayerTable = ZNBodyFrame.Subframes.Player
  -- Title Row
  PlayerTable.TitleRow = CreateTitleRow()

  local scrollHeight = ZN.PlayerTableRows.title + (ZN.PlayerTableRows.row+ZN.PlayerTableRows.rowgap)*#ZNotes.PlayerSpells
  PlayerTable.scrollChild:SetHeight(scrollHeight)

  local anchor=PlayerTable.TitleRow

  for i=1, #ZNotes.PlayerSpells do

    local newRow = CreateContentRow(i, ZNotes.PlayerSpells[i], anchor)
    anchor = newRow
  end
  
end