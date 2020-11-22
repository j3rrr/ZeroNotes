local _, ZN, L = ...
--[[ ##############################################################################
	Helper
############################################################################## --]]
function ZN:Print(msg)
	print("|cff00ffffZero|rNotes: |cffff7e40"..msg.."|r")
end

function ZN:DebugPrint(msg)
	if ZNotes.DebugMode then
		print("|cff00ffffDEBUG|: |cffff7e40"..msg.."|r")
	end
end

function ZN:Toggle(self)
	ZNFrame:SetShown(not ZNFrame:IsShown());
end

function ZN:ToggleInfo(self)
	ZNInfoFrame:SetShown(not ZNInfoFrame:IsShown());
end

function ZN:ShowToolTip(text, color, parent, anchor)
	GameTooltip:SetOwner(parent, anchor and anchor or "ANCHOR_TOP" , 0, 5)
	GameTooltip:AddLine(text, tonumber("0x"..color:sub(1,2))/255, tonumber("0x"..color:sub(3,4))/255, tonumber("0x"..color:sub(5,6))/255, 1)
	GameTooltip:Show()
end

function ZN:getTableOrder(arr) 
	local tmp = {}
	for k,v in pairs(arr) do
		table.insert(tmp, k)
	end	
	return tmp
end

function ZN:getTemplateTableOrder(arr) 
	local tmp = {}
	table.insert(tmp, "Use Current Group")
	for k,v in pairs(arr) do
		if k ~= "Use Current Group" then
			table.insert(tmp, k)
		end
	end	
	return tmp
end

function ZN:getTemplateTableWithoutCurrentOrder(arr) 
	local tmp = {}
	for k,v in pairs(arr) do
		if k ~= "Use Current Group" then
			table.insert(tmp, k)
		end
	end	
	return tmp
end

function ZN:getTableKeys(arr) 
	local tmp = {}
	for k,v in pairs(arr) do
		tmp[k] = k
	end	
	return tmp
end
--[[ ##############################################################################
	Header Tabs
############################################################################## --]]
function ZN:ClickHome(ZNHeaderFrame, ZNSidebarFrame, ZNBodyFrame)
	ZNHeaderFrame.btnHome.active = true
	ZNHeaderFrame.btnHome:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.ACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.ACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.ACTIVE:sub(5,6))/255, 1)
	ZNHeaderFrame.btnImpExp.active = false
	ZNHeaderFrame.btnImpExp:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
    ZNHeaderFrame.btnBoss.active = false
	ZNHeaderFrame.btnBoss:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
    ZNHeaderFrame.btnPlayer.active = false
	ZNHeaderFrame.btnPlayer:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
		ZNHeaderFrame.btnGroup.active = false
	ZNHeaderFrame.btnGroup:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)

	for k,v in pairs(ZNSidebarFrame.Subframes) do
			v:SetShown(false)
			v.visible=false
	end
	for k,v in pairs(ZNBodyFrame.Subframes) do
			v:SetShown(false)
	end
	for i=1, #ZN.DropDowns do
		ZN.DropDowns[i]:SetShown(false)
	end
	for i=1, #ZN.DropDownsEdit do
		ZN.DropDownsEdit[i]:SetShown(false)
	end
	ZNBodyFrame.Subframes["Home"]:SetShown(true)
	ZNSidebarFrame.Subframes["Home"]:SetShown(true)
	ZNSidebarFrame.Subframes["Home"].visible=true
	ZNSidebarFrame.btnCollapseSidebar:SetShown(false)
	if ZNSidebarFrame.btnDeleteGroupTemplate then
		ZNSidebarFrame.btnDeleteGroupTemplate:SetShown(false)
    ZNSidebarFrame.btnReloadGroupTemplate:SetShown(false)
	end
	if ZNSidebarFrame.btnReloadPlayer then
		ZNSidebarFrame.btnReloadPlayer:SetShown(false)
		ZNSidebarFrame.btnAddPlayer:SetShown(false)
		ZNSidebarFrame.btnResetPlayer:SetShown(false)
	end

	if ZNSidebarFrame.btnAddBossSpell then
		ZNSidebarFrame.btnAddBossSpell:SetShown(false)
		ZNSidebarFrame.btnReloadBossSpell:SetShown(false)
		ZNSidebarFrame.btnAddBossTrenner:SetShown(false)
		ZNSidebarFrame.btnReloadBossTrenner:SetShown(false)
	end
	ZN:ClickCollapse(nil, ZNHeaderFrame, ZNSidebarFrame, false, true)
end

function ZN:ClickImpExp(ZNHeaderFrame, ZNSidebarFrame, ZNBodyFrame)
	ZNHeaderFrame.btnHome.active = false
	ZNHeaderFrame.btnHome:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
	ZNHeaderFrame.btnImpExp.active = true
	ZNHeaderFrame.btnImpExp:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.ACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.ACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.ACTIVE:sub(5,6))/255, 1)
    ZNHeaderFrame.btnBoss.active = false
	ZNHeaderFrame.btnBoss:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
    ZNHeaderFrame.btnPlayer.active = false
	ZNHeaderFrame.btnPlayer:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
		ZNHeaderFrame.btnGroup.active = false
	ZNHeaderFrame.btnGroup:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)

	for k,v in pairs(ZNSidebarFrame.Subframes) do
			v:SetShown(false)
			v.visible=false
	end
	for k,v in pairs(ZNBodyFrame.Subframes) do
			v:SetShown(false)
	end
	for i=1, #ZN.DropDowns do
		ZN.DropDowns[i]:SetShown(false)
	end
	for i=1, #ZN.DropDownsEdit do
		ZN.DropDownsEdit[i]:SetShown(false)
	end
	ZNBodyFrame.Subframes["ImpExp"]:SetShown(true)
	ZNSidebarFrame.Subframes["ImpExp"]:SetShown(true)
	ZNSidebarFrame.Subframes["ImpExp"].visible=true
	ZNSidebarFrame.btnCollapseSidebar:SetShown(false)
	ZNSidebarFrame.btnReloadPlayer:SetShown(false)
	ZNSidebarFrame.btnResetPlayer:SetShown(false)
	ZNSidebarFrame.btnAddPlayer:SetShown(false)
	ZNSidebarFrame.btnAddBossSpell:SetShown(false)
	ZNSidebarFrame.btnReloadBossSpell:SetShown(false)
	ZNSidebarFrame.btnAddBossTrenner:SetShown(false)
	ZNSidebarFrame.btnReloadBossTrenner:SetShown(false)
	ZN:ClickCollapse(nil, ZNHeaderFrame, ZNSidebarFrame, false, true)
	ImpExpContent.PlayerDbSubframe:Hide()
	ImpExpContent.BossTemplateSubframe:Hide()
	ImpExpContent.WeakaurasSubframe:Hide()
	if ZNSidebarFrame.btnDeleteGroupTemplate then
		ZNSidebarFrame.btnDeleteGroupTemplate:SetShown(false)
		ZNSidebarFrame.btnReloadGroupTemplate:SetShown(false)
	end
