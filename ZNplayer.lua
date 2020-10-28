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

ZN.PlayerAttributeMapping = {
  ["role"] = "role",
  ["class"] = "class",
  ["spellid"] = "id",
  ["spellname"] = "name",
  ["spelltype"] = "type",
  ["aoe"] = "aoe",
  ["station"] = "station",
  ["spellcd"] = "cd",
  ["spellrating"] = "rating",
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
ZN.RoleSelectionColor = {
  ["heal"] = "|cffabd473Heal|r",
  ["tank"] = "|cffc5af2aTank|r",
  ["melee"] = "|cffd2728aMelee|r",
  ["range"] = "|cff6bbceeRange|r",
  ["all"] = "|cfff8f8ffAll|r"
}

ZN.RoleSelectionOrder = {
  "all",
  "heal",
  "tank",
  "melee",
  "range",

}

ZN.TypeSelection = {
  ["heal"] = "Heal",
  ["util"] = "Utility",
  ["imun"] = "Immunity",
  ["all"] = "ALL",
}

ZN.TypeSelectionOrder = {
  "all",
  "heal",
  "util",
  "imun",
}

ZN.CheckBoxSelectionColor ={
  ["all"] = "|cfff8f8ffAll|r",
  ["checked"] = "|cff"..ZN.Colors.hunter.."Yes|r",
  ["unchecked"] = "|cff"..ZN.Colors.dk.."No|r",
}

ZN.CheckBoxSelectionOrder = {
  "all",
  "checked",
  "unchecked",
}

ZN.PlayerSortSelect = {
  ["rating"] = "Rating",
  ["role"] = "Role",
  ["class"] = "Class",
  ["type"] = "Type",
  ["cd"]= "CD",
}

ZN.PlayerSortOrder = {
  "rating",
  "role",
  "class",
  "type",
  "cd",
}


ZN.TextSortOrder = {
  ["heal"]=30,
  ["util"]=20,
  ["imun"]=10,
  ["tank"]=25,
  ["melee"]=20,
  ["range"]=10,
  ["all"] = 0,
  ["dk"]= 13,
  ["dh"]= 12,
  ["druid"]= 11,
  ["hunter"]= 10,
  ["mage"]= 9,
  ["monk"]= 8,
  ["paladin"]= 7,
  ["priest"]= 6,
  ["diszi"]= 5,
  ["rogue"]= 4,
  ["shaman"]= 3,
  ["warlock"]= 2,
  ["warrior"]= 1,
}

ZN.RoleFilter="all"
ZN.ClassFilter="all"
ZN.TypeFilter="all"
ZN.AoeFilter="all"
ZN.StationFilter="all"
ZN.PlayerSort="rating"

--###############################SIDEBAR########################################
PlayerSidebar = ZNSidebarFrame.Subframes.Player 
PlayerSidebar.RoleSelectButton = ZN.CreateGenericButton("ZNPlayerFilterRoleButton", PlayerSidebar, "TOPLEFT", PlayerSidebar, "TOPLEFT", 240, 30, 0, -40,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, "Filter by Role", ZN.RoleSelectionColor["all"], "LEFT",true )
PlayerSidebar.RoleSelectButton.doOnUpdate = true
PlayerSidebar.RoleSelectButton.OnUpdate = function(_,_,_,newValue) ZN.RoleFilter = newValue ZN:ReloadPlayerTable() end
PlayerSidebar.RoleSelectButton:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN.RoleSelectionColor, ZN.RoleSelectionOrder, 240, ZN.Colors.BG, "LEFT", 10) end)

PlayerSidebar.ClassSelectButton = ZN.CreateGenericButton("ZNPlayerFilterClassButton", PlayerSidebar, "TOPLEFT", PlayerSidebar.RoleSelectButton, "BOTTOMLEFT", 240, 30, 0, -40,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, "Filter by Class", ZN.PlayerClassesColored["all"], "LEFT",true )
PlayerSidebar.ClassSelectButton.doOnUpdate = true
PlayerSidebar.ClassSelectButton.OnUpdate = function(_,_,_,newValue) ZN.ClassFilter = newValue ZN:ReloadPlayerTable() end
PlayerSidebar.ClassSelectButton:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN.PlayerClassesColored, ZN.PlayerClassesColoredOrder, 240, ZN.Colors.BG, "LEFT", 10) end)

