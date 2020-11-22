local _, ZN, L = ...
--930
ZN.PlayerInit=false

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

ZNSidebarFrame.btnResetFilter = ZN.CreateIconButton(PlayerSidebar, "BOTTOMLEFT", PlayerSidebar, "BOTTOMLEFT", 24, 24, 0, -24, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\resetfilter", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, nil, true, "Reset All Filter", ZN.Colors.ACTIVE)
ZNSidebarFrame.btnResetPlayer = ZN.CreateIconButton(ZNSidebarFrame, "BOTTOM", ZNSidebarFrame.btnCollapseSidebar, "TOP", 20, 20, 0, 20, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\reset", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, nil, true, "Reset Player DB", ZN.Colors.ACTIVE)
ZNSidebarFrame.btnReloadPlayer = ZN.CreateIconButton(ZNSidebarFrame, "BOTTOM", ZNSidebarFrame.btnResetPlayer, "TOP", 20, 20, 0, 20, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\update", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, nil, true, "Update Player Table", ZN.Colors.ACTIVE)
ZNSidebarFrame.btnAddPlayer = ZN.CreateIconButton(ZNSidebarFrame, "BOTTOM", ZNSidebarFrame.btnReloadPlayer, "TOP", 20, 20, 0, 20, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\plus_nobg", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, nil, true, "Add Spell", ZN.Colors.ACTIVE)

ZNSidebarFrame.btnReloadPlayer:SetShown(false)
ZNSidebarFrame.btnResetPlayer:SetShown(false)
ZNSidebarFrame.btnAddPlayer:SetShown(false)

ZNSidebarFrame.btnReloadPlayer:SetScript("OnClick",function(self) ZN:ReloadPlayerTable() end)
ZNSidebarFrame.btnAddPlayer:SetScript("OnClick",function(self) ZN:addNewPlayerSpell() end)
ZNSidebarFrame.btnResetFilter:SetScript("OnClick", function(self) ZN:ResetPlayerFilter() end)

ZN.PlayerResetConfirmFrame = ZN.createSubFrame("ZNPlayerResetConfirmFrame",ZNFrame, 300, 200, ZN.Colors.ROWBG, 1, 'CENTER', 'TOOLTIP', true)
ZN.PlayerResetConfirmFrame.btnClose = ZN.CreateIconButton(ZN.PlayerResetConfirmFrame, "TOPRIGHT", ZN.PlayerResetConfirmFrame, "TOPRIGHT", 16, 16, -10, -10, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
ZN.PlayerResetConfirmFrame.Title = ZN.CreateText(ZN.PlayerResetConfirmFrame, "TOP", ZN.PlayerResetConfirmFrame, "TOP", 150, 30, 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 14, ZN.Colors.ACTIVE, "RESET PLAYER DB")
ZN.PlayerResetConfirmFrame.Message = ZN.CreateText(ZN.PlayerResetConfirmFrame, "TOP", ZN.PlayerResetConfirmFrame, "TOP", 260, 60, 0, -40, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 12, ZN.Colors.ACTIVE, "Reset will override your local Database\nAre you sure?", "CENTER")
ZN.PlayerResetConfirmFrame.ConfirmButton = ZN.CreateGenericButton("ZNResetPlayerConfirmButton", ZN.PlayerResetConfirmFrame, "BOTTOMLEFT", ZN.PlayerResetConfirmFrame, "BOTTOMLEFT", 125, 30, 20, 20,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Reset", "CENTER",true, ZN.Colors.HD )
ZN.PlayerResetConfirmFrame.CancelButton = ZN.CreateGenericButton("ZNResetPlayerCancelButton", ZN.PlayerResetConfirmFrame, "BOTTOMRIGHT", ZN.PlayerResetConfirmFrame, "BOTTOMRIGHT", 125, 30, -20, 20,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Cancel", "CENTER",true, ZN.Colors.HD )


ZN.PlayerResetConfirmFrame.btnClose:SetScript("OnClick", function(self) ZN.PlayerResetConfirmFrame:Hide() end)
ZN.PlayerResetConfirmFrame.CancelButton:SetScript("OnClick", function(self) ZN.PlayerResetConfirmFrame:Hide() end)

ZN.PlayerResetConfirmFrame.ConfirmButton:SetScript("OnClick", function(self) 
  ZN.initPlayerSpells()
  ZN:ReloadPlayerTable()
  ZN:Print("Player DB reset")
  ZN.PlayerResetConfirmFrame:Hide()
end)

ZNSidebarFrame.btnResetPlayer:SetScript("OnClick", function(self) 
  ZN.PlayerResetConfirmFrame:SetShown(not ZN.PlayerResetConfirmFrame:IsShown());
end)

--##############################################################################
local function CreateTitleRow()
  local TitleRow = ZN.createSubFrame("ZNPlayerTitleRow", ZNBodyFrame.Subframes.PlayerHead, 930, ZN.PlayerTableRows.title, ZN.Colors.BG, 1, "TOP", "HIGH", false, -5,0)
  local anchor = TitleRow
  for i=1, #ZN.PlayerTableColumnHeaders do
    local header = ZN.PlayerTableColumnHeaders[i]
    local text = ZN.PlayerTableColumnHeaderNames[header]
    local width = ZN.PlayerTableColumns[header]
    local height = ZN.PlayerTableRows.title
    local tooltip = false
    local tooltipText = ""
    if ZN.HeadersToolTips["player"..header] then
      tooltip = ZN.HeadersToolTips["player"..header]["tooltip"]
      tooltipText = ZN.HeadersToolTips["player"..header]["text"]
    end
    local tooltipColor = ZN.Colors.ACTIVE
    local headerButton = ZN.CreateGenericButton(nil, TitleRow, "LEFT", anchor, anchor==TitleRow and "LEFT" or "RIGHT", width, height, 0, 0, 0, 0 ,10, ZN.Colors.INACTIVE, ZN.Colors.BG, nil, text, "CENTER", false, nil, tooltip, tooltipText, tooltipColor)
    anchor = headerButton
    
  end
  return TitleRow
end

local function CreateGenericButton (name, parent, point, anchor, anchorPoint, type, text,row,xoffset, fontoffset)
  local btn = ZN.CreateGenericButton(name, parent, point, anchor, anchorPoint, ZN.PlayerTableColumns[type], ZN.PlayerTableRows.row, 0, 0,xoffset and xoffset or 0, fontoffset and fontoffset or 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, text, "CENTER", false)
  local width = ZN.PlayerTableColumns[type]
  if type == "class" then
    width=200
  end
  btn:SetScript("OnClick", function(self) 
    ZN:CreateDropdown(self, ZN.PlayerDropdowns[type].content, ZN.PlayerDropdowns[type].order, width, ZN.Colors.SBButtonBG, "CENTER",0, ZN.Colors.HD) 
    if self.Column == "class" then
      self.dropdown:ClearAllPoints()
      self.dropdown:SetPoint("TOP", self, "BOTTOM")
    end
  end)

  btn.Row = row
  btn.Column = ZN.PlayerAttributeMapping[type]
  btn.OnUpdate=function(_, row, column, newvalue)
    ZNotes.PlayerSpells[btn.Row][btn.Column]=newvalue
  end
  btn.doOnUpdate=true
  return btn
end

local function CreateSingleLineEditBox(name, parent, point, anchor, anchorPoint, type, text, xOffSet, row)
  local tb = ZN.SingleLineEditBox(name, parent, point, anchor, anchorPoint, ZN.PlayerTableColumns[type], ZN.PlayerTableRows.row, xOffSet and xOffSet or 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, text, "CENTER")
  tb.Row = row
  tb.Column = ZN.PlayerAttributeMapping[type]
  tb.refersTo=nil
  tb.OnUpdate=function(_, row, column, newvalue)
    newvalue = tonumber(newvalue)
    if newvalue == nil then
      UIErrorsFrame:AddMessage("You need to enter a numeric value", 0.8, 0.07, 0.2, 5.0)
      tb:SetText(ZNotes.PlayerSpells[tb.Row][tb.Column])
    else
      ZNotes.PlayerSpells[tb.Row][tb.Column]=newvalue
    end
    if tb.Column=="id" then
      tb.refersTo:SetText((GetSpellInfo(ZNotes.PlayerSpells[tb.Row][tb.Column]) and GetSpellInfo(ZNotes.PlayerSpells[tb.Row][tb.Column]) or "|cffff3f40Invalid Spell ID|r"):upper())
      ZNotes.PlayerSpells[tb.Row]["name"]=GetSpellInfo(ZNotes.PlayerSpells[tb.Row][tb.Column])
    end
  end
  tb.doOnUpdate=true
  return tb
end

local function CreateCheckBox(parent, point, anchor, anchorPoint, type, row, checked)
  local cb = ZN.CreateIconButton(parent, point, anchor, anchorPoint, ZN.PlayerTableIconButton[type].size, ZN.PlayerTableIconButton[type].size, ZN.PlayerTableIconButton[type].xOffset, 0, ZN.CheckBoxTextures.checked, ZN.CheckBoxTextures.checkedColor, ZN.CheckBoxTextures.uncheckedColor, true, ZN.Colors.ACTIVE)
  cb.toggleChecked = function()
    if cb.active then
      cb.active=false
      cb:SetNormalTexture(ZN.CheckBoxTextures.unchecked)
      cb:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.CheckBoxTextures.uncheckedColor:sub(1,2))/255, tonumber("0x"..ZN.CheckBoxTextures.uncheckedColor:sub(3,4))/255, tonumber("0x"..ZN.CheckBoxTextures.uncheckedColor:sub(5,6))/255, 1)
    else
      cb.active=true
      cb:SetNormalTexture(ZN.CheckBoxTextures.checked)
      cb:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.CheckBoxTextures.checkedColor:sub(1,2))/255, tonumber("0x"..ZN.CheckBoxTextures.checkedColor:sub(3,4))/255, tonumber("0x"..ZN.CheckBoxTextures.checkedColor:sub(5,6))/255, 1)
    end
  end
  if not checked then
    cb.toggleChecked()
    cb:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.CheckBoxTextures.uncheckedColor:sub(1,2))/255, tonumber("0x"..ZN.CheckBoxTextures.uncheckedColor:sub(3,4))/255, tonumber("0x"..ZN.CheckBoxTextures.uncheckedColor:sub(5,6))/255, 1)
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
  local btn =ZN.CreateIconButton(parent, point, anchor, anchorPoint, ZN.PlayerTableIconButton[type].size, ZN.PlayerTableIconButton[type].size, ZN.PlayerTableIconButton[type].xOffset, 0, ZN.PlayerTableIconButton[type].texture, ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
  btn.Row = row
  btn.Column = type
  return btn
end

-- local function CreateIconDropButton(name, parent, point, anchor, anchorPoint, type, text,row,xoffset)
--   local btn = ZN.CreateGenericButton(name, parent, point, anchor, anchorPoint, ZN.PlayerTableColumns[type], ZN.PlayerTableRows.row, 0, 0,xoffset and xoffset or 0, -8 ,12, nil, ZN.Colors.ROWBG, nil, text, "CENTER", false)
--   btn:SetScript("OnClick", function(self)
--       ZN:CreateIconDropdown(self, ZN.ClassIconsList, ZN.ClassIconsListOrder, 40, ZN.Colors.SBButtonBG, "CENTER", 0, ZN.Colors.HD, nil, 40, -8, 2, 6, true)
--   end)
--   btn.Column = ZN.PlayerAttributeMapping[type]
--   btn.OnUpdate=function(_, row, column, newvalue,self)
--     ZNotes.PlayerSpells[btn.Row][btn.Column]=newvalue
--     local class = PlayerSpell.class
--     if class and (class=="diszi" or class=="shadow") then class="priest" end
--     if class =="all" then class="zzz" end
--     self.ZNText:SetText(ZN.ClassIconsList[class])
--   end
--   btn.doOnUpdate=true

--   btn.Row = row
--   return btn
-- end

local function CreateContentRow(PlayerSpellID, PlayerSpell, AnchorFrame)
  local ContentRow = ZN.createSubFrame("ZNPlayerRow"..PlayerSpellID, ZNBodyFrame.Subframes.Player.scrollChild, 930, ZN.PlayerTableRows.row, ZN.Colors.ROWBG, 1, "TOPLEFT", "HIGH", false, 0,-ZN.PlayerTableRows.rowgap, AnchorFrame, "BOTTOMLEFT")
  local class = PlayerSpell.class
  if class and (class=="diszi" or class=="shadow") then class="priest" end
  if class =="all" then class="zzz" end

  local stackable = true

  if PlayerSpell.type~="imun" then
    stackable=PlayerSpell.stackable and PlayerSpell.stackable or false
  end

  ContentRow.Role = CreateGenericButton ("Role"..PlayerSpellID, ContentRow, "LEFT", ContentRow, "LEFT", "role", ZN.ColoredRoles[PlayerSpell.role],PlayerSpellID)
  ContentRow.Class = CreateGenericButton ("Class"..PlayerSpellID, ContentRow, "LEFT", ContentRow.Role, "RIGHT", "class", ZN.ClassIconsList[class],PlayerSpellID,0,-8)
  ContentRow.SpellId = CreateSingleLineEditBox("Spellid"..PlayerSpellID, ContentRow, "LEFT", ContentRow.Class, "RIGHT", "spellid", PlayerSpell.id,0,PlayerSpellID)
  ContentRow.SpellName = CreateText(ContentRow, "LEFT", ContentRow.SpellId, "RIGHT", "spellname", (GetSpellInfo(PlayerSpell.id) and GetSpellInfo(PlayerSpell.id) or "|cffff3f40Invalid Spell ID|r"):upper())
  ContentRow.SpellType = CreateGenericButton ("Type"..PlayerSpellID, ContentRow, "LEFT", ContentRow.SpellName, "RIGHT", "spelltype", ZN.Types[PlayerSpell.type],PlayerSpellID)
  ContentRow.Stackable = CreateCheckBox(ContentRow, "LEFT", ContentRow.SpellType, "RIGHT", "stackable", PlayerSpellID, stackable)
  ContentRow.Aoe = CreateCheckBox(ContentRow, "LEFT", ContentRow.Stackable, "RIGHT", "aoe", PlayerSpellID, PlayerSpell.aoe)
  ContentRow.Station = CreateCheckBox(ContentRow, "LEFT", ContentRow.Aoe, "RIGHT", "station", PlayerSpellID, PlayerSpell.station)
  ContentRow.SpellCd = CreateSingleLineEditBox("Spellcd"..PlayerSpellID, ContentRow, "LEFT", ContentRow.Station, "RIGHT", "spellcd", PlayerSpell.cd, 17, PlayerSpellID)
  ContentRow.SpellRating = CreateSingleLineEditBox("Spellrating"..PlayerSpellID, ContentRow, "LEFT", ContentRow.SpellCd, "RIGHT", "spellrating", PlayerSpell.rating,0, PlayerSpellID)
  ContentRow.Delete = CreateIconButton(ContentRow, "LEFT", ContentRow.SpellRating, "RIGHT", "delete", PlayerSpellID)


  ContentRow.SpellId.refersTo=ContentRow.SpellName
  ContentRow.SpellType.AoeBtn = ContentRow.Aoe
  ContentRow.SpellType.StackableBtn = ContentRow.Stackable

  ContentRow.Class.OnUpdate=function(_, row, column, newvalue,self)
    ZNotes.PlayerSpells[row][column]=newvalue
    local class = newvalue
    if class and (class=="diszi" or class=="shadow") then class="priest" end
    if class =="all" then class="zzz" end
    self.ZNText:SetText(ZN.ClassIconsList[class])
  end

  ContentRow.SpellType.OnUpdate=function(_, row, column, newvalue,self)
    ZNotes.PlayerSpells[row][column]=newvalue

    if newvalue ~= "util" then
      if newvalue=="heal" then
        self.AoeBtn.active=true
        ZNotes.PlayerSpells[row]["aoe"]=true
        self.AoeBtn:SetNormalTexture(ZN.CheckBoxTextures.checked)
      else
        self.AoeBtn.active=false
        ZNotes.PlayerSpells[row]["aoe"]=false
        self.AoeBtn:SetNormalTexture(ZN.CheckBoxTextures.unchecked)
      end
      self.AoeBtn:SetScript("OnClick",function(self) end)
      self.AoeBtn.activeColor=ZN.Colors.INACTIVE
      self.AoeBtn.inactiveColor=ZN.Colors.INACTIVE
      self.AoeBtn.highlightColor=ZN.Colors.INACTIVE
      self.AoeBtn:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
    else
      if self.AoeBtn.active then
        self.AoeBtn:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.CheckBoxTextures.checkedColor:sub(1,2))/255, tonumber("0x"..ZN.CheckBoxTextures.checkedColor:sub(3,4))/255, tonumber("0x"..ZN.CheckBoxTextures.checkedColor:sub(5,6))/255, 1)
      else
        self.AoeBtn:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.CheckBoxTextures.uncheckedColor:sub(1,2))/255, tonumber("0x"..ZN.CheckBoxTextures.uncheckedColor:sub(3,4))/255, tonumber("0x"..ZN.CheckBoxTextures.uncheckedColor:sub(5,6))/255, 1)
      end
      self.AoeBtn.activeColor=ZN.CheckBoxTextures.checkedColor
      self.AoeBtn.inactiveColor=ZN.CheckBoxTextures.uncheckedColor
      self.AoeBtn.highlightColor=ZN.Colors.ACTIVE
      self.AoeBtn:SetScript("OnClick",function(self)
        self.toggleChecked()
        ZNotes.PlayerSpells[self.Row][self.Column] = self.active
      end)
    end
    if newvalue == "imun" then
      self.StackableBtn.active=true
      ZNotes.PlayerSpells[row]["stackable"]=true
      self.StackableBtn:SetNormalTexture(ZN.CheckBoxTextures.checked)

      StackableBtn:SetScript("OnClick",function(self) end)
      StackableBtn.activeColor=ZN.Colors.INACTIVE
      StackableBtn.inactiveColor=ZN.Colors.INACTIVE
      StackableBtn.highlightColor=ZN.Colors.INACTIVE
      StackableBtn:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
    else
      self.StackableBtn.active=false
      ZNotes.PlayerSpells[row]["aoe"]=false
      self.StackableBtn:SetNormalTexture(ZN.CheckBoxTextures.unchecked)

      StackableBtn:SetScript("OnClick",function(self)
        self.toggleChecked()
        ZNotes.PlayerSpells[self.Row][self.Column] = self.active
      end)
      StackableBtn.activeColor=ZN.CheckBoxTextures.checkedColor
      StackableBtn.inactiveColor=ZN.CheckBoxTextures.uncheckedColor
      StackableBtn.highlightColor=ZN.Colors.ACTIVE
    end
  end


  if PlayerSpell.type ~= "util" then
    ContentRow.Aoe:SetScript("OnClick",function(self) end)
    ContentRow.Aoe.activeColor=ZN.Colors.INACTIVE
    ContentRow.Aoe.inactiveColor=ZN.Colors.INACTIVE
    ContentRow.Aoe.highlightColor=ZN.Colors.INACTIVE
    ContentRow.Aoe:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
  else
     ContentRow.Aoe:SetScript("OnClick",function(self)
      self.toggleChecked()
      ZNotes.PlayerSpells[self.Row][self.Column] = self.active
    end)
    ContentRow.Aoe.activeColor=ZN.CheckBoxTextures.checkedColor
    ContentRow.Aoe.inactiveColor=ZN.CheckBoxTextures.uncheckedColor
    ContentRow.Aoe.highlightColor=ZN.Colors.ACTIVE
  end

  if PlayerSpell.type == "imun" then
    ContentRow.Stackable:SetScript("OnClick",function(self) end)
    ContentRow.Stackable.activeColor=ZN.Colors.INACTIVE
    ContentRow.Stackable.inactiveColor=ZN.Colors.INACTIVE
    ContentRow.Stackable.highlightColor=ZN.Colors.INACTIVE
    ContentRow.Stackable:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
  else
     ContentRow.Stackable:SetScript("OnClick",function(self)
      self.toggleChecked()
      ZNotes.PlayerSpells[self.Row][self.Column] = self.active
    end)
    ContentRow.Stackable.activeColor=ZN.CheckBoxTextures.checkedColor
    ContentRow.Stackable.inactiveColor=ZN.CheckBoxTextures.uncheckedColor
    ContentRow.Stackable.highlightColor=ZN.Colors.ACTIVE
  end

  ContentRow.Station:SetScript("OnClick",function(self)
    self.toggleChecked()
    ZNotes.PlayerSpells[self.Row][self.Column] = self.active
  end)

  ContentRow.Stackable:SetScript("OnClick",function(self)
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
  local class = PlayerSpell.class
  if class and (class=="diszi" or class=="shadow") then class="priest" end
  if class =="all" then class="zzz" end

  local stackable = true

  if PlayerSpell.type~="imun" then
    stackable=PlayerSpell.stackable and PlayerSpell.stackable or false
  end
  
  ContentRow.Role.Row = PlayerSpellID
  ContentRow.Role.ZNText:SetText(ZN.ColoredRoles[PlayerSpell.role]:upper())
  ContentRow.Class.Row = PlayerSpellID
  ContentRow.Class.ZNText:SetText(ZN.ClassIconsList[class])
  ContentRow.SpellId.Row = PlayerSpellID
  ContentRow.SpellId:SetText(PlayerSpell.id)
  ContentRow.SpellName:SetText((GetSpellInfo(PlayerSpell.id) and GetSpellInfo(PlayerSpell.id) or "|cffff3f40Invalid Spell ID|r"):upper())
  ContentRow.SpellType.Row = PlayerSpellID
  ContentRow.SpellType.ZNText:SetText(ZN.Types[PlayerSpell.type]:upper())
  ContentRow.Stackable.Row=PlayerSpellID
  if ContentRow.Stackable.active ~= stackable then ContentRow.Stackable.toggleChecked() end
  ContentRow.Aoe.Row=PlayerSpellID
  if ContentRow.Aoe.active ~= PlayerSpell.aoe then ContentRow.Aoe.toggleChecked() end
  ContentRow.Station.Row=PlayerSpellID
  if ContentRow.Station.active ~= PlayerSpell.station then ContentRow.Station.toggleChecked() end
  ContentRow.SpellCd.Row = PlayerSpellID
  ContentRow.SpellCd:SetText(PlayerSpell.cd)
  ContentRow.SpellRating.Row = PlayerSpellID
  ContentRow.SpellRating:SetText(PlayerSpell.rating)
  ContentRow.Delete.Row = PlayerSpellID

  if PlayerSpell.type ~= "util" then
    ContentRow.Aoe:SetScript("OnClick",function(self) end)
    ContentRow.Aoe.activeColor=ZN.Colors.INACTIVE
    ContentRow.Aoe.inactiveColor=ZN.Colors.INACTIVE
    ContentRow.Aoe.highlightColor=ZN.Colors.INACTIVE
    ContentRow.Aoe:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
  else
    if ContentRow.Aoe.active then
      ContentRow.Aoe:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.CheckBoxTextures.checkedColor:sub(1,2))/255, tonumber("0x"..ZN.CheckBoxTextures.checkedColor:sub(3,4))/255, tonumber("0x"..ZN.CheckBoxTextures.checkedColor:sub(5,6))/255, 1)
    else
      ContentRow.Aoe:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.CheckBoxTextures.uncheckedColor:sub(1,2))/255, tonumber("0x"..ZN.CheckBoxTextures.uncheckedColor:sub(3,4))/255, tonumber("0x"..ZN.CheckBoxTextures.uncheckedColor:sub(5,6))/255, 1)
    end
    ContentRow.Aoe.activeColor=ZN.CheckBoxTextures.checkedColor
    ContentRow.Aoe.inactiveColor=ZN.CheckBoxTextures.uncheckedColor
    ContentRow.Aoe.highlightColor=ZN.Colors.ACTIVE
    ContentRow.Aoe:SetScript("OnClick",function(self)
      self.toggleChecked()
      ZNotes.PlayerSpells[self.Row][self.Column] = self.active
    end)
  end

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

  local scrollHeight = (ZN.PlayerTableRows.row+ZN.PlayerTableRows.rowgap)*#ZN.PlayerSortArray
  PlayerTable.scrollChild:SetHeight(scrollHeight)

  local anchor=PlayerTable.TitleRow

  for i=1, #ZN.PlayerSortArray do

    local newRow = CreateContentRow(ZN.PlayerFilterArray[ZN.PlayerSortArray[i]], ZNotes.PlayerSpells[ZN.PlayerFilterArray[ZN.PlayerSortArray[i]]], anchor)
    if i==1 then
      newRow:SetPoint("TOPLEFT", ZNBodyFrame.Subframes.Player.scrollChild,"TOPLEFT")
    end
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
        if  type(comp)=="number"  and comp>pivot or type(comp)~="number" and ZN.TextSortOrder[comp]>ZN.TextSortOrder[pivot] then
          local saveUnit = ZN.PlayerSortArray[i]
					ZN.PlayerSortArray[i] = ZN.PlayerSortArray[j]
					ZN.PlayerSortArray[j] = saveUnit
        end
      end 
    end 
  end 