end

function ZN:ClickBoss(ZNHeaderFrame, ZNSidebarFrame, ZNBodyFrame)
	ZNHeaderFrame.btnHome.active = false
	ZNHeaderFrame.btnHome:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
	ZNHeaderFrame.btnImpExp.active = false
	ZNHeaderFrame.btnImpExp:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
    ZNHeaderFrame.btnBoss.active = true
	ZNHeaderFrame.btnBoss:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.ACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.ACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.ACTIVE:sub(5,6))/255, 1)
    ZNHeaderFrame.btnPlayer.active = false
	ZNHeaderFrame.btnPlayer:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
		ZNHeaderFrame.btnGroup.active = false
	ZNHeaderFrame.btnGroup:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)

	if not ZN.BossInit then
		ZN.BossInit=true
		ZN:InitBoss()
	end

	for k,v in pairs(ZNSidebarFrame.Subframes) do
			v:SetShown(false)
			v.visible=false
	end
	for k,v in pairs(ZNBodyFrame.Subframes) do
			v:SetShown(false)
	end
	for i=1, #ZN.DropDowns do
		ZN.DropDowns[i]:SetShown(false)
	end
	for i=1, #ZN.DropDownsEdit do
		ZN.DropDownsEdit[i]:SetShown(false)
	end
	ZNBodyFrame.Subframes["BossSpellHead"]:SetShown(true)
	ZNBodyFrame.Subframes["BossSpells"]:SetShown(true)
	ZNBodyFrame.Subframes["BossTrennerHead"]:SetShown(true)
	ZNBodyFrame.Subframes["BossTrenner"]:SetShown(true)
	ZNBodyFrame.Subframes["BossNote"]:SetShown(true)
	ZNBodyFrame.Subframes["PreviewTemplateHead"]:SetShown(true)
	ZNBodyFrame.Subframes["PreviewTemplateContent"]:SetShown(false)
	ZNSidebarFrame.Subframes["Boss"]:SetShown(true)
	ZNSidebarFrame.Subframes["Boss"].visible=true
	ZNSidebarFrame.btnCollapseSidebar:SetShown(false)
	ZNSidebarFrame.btnReloadPlayer:SetShown(false)
	ZNSidebarFrame.btnResetPlayer:SetShown(false)
	ZNSidebarFrame.btnAddPlayer:SetShown(false)
	ZNSidebarFrame.btnAddBossSpell:SetShown(true)
	ZNSidebarFrame.btnReloadBossSpell:SetShown(true)
	ZNSidebarFrame.btnAddBossTrenner:SetShown(true)
	ZNSidebarFrame.btnReloadBossTrenner:SetShown(true)
	if ZNSidebarFrame.btnDeleteGroupTemplate then
		ZNSidebarFrame.btnDeleteGroupTemplate:SetShown(false)
		ZNSidebarFrame.btnReloadGroupTemplate:SetShown(false)
	end
	ZN:ClickCollapse(nil, ZNHeaderFrame, ZNSidebarFrame, true, false)
