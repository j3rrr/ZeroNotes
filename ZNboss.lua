local _, ZN, L = ...

local selectedTemplate = nil

-- Boss Sidebar
BossSidebar = ZNSidebarFrame.Subframes.Boss 
BossSidebar.TemplateSelectButton = ZN.CreateGenericButton("ZNBossTemplateSelectButton", BossSidebar, "TOPLEFT", BossSidebar, "TOPLEFT", 240, 30, 0, -40,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, "Select Template", "Select Template..", "LEFT",true )
BossSidebar.TemplateSelectButton.doOnUpdate = true
BossSidebar.TemplateSelectButton.OnUpdate = function(_,_,_,newValue) 
    selectedTemplate = newValue 
    ZN:ReloadBossSpellTable(newValue)
end
BossSidebar.TemplatePreviewButton = ZN.CreateGenericButton("ZNBossTemplatePreviewButton", BossSidebar, "TOPLEFT", BossSidebar.TemplateSelectButton, "BOTTOMLEFT", 240, 30, 0, -20,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Preview Note", "CENTER",true )
BossSidebar.TemplatePreviewFrame = ZN.createSubFrame("ZNBossTemplatePreviewFrame", BossSidebar, 232, 350, nil, 1, "BOTTOMLEFT", "DIALOG", false, 0, 50)
BossSidebar.TemplatePreviewFrame.Scroll = ZN.createScrollFrame("ZNBossTemplatePreviewScrollFrame", BossSidebar.TemplatePreviewFrame, 232, 350, nil, 1, "CENTER","DIALOG", false, false, ZN.Colors.SBButtonBG)

-- Boss Sidebar Functions
BossSidebar.TemplateSelectButton:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN:getTableKeys(ZNotes.BossTemplates), ZN:getTableOrder(ZNotes.BossTemplates), 240, ZN.Colors.BG, "LEFT", 10, nil, "TOOLTIP") end)
BossSidebar.TemplatePreviewButton:SetScript("OnClick", function(self) 
  if selectedTemplate == nil or selectedTemplate == "Select Template.." then
    ZN:Print("You need to select a Boss Template")
    return
  end
  ZN:showPreview(ZN:printPreviewNote(selectedTemplate), BossSidebar.TemplatePreviewFrame.Scroll.scrollChild)
 end)

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


  ZN.BossTrennerTableColumns = {
    ["text"] = 340,
    ["time"] = 60,
    ["raidicon"] = 60,
  }
  ZN.BossDropdowns = {
    ["icon"] = {["content"]=ZN.ColoredRoles, ["order"]=ZN.ColoredRolesOrder},
  }
  ZN.BossAttributeMapping = {
    ["time"] = "time",
    ["repeatAfter"] = "repeatAfter",
    ["spellid"] = "id",
    ["spellname"] = "name",
    ["need"] = "need",
    ["aoe"] = "aoe",
    ["station"] = "station",
    ["repeatX"] = "repeatX",
    ["prio"] = "prio",
    ["trenner"] = "trenner",
    ["raidicon"] = "raidico",
    ["heal"] = "heal",
    ["util"] = "util",
    ["imun"] = "imun",
  }
  ZN.BossTableIconButton = {
    ["aoe"]= {["size"]= 16, ["xOffset"]=44, ["type"]="checkBox"},
    ["station"]= {["size"]= 16, ["xOffset"]=22, ["type"]="checkBox"},
    ["edit"]= {["size"]= 16, ["xOffset"]=19, ["type"]="edit", ["texture"]="Interface\\AddOns\\ZeroNotes\\Media\\Texture\\edit"},
    ["delete"]= {["size"]= 16, ["xOffset"]=39, ["type"]="delete", ["texture"]="Interface\\AddOns\\ZeroNotes\\Media\\Texture\\delete2"}
  }

    ZNSidebarFrame.btnReloadBossSpell = ZN.CreateIconButton(ZNSidebarFrame, "BOTTOM", ZNSidebarFrame.btnCollapseSidebar, "TOP", 20, 20, 0, 196, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\update", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, nil, true, "Update Boss Spell", ZN.Colors.ACTIVE)
    ZNSidebarFrame.btnAddBossSpell = ZN.CreateIconButton(ZNSidebarFrame, "BOTTOM", ZNSidebarFrame.btnReloadBossSpell, "TOP", 20, 20, 0, 20, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\plus_nobg", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, nil, true, "Add Boss Spell", ZN.Colors.ACTIVE)

    ZNSidebarFrame.btnReloadBossSpell:SetShown(false)
    ZNSidebarFrame.btnAddBossSpell:SetShown(false)

    -- ZNSidebarFrame.btnReloadBossSpell:SetScript("OnClick",function(self) ZN:ReloadPlayerTable() end)
    -- ZNSidebarFrame.btnAddBossSpell:SetScript("OnClick",function(self) ZN:addNewPlayerSpell() end)

    ZNSidebarFrame.btnReloadBossTrenner = ZN.CreateIconButton(ZNSidebarFrame, "BOTTOM", ZNSidebarFrame.btnCollapseSidebar, "TOP", 20, 20, 0, 20, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\update", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, nil, true, "Update Boss Divider", ZN.Colors.ACTIVE)
    ZNSidebarFrame.btnAddBossTrenner = ZN.CreateIconButton(ZNSidebarFrame, "BOTTOM", ZNSidebarFrame.btnReloadBossTrenner, "TOP", 20, 20, 0, 20, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\plus_nobg", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, nil, true, "Add Boss Divider", ZN.Colors.ACTIVE)

    ZNSidebarFrame.btnReloadBossTrenner:SetShown(false)
    ZNSidebarFrame.btnAddBossTrenner:SetShown(false)

    -- ZNSidebarFrame.btnReloadBossTrenner:SetScript("OnClick",function(self) ZN:ReloadPlayerTable() end)
    -- ZNSidebarFrame.btnAddBossTrenner:SetScript("OnClick",function(self) ZN:addNewPlayerSpell() end)

  local function CreateGenericButton (name, parent, point, anchor, anchorPoint, width, type, text,row)
    local btn = ZN.CreateGenericButton(name, parent, point, anchor, anchorPoint, width, ZN.PlayerTableRows.row, 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, text, "CENTER", false)
    btn:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN.BossDropdowns[type].content, ZN.BossDropdowns[type].order, width, ZN.Colors.SBButtonBG, "CENTER",0, ZN.Colors.HD) end)
    btn.Row = row
    btn.Column = ZN.BossAttributeMapping[type]
    btn.OnUpdate=function(_, row, column, newvalue)
      ZNotes.BossSpells[btn.Row][btn.Column]=newvalue
    end
    btn.doOnUpdate=true
    return btn
  end
  
  local function CreateSingleLineEditBox(name, parent, point, anchor, anchorPoint, width, type, text, xOffSet, row, boss)
    local tb = ZN.SingleLineEditBox(name, parent, point, anchor, anchorPoint, width, ZN.PlayerTableRows.row, xOffSet and xOffSet or 0, 0, 0, 0 ,12, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, text, "CENTER")
    tb.Row = row
    tb.boss=boss
    tb.Column = ZN.BossAttributeMapping[type]
    tb.refersTo=nil
    tb.OnUpdate=function(_, row, column, newvalue)
      newvalue = tonumber(newvalue)
      if newvalue == nil then
        UIErrorsFrame:AddMessage("You need to enter a numeric value", 0.8, 0.07, 0.2, 5.0)
        tb:SetText(ZNotes.BossTemplates[tb.boss][tb.Row][tb.Column])
      else
        ZNotes.BossTemplates[tb.boss][tb.Row][tb.Column]=newvalue
      end
      if tb.Column=="id" then
        tb.refersTo:SetText((GetSpellInfo(newvalue) and GetSpellInfo(newvalue) or "|cffff3f40Invalid Spell ID|r"):upper())
        ZNotes.BossTemplates[tb.boss][tb.Row]["name"]=GetSpellInfo(newvalue)
      end
    end
    tb.doOnUpdate=true
    return tb
  end
  
  local function CreateCheckBox(parent, point, anchor, anchorPoint, type, row, checked, boss)
    local cb = ZN.CreateIconButton(parent, point, anchor, anchorPoint, ZN.BossTableIconButton[type].size, ZN.BossTableIconButton[type].size, ZN.BossTableIconButton[type].xOffset, 0, ZN.CheckBoxTextures.checked, ZN.CheckBoxTextures.checkedColor, ZN.CheckBoxTextures.uncheckedColor, true, ZN.Colors.ACTIVE)
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
    cb.boss=boss
    cb.Column = ZN.BossAttributeMapping[type]
    return cb
  end
  
  
  local function CreateText(parent, point, anchor, anchorPoint, width, type, text, xOffset)
    local txt = ZN.CreateText(parent, point, anchor, anchorPoint, width, ZN.PlayerTableRows.row, xOffset and xOffset or 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 12, ZN.Colors.INACTIVE, text, "CENTER", "CENTER")
    return txt
  end
  
  local function CreateIconButton(parent, point, anchor, anchorPoint, type, row, boss)
    local btn =ZN.CreateIconButton(parent, point, anchor, anchorPoint, ZN.BossTableIconButton[type].size, ZN.BossTableIconButton[type].size, ZN.BossTableIconButton[type].xOffset, 0, ZN.BossTableIconButton[type].texture, ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
    btn.Row = row
    btn.boss=boss
    btn.Column = ZN.BossAttributeMapping[type]
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

local function CreateBossSpellRow(BossSpellID, BossSpell, AnchorFrame, boss)
    local ContentRow = ZN.createSubFrame("ZNBossSpellRow"..BossSpellID, ZNBodyFrame.Subframes.BossSpells.scrollChild, 930, ZN.BossTableRows.row, ZN.Colors.ROWBG, 1, "TOP", "HIGH", false, 0,-ZN.BossTableRows.rowgap, AnchorFrame, "BOTTOM")
    
    ContentRow.SpellId = CreateSingleLineEditBox("Spellid"..BossSpellID, ContentRow, "LEFT", ContentRow, "LEFT",ZN.BossSpellTableColumns["spellid"], "spellid", BossSpell.id,0,BossSpellID, boss)
    ContentRow.SpellName = CreateText(ContentRow, "LEFT", ContentRow.SpellId, "RIGHT",ZN.BossSpellTableColumns["spellname"], "spellname", (GetSpellInfo(BossSpell.id) and GetSpellInfo(BossSpell.id) or "|cffff3f40Invalid Spell ID|r"):upper())
    ContentRow.Time = CreateSingleLineEditBox("Time"..BossSpellID, ContentRow, "LEFT", ContentRow.SpellName, "RIGHT",ZN.BossSpellTableColumns["time"], "time", BossSpell.time,0,BossSpellID, boss)
    ContentRow.Prio = CreateSingleLineEditBox("Prio"..BossSpellID, ContentRow, "LEFT", ContentRow.Time, "RIGHT",ZN.BossSpellTableColumns["prio"], "prio", BossSpell.prio,0,BossSpellID, boss)
    ContentRow.Station = CreateCheckBox(ContentRow, "LEFT", ContentRow.Prio, "RIGHT", "station", BossSpellID, BossSpell.station, boss)
    ContentRow.Aoe = CreateCheckBox(ContentRow, "LEFT", ContentRow.Station, "RIGHT", "aoe", BossSpellID, BossSpell.aoe, boss)
    ContentRow.repeatX = CreateSingleLineEditBox("RepeatX"..BossSpellID, ContentRow, "LEFT", ContentRow.Aoe, "RIGHT",ZN.BossSpellTableColumns["repeatX"], "repeatX", BossSpell.repeatX,22,BossSpellID, boss)
    ContentRow.repeatAfter = CreateSingleLineEditBox("RepeatAfter"..BossSpellID, ContentRow, "LEFT", ContentRow.repeatX, "RIGHT",ZN.BossSpellTableColumns["repeatX"], "repeatX", BossSpell.repeatAfter,0,BossSpellID, boss)
    ContentRow.heal = CreateSingleLineEditBox("heal"..BossSpellID, ContentRow, "LEFT", ContentRow.repeatAfter, "RIGHT",ZN.BossSpellTableColumns["heal"], "heal", ZN:CountBossSpellNeeds(boss, BossSpellID, "heal"),0,BossSpellID, boss)
    ContentRow.util = CreateSingleLineEditBox("util"..BossSpellID, ContentRow, "LEFT", ContentRow.heal, "RIGHT",ZN.BossSpellTableColumns["util"], "util", ZN:CountBossSpellNeeds(boss, BossSpellID, "util"),0,BossSpellID, boss)
    ContentRow.imun = CreateSingleLineEditBox("imun"..BossSpellID, ContentRow, "LEFT", ContentRow.util, "RIGHT",ZN.BossSpellTableColumns["imun"], "imun", ZN:CountBossSpellNeeds(boss, BossSpellID, "imun"),0,BossSpellID, boss)
    ContentRow.edit = CreateIconButton(ContentRow, "LEFT", ContentRow.imun, "RIGHT", "edit", BossSpellID,boss)
    ContentRow.Delete = CreateIconButton(ContentRow, "LEFT", ContentRow.edit, "RIGHT", "delete", BossSpellID,boss)

    ContentRow.SpellId.refersTo=ContentRow.SpellName

    ContentRow.heal.OnUpdate=function(_, row, column, newvalue, self)
        newvalue = tonumber(newvalue)
        if newvalue == nil then
          UIErrorsFrame:AddMessage("You need to enter a numeric value", 0.8, 0.07, 0.2, 5.0)
          self:SetText(ZN:CountBossSpellNeeds(self.boss, self.Row, self.Column))
        else
            ZN:SetBossSpellNeeds(self.boss, self.Row, self.parent)
        end
      end
    ContentRow.util.OnUpdate = ContentRow.heal.OnUpdate
    ContentRow.imun.OnUpdate = ContentRow.heal.OnUpdate

    ContentRow.Aoe:SetScript("OnClick",function(self)
    self.toggleChecked()
    ZNotes.BossTemplates[self.boss][self.Row][self.Column] = self.active
    end)

    ContentRow.Station:SetScript("OnClick",function(self)
    self.toggleChecked()
    ZNotes.BossTemplates[self.boss][self.Row][self.Column] = self.active
    end)

    -- ContentRow.Delete:SetScript("OnClick", function(self)
    -- table.remove(ZNotes.BossSpells,self.Row)
    -- ZN:ReloadPlayerTable()
    -- end)

    --edit function

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

    -- local spellI=1
    -- local trennerI=1
    -- local boss="SampleBoss"
    -- for i=1, #ZNotes.BossTemplates[boss] do
    --     if not ZNotes.BossTemplates[boss][i].trenner then
    --         ZN.BossSpellsIndex[spellI]=i
    --         spellI = spellI + 1
    --     else
    --         ZN.BossTrennerIndex[trennerI]=i
    --         trennerI = trennerI + 1
    --     end
    -- end
  
    -- ZN:BuildPlayerFilterArray()
    -- ZN:BuildPlayerSortArray()
  
    --  local scrollHeight = ZN.PlayerTableRows.title + (ZN.BossTableRows.row+ZN.BossTableRows.rowgap)*#ZN.BossSpellsIndex
    -- BossSpellTable.scrollChild:SetHeight(scrollHeight)
  
    -- local anchor=BossSpellTable.TitleRow
  
    -- for i=1, #ZN.BossSpellsIndex do
    --   local newRow = CreateBossSpellRow(ZN.BossSpellsIndex[i], ZNotes.BossTemplates[boss][ZN.BossSpellsIndex[i]], anchor,boss)
    --   if i==1 then
    --     newRow:ClearAllPoints()
    --     newRow:SetPoint("TOP", ZNBodyFrame.Subframes.BossSpells.scrollChild,"TOP")
    --   end
    --   ZN.BossSpellRows[i] = newRow
    --   anchor = newRow
    -- end  
  end

  function ZN:ReloadBossSpellTable(boss)
    ZN.BossSpellsIndex = {}
    local BossSpellTable = ZNBodyFrame.Subframes.BossSpells

  
    local scrollHeight = ZN.PlayerTableRows.title + (ZN.BossTableRows.row+ZN.BossTableRows.rowgap)*#ZN.BossSpellsIndex
    BossSpellTable.scrollChild:SetHeight(scrollHeight)
  
    local spellI=1
    --local boss="SampleBoss"
    for i=1, #ZNotes.BossTemplates[boss] do
        if not ZNotes.BossTemplates[boss][i].trenner then
            ZN.BossSpellsIndex[spellI]=i
            spellI = spellI + 1
        end
    end
    ZN:BuildBossSpellSortArray (boss)

    for i=1, #ZN.BossSpellRows do
      ZN.BossSpellRows[i]:SetShown(false)
    end
  
    local anchor=BossSpellTable.TitleRow
    
    for i=1, #ZN.BossSpellSortArray do
      if i >#ZN.BossSpellRows then
        ZN.BossSpellRows[i] = CreateBossSpellRow(ZN.BossSpellsIndex[ZN.BossSpellSortArray[i]], ZNotes.BossTemplates[boss][ZN.BossSpellsIndex[ZN.BossSpellSortArray[i]]], anchor,boss)
      else 
        --UpdateContentRow(ZN.BossSpellsIndex[ZN.BossSpellSortArray[i]], ZNotes.BossTemplates[boss][ZN.BossSpellsIndex[ZN.BossSpellSortArray[i]]], anchor,boss, ZN.PlayerRows[i])
      end
      if i==1 then
        ZN.BossSpellRows[i]:ClearAllPoints()
        ZN.BossSpellRows[i]:SetPoint("TOP", ZNBodyFrame.Subframes.BossSpells.scrollChild,"TOP")
      end
      ZN.BossSpellRows[i]:SetShown(true)
      anchor = ZN.BossSpellRows[i]
    end  
  
  end

  ZN.BossSpellSortArray={}
  function ZN:BuildBossSpellSortArray (boss)
    ZN.BossSpellSortArray={}
    for i=1, #ZN.BossSpellsIndex do
      ZN.BossSpellSortArray[i]=i
    end
  
    for k=1,#ZN.BossSpellsIndex do
      for i=1,#ZN.BossSpellsIndex do
        local pivot = ZNotes.BossTemplates[boss][ZN.BossSpellsIndex[i]]["time"]
        for j=i+1,#ZN.BossSpellsIndex do
          local comp = ZNotes.BossTemplates[boss][ZN.BossSpellsIndex[j]]["time"]
          if  type(comp)=="number"  and comp<pivot then
            local saveUnit = ZN.BossSpellSortArray[i]
                      ZN.BossSpellSortArray[i] = ZN.BossSpellSortArray[j]
                      ZN.BossSpellSortArray[j] = saveUnit
          end
        end 
      end 
    end 
  end

  function ZN:CountBossSpellNeeds(boss, spellID, needtype)
    if not ZNotes.BossTemplates[boss][spellID]["need"] then return end
    local count = 0
    for i=1, #ZNotes.BossTemplates[boss][spellID]["need"] do
        if ZNotes.BossTemplates[boss][spellID]["need"][i]["type"]==needtype then
            count = count +1
        end
    end
    return count
  end

  function ZN:SetBossSpellNeeds(boss, spellID, row)
    ZNotes.BossTemplates[boss][spellID]["need"]={}

    for i=1, tonumber(row.heal:GetText()) do
        table.insert(ZNotes.BossTemplates[boss][spellID]["need"], {["type"] = "heal"})
    end
    for i=1, tonumber(row.util:GetText()) do
        table.insert(ZNotes.BossTemplates[boss][spellID]["need"], {["type"] = "util"})
    end
    for i=1, tonumber(row.imun:GetText()) do
        table.insert(ZNotes.BossTemplates[boss][spellID]["need"], {["type"] = "imun"})
    end
    return count
  end