end

function ZN:ReloadPlayerTable()
  --if not (#ZN.PlayerRows > 0) then return end
  local PlayerTable = ZNBodyFrame.Subframes.Player
  ZN:BuildPlayerFilterArray()
  ZN:BuildPlayerSortArray()

  local scrollHeight = (ZN.PlayerTableRows.row+ZN.PlayerTableRows.rowgap)*#ZN.PlayerSortArray
  PlayerTable.scrollChild:SetHeight(scrollHeight)

  for i=1, #ZN.PlayerRows do
    ZN.PlayerRows[i]:SetShown(false)
  end

  local anchor=PlayerTable.TitleRow
  
  for i=1, #ZN.PlayerSortArray do
    if i >#ZN.PlayerRows then
      ZN.PlayerRows[i] = CreateContentRow(ZN.PlayerFilterArray[ZN.PlayerSortArray[i]], ZNotes.PlayerSpells[ZN.PlayerFilterArray[ZN.PlayerSortArray[i]]], anchor)
    else 
      UpdateContentRow(ZN.PlayerFilterArray[ZN.PlayerSortArray[i]], ZNotes.PlayerSpells[ZN.PlayerFilterArray[ZN.PlayerSortArray[i]]], anchor, ZN.PlayerRows[i])
    end
    if i==1 then
      ZN.PlayerRows[i]:SetPoint("TOPLEFT", ZNBodyFrame.Subframes.Player.scrollChild,"TOPLEFT")
    end
    ZN.PlayerRows[i]:SetShown(true)
    anchor = ZN.PlayerRows[i]
  end  

end

function ZN:addNewPlayerSpell()
  table.insert(ZNotes.PlayerSpells,
  {
    ["type"] = "heal",
    ["id"] = 0,
    ["class"] = "all",
    ["role"] = "heal",
    ["cd"] = 0,
    ["aoe"] = true,
    ["rating"] = 0,
    ["stackable"] = "true",
    ["station"] = true,
    ["name"] = "",
  })
  ZN:ReloadPlayerTable()
end

function ZN:ResetPlayerFilter()
  ZN.RoleFilter="all"
  ZN.ClassFilter="all"
  ZN.TypeFilter="all"
  ZN.AoeFilter="all"
  ZN.StationFilter="all"

  PlayerSidebar.StationSelectButton.ZNText:SetText(ZN.CheckBoxSelectionColor["all"])
  PlayerSidebar.AoeSelectButton.ZNText:SetText(ZN.CheckBoxSelectionColor["all"])
  PlayerSidebar.TypeSelectButton.ZNText:SetText(ZN.TypeSelection["all"])
  PlayerSidebar.RoleSelectButton.ZNText:SetText(ZN.RoleSelectionColor["all"])
  PlayerSidebar.ClassSelectButton.ZNText:SetText(ZN.PlayerClassesColored["all"])
  ZN:ReloadPlayerTable()
end