end

function ZN:ClickPlayer(ZNHeaderFrame, ZNSidebarFrame, ZNBodyFrame)
	ZNHeaderFrame.btnHome.active = false
	ZNHeaderFrame.btnHome:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
	ZNHeaderFrame.btnImpExp.active = false
	ZNHeaderFrame.btnImpExp:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
    ZNHeaderFrame.btnBoss.active = false
	ZNHeaderFrame.btnBoss:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
    ZNHeaderFrame.btnPlayer.active = true
	ZNHeaderFrame.btnPlayer:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.ACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.ACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.ACTIVE:sub(5,6))/255, 1)
	ZNHeaderFrame.btnGroup.active = false
	ZNHeaderFrame.btnGroup:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
	
	if not ZN.PlayerInit then
		ZN.PlayerInit=true
		ZN:InitPlayer()
	end

	for k,v in pairs(ZNSidebarFrame.Subframes) do
			v:SetShown(false)
			v.visible=false
	end
	for k,v in pairs(ZNBodyFrame.Subframes) do
			v:SetShown(false)
	end
	for i=1, #ZN.DropDowns do
		ZN.DropDowns[i]:SetShown(false)
	end
	for i=1, #ZN.DropDownsEdit do
		ZN.DropDownsEdit[i]:SetShown(false)
	end
	ZNBodyFrame.Subframes["Player"]:SetShown(true)
	ZNBodyFrame.Subframes["PlayerHead"]:SetShown(true)
	ZNSidebarFrame.Subframes["Player"]:SetShown(true)
	ZNSidebarFrame.Subframes["Player"].visible=true
	ZNSidebarFrame.btnReloadPlayer:SetShown(true)
	ZNSidebarFrame.btnResetPlayer:SetShown(true)
	ZNSidebarFrame.btnAddPlayer:SetShown(true)
	ZNSidebarFrame.btnAddBossSpell:SetShown(false)
	ZNSidebarFrame.btnReloadBossSpell:SetShown(false)
	ZNSidebarFrame.btnAddBossTrenner:SetShown(false)
	ZNSidebarFrame.btnReloadBossTrenner:SetShown(false)
	ZNSidebarFrame.btnCollapseSidebar:SetShown(true)
	if ZNSidebarFrame.btnDeleteGroupTemplate then
		ZNSidebarFrame.btnDeleteGroupTemplate:SetShown(false)
		ZNSidebarFrame.btnReloadGroupTemplate:SetShown(false)
	end
	ZN:ClickCollapse(nil, ZNHeaderFrame, ZNSidebarFrame, true, false)
