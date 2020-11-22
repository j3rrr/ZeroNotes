local _, ZN, L = ...

--local selectedTemplate = nil
--local selectedGroupTemplate = nil
function ZN:initHome()
  ZN.SavedNotesRows = {}
  ZN.LoadedNote = ""
  HomeContent = ZNBodyFrame.Subframes.Home
  --[[ ##############################################################################
    Home Body
  ############################################################################## --]]
  HomeContent.UrlButton = ZN.CreateGenericButton("HomeUrlButton", HomeContent, "BOTTOM", HomeContent, "BOTTOM", 640, 30, 0, 0,0,0, 10, ZN.Colors.INACTIVE, ZN.Colors.BG, nil, "www.zero-wow.de", "CENTER",false )
  HomeContent.UrlButton:SetScript("OnClick", function(self) ZN:ToggleInfo(self) end)
  HomeContent.MainTitle = ZN.CreateText(HomeContent, "TOP", HomeContent, "TOP", 680, 30, 0, -30, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNVers.ttf", 18, ZN.Colors.ACTIVE, "Welcome to Zero Notes", "LEFT", "TOP")
  HomeContent.MainIntro = ZN.CreateText(HomeContent, "TOP", HomeContent.MainTitle, "BOTTOM", 680, 60, 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNTitle.ttf", 14, ZN.Colors.ACTIVE, 
  "This addon is designed to automatically create notes, populated with heal / immunity / utility spells, depending on your current raidsetup."
  , "LEFT", "TOP",8)
  HomeContent.HowToTitle = ZN.CreateText(HomeContent, "TOP", HomeContent.MainIntro, "BOTTOM", 680, 30, 0, -20, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 18, ZN.Colors.ACTIVE, "How to use", "LEFT", "TOP")
  HomeContent.Paragraph = ZN.CreateText(HomeContent, "TOP", HomeContent.HowToTitle, "BOTTOM", 680, 300, 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNTitle.ttf", 14, ZN.Colors.ACTIVE, 
  "* Use the editor to set ratings, types, etc for all playerspells, you want to assign during encounters\n"
  .."* Use the editor to create a template for each boss\n"
  .."* Create the note or send it directly to all raidmembers using Exorsus Raid Tools\n\n"
  .."Playerspells with the highest rating will be assigned to the highest priority spells in an encounter first to make sure that all important spells will be covered.\n"
  .."Spells will be blocked when they have been used until they are off cooldown.\n"
  .."If you don't have any more useable spells, there will be a notification in the note.\n"
  .."Define how many healing cooldowns, utility spells or immunities you want to use each time.\nSee the default template to get an idea.\n\n"
  .."For 'Count Mode' you still need to set approximate timings when creating a Boss Template, so Cooldowns can be assigned properly"
  , "LEFT", "TOP",8)
  --[[ ##############################################################################
    Raw Note Edit Box
  ############################################################################## --]]
  HomeContent.ShowNoteEditBox = ZN.createSubFrame("ShowNoteEditBox", HomeContent, 680, 530, ZN.Colors.BG, 1, "TOP","DIALOG", true, 0, 0)
  HomeContent.ShowNoteEditBox.btnClose = ZN.CreateIconButton(HomeContent.ShowNoteEditBox, "TOPRIGHT", HomeContent.ShowNoteEditBox, "TOPRIGHT", 16, 16, -10, -10, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)  
  HomeContent.ShowNoteEditBox.EditBox = ZN.MultiLineEditBox("ZBMImportEditBox", HomeContent.ShowNoteEditBox, "TOP", HomeContent.ShowNoteEditBox, "TOP", 660, 450, 0, -65, 0, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.HD, nil, "", "LEFT")
  HomeContent.ShowNoteEditBox.btnSaveNote = ZN.CreateIconButton(HomeContent.ShowNoteEditBox, "BOTTOMLEFT", HomeContent.ShowNoteEditBox.EditBox, "TOPLEFT", 26, 26, 0, 16, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\save", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, ZN.Colors.ACTIVE, true, "Save Note", ZN.Colors.ACTIVE)
  HomeContent.ShowNoteEditBox.btnLoadNote = ZN.CreateIconButton(HomeContent.ShowNoteEditBox, "BOTTOMLEFT", HomeContent.ShowNoteEditBox.btnSaveNote, "BOTTOMRIGHT", 26, 26, 16, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\load", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, ZN.Colors.ACTIVE, true, "Load Note", ZN.Colors.ACTIVE)
  HomeContent.ShowNoteEditBox.btnSendNote = ZN.CreateIconButton(HomeContent.ShowNoteEditBox, "BOTTOMLEFT", HomeContent.ShowNoteEditBox.btnLoadNote, "BOTTOMRIGHT", 26, 26, 32, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\arrow_send", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, ZN.Colors.ACTIVE, true, "Send Note", ZN.Colors.ACTIVE)

  HomeContent.ShowNoteEditBox.EditBox.editbox.hintText = ZN.CreateText(HomeContent.ShowNoteEditBox.EditBox, "BOTTOMRIGHT", HomeContent.ShowNoteEditBox.EditBox, "BOTTOMRIGHT", 225, 10, 0, 3, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 10, ZN.Colors.INACTIVE, "Press Enter to save, Shift+Enter for new line", "LEFT", "CENTER")
  HomeContent.ShowNoteEditBox.EditBox.editbox:SetScript("OnEnterPressed", function(self)
    if not IsShiftKeyDown() then
      self.oldText = self:GetText()
      if self.doOnUpdate then
        self.OnUpdate(self.tableType,self.Row,self.Column, self:GetText(),self)
      end
      self:ClearFocus()		
    else
      self:Insert("\n")
    end
  end)
  
  HomeContent.ShowNoteEditBox.btnSendNote:SetScript("OnClick", function()
    --ZN:DebugPrint(ZNotes.SavedNotes[ZN.LoadedNote].content)
    
    local CreatedNote = HomeContent.ShowNoteEditBox.EditBox.editbox:GetText():gsub("{count:(%d+)}","")
    local CreatedZNNote = HomeContent.ShowNoteEditBox.EditBox.editbox:GetText()
    -- local CreatedNote = ZNotes.SavedNotes[ZN.LoadedNote].content:gsub("{count:(%d+)}","")
    -- local CreatedZNNote = ZNotes.SavedNotes[ZN.LoadedNote].content
    if not CreatedNote then
      ZN:Print("No note was created. Please check templates and try again.")
      return
    end
    local group = "RAID"
    if IsInGroup() and not IsInRaid() then
      group = "PARTY"
    end
    if (IsInRaid() or IsInGroup()) and HomeSidebar.zndCheckbox.active then
      if HomeSidebar.SendCountCheckBox.active then
        C_ChatInfo.SendAddonMessage( "ZERONOTE_TYPE", "count", group )
        CreatedNote = CreatedZNNote:gsub("%{time:([^}]+)%}","")
        CreatedNote = CreatedNote:gsub("{count:(%d+)}","%1")
      else
        C_ChatInfo.SendAddonMessage( "ZERONOTE_TYPE", "time", group )
      end
      local parts = math.ceil(string.len(CreatedZNNote)/255)
      C_ChatInfo.SendAddonMessage( "ZERONOTE", "NewNote", group )
      for i=1,parts do
        C_ChatInfo.SendAddonMessage( "ZERONOTE", strsub(CreatedZNNote,1+(255*(i-1)),255+(255*(i-1))), group )
      end
      C_ChatInfo.SendAddonMessage( "ZERONOTE", "DoneNewNote", group )
    elseif HomeSidebar.zndCheckbox.active and not (IsInRaid() or IsInGroup()) then
      ZN:Print("Note not sent to ZND because you are not in a group.")
    end
    if IsAddOnLoaded("ExRT") and HomeSidebar.exrtCheckbox.active then
      VExRT.Note.Text1 = CreatedNote
      _G["GExRT"].A["Note"].frame:Save()
    end
    if (IsAddOnLoaded("ExRT") and IsAddOnLoaded("WeakAuras") and WeakAurasSaved.displays["0 ZND - Zero Note Display"] and not HomeSidebar.zndCheckbox.active and not HomeSidebar.exrtCheckbox.active) 
      or (IsAddOnLoaded("ExRT") and IsAddOnLoaded("WeakAuras") and not WeakAurasSaved.displays["0 ZND - Zero Note Display"] and not HomeSidebar.exrtCheckbox.active)
      or (IsAddOnLoaded("ExRT") and not IsAddOnLoaded("WeakAuras") and not HomeSidebar.exrtCheckbox.active)
      or (not IsAddOnLoaded("ExRT") and IsAddOnLoaded("WeakAuras") and not HomeSidebar.zndCheckbox.active) then
      ZN:Print("Please choose at least one Display to send your note to.")
    elseif not IsAddOnLoaded("ExRT") and (not IsAddOnLoaded("WeakAuras") or (IsAddOnLoaded("WeakAuras") and not WeakAurasSaved.displays["0 ZND - Zero Note Display"])) then
      ZN:Print("No Display found. Please install ExRT or Weakauras and ZND")
    end
  end)

  HomeContent.ShowNoteEditBox.btnLoadNote:SetScript("OnClick", function(self) 
    if not ZNShowNote.SavedNotesContainer:IsShown() then
      ZN:initSavedNotesList()
    end
    ZNShowNote.SavedNotesContainer:SetShown(not ZNShowNote.SavedNotesContainer:IsShown())
  end)
  HomeContent.ShowNoteEditBox.btnSaveNote:SetScript("OnClick", function(self) ZNsaveNoteFrame:SetShown(not ZNsaveNoteFrame:IsShown()) end)
  HomeContent.ShowNoteEditBox.btnClose:SetScript("OnClick", function(self) HomeContent.ShowNoteEditBox:Hide() end)
  --[[ ##############################################################################
    Saved Note List Overlay
  ############################################################################## --]]
  ZNShowNote = HomeContent.ShowNoteEditBox.EditBox
  ZNShowNote.SavedNotesContainer = ZN.createSubFrame("SavedNotesContaier", ZNShowNote, 250, 450, ZN.Colors.HD, 1, "TOPLEFT", "DIALOG", true, 0, 0, ZNShowNote, "TOPLEFT", false)
  ZNShowNote.SavedNotesContainer.btnClose = ZN.CreateIconButton(ZNShowNote.SavedNotesContainer, "TOPRIGHT", ZNShowNote.SavedNotesContainer, "TOPRIGHT", 12, 12, -8, -8, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)  
  ZNShowNote.SavedNotesContainer.btnClose:SetScript("OnClick", function(self) ZNShowNote.SavedNotesContainer:Hide() end)
  -- Scrollframe
  ZNShowNote.SavedNotesContainer.SavedNotesListScroll = ZN.createScrollFrame("SavedNotesListScroll", ZNShowNote.SavedNotesContainer, 250, 450, ZN.Colors.BG, 1, "TOPLEFT", "DIALOG", false, true, ZN.Colors.INACTIVE)
  ZNShowNote.SavedNotesContainer.SavedNotesListScroll:SetBackdrop({bgFile = "Interface/AddOns/ZeroNotes/Media/Texture/square", -- Interface/Tooltips/UI-Tooltip-Background Interface/AddOns/ZeroNotes/Media/Texture/square
    edgeFile = [[Interface\Buttons\WHITE8x8]],
    edgeSize = 1,
  });
  ZNShowNote.SavedNotesContainer.SavedNotesListScroll:SetBackdropColor(tonumber("0x"..ZN.Colors.BG:sub(1,2))/255, tonumber("0x"..ZN.Colors.BG:sub(3,4))/255, tonumber("0x"..ZN.Colors.BG:sub(5,6))/255, 1);
  ZNShowNote.SavedNotesContainer.SavedNotesListScroll:SetBackdropBorderColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1);
  ZNSavedNotesList = ZNShowNote.SavedNotesContainer.SavedNotesListScroll

  function ZN:initSavedNotesList()
    for i = 1, #ZN.SavedNotesRows do
      ZN.SavedNotesRows[i]:Hide()
    end
    local count = 0
    ZN.SaveNotesLabel = {}
    for k,v in pairs(ZNotes.SavedNotes) do
      count = count+1
      ZN.SaveNotesLabel[count] = v.name
    end

    for i = 1, #ZN.SaveNotesLabel do
      if i > #ZN.SavedNotesRows then 
        ZN.SavedNotesRows[i] = ZN:createSavedNotesRow(i, ZN.SavedNotesRows[i-1], "BOTTOM", 2)
      else
        ZN:updateSavedNotesRow(i, ZN.SavedNotesRows[i-1], ZN.SavedNotesRows[i])
      end
      if i == 1 then
        ZN.SavedNotesRows[i]:ClearAllPoints()
        ZN.SavedNotesRows[i]:SetPoint("TOP", ZNShowNote.SavedNotesContainer.SavedNotesListScroll.scrollChild,"TOP", 0, -28)
      end
      ZN.SavedNotesRows[i]:Show()
      ZN.SavedNotesRows[i].btnDelete.key = ZN.SaveNotesLabel[i]
      ZN:DebugPrint(i)
    end
  end

  function ZN:createSavedNotesRow(i, AnchorFrame, anchorPoint, yOffset)
    local ZNSavedNotesListRow = ZN.createSubFrame("SavedNotesRow"..i, ZNSavedNotesList.scrollChild, 248, 20, ZN.Colors.ROWBG, 1, "TOP", "DIALOG", false, 0, -yOffset, AnchorFrame, anchorPoint, false)
    ZNSavedNotesListRow.btn = ZN.CreateGenericButton("NoteListItem"..i, ZNSavedNotesListRow, "LEFT", ZNSavedNotesListRow, "LEFT", 228, 20, 0, 0, 10, 0 , 10, ZN.Colors.INACTIVE, ZN.Colors.ROWBG, nil, ZN.SaveNotesLabel[i], "LEFT", true, ZN.Colors.SBButtonBG, false, nil, nil, nil)
    ZNSavedNotesListRow.btn:SetScript("OnClick", function()
      HomeContent.ShowNoteEditBox.EditBox.editbox:SetText(ZNotes.SavedNotes[ZN.SaveNotesLabel[i]].content)
      ZN.LoadedNote = ZN.SaveNotesLabel[i]
      HomeContent.ShowNoteEditBox.EditBox.SavedNotesContainer:Hide()
      ZN:DebugPrint("ZNLoadedNote2: "..ZN.LoadedNote)
    end)
    ZNSavedNotesListRow.btnDelete = ZN.CreateIconButton(ZNSavedNotesListRow, "LEFT", ZNSavedNotesListRow.btn, "RIGHT", 12, 12, 2, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\delete2", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, ZN.Colors.ACTIVE, true, "Delete Note", ZN.Colors.ACTIVE)
    ZNSavedNotesListRow.btnDelete.key = ZN.SaveNotesLabel[i]
    ZNSavedNotesListRow.btnDelete:SetScript("OnClick", function(self) 
      ZNotes.SavedNotes[self.key] = nil
      ZN:initSavedNotesList()
    end)
    return ZNSavedNotesListRow
  end

  function ZN:updateSavedNotesRow(i, AnchorFrame, ContentRow)
    ContentRow:SetPoint("TOP", AnchorFrame, "BOTTOM",0,-2)    
    ContentRow.btn.ZNText:SetText(ZN.SaveNotesLabel[i]:upper())
  end

  --[[ ##############################################################################
    Sidebar
  ############################################################################## --]]
  HomeSidebar = ZNSidebarFrame.Subframes.Home
  HomeSidebar.TemplateSelectButton = ZN.CreateGenericButton("ZNBossTemplateSelectButton", HomeSidebar, "TOPLEFT", HomeSidebar, "TOPLEFT", 240, 25, 0, -60,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, "Select Boss Template", ZN.homeSelectedBossTemplate and ZN.homeSelectedBossTemplate or "Select Template..", "LEFT",true )
  HomeSidebar.TemplateSelectButton.doOnUpdate = true
  HomeSidebar.TemplateSelectButton.OnUpdate = function(_,_,_,newValue)
    ZN.homeSelectedBossTemplate = newValue 
    ZNotes.lastTemplates.homeLastBossTemplate = newValue
    ZN:DebugPrint("homeLastBossTemplate: "..ZNotes.lastTemplates.homeLastBossTemplate)
  end
  HomeSidebar.TemplateSelectButton:SetScript("OnClick", function(self) 
    ZN:CreateDropdown(self, ZN:getTableKeys(ZNotes.BossTemplates), ZN:getTableOrder(ZNotes.BossTemplates), 240, ZN.Colors.BG, "LEFT", 10, nil, "TOOLTIP")
  end)

  HomeSidebar.GroupTemplateSelectButton = ZN.CreateGenericButton("ZNGroupTemplateSelectButton", HomeSidebar, "TOPLEFT", HomeSidebar.TemplateSelectButton, "BOTTOMLEFT", 240, 30, 0, -40,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, "Select Group Template", ZN.homeSelectedGroupTemplate and ZN.homeSelectedGroupTemplate or "Use Current Group", "LEFT",true )
  HomeSidebar.GroupTemplateSelectButton.doOnUpdate = true
  HomeSidebar.GroupTemplateSelectButton.OnUpdate = function(_,_,_,newValue) 
    ZN.homeSelectedGroupTemplate = newValue
    ZNotes.lastTemplates.homeLastGroupTemplate = newValue
    ZN:DebugPrint("homeLastGroupTemplate: "..ZNotes.lastTemplates.homeLastGroupTemplate)
  end
  HomeSidebar.GroupTemplateSelectButton:SetScript("OnClick", function(self)
    ZN:CreateDropdown(self, ZN:getTableKeys(ZNotes.GroupTemplates), ZN:getTemplateTableOrder(ZNotes.GroupTemplates), 240, ZN.Colors.BG, "LEFT", 10, nil, "TOOLTIP")
  end)

  HomeSidebar.SendToButton = ZN.CreateGenericButton("SendToButton", HomeSidebar, "BOTTOMLEFT", HomeSidebar, "BOTTOMLEFT", 240, 30, 0, 100,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Send Note", "CENTER",true )

  -- ExRT Checkbox 
  if IsAddOnLoaded("ExRT") then
    HomeSidebar.exrtCheckbox = ZN:createSquareCheckBox(HomeSidebar, "BOTTOMLEFT", HomeSidebar.SendToButton, "TOPLEFT", 0, 10, "ExRT", 12, ZN.Colors.ACTIVE, 70, ZNotes.lastTemplates.homeSendToExRT, true, "Send to ExRT", ZN.Colors.ACTIVE)
    HomeSidebar.exrtCheckbox:SetScript("OnClick",function(self)
      self.toggleChecked()
      -- Toggle SavedVariable
      if ZNotes.lastTemplates.homeSendToExRT then
        ZNotes.lastTemplates.homeSendToExRT = false
      else
        ZNotes.lastTemplates.homeSendToExRT = true
      end
      local debugExRT = "false"
      if ZNotes.lastTemplates.homeSendToExRT then 
        debugExRT = "true" 
      end
      ZN:DebugPrint("homeSendToExRT: "..debugExRT)
    end)
    HomeSidebar.exrtCheckbox.button:SetScript("OnMouseDown",function()
      HomeSidebar.exrtCheckbox.toggleChecked()
      -- Toggle SavedVariable
      if ZNotes.lastTemplates.homeSendToExRT then
        ZNotes.lastTemplates.homeSendToExRT = false
      else
        ZNotes.lastTemplates.homeSendToExRT = true
      end
      local debugExRT = "false"
      if ZNotes.lastTemplates.homeSendToExRT then 
        debugExRT = "true" 
      end
      ZN:DebugPrint("homeSendToExRT: "..debugExRT)
    end)
  else
    HomeSidebar.exrtCheckbox = ZN:createSquareCheckBox(HomeSidebar, "BOTTOMLEFT", HomeSidebar.SendToButton, "TOPLEFT", 0, 10, "ExRT", 12, ZN.Colors.INACTIVE, 50, false, true, "Please install Exorsus Raid Tools to use this function", ZN.Colors.ACTIVE)
  end
  -- ZND Checkbox 
  if IsAddOnLoaded("WeakAuras") then
    if WeakAurasSaved.displays["0 ZND - Zero Note Display"] then
      HomeSidebar.zndCheckbox = ZN:createSquareCheckBox(HomeSidebar, "BOTTOMRIGHT", HomeSidebar.SendToButton, "TOPRIGHT", -120, 10, "Zero Note Display", 12, ZN.Colors.ACTIVE, 120, ZNotes.lastTemplates.homeSendToZND, true, "Send to Zero Note Display", ZN.Colors.ACTIVE)
      HomeSidebar.zndCheckbox:SetScript("OnClick",function(self)
        self.toggleChecked()
        -- Toggle SavedVariable
        if ZNotes.lastTemplates.homeSendToZND then
          ZNotes.lastTemplates.homeSendToZND = false
        else
          ZNotes.lastTemplates.homeSendToZND = true
        end
        local debugZND = "false"
        if ZNotes.lastTemplates.homeSendToZND then 
          debugZND = "true" 
        end
        ZN:DebugPrint("homeSendToZND: "..debugZND)
      end)
      HomeSidebar.zndCheckbox.button:SetScript("OnMouseDown",function()
        HomeSidebar.zndCheckbox.toggleChecked()
        -- Toggle SavedVariable
        if ZNotes.lastTemplates.homeSendToZND then
          ZNotes.lastTemplates.homeSendToZND = false
        else
          ZNotes.lastTemplates.homeSendToZND = true
        end
        local debugZND = "false"
        if ZNotes.lastTemplates.homeSendToZND then 
          debugZND = "true" 
        end
        ZN:DebugPrint("homeSendToZND: "..debugZND)
      end)
    elseif not WeakAurasSaved.displays["0 ZND - Zero Note Display"] then
      HomeSidebar.zndCheckbox = ZN:createSquareCheckBox(HomeSidebar, "BOTTOMRIGHT", HomeSidebar.SendToButton, "TOPRIGHT", -120, 10, "Zero Note Display", 12, ZN.Colors.INACTIVE, 120, false, true, "Please install Zero Note Display WA to use this function", ZN.Colors.ACTIVE)
    end
  else
    HomeSidebar.zndCheckbox = ZN:createSquareCheckBox(HomeSidebar, "BOTTOMRIGHT", HomeSidebar.SendToButton, "TOPRIGHT", -120, 10, "Zero Note Display", 12, ZN.Colors.INACTIVE, 120, false, true, "Please install WeakAuras and ZND to use this function", ZN.Colors.ACTIVE)
  end

  HomeSidebar.ShowNoteInEditorButton = ZN.CreateGenericButton("ShowNoteInEditorButton", HomeSidebar, "TOPLEFT", HomeSidebar.SendToButton, "BOTTOMLEFT", 240, 30, 0, -10,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Show Note", "CENTER",true )
  HomeSidebar.btnConfig = ZN.CreateIconButton(HomeSidebar, "BOTTOMLEFT", HomeSidebar, "BOTTOMLEFT", 24, 24, 0, 17, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\config", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, nil, true, "Open Config", ZN.Colors.ACTIVE)
  HomeSidebar.btnConfig:SetScript("OnClick", function(self) HomeContent.ConfigFrame:SetShown(not HomeContent.ConfigFrame:IsShown()); end)
  HomeSidebar.btnConfig:SetShown(false);

  HomeSidebar.SendToButton:SetScript("OnClick", function(self) 
    if not IsInGroup() and (ZN.homeSelectedGroupTemplate == "Use Current Group" or ZN.homeSelectedGroupTemplate == nil) then 
      ZN:Print("You need to join a group or select a Grouptemplate")
      return
    end
    if ZN.homeSelectedBossTemplate == nil or ZN.homeSelectedBossTemplate == "Select Template.." then
      ZN:Print("You need to select a Boss Template")
      return
    end
    local CreatedNote, CreatedZNNote = ZN:PrintNote(ZN.homeSelectedBossTemplate, HomeSidebar.IncludeMissingCheckBox.active, ZN.homeSelectedGroupTemplate)
    if not CreatedNote then
      ZN:Print("No note was created. Please check templates and try again.")
      return
    end
    local group = "RAID"
    if IsInGroup() and not IsInRaid() then
      group = "PARTY"
    end
    if (IsInRaid() or IsInGroup()) and HomeSidebar.zndCheckbox.active then
      if HomeSidebar.SendCountCheckBox.active then
        C_ChatInfo.SendAddonMessage( "ZERONOTE_TYPE", "count", group )
        CreatedNote = CreatedZNNote:gsub("%{time:([^}]+)%}","")
        CreatedNote = CreatedNote:gsub("{count:(%d+)}","%1")
      else
        C_ChatInfo.SendAddonMessage( "ZERONOTE_TYPE", "time", group )
      end

      local parts = math.ceil(string.len(CreatedZNNote)/255)
      C_ChatInfo.SendAddonMessage( "ZERONOTE", "NewNote", group )
      for i=1,parts do
        C_ChatInfo.SendAddonMessage( "ZERONOTE", strsub(CreatedZNNote,1+(255*(i-1)),255+(255*(i-1))), group )
      end
      C_ChatInfo.SendAddonMessage( "ZERONOTE", "DoneNewNote", group )
    elseif HomeSidebar.zndCheckbox.active and not (IsInRaid() or IsInGroup()) then
      ZN:Print("Note not sent to ZND because you are not in a group.")
    end
    if IsAddOnLoaded("ExRT") and HomeSidebar.exrtCheckbox.active then
      VExRT.Note.Text1 = CreatedNote
      _G["GExRT"].A["Note"].frame:Save()
    end
    if (IsAddOnLoaded("ExRT") and IsAddOnLoaded("WeakAuras") and WeakAurasSaved.displays["0 ZND - Zero Note Display"] and not HomeSidebar.zndCheckbox.active and not HomeSidebar.exrtCheckbox.active) 
      or (IsAddOnLoaded("ExRT") and IsAddOnLoaded("WeakAuras") and not WeakAurasSaved.displays["0 ZND - Zero Note Display"] and not HomeSidebar.exrtCheckbox.active)
      or (IsAddOnLoaded("ExRT") and not IsAddOnLoaded("WeakAuras") and not HomeSidebar.exrtCheckbox.active)
      or (not IsAddOnLoaded("ExRT") and IsAddOnLoaded("WeakAuras") and not HomeSidebar.zndCheckbox.active) then
      ZN:Print("Please choose at least one Display to send your note to.")
    elseif not IsAddOnLoaded("ExRT") and (not IsAddOnLoaded("WeakAuras") or (IsAddOnLoaded("WeakAuras") and not WeakAurasSaved.displays["0 ZND - Zero Note Display"])) then
      ZN:Print("No Display found. Please install ExRT or Weakauras and ZND")
    end
  end)


  HomeSidebar.ShowNoteInEditorButton:SetScript("OnClick", function(self) 
    if not IsInGroup() and (ZN.homeSelectedGroupTemplate == "Use Current Group" or ZN.homeSelectedGroupTemplate == nil) then 
      ZN:Print("You need to join a group or select a Grouptemplate")
      return
    end
    if ZN.homeSelectedBossTemplate == nil or ZN.homeSelectedBossTemplate == "Select Template.." then
      ZN:Print("You need to select a Boss Template")
      return
    end
    local rtnote, zndnote = ZN:PrintNote(ZN.homeSelectedBossTemplate, HomeSidebar.IncludeMissingCheckBox.active, ZN.homeSelectedGroupTemplate)
    if not HomeContent.ShowNoteEditBox:IsShown() then
      HomeContent.ShowNoteEditBox:Show()   
    end
    HomeContent.ShowNoteEditBox.EditBox.editbox:SetText(zndnote)    
    --HomeContent.ShowNoteEditBox.EditBox.editbox.znd = zndnote
  end)

  HomeSidebar.IncludeMissingCheckBox = ZN:createSquareCheckBox(HomeSidebar, "TOPLEFT", HomeSidebar.GroupTemplateSelectButton, "BOTTOMLEFT", 0, -20, "Include Missing Spells", 14, ZN.Colors.ACTIVE, 200, ZNotes.lastTemplates.homeIncludeMissing)
  HomeSidebar.SendCountCheckBox = ZN:createSquareCheckBox(HomeSidebar, "TOPLEFT", HomeSidebar.IncludeMissingCheckBox, "BOTTOMLEFT", 0, -10, "Toggle Count Mode", 14, ZN.Colors.ACTIVE, 200, ZNotes.lastTemplates.homeSendCount,true, "Send Note with count of spellcasts instead of fixed times. This will disable ZBM for this note. ExRT will not mark the completed spells as done.", ZN.Colors.ACTIVE)


  -- Missing Checkbox onclick
  HomeSidebar.IncludeMissingCheckBox:SetScript("OnClick",function(self)
    self.toggleChecked()
    -- Toggle SavedVariable
    if ZNotes.lastTemplates.homeIncludeMissing then
      ZNotes.lastTemplates.homeIncludeMissing = false
    else
      ZNotes.lastTemplates.homeIncludeMissing = true
    end
    local debugMissing = "false"
    if ZNotes.lastTemplates.homeIncludeMissing then 
      debugMissing = "true" 
    end
    ZN:DebugPrint("homeSendToZND: "..debugMissing)
  end)

  HomeSidebar.SendCountCheckBox:SetScript("OnClick",function(self)
    self.toggleChecked()
    -- Toggle SavedVariable
    if ZNotes.lastTemplates.homeSendCount then
      ZNotes.lastTemplates.homeSendCount = false
    else
      ZNotes.lastTemplates.homeSendCount = true
    end
  end)

  HomeSidebar.IncludeMissingCheckBox.button:SetScript("OnMouseDown",function()
    HomeSidebar.IncludeMissingCheckBox.toggleChecked()
    -- Toggle SavedVariable
    if ZNotes.lastTemplates.homeIncludeMissing then
      ZNotes.lastTemplates.homeIncludeMissing = false
    else
      ZNotes.lastTemplates.homeIncludeMissing = true
    end
    local debugMissing = "false"
    if ZNotes.lastTemplates.homeIncludeMissing then 
      debugMissing = "true" 
    end
    ZN:DebugPrint("homeSendToZND: "..debugMissing)
  end)

  HomeSidebar.SendCountCheckBox.button:SetScript("OnMouseDown",function()
    HomeSidebar.SendCountCheckBox.toggleChecked()
    -- Toggle SavedVariable
    if ZNotes.lastTemplates.homeSendCount then
      ZNotes.lastTemplates.homeSendCount = false
    else
      ZNotes.lastTemplates.homeSendCount = true
    end
  end)
  --[[ ##############################################################################
    Save Note Popup
  ############################################################################## --]]
  ZNsaveNoteFrame = ZN.createSubFrame("ZNsaveNoteFrame",ZNFrame, 302, 202, ZN.Colors.HD, 1, 'CENTER', 'TOOLTIP', true)
  ZNsaveNoteFrame:SetScript("OnMouseDown", function(self, button)end)
  table.insert(ZN.DropDownsEdit, ZNsaveNoteFrame)
  table.insert(ZN.GroupPopups, ZNsaveNoteFrame)
  ZNsaveNoteFrame:SetScript("OnMouseDown", function(self, button)end)
  ZNsaveNoteFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
    edgeFile = [[Interface\Buttons\WHITE8x8]],
    edgeSize = 1,
  });
  ZNsaveNoteFrame:SetBackdropColor(tonumber("0x"..ZN.Colors.HD:sub(1,2))/255, tonumber("0x"..ZN.Colors.HD:sub(3,4))/255, tonumber("0x"..ZN.Colors.HD:sub(5,6))/255, 1);
  ZNsaveNoteFrame:SetBackdropBorderColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1);
  ZNsaveNoteFrame.btnClose = ZN.CreateIconButton(ZNsaveNoteFrame, "TOPRIGHT", ZNsaveNoteFrame, "TOPRIGHT", 16, 16, -11, -11, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
  
  ZNsaveNoteFrame.Message = ZN.CreateText(ZNsaveNoteFrame, "TOP", ZNsaveNoteFrame, "TOP", 250, 30, 0, -41, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 12, ZN.Colors.ACTIVE, "Name", "LEFT")
  ZNsaveNoteFrame.newNoteName = ZN.SingleLineEditBox("newNoteName", ZNsaveNoteFrame, "TOP", ZNsaveNoteFrame.Message, "BOTTOM", 250, 30, 0, -10, 20, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "", "LEFT")
  ZNsaveNoteFrame.ErrorMessage = ZN.CreateText(ZNsaveNoteFrame, "TOP", ZNsaveNoteFrame.newNoteName, "BOTTOM", 250, 20, 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNVers.ttf", 10, ZN.Colors.chatYell, "", "CENTER")
  ZNsaveNoteFrame.ConfirmButton = ZN.CreateGenericButton("ZNnewNoteConfirmButton", ZNsaveNoteFrame, "BOTTOMLEFT", ZNsaveNoteFrame, "BOTTOMLEFT", 125, 30, 20, 20,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Save", "CENTER",true, ZN.Colors.BG )
  ZNsaveNoteFrame.CancelButton = ZN.CreateGenericButton("ZNnewNoteCancelButton", ZNsaveNoteFrame, "BOTTOMRIGHT", ZNsaveNoteFrame, "BOTTOMRIGHT", 125, 30, -20, 20,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Cancel", "CENTER",true, ZN.Colors.BG )
  ZNsaveNoteFrame.ErrorMessage:Hide()
  -- Check if Name exists 
  ZNsaveNoteFrame.newNoteName.doOnUpdate = true
  ZNsaveNoteFrame.newNoteName.OnUpdate = function(_,_,_,newValue) 
    -- Check if Name exists 
    if ZNotes.SavedNotes[newValue:lower():match("^%s*(.-)%s*$")] then 
      ZNsaveNoteFrame.ErrorMessage:SetText("Name already exists") 
      ZNsaveNoteFrame.ErrorMessage:Show()
      C_Timer.After(3, function() ZNsaveNoteFrame.ErrorMessage:Hide() end)
      return
    end
    -- Check if Name is empty
     if newValue == nil or newValue == "" then 
      ZNsaveNoteFrame.ErrorMessage:SetText("Please enter a name for your Note") 
      ZNsaveNoteFrame.ErrorMessage:Show()
      C_Timer.After(3, function() ZNsaveNoteFrame.ErrorMessage:Hide() end)
      return
    end
  end  
  ZNsaveNoteFrame.newNoteName:SetScript("OnEditFocusLost", function(self)
		self:ClearFocus()
	end) 
  ZNsaveNoteFrame.ConfirmButton:SetScript("OnClick", function(self)
    local name = ZNsaveNoteFrame.newNoteName:GetText():lower():match("^%s*(.-)%s*$")
     -- Check if Name exists 
    if ZNotes.SavedNotes[name] then
      ZNsaveNoteFrame.ErrorMessage:SetText("Name already exists") 
      ZNsaveNoteFrame.ErrorMessage:Show()
      C_Timer.After(3, function() ZNsaveNoteFrame.ErrorMessage:Hide() end)
      return
    end
    -- Check if Name is empty
    if name == nil or name == "" then
      ZNsaveNoteFrame.ErrorMessage:SetText("Please enter a name for your Template")
      ZNsaveNoteFrame.ErrorMessage:Show()
      C_Timer.After(3, function() ZNsaveNoteFrame.ErrorMessage:Hide() end)
    -- If Name does not exist, create new template
    else      
      ZNotes.SavedNotes[name] = {}
      ZNotes.SavedNotes[name]["name"] = name
      ZNotes.SavedNotes[name]["content"] = HomeContent.ShowNoteEditBox.EditBox.editbox:GetText()
      -- ZNotes.SavedNotes[name]["contentznd"] = HomeContent.ShowNoteEditBox.EditBox.editbox.znd
      -- Reset Button / SavedVariables / Rebuild Frames
      ZN:DebugPrint("Note Name: "..name)
      ZN:Print("Saved Note as: "..name) 
      ZNsaveNoteFrame:Hide()
    end
  end)
  ZNsaveNoteFrame.btnClose:SetScript("OnClick", function(self) ZNsaveNoteFrame:Hide() end)
  ZNsaveNoteFrame.CancelButton:SetScript("OnClick", function(self) ZNsaveNoteFrame:Hide() end)
end