PlayerSidebar.TypeSelectButton = ZN.CreateGenericButton("ZNPlayerFilterTypeButton", PlayerSidebar, "TOPLEFT", PlayerSidebar.ClassSelectButton, "BOTTOMLEFT", 240, 30, 0, -40,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, "Filter by Type", ZN.TypeSelection["all"], "LEFT",true )
PlayerSidebar.TypeSelectButton.doOnUpdate = true
PlayerSidebar.TypeSelectButton.OnUpdate = function(_,_,_,newValue) ZN.TypeFilter = newValue ZN:ReloadPlayerTable() end
PlayerSidebar.TypeSelectButton:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN.TypeSelection, ZN.TypeSelectionOrder, 240, ZN.Colors.BG, "LEFT", 10) end)

PlayerSidebar.AoeSelectButton = ZN.CreateGenericButton("ZNPlayerFilterAoeButton", PlayerSidebar, "TOPLEFT", PlayerSidebar.TypeSelectButton, "BOTTOMLEFT", 240, 30, 0, -40,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, "Filter by AoE", ZN.CheckBoxSelectionColor["all"], "LEFT",true )
PlayerSidebar.AoeSelectButton.doOnUpdate = true
PlayerSidebar.AoeSelectButton.OnUpdate = function(_,_,_,newValue) ZN.AoeFilter = newValue ZN:ReloadPlayerTable() end
PlayerSidebar.AoeSelectButton:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN.CheckBoxSelectionColor, ZN.CheckBoxSelectionOrder, 240, ZN.Colors.BG, "LEFT", 10) end)

PlayerSidebar.StationSelectButton = ZN.CreateGenericButton("ZNPlayerFilterStationButton", PlayerSidebar, "TOPLEFT", PlayerSidebar.AoeSelectButton, "BOTTOMLEFT", 240, 30, 0, -40,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, "Filter by Station", ZN.CheckBoxSelectionColor["all"], "LEFT",true )
PlayerSidebar.StationSelectButton.doOnUpdate = true
PlayerSidebar.StationSelectButton.OnUpdate = function(_,_,_,newValue) ZN.StationFilter = newValue ZN:ReloadPlayerTable() end
PlayerSidebar.StationSelectButton:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN.CheckBoxSelectionColor, ZN.CheckBoxSelectionOrder, 240, ZN.Colors.BG, "LEFT", 10) end)



PlayerSidebar.SortSelectButton = ZN.CreateGenericButton("ZNPlayerFilterStationButton", PlayerSidebar, "TOPLEFT", PlayerSidebar.StationSelectButton, "BOTTOMLEFT", 240, 30, 0, -60,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, "Sort by", ZN.PlayerSortSelect["rating"], "LEFT",true )
PlayerSidebar.SortSelectButton.doOnUpdate = true
PlayerSidebar.SortSelectButton.OnUpdate = function(_,_,_,newValue) ZN.PlayerSort = newValue ZN:ReloadPlayerTable() end
PlayerSidebar.SortSelectButton:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN.PlayerSortSelect, ZN.PlayerSortOrder, 240, ZN.Colors.BG, "LEFT", 10) end)

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

local function CreateGenericButton (name, parent, point, anchor, anchorPoint, type, text,row)
  local btn = ZN.CreateGenericButton(name, parent, point, anchor, anchorPoint, ZN.PlayerTableColumns[type], ZN.PlayerTableRows.row, 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, text, "CENTER", false)
  btn:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN.PlayerDropdowns[type].content, ZN.PlayerDropdowns[type].order, ZN.PlayerTableColumns[type], ZN.Colors.SBButtonBG, "CENTER",0, ZN.Colors.HD) end)
  btn.Row = row
  btn.Column = ZN.PlayerAttributeMapping[type]
  btn.OnUpdate=function(_, row, column, newvalue)
    ZNotes.PlayerSpells[btn.Row][btn.Column]=newvalue
  end
  btn.doOnUpdate=true
  return btn