end

function ZN:ClickGroupTemplates(ZNHeaderFrame, ZNSidebarFrame, ZNBodyFrame)
	ZNHeaderFrame.btnHome.active = false
	ZNHeaderFrame.btnHome:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
	ZNHeaderFrame.btnImpExp.active = false
	ZNHeaderFrame.btnImpExp:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
	ZNHeaderFrame.btnBoss.active = false
	ZNHeaderFrame.btnBoss:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
	ZNHeaderFrame.btnPlayer.active = false
	ZNHeaderFrame.btnPlayer:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
	ZNHeaderFrame.btnGroup.active = true
	ZNHeaderFrame.btnGroup:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.ACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.ACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.ACTIVE:sub(5,6))/255, 1)
	
	for k,v in pairs(ZNSidebarFrame.Subframes) do
			v:SetShown(false)
			v.visible=false
	end
	for k,v in pairs(ZNBodyFrame.Subframes) do
			v:SetShown(false)
	end
	for i=1, #ZN.DropDowns do
		ZN.DropDowns[i]:SetShown(false)
	end
	for i=1, #ZN.DropDownsEdit do
		ZN.DropDownsEdit[i]:SetShown(false)
	end
	ZNBodyFrame.Subframes["GroupTemplates"]:SetShown(true)
	ZNSidebarFrame.Subframes["GroupTemplates"]:SetShown(true)
	ZNSidebarFrame.Subframes["GroupTemplates"].visible=true
	ZNSidebarFrame.btnCollapseSidebar:SetShown(false)
	ZNSidebarFrame.btnDeleteGroupTemplate:SetShown(true)
	ZNSidebarFrame.btnReloadGroupTemplate:SetShown(true)
	if ZNSidebarFrame.btnReloadPlayer then
		ZNSidebarFrame.btnReloadPlayer:SetShown(false)
		ZNSidebarFrame.btnAddPlayer:SetShown(false)
		ZNSidebarFrame.btnResetPlayer:SetShown(false)
	end

	if ZNSidebarFrame.btnAddBossSpell then
		ZNSidebarFrame.btnAddBossSpell:SetShown(false)
		ZNSidebarFrame.btnReloadBossSpell:SetShown(false)
		ZNSidebarFrame.btnAddBossTrenner:SetShown(false)
		ZNSidebarFrame.btnReloadBossTrenner:SetShown(false)
	end
	ZN:ClickCollapse(nil, ZNHeaderFrame, ZNSidebarFrame, true, false)
	if ZN.selectedGroupTemplate ~= nil and ZN.selectedGroupTemplate ~= "" then
		ZN:BuildGroupTemplateSortArray()
		ZN:updateGroupView()
	end
end

function ZN:ToggleImpExpView(frameToShow)
	if frameToShow == "ImpExpContent.PlayerDbSubframe" then
		ImpExpContent.PlayerDbSubframe:SetShown(not ImpExpContent.PlayerDbSubframe:IsShown());
		ImpExpContent.BossTemplateSubframe:Hide()
		ImpExpContent.GroupTemplateSubframe:Hide()
		ImpExpContent.WeakaurasSubframe:Hide()
	elseif frameToShow == "ImpExpContent.BossTemplateSubframe" then
		ImpExpContent.PlayerDbSubframe:Hide()
		ImpExpContent.BossTemplateSubframe:SetShown(not ImpExpContent.BossTemplateSubframe:IsShown());
		ImpExpContent.GroupTemplateSubframe:Hide()
		ImpExpContent.WeakaurasSubframe:Hide()
	elseif frameToShow == "ImpExpContent.GroupTemplateSubframe" then
		ImpExpContent.PlayerDbSubframe:Hide()
		ImpExpContent.BossTemplateSubframe:Hide()
		ImpExpContent.GroupTemplateSubframe:SetShown(not ImpExpContent.GroupTemplateSubframe:IsShown());
		ImpExpContent.WeakaurasSubframe:Hide()
	elseif frameToShow == "ImpExpContent.WeakaurasSubframe" then
		ImpExpContent.PlayerDbSubframe:Hide()
		ImpExpContent.BossTemplateSubframe:Hide()
		ImpExpContent.GroupTemplateSubframe:Hide()
		ImpExpContent.WeakaurasSubframe:SetShown(not ImpExpContent.WeakaurasSubframe:IsShown());
	end
