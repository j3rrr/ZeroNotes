local _, ZN, L = ...

local selectedTemplate = nil
local selectedGroupTemplate = nil

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
HomeContent.Paragraph = ZN.CreateText(HomeContent, "TOP", HomeContent.HowToTitle, "BOTTOM", 680, 250, 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNTitle.ttf", 14, ZN.Colors.ACTIVE, 
"* Use the editor to set ratings, types, etc for all playerspells, you want to assign during encounters\n"
.."* Use the editor to create a template for each boss\n"
.."* Create the note or send it directly to all raidmembers using Exorsus Raid Tools\n\n"
.."Playerspells with the highest rating will be assigned to the highest priority spells in an encounter first to make sure that all important spells will be covered.\n"
.."Spells will be blocked when they have been used until they are off cooldown.\n"
.."If you don't have any more useable spells, there will be a notification in the note.\n"
.."Define how many healing cooldowns, utility spells or immunities you want to use each time.\nSee the default template to get an idea.\n"
, "LEFT", "TOP",8)
--[[ ##############################################################################
  Raw Note Edit Box
############################################################################## --]]
HomeContent.ShowNoteEditBox = ZN.createSubFrame("ShowNoteEditBox", HomeContent, 680, 530, ZN.Colors.BG, 1, "TOP","DIALOG", true, 0, 0)
HomeContent.ShowNoteEditBox.btnClose = ZN.CreateIconButton(HomeContent.ShowNoteEditBox, "TOPRIGHT", HomeContent.ShowNoteEditBox, "TOPRIGHT", 16, 16, -10, -10, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
HomeContent.ShowNoteEditBox.EditBox = ZN.MultiLineEditBox("ZBMImportEditBox", HomeContent.ShowNoteEditBox, "TOP", HomeContent.ShowNoteEditBox, "TOP", 660, 450, 0, -65, 0, 0 ,12, ZN.Colors.ACTIVE, ZN.Colors.HD, nil, "", "LEFT")

HomeContent.ShowNoteEditBox.btnClose:SetScript("OnClick", function(self) HomeContent.ShowNoteEditBox:Hide() end)
--[[ ##############################################################################
  Sidebar
############################################################################## --]]
HomeSidebar = ZNSidebarFrame.Subframes.Home
HomeSidebar.TemplateSelectButton = ZN.CreateGenericButton("ZNBossTemplateSelectButton", HomeSidebar, "TOPLEFT", HomeSidebar, "TOPLEFT", 240, 30, 0, -60,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, "Select Boss Template", "Select Template..", "LEFT",true )
HomeSidebar.TemplateSelectButton.doOnUpdate = true
HomeSidebar.TemplateSelectButton.OnUpdate = function(_,_,_,newValue) selectedTemplate = newValue end

HomeSidebar.GroupTemplateSelectButton = ZN.CreateGenericButton("ZNGroupTemplateSelectButton", HomeSidebar, "TOPLEFT", HomeSidebar.TemplateSelectButton, "BOTTOMLEFT", 240, 30, 0, -40,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, "Select Group Template", "Use current group", "LEFT",true )
HomeSidebar.GroupTemplateSelectButton.doOnUpdate = true
HomeSidebar.GroupTemplateSelectButton.OnUpdate = function(_,_,_,newValue) 
  selectedGroupTemplate = newValue
  ZN:DebugPrint(selectedGroupTemplate)
end
HomeSidebar.GroupTemplateSelectButton:SetScript("OnClick", function(self)
  ZN:CreateDropdown(self, ZN:getTableKeys(ZNotes.GroupTemplates), ZN:getTemplateTableOrder(ZNotes.GroupTemplates), 240, ZN.Colors.BG, "LEFT", 10, nil, "TOOLTIP")
end)

if IsAddOnLoaded("ExRT") then
  HomeSidebar.SendToExRTButton = ZN.CreateGenericButton("SendToExRTButton", HomeSidebar, "BOTTOMLEFT", HomeSidebar, "BOTTOMLEFT", 240, 30, 0, 100,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Send Note to ExRT", "CENTER",true )
else
  HomeSidebar.SendToExRTButton = ZN.CreateGenericButton("SendToExRTButton", HomeSidebar, "BOTTOMLEFT", HomeSidebar, "BOTTOMLEFT", 240, 30, 0, 100,0,0, 12, ZN.Colors.chatYell, ZN.Colors.SBButtonBG, nil, "ExRT not found", "CENTER",false )
end

HomeSidebar.ShowNoteInEditorButton = ZN.CreateGenericButton("ShowNoteInEditorButton", HomeSidebar, "TOPLEFT", HomeSidebar.SendToExRTButton, "BOTTOMLEFT", 240, 30, 0, -10,0,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, nil, "Show Note", "CENTER",true )
HomeSidebar.btnConfig = ZN.CreateIconButton(HomeSidebar, "BOTTOMLEFT", HomeSidebar, "BOTTOMLEFT", 24, 24, 0, 17, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\config", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, nil, true, "Open Config", ZN.Colors.ACTIVE)
HomeSidebar.btnConfig:SetScript("OnClick", function(self) HomeContent.ConfigFrame:SetShown(not HomeContent.ConfigFrame:IsShown()); end)
-- Home Sidebar Functions
HomeSidebar.TemplateSelectButton:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN:getTableKeys(ZNotes.BossTemplates), ZN:getTableOrder(ZNotes.BossTemplates), 240, ZN.Colors.BG, "LEFT", 10, nil, "TOOLTIP") end)

if IsAddOnLoaded("ExRT") then
  HomeSidebar.SendToExRTButton:SetScript("OnClick", function(self) 
    if not IsInGroup() and (selectedGroupTemplate == "Use Current Group" or selectedGroupTemplate == nil) then 
      ZN:Print("You need to join a group or select a Grouptemplate")
      return
    end
    VExRT.Note.Text1 = ZN:PrintNote(selectedTemplate, HomeSidebar.IncludeMissingCheckBox.active, selectedGroupTemplate)
    _G["GExRT"].A["Note"].frame:Save()
  end)
end

HomeSidebar.ShowNoteInEditorButton:SetScript("OnClick", function(self) 
  if not IsInGroup() then
    ZN:Print("You need to be in a party or raid.")
    return
  end
  if selectedTemplate == nil or selectedTemplate == "Select Template.." then
    ZN:Print("You need to select a Boss Template")
    return
  end
  if not HomeContent.ShowNoteEditBox:IsShown() then
    HomeContent.ShowNoteEditBox:Show()
    HomeContent.ShowNoteEditBox.EditBox.editbox:SetText(ZN:PrintNote(selectedTemplate, HomeSidebar.IncludeMissingCheckBox.active, selectedGroupTemplate))    
  else
    HomeContent.ShowNoteEditBox.EditBox.editbox:SetText(ZN:PrintNote(selectedTemplate, HomeSidebar.IncludeMissingCheckBox.active, selectedGroupTemplate))    
  end
end)

HomeSidebar.IncludeMissingCheckBox = ZN:createCheckBox(HomeSidebar, "TOPLEFT", HomeSidebar.GroupTemplateSelectButton, "BOTTOMLEFT", 0, -20, "Include Missing Spells", 14, ZN.Colors.ACTIVE, 200, true)

-- Missing Checkbox onclick
HomeSidebar.IncludeMissingCheckBox:SetScript("OnClick",function(self)
  self.toggleChecked()
end)

HomeSidebar.IncludeMissingCheckBox.button:SetScript("OnMouseDown",function()
  HomeSidebar.IncludeMissingCheckBox.toggleChecked()
end)
