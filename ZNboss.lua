local _, ZN, L = ...

-- Boss Sidebar
BossSidebar = ZNSidebarFrame.Subframes.Boss 
BossSidebar.TemplateSelectButton = ZN.CreateGenericButton("ZNBossTemplateSelectButton", BossSidebar, "TOPLEFT", BossSidebar, "TOPLEFT", 240, 30, 0, -40,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, "Select Template", "Select Template..", "LEFT",true )
BossSidebar.TemplateSelectButton.doOnUpdate = true
BossSidebar.TemplateSelectButton.OnUpdate = function(_,_,_,newValue) selectedTemplate = newValue end
BossSidebar.TemplatePreviewButton = ZN.CreateGenericButton("ZNBossTemplatePreviewButton", BossSidebar, "TOPLEFT", BossSidebar.TemplateSelectButton, "BOTTOMLEFT", 240, 30, 0, -20,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Preview Note", "CENTER",true )
BossSidebar.TemplatePreviewFrame = ZN.createSubFrame("ZNBossTemplatePreviewFrame", BossSidebar, 240, 350, nil, 1, "BOTTOMLEFT", "DIALOG", false, 0, 50)
BossSidebar.TemplatePreviewFrame.Scroll = ZN.createScrollFrame("ZNBossTemplatePreviewScrollFrame", BossSidebar.TemplatePreviewFrame, 240, 350, nil, 1, "CENTER","DIALOG", false, false, ZN.Colors.SBButtonBG)

-- Boss Sidebar Functions
BossSidebar.TemplateSelectButton:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN:getTableKeys(ZNotes.BossTemplates), ZN:getTableOrder(ZNotes.BossTemplates), 240, ZN.Colors.BG, "LEFT", 10, nil, "TOOLTIP") end)
BossSidebar.TemplatePreviewButton:SetScript("OnClick", function(self) ZN:showPreview(ZN:printPreviewNote(selectedTemplate), BossSidebar.TemplatePreviewFrame.Scroll.scrollChild) end)

-- Boss Sidebar Buttons