end

local function CreateSingleLIneEditBox(name, parent, point, anchor, anchorPoint, type, text, xOffSet, row)
  local tb = ZN.SingleLineEditBox(name, parent, point, anchor, anchorPoint, ZN.PlayerTableColumns[type], ZN.PlayerTableRows.row, xOffSet and xOffSet or 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, text, "CENTER")
  tb.Row = row
  tb.Column = ZN.PlayerAttributeMapping[type]
  tb.refersTo=nil
  tb.OnUpdate=function(_, row, column, newvalue)
    ZNotes.PlayerSpells[tb.Row][tb.Column]=newvalue
    if tb.Column=="id" then
      tb.refersTo:SetText((GetSpellInfo(newvalue) and GetSpellInfo(newvalue) or ""):upper())
      ZNotes.PlayerSpells[tb.Row]["name"]=GetSpellInfo(newvalue)
    end
  end
  tb.doOnUpdate=true
  return tb
end

local function CreateCheckBox(parent, point, anchor, anchorPoint, type, row, checked)
  local cb = ZN.CreateIconButton(parent, point, anchor, anchorPoint, ZN.PlayerTableIconButton[type].size, ZN.PlayerTableIconButton[type].size, ZN.PlayerTableIconButton[type].xOffset, 0, ZN.PlayerTableCheckBoxTextures.checked, ZN.PlayerTableCheckBoxTextures.checkedColor, ZN.PlayerTableCheckBoxTextures.uncheckedColor, true, ZN.Colors.ACTIVE)
  cb.toggleChecked = function()
    if cb.active then
      cb.active=false
      cb:SetNormalTexture(ZN.PlayerTableCheckBoxTextures.unchecked)
      cb:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.PlayerTableCheckBoxTextures.uncheckedColor:sub(1,2))/255, tonumber("0x"..ZN.PlayerTableCheckBoxTextures.uncheckedColor:sub(3,4))/255, tonumber("0x"..ZN.PlayerTableCheckBoxTextures.uncheckedColor:sub(5,6))/255, 1)
    else
      cb.active=true
      cb:SetNormalTexture(ZN.PlayerTableCheckBoxTextures.checked)
      cb:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.PlayerTableCheckBoxTextures.checkedColor:sub(1,2))/255, tonumber("0x"..ZN.PlayerTableCheckBoxTextures.checkedColor:sub(3,4))/255, tonumber("0x"..ZN.PlayerTableCheckBoxTextures.checkedColor:sub(5,6))/255, 1)
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
  ContentRow.Role = CreateGenericButton ("Role"..PlayerSpellID, ContentRow, "LEFT", ContentRow, "LEFT", "role", ZN.ColoredRoles[PlayerSpell.role],PlayerSpellID)
  ContentRow.Class = CreateGenericButton ("Class"..PlayerSpellID, ContentRow, "LEFT", ContentRow.Role, "RIGHT", "class", ZN.PlayerClassesColored[PlayerSpell.class],PlayerSpellID)
  ContentRow.SpellId = CreateSingleLIneEditBox("Spellid"..PlayerSpellID, ContentRow, "LEFT", ContentRow.Class, "RIGHT", "spellid", PlayerSpell.id,0,PlayerSpellID)
  ContentRow.SpellName = CreateText(ContentRow, "LEFT", ContentRow.SpellId, "RIGHT", "spellname", (GetSpellInfo(PlayerSpell.id) and GetSpellInfo(PlayerSpell.id) or ""):upper())
  ContentRow.SpellType = CreateGenericButton ("Type"..PlayerSpellID, ContentRow, "LEFT", ContentRow.SpellName, "RIGHT", "spelltype", ZN.Types[PlayerSpell.type],PlayerSpellID)
  ContentRow.Aoe = CreateCheckBox(ContentRow, "LEFT", ContentRow.SpellType, "RIGHT", "aoe", PlayerSpellID, PlayerSpell.aoe)
  ContentRow.Station = CreateCheckBox(ContentRow, "LEFT", ContentRow.Aoe, "RIGHT", "station", PlayerSpellID, PlayerSpell.station)
  --ContentRow.SpellCd = CreateText(ContentRow, "LEFT", ContentRow.Station, "RIGHT", "spellcd", select(1,GetSpellBaseCooldown(PlayerSpell.id))/1000, 17)
  ContentRow.SpellCd = CreateSingleLIneEditBox("Spellcd"..PlayerSpellID, ContentRow, "LEFT", ContentRow.Station, "RIGHT", "spellcd", PlayerSpell.cd, 17, PlayerSpellID)
  ContentRow.SpellRating = CreateSingleLIneEditBox("Spellrating"..PlayerSpellID, ContentRow, "LEFT", ContentRow.SpellCd, "RIGHT", "spellrating", PlayerSpell.rating,0, PlayerSpellID)
  ContentRow.Delete = CreateIconButton(ContentRow, "LEFT", ContentRow.SpellRating, "RIGHT", "delete", PlayerSpellID)


  ContentRow.SpellId.refersTo=ContentRow.SpellName

  ContentRow.Aoe:SetScript("OnClick",function(self)
    self.toggleChecked()
    ZNotes.PlayerSpells[self.Row][self.Column] = self.active
  end)

  ContentRow.Station:SetScript("OnClick",function(self)
    self.toggleChecked()
    ZNotes.PlayerSpells[self.Row][self.Column] = self.active
  end)

  ContentRow.Delete:SetScript("OnClick", function(self)
    table.remove(ZNotes.PlayerSpells,self.Row)
    ZN:ReloadPlayerTable()
  end)

  return ContentRow