end
--[[ ##############################################################################
	Sidebar Collapse
############################################################################## --]]
function ZN:ClickCollapse(ZNFrame, ZNHeaderFrame, ZNSidebarFrame, collapse, expand)
	if (not ZNSidebarFrame.collapsed and not collapse and not expand) or collapse then
		ZNSidebarFrame.collapsed = true
		ZNSidebarFrame.btnCollapseSidebar:SetNormalTexture("Interface\\AddOns\\ZeroNotes\\Media\\Texture\\arrow_right")
		ZNSidebarFrame.btnCollapseSidebar:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
		ZNSidebarFrame:SetWidth(48)

		
		for k,v in pairs(ZNSidebarFrame.Subframes) do
			if v.visible then
				v:SetShown(false)
			end
		end
		if ZNSidebarFrame.btnReloadPlayer then
			ZNSidebarFrame.btnReloadPlayer:ClearAllPoints()
			ZNSidebarFrame.btnAddPlayer:ClearAllPoints()
			ZNSidebarFrame.btnResetPlayer:ClearAllPoints()
			ZNSidebarFrame.btnResetPlayer:SetPoint("BOTTOM", ZNSidebarFrame.btnCollapseSidebar, "TOP", 0, 20)
			ZNSidebarFrame.btnReloadPlayer:SetPoint("BOTTOM", ZNSidebarFrame.btnResetPlayer, "TOP", 0, 20)
			ZNSidebarFrame.btnAddPlayer:SetPoint("BOTTOM", ZNSidebarFrame.btnReloadPlayer, "TOP", 0, 20)
		end
	elseif (ZNSidebarFrame.collapsed and not collapse and not expand) or expand then 
		ZNSidebarFrame.collapsed = false
		ZNSidebarFrame.btnCollapseSidebar:SetNormalTexture("Interface\\AddOns\\ZeroNotes\\Media\\Texture\\arrow_left")
		ZNSidebarFrame.btnCollapseSidebar:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)

		ZNSidebarFrame:SetWidth(300)

		for k,v in pairs(ZNSidebarFrame.Subframes) do
			if v.visible then
				v:SetShown(true)
			end
		end
		if ZNSidebarFrame.btnReloadPlayer then
			ZNSidebarFrame.btnReloadPlayer:ClearAllPoints()
			ZNSidebarFrame.btnAddPlayer:ClearAllPoints()
			ZNSidebarFrame.btnResetPlayer:ClearAllPoints()
			ZNSidebarFrame.btnAddPlayer:SetPoint("RIGHT", ZNSidebarFrame.btnCollapseSidebar, "LEFT", -12, 0)
			ZNSidebarFrame.btnReloadPlayer:SetPoint("RIGHT", ZNSidebarFrame.btnAddPlayer, "LEFT", -20, 0)
			ZNSidebarFrame.btnResetPlayer:SetPoint("RIGHT", ZNSidebarFrame.btnReloadPlayer, "LEFT", -20, 0)
		end

	end
end

function ZN:ClickPreviewCollapse()
	if not ZNBodyFrame.Subframes.PreviewTemplateContent:IsShown() then
		ZNBodyFrame.Subframes.PreviewTemplateHead.btnCollapsePreviewTemlate:SetNormalTexture("Interface\\AddOns\\ZeroNotes\\Media\\Texture\\arrow_up")
		ZNBodyFrame.Subframes.PreviewTemplateHead.btnCollapsePreviewTemlate:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
		ZNBodyFrame.Subframes.PreviewTemplateHead.ShowHide:SetText("Hide Preview")
		ZNBodyFrame.Subframes.PreviewTemplateContent:Show()
	elseif ZNBodyFrame.Subframes.PreviewTemplateContent:IsShown() then 
		ZNBodyFrame.Subframes.PreviewTemplateHead.btnCollapsePreviewTemlate:SetNormalTexture("Interface\\AddOns\\ZeroNotes\\Media\\Texture\\arrow_down")
		ZNBodyFrame.Subframes.PreviewTemplateHead.btnCollapsePreviewTemlate:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
		ZNBodyFrame.Subframes.PreviewTemplateHead.ShowHide:SetText("Show Preview")
		ZNBodyFrame.Subframes.PreviewTemplateContent:Hide()
	end
end
--[[ ##############################################################################
	Dropdowns
############################################################################## --]]
function ZN:CreateDropdown(parentObj, list, order, width, dropDownBgColor, buttonAlign, buttonTextXOffset, hoverColor, strata, listItemHeight, buttonTextYOffset)

	if not parentObj.dropdownInit then
		parentObj.dropdownInit = true
		local parentName = parentObj.name
		local dropdown = ZN.DropdownList(parentName.."Dropdown", ZNFrame, "TOPLEFT", parentObj, "BOTTOMLEFT" , width, listItemHeight and listItemHeight or 30, dropDownBgColor, 1, "CENTER", true, #order, "TOOLTIP")
		parentObj.dropdown = dropdown
		dropdown.dropdownItems = {}

		for i = 1, #order do
			local text = list[order[i]]:upper()
			text = text:gsub("(:%d+|)T", "%1t")
			local dropdownItem = ZN.CreateGenericButton(nil, dropdown, "TOPLEFT", dropdown, "TOPLEFT", width, listItemHeight and listItemHeight or 30, 0,listItemHeight and (-listItemHeight*(i-1)) or (-30*(i-1)), buttonTextXOffset, buttonTextYOffset and buttonTextYOffset or 0, 12, nil, dropDownBgColor, nil, text , buttonAlign ,true, hoverColor)
			dropdownItem.class = order[i]
			dropdownItem.newText = list[order[i]]:upper()
			dropdownItem.newText = dropdownItem.newText:gsub("(:%d+|)T", "%1t") -- Fix texture paths that need to end in lowercase |t
			dropdownItem.parentObj = parentObj
			dropdownItem:SetScript("OnClick", function(self)
				self.parentObj.ZNText:SetText(dropdownItem.newText)
				self.parentObj.Update(dropdownItem.class)
				self.parentObj.dropdown:SetShown(not self.parentObj.dropdown:IsShown());
			end)
			dropdown.dropdownItems[i]=dropdownItem
		end
	else
		parentObj.dropdown:SetHeight((listItemHeight and listItemHeight or 30)*#order)
		for i=1, #parentObj.dropdown.dropdownItems do
			parentObj.dropdown.dropdownItems[i]:SetShown(false)
		end
		for i = 1, #order do
			if i> #parentObj.dropdown.dropdownItems then
				local text = list[order[i]]:upper()
				text = text:gsub("(:%d+|)T", "%1t")
				local dropdownItem = ZN.CreateGenericButton(nil, parentObj.dropdown, "TOPLEFT", parentObj.dropdown, "TOPLEFT", width, listItemHeight and listItemHeight or 30, 0,listItemHeight and (-listItemHeight*(i-1)) or (-30*(i-1)), buttonTextXOffset, buttonTextYOffset and buttonTextYOffset or 0, 12, nil, dropDownBgColor, nil, text , buttonAlign ,true, hoverColor)
				dropdownItem.class = order[i]
				dropdownItem.newText = list[order[i]]:upper()
				dropdownItem.newText = dropdownItem.newText:gsub("(:%d+|)T", "%1t") -- Fix texture paths that need to end in lowercase |t
				dropdownItem.parentObj = parentObj
				dropdownItem:SetScript("OnClick", function(self)
					self.parentObj.ZNText:SetText(dropdownItem.newText)
					self.parentObj.Update(dropdownItem.class)
					self.parentObj.dropdown:SetShown(not self.parentObj.dropdown:IsShown());
			end)
			parentObj.dropdown.dropdownItems[i]=dropdownItem
			else
				parentObj.dropdown.dropdownItems[i].class = order[i]
				parentObj.dropdown.dropdownItems[i].newText = list[order[i]]:upper()
				parentObj.dropdown.dropdownItems[i].newText = parentObj.dropdown.dropdownItems[i].newText:gsub("(:%d+|)T", "%1t") -- Fix texture paths that need to end in lowercase |t
				parentObj.dropdown.dropdownItems[i].ZNText:SetText(parentObj.dropdown.dropdownItems[i].newText)
			end
			parentObj.dropdown.dropdownItems[i]:SetShown(true)
		end
	end
	local wasShown = parentObj.dropdown:IsShown();
	for i=1, #ZN.DropDowns do
		ZN.DropDowns[i]:SetShown(false)
	end

	parentObj.dropdown:SetShown(not wasShown);
end

function ZN:CreateIconDropdown(parentObj, list, order, width, dropDownBgColor, buttonAlign, buttonTextXOffset, hoverColor, strata, listItemHeight, buttonTextYOffset, rows, perRow, singleFirst)
	if not parentObj.dropdownInit then
		parentObj.dropdownInit = true
		local parentName = parentObj.name	
		local dropdownWidth = width*perRow		
		if singleFirst then 
			rows = rows+1			
		end
		local dropdown = ZN.DropdownList(parentName.."Dropdown", ZNFrame, "TOPLEFT", parentObj, "BOTTOMLEFT" , dropdownWidth, listItemHeight, dropDownBgColor, 1, "CENTER", true, rows, "TOOLTIP")
		parentObj.dropdown = dropdown
		dropdown.dropdownItems = {}
		
		local point = "TOPLEFT"
		local anchorPoint = "TOPLEFT"
		local anchor = dropdown
		for i = 1, #order do
			if i > 1 then 
				anchor = dropdown.dropdownItems[i-1]
				anchorPoint = "TOPRIGHT"
			end
			local buttonOffset = 0
			if singleFirst then
				buttonOffset = 1
				if i == 2 then
					anchor = dropdown.dropdownItems[i-1]
					anchorPoint = "BOTTOMLEFT"
				end
			end
			if i > 2 and ((i-1)-buttonOffset)%perRow == 0 then 
				anchor = dropdown.dropdownItems[i-perRow]
				anchorPoint = "BOTTOMLEFT"
			end
			local text = list[order[i]]:upper()
			text = text:gsub("(:%d+|)T", "%1t")
			local dropdownItem = ZN.CreateGenericButton("dropdownitem"..i, dropdown, point, anchor, anchorPoint, width, listItemHeight and listItemHeight or 30, 0,0, buttonTextXOffset, buttonTextYOffset and buttonTextYOffset or 0, 12, nil, dropDownBgColor, nil, text , buttonAlign ,true, hoverColor)
			dropdownItem.class = order[i]
			dropdownItem.newText = list[order[i]]:upper()
			dropdownItem.newText = dropdownItem.newText:gsub("(:%d+|)T", "%1t") -- Fix texture paths that need to end in lowercase |t
			dropdownItem.parentObj = parentObj
			dropdownItem:SetScript("OnClick", function(self)
				self.parentObj.ZNText:SetText(dropdownItem.newText)
				self.parentObj.Update(dropdownItem.class)
				self.parentObj.dropdown:Hide() --SetShown(not self.parentObj.dropdown:IsShown());
			end)
			dropdown.dropdownItems[i]=dropdownItem
		end
	end
	local wasShown = parentObj.dropdown:IsShown();
	for i=1, #ZN.DropDowns do
		ZN.DropDowns[i]:SetShown(false)
	end

	parentObj.dropdown:SetShown(not wasShown);
end

function ZN:indexTrenner(template)
	local BossTrennerIndex={}
    local spellI=1
    for i=1, #template do
        if template[i].trenner then
            BossTrennerIndex[spellI]=i
            spellI = spellI + 1
        end
    end

    local BossTrennerSortArray={}
    for i=1, #BossTrennerIndex do
      BossTrennerSortArray[i]=i
    end

    for k=1,#BossTrennerIndex do
      for i=1,#BossTrennerIndex do
        local pivot = template[BossTrennerIndex[BossTrennerSortArray[i]]]["no"]
        for j=i+1,#BossTrennerIndex do
          local comp = template[BossTrennerIndex[BossTrennerSortArray[j]]]["no"]
          if  type(comp)=="number"  and comp<pivot then
            local saveUnit = BossTrennerSortArray[i]
            BossTrennerSortArray[i] = BossTrennerSortArray[j]
            BossTrennerSortArray[j] = saveUnit
          end
        end 
      end 
	end 
	return BossTrennerIndex, BossTrennerSortArray
end