ZN.BossTableRows = {
    ["title"] = 30,
    ["row"] = 40,
    ["rowgap"] = 2,
  }
  ZN.BossSpellTableColumnHeaderNames = {
    ["spellid"] = "ID",
    ["spellname"] = "Spellname",
    ["time"] = "Time",
    ["prio"] = "Prio",
    ["station"] = "Station",
    ["aoe"] = "AOE",
    ["repeatX"] = "x Times",
    ["repeatAfter"] = "Interval",
    ["heal"] = "Heal",
    ["imun"] = "Immunity",
    ["util"] = "Utility",
    ["edit"] = "Edit",
    ["delete"] = "Delete",
  }
  ZN.BossSpellTableColumnHeaders = {
    "spellid",
    "spellname",
    "time",
    "prio",
    "station",
    "aoe",
    "repeatX",
    "repeatAfter",
    "heal",
    "util",
    "imun",
    "edit",
    "delete",
  }
  ZN.BossSpellTableColumns = {
    ["spellid"] = 80,
    ["spellname"] = 200,
    ["time"] = 60,
    ["prio"] = 60,
    ["station"] = 60,
    ["aoe"] = 60,
    ["repeatX"] = 60,
    ["repeatAfter"] = 60,
    ["heal"]=60,
    ["imun"]=60,
    ["util"]=60,
    ["edit"]= 55,
    ["delete"] = 55,
  }
  ZN.BossTrennerTableColumnHeaderNames = {
    ["text"] = "Divider Text",
    ["time"] = "Time",
    ["raidicon"] = "Icon",
  }
  ZN.BossTrennerTableColumnHeaders = {
    "text",
    "time",
    "raidicon",
  }

  ZN.BossTableCheckBoxTextures = {
    ["checked"] = "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\checkmark",
    ["checkedColor"] = ZN.Colors.hunter,
    ["unchecked"] = "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active",
    ["uncheckedColor"] = ZN.Colors.dk,
  }

  ZN.BossTrennerTableColumns = {
    ["text"] = 340,
    ["time"] = 60,
    ["raidicon"] = 60,
  }
  ZN.PlayerDropdowns = {
    ["icon"] = {["content"]=ZN.ColoredRoles, ["order"]=ZN.ColoredRolesOrder},
  }

  local function CreateGenericButton (name, parent, point, anchor, anchorPoint, width, type, text,row)
    local btn = ZN.CreateGenericButton(name, parent, point, anchor, anchorPoint, width, ZN.PlayerTableRows.row, 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, text, "CENTER", false)
    btn:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN.PlayerDropdowns[type].content, ZN.PlayerDropdowns[type].order, width, ZN.Colors.SBButtonBG, "CENTER",0, ZN.Colors.HD) end)
    btn.Row = row
    btn.Column = ZN.PlayerAttributeMapping[type]
    btn.OnUpdate=function(_, row, column, newvalue)
      ZNotes.BossSpells[btn.Row][btn.Column]=newvalue
    end
    btn.doOnUpdate=true
    return btn
  end
  
  local function CreateSingleLineEditBox(name, parent, point, anchor, anchorPoint, width, type, text, xOffSet, row)
    local tb = ZN.SingleLineEditBox(name, parent, point, anchor, anchorPoint, width, ZN.PlayerTableRows.row, xOffSet and xOffSet or 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, text, "CENTER")
    tb.Row = row
    tb.Column = ZN.PlayerAttributeMapping[type]
    tb.refersTo=nil
    tb.OnUpdate=function(_, row, column, newvalue)
      newvalue = tonumber(newvalue)
      if newvalue == nil then
        UIErrorsFrame:AddMessage("You need to enter a numeric value", 0.8, 0.07, 0.2, 5.0)
        tb:SetText(ZNotes.BossSpells[tb.Row][tb.Column])
      else
        ZNotes.BossSpells[tb.Row][tb.Column]=newvalue
      end
      if tb.Column=="id" then
        tb.refersTo:SetText((GetSpellInfo(newvalue) and GetSpellInfo(newvalue) or "|cffff3f40Invalid Spell ID|r"):upper())
        ZNotes.BossSpells[tb.Row]["name"]=GetSpellInfo(newvalue)
      end
    end
    tb.doOnUpdate=true
    return tb
  end
  
  local function CreateCheckBox(parent, point, anchor, anchorPoint, type, row, checked)
    local cb = ZN.CreateIconButton(parent, point, anchor, anchorPoint, ZN.PlayerTableIconButton[type].size, ZN.PlayerTableIconButton[type].size, ZN.PlayerTableIconButton[type].xOffset, 0, ZN.BossTableCheckBoxTextures.checked, ZN.BossTableCheckBoxTextures.checkedColor, ZN.BossTableCheckBoxTextures.uncheckedColor, true, ZN.Colors.ACTIVE)
    cb.toggleChecked = function()
      if cb.active then
        cb.active=false
        cb:SetNormalTexture(ZN.BossTableCheckBoxTextures.unchecked)
        cb:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.BossTableCheckBoxTextures.uncheckedColor:sub(1,2))/255, tonumber("0x"..ZN.BossTableCheckBoxTextures.uncheckedColor:sub(3,4))/255, tonumber("0x"..ZN.BossTableCheckBoxTextures.uncheckedColor:sub(5,6))/255, 1)
      else
        cb.active=true
        cb:SetNormalTexture(ZN.BossTableCheckBoxTextures.checked)
        cb:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.BossTableCheckBoxTextures.checkedColor:sub(1,2))/255, tonumber("0x"..ZN.BossTableCheckBoxTextures.checkedColor:sub(3,4))/255, tonumber("0x"..ZN.BossTableCheckBoxTextures.checkedColor:sub(5,6))/255, 1)
      end
    end
    if not checked then
      cb.toggleChecked()
      cb:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.BossTableCheckBoxTextures.uncheckedColor:sub(1,2))/255, tonumber("0x"..ZN.BossTableCheckBoxTextures.uncheckedColor:sub(3,4))/255, tonumber("0x"..ZN.BossTableCheckBoxTextures.uncheckedColor:sub(5,6))/255, 1)
    end
    cb.Row = row
    cb.Column = type
    return cb
  end
  
  
  local function CreateText(parent, point, anchor, anchorPoint, width, type, text, xOffset)
    local txt = ZN.CreateText(parent, point, anchor, anchorPoint, width, ZN.PlayerTableRows.row, xOffset and xOffset or 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 12, ZN.Colors.INACTIVE, text, "CENTER", "CENTER")
    return txt
  end
  
  local function CreateIconButton(parent, point, anchor, anchorPoint, type, row)
    local btn =ZN.CreateIconButton(parent, point, anchor, anchorPoint, 16, 16, 17, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\delete2", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
    btn.Row = row
    btn.Column = type
    return btn
  end

local function CreateSpellTitleRow()
    local TitleRow = ZN.createSubFrame("ZNBossSpellTitleRow", ZNBodyFrame.Subframes.BossSpellHead, 930, ZN.BossTableRows.title, ZN.Colors.BG, 1, "TOP", "HIGH", false, -5,0)
    local anchor = TitleRow
    for i=1, #ZN.BossSpellTableColumnHeaders do
        local header = ZN.BossSpellTableColumnHeaders[i]
        local text = ZN.BossSpellTableColumnHeaderNames[header]
        local width = ZN.BossSpellTableColumns[header]
        local height = ZN.BossTableRows.title
        local headerButton = ZN.CreateGenericButton(nil, TitleRow, "LEFT", anchor, anchor==TitleRow and "LEFT" or "RIGHT", width, height, 0, 0, 0, 0 ,10, ZN.Colors.INACTIVE, ZN.Colors.BG, nil, text, "CENTER", false)
        anchor = headerButton
    end
    return TitleRow
end

local function CreateTrennerTitleRow()
    local TitleRow = ZN.createSubFrame("ZNBossTrennerTitleRow", ZNBodyFrame.Subframes.BossTrennerHead, 460, ZN.BossTableRows.title, ZN.Colors.BG, 1, "TOP", "HIGH", false, -5,0)
    local anchor = TitleRow
    for i=1, #ZN.BossTrennerTableColumnHeaders do
        local header = ZN.BossTrennerTableColumnHeaders[i]
        local text = ZN.BossTrennerTableColumnHeaderNames[header]
        local width = ZN.BossTrennerTableColumns[header]
        local height = ZN.BossTableRows.title
        local headerButton = ZN.CreateGenericButton(nil, TitleRow, "LEFT", anchor, anchor==TitleRow and "LEFT" or "RIGHT", width, height, 0, 0, 0, 0 ,10, ZN.Colors.INACTIVE, ZN.Colors.BG, nil, text, "CENTER", false)
        anchor = headerButton
    end
    return TitleRow
end

local function CreateBossSpellRow(BossSpellID, BossSpell, AnchorFrame)
    local ContentRow = ZN.createSubFrame("ZNBossSpellRow"..BossSpellID, ZNBodyFrame.Subframes.BossSpells.scrollChild, 930, ZN.BossTableRows.row, ZN.Colors.ROWBG, 1, "TOP", "HIGH", false, 0,-ZN.BossTableRows.rowgap, AnchorFrame, "BOTTOM")
    
    ContentRow.SpellId = CreateSingleLineEditBox("Spellid"..BossSpellID, ContentRow, "LEFT", ContentRow, "LEFT",ZN.BossSpellTableColumns["spellid"], "spellid", BossSpell.id,0,BossSpellID)
    ContentRow.SpellName = CreateText(ContentRow, "LEFT", ContentRow.SpellId, "RIGHT",ZN.BossSpellTableColumns["spellname"], "spellname", (GetSpellInfo(BossSpell.id) and GetSpellInfo(BossSpell.id) or "|cffff3f40Invalid Spell ID|r"):upper())
    


    -- ContentRow.Role = CreateGenericButton ("Role"..BossSpellID, ContentRow, "LEFT", ContentRow, "LEFT", "role", ZN.ColoredRoles[BossSpell.role],BossSpellID)
    -- ContentRow.Class = CreateGenericButton ("Class"..BossSpellID, ContentRow, "LEFT", ContentRow.Role, "RIGHT", "class", ZN.PlayerClassesColored[BossSpell.class],BossSpellID)
    
    -- ContentRow.SpellName = CreateText(ContentRow, "LEFT", ContentRow.SpellId, "RIGHT", "spellname", (GetSpellInfo(BossSpell.id) and GetSpellInfo(BossSpell.id) or "|cffff3f40Invalid Spell ID|r"):upper())
    -- ContentRow.SpellType = CreateGenericButton ("Type"..BossSpellID, ContentRow, "LEFT", ContentRow.SpellName, "RIGHT", "spelltype", ZN.Types[BossSpell.type],BossSpellID)
    -- ContentRow.Aoe = CreateCheckBox(ContentRow, "LEFT", ContentRow.SpellType, "RIGHT", "aoe", BossSpellID, BossSpell.aoe)
    -- ContentRow.Station = CreateCheckBox(ContentRow, "LEFT", ContentRow.Aoe, "RIGHT", "station", BossSpellID, BossSpell.station)
    -- --ContentRow.SpellCd = CreateText(ContentRow, "LEFT", ContentRow.Station, "RIGHT", "spellcd", select(1,GetSpellBaseCooldown(BossSpell.id))/1000, 17)
    -- ContentRow.SpellCd = CreateSingleLineEditBox("Spellcd"..BossSpellID, ContentRow, "LEFT", ContentRow.Station, "RIGHT", "spellcd", BossSpell.cd, 17, BossSpellID)
    -- ContentRow.SpellRating = CreateSingleLineEditBox("Spellrating"..BossSpellID, ContentRow, "LEFT", ContentRow.SpellCd, "RIGHT", "spellrating", BossSpell.rating,0, BossSpellID)
    -- ContentRow.Delete = CreateIconButton(ContentRow, "LEFT", ContentRow.SpellRating, "RIGHT", "delete", BossSpellID)


    -- ContentRow.SpellId.refersTo=ContentRow.SpellName

    -- ContentRow.Aoe:SetScript("OnClick",function(self)
    -- self.toggleChecked()
    -- ZNotes.BossSpells[self.Row][self.Column] = self.active
    -- end)

    -- ContentRow.Station:SetScript("OnClick",function(self)
    -- self.toggleChecked()
    -- ZNotes.BossSpells[self.Row][self.Column] = self.active
    -- end)

    -- ContentRow.Delete:SetScript("OnClick", function(self)
    -- table.remove(ZNotes.BossSpells,self.Row)
    -- ZN:ReloadPlayerTable()
    -- end)

    return ContentRow
end

ZN.BossSpellsIndex = {}
ZN.BossTrennerIndex = {}
ZN.BossSpellRows = {}
function ZN:InitBoss()
    -- Player Body
    local BossSpellTable = ZNBodyFrame.Subframes.BossSpells
    local BossTrennerTable = ZNBodyFrame.Subframes.BossTrenner
    -- Title Row
    BossSpellTable.TitleRow = CreateSpellTitleRow()
    BossTrennerTable.TitleRow = CreateTrennerTitleRow()

    local spellI=1
    local trennerI=1
    for i=1, #ZNotes.BossTemplates.SampleBoss do
        if not ZNotes.BossTemplates.SampleBoss[i].trenner then
            ZN.BossSpellsIndex[spellI]=i
            spellI = spellI + 1
        else
            ZN.BossTrennerIndex[trennerI]=i
            trennerI = trennerI + 1
        end
    end
  
    -- ZN:BuildPlayerFilterArray()
    -- ZN:BuildPlayerSortArray()
  
    -- local scrollHeight = ZN.PlayerTableRows.title + (ZN.PlayerTableRows.row+ZN.PlayerTableRows.rowgap)*#ZN.PlayerSortArray
    BossSpellTable.scrollChild:SetHeight(700)
  
    local anchor=BossSpellTable.TitleRow
  
    for i=1, #ZN.BossSpellsIndex do
        print(i)
        print("boss"..ZN.BossSpellsIndex[i])
      local newRow = CreateBossSpellRow(ZN.BossSpellsIndex[i], ZNotes.BossTemplates.SampleBoss[ZN.BossSpellsIndex[i]], anchor)
      if i==1 then
        newRow:ClearAllPoints()
        newRow:SetPoint("TOP", ZNBodyFrame.Subframes.BossSpells.scrollChild,"TOP")
      end
      ZN.BossSpellRows[i] = newRow
      anchor = newRow
    end  
  end