end

local function UpdateContentRow(PlayerSpellID, PlayerSpell, AnchorFrame,ContentRow)
  ContentRow:SetPoint("TOP", AnchorFrame, "BOTTOM",0,-ZN.PlayerTableRows.rowgap)
  --iconbutton on click setzen für onupdate
  ContentRow.Role.Row = PlayerSpellID
  ContentRow.Role.ZNText:SetText(ZN.ColoredRoles[PlayerSpell.role]:upper())
  ContentRow.Class.Row = PlayerSpellID
  ContentRow.Class.ZNText:SetText(ZN.PlayerClassesColored[PlayerSpell.class]:upper())
  ContentRow.SpellId.Row = PlayerSpellID
  ContentRow.SpellId:SetText(PlayerSpell.id)
  ContentRow.SpellName:SetText((GetSpellInfo(PlayerSpell.id) and GetSpellInfo(PlayerSpell.id) or ""):upper())
  ContentRow.SpellType.Row = PlayerSpellID
  ContentRow.SpellType.ZNText:SetText(ZN.Types[PlayerSpell.type]:upper())
  ContentRow.Aoe.Row=PlayerSpellID
  if ContentRow.Aoe.active ~= PlayerSpell.aoe then ContentRow.Aoe.toggleChecked() end
  ContentRow.Station.Row=PlayerSpellID
  if ContentRow.Station.active ~= PlayerSpell.station then ContentRow.Station.toggleChecked() end
  ContentRow.SpellCd.Row = PlayerSpellID
  ContentRow.SpellCd:SetText(PlayerSpell.cd)
  ContentRow.SpellRating.Row = PlayerSpellID
  ContentRow.SpellRating:SetText(PlayerSpell.rating)
  ContentRow.Delete.Row = PlayerSpellID
end

ZN.PlayerRows={}
ZN.PlayerFilterArray={}
ZN.PlayerSortArray={}
function ZN:InitPlayer()
  -- Player Body
  local PlayerTable = ZNBodyFrame.Subframes.Player
  -- Title Row
  PlayerTable.TitleRow = CreateTitleRow()

  ZN:BuildPlayerFilterArray()
  ZN:BuildPlayerSortArray()

  local scrollHeight = ZN.PlayerTableRows.title + (ZN.PlayerTableRows.row+ZN.PlayerTableRows.rowgap)*#ZN.PlayerSortArray
  PlayerTable.scrollChild:SetHeight(scrollHeight)

  local anchor=PlayerTable.TitleRow

  for i=1, #ZN.PlayerSortArray do

    local newRow = CreateContentRow(ZN.PlayerFilterArray[ZN.PlayerSortArray[i]], ZNotes.PlayerSpells[ZN.PlayerFilterArray[ZN.PlayerSortArray[i]]], anchor)
    ZN.PlayerRows[i] = newRow
    anchor = newRow
  end  
end

function ZN:BuildPlayerFilterArray ()
  ZN.PlayerFilterArray={}
  local j = 1
  for i=1, #ZNotes.PlayerSpells do
    local show = true
    if ZN.RoleFilter~="all" and ZNotes.PlayerSpells[i].role~=ZN.RoleFilter then
      show=false
    end
    if ZN.ClassFilter~="all" and ZNotes.PlayerSpells[i].class~=ZN.ClassFilter then
      show=false
    end
    if ZN.TypeFilter~="all" and ZNotes.PlayerSpells[i].type~=ZN.TypeFilter then
      show=false
    end
    if ZN.AoeFilter~="all" and (ZNotes.PlayerSpells[i].aoe and "checked" or "unchecked")~=ZN.AoeFilter then
      show=false
    end
    if ZN.StationFilter~="all" and (ZNotes.PlayerSpells[i].station and "checked" or "unchecked")~=ZN.StationFilter then
      show=false
    end
    if show then
      ZN.PlayerFilterArray[j]=i
      j=j+1
    end
  end
end

function ZN:BuildPlayerSortArray ()
  ZN.PlayerSortArray={}
  for i=1, #ZN.PlayerFilterArray do
    ZN.PlayerSortArray[i]=i
  end

  for k=1,#ZN.PlayerFilterArray do
    for i=1,#ZN.PlayerFilterArray do
      local pivot = ZNotes.PlayerSpells[ZN.PlayerFilterArray[ZN.PlayerSortArray[i]]][ZN.PlayerSort]
      for j=i+1,#ZN.PlayerFilterArray do
        local comp = ZNotes.PlayerSpells[ZN.PlayerFilterArray[ZN.PlayerSortArray[j]]][ZN.PlayerSort]
        if  type(comp)=="number" and comp>pivot or type(comp)~="number" and ZN.TextSortOrder[comp]>ZN.TextSortOrder[pivot] then
          local saveUnit = ZN.PlayerSortArray[i]
					ZN.PlayerSortArray[i] = ZN.PlayerSortArray[j]
					ZN.PlayerSortArray[j] = saveUnit
        end
      end 
    end 
  end 
end

function ZN:ReloadPlayerTable()
  if not (#ZN.PlayerRows > 0) then return end
  local PlayerTable = ZNBodyFrame.Subframes.Player
  ZN:BuildPlayerFilterArray()
  ZN:BuildPlayerSortArray()

  local scrollHeight = ZN.PlayerTableRows.title + (ZN.PlayerTableRows.row+ZN.PlayerTableRows.rowgap)*#ZN.PlayerSortArray
  PlayerTable.scrollChild:SetHeight(scrollHeight)

  for i=1, #ZN.PlayerRows do
    ZN.PlayerRows[i]:SetShown(false)
  end

  local anchor=PlayerTable.TitleRow
  
  for i=1, #ZN.PlayerSortArray do

    UpdateContentRow(ZN.PlayerFilterArray[ZN.PlayerSortArray[i]], ZNotes.PlayerSpells[ZN.PlayerFilterArray[ZN.PlayerSortArray[i]]], anchor, ZN.PlayerRows[i])
    ZN.PlayerRows[i]:SetShown(true)
    anchor = ZN.PlayerRows[i]
  end  

end

-- ZN.PlayerSortOrder = {
--   "rating",
--   "role",
--   "class",
--   "type",
--   "cd",
-- }