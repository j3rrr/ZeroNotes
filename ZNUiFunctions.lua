local _, ZN, L = ...

function ZN:Print(msg)
	print("|cff00ffffZero|rNotes: |cffff7e40"..msg.."|r")
end

function ZN:Toggle(self)
	ZNFrame:SetShown(not ZNFrame:IsShown());
end

function ZN:ToggleInfo(self)
	ZNInfoFrame:SetShown(not ZNInfoFrame:IsShown());
end

function ZN:ShowToolTip(text, color, parent)
	GameTooltip:SetOwner(parent,"ANCHOR_TOP" , 0, 5)
	GameTooltip:AddLine(text, tonumber("0x"..color:sub(1,2))/255, tonumber("0x"..color:sub(3,4))/255, tonumber("0x"..color:sub(5,6))/255, 1)
	GameTooltip:Show()
end

function ZN:ClickHome(ZNHeaderFrame, ZNSidebarFrame, ZNBodyFrame)
	ZNHeaderFrame.btnHome.active = true
	ZNHeaderFrame.btnHome:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.ACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.ACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.ACTIVE:sub(5,6))/255, 1)
	ZNHeaderFrame.btnImpExp.active = false
	ZNHeaderFrame.btnImpExp:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
    ZNHeaderFrame.btnBoss.active = false
	ZNHeaderFrame.btnBoss:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
    ZNHeaderFrame.btnPlayer.active = false
	ZNHeaderFrame.btnPlayer:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
	
	for k,v in pairs(ZNSidebarFrame.Subframes) do
			v:SetShown(false)
			v.visible=false
	end
	for k,v in pairs(ZNBodyFrame.Subframes) do
			v:SetShown(false)
	end
	ZNBodyFrame.Subframes["Home"]:SetShown(true)
	ZNSidebarFrame.Subframes["Home"]:SetShown(true)
	ZNSidebarFrame.Subframes["Home"].visible=true
	ZNSidebarFrame.btnCollapseSidebar:SetShown(false)
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
	
	for k,v in pairs(ZNSidebarFrame.Subframes) do
			v:SetShown(false)
			v.visible=false
	end
	for k,v in pairs(ZNBodyFrame.Subframes) do
			v:SetShown(false)
	end
	ZNBodyFrame.Subframes["ImpExp"]:SetShown(true)
	ZNSidebarFrame.Subframes["ImpExp"]:SetShown(true)
	ZNSidebarFrame.Subframes["ImpExp"].visible=true
	ZNSidebarFrame.btnCollapseSidebar:SetShown(false)
	ZN:ClickCollapse(nil, ZNHeaderFrame, ZNSidebarFrame, false, true)
	ImpExpContent.PlayerDbSubframe:Hide()
	ImpExpContent.BossTemplateSubframe:Hide()
	ImpExpContent.WeakaurasSubframe:Hide()
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
	
	for k,v in pairs(ZNSidebarFrame.Subframes) do
			v:SetShown(false)
			v.visible=false
	end
	for k,v in pairs(ZNBodyFrame.Subframes) do
			v:SetShown(false)
	end
	ZNBodyFrame.Subframes["Boss"]:SetShown(true)
	ZNSidebarFrame.Subframes["Boss"]:SetShown(true)
	ZNSidebarFrame.Subframes["Boss"].visible=true
	ZNSidebarFrame.btnCollapseSidebar:SetShown(true)
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
	ZNBodyFrame.Subframes["Player"]:SetShown(true)
	ZNSidebarFrame.Subframes["Player"]:SetShown(true)
	ZNSidebarFrame.Subframes["Player"].visible=true
	ZNSidebarFrame.btnCollapseSidebar:SetShown(true)
	ZN:ClickCollapse(nil, ZNHeaderFrame, ZNSidebarFrame, true, false)
end

function ZN:ClickCollapse(ZNFrame, ZNHeaderFrame, ZNSidebarFrame, collapse, expand)
	if (not ZNSidebarFrame.collapsed and not collapse and not expand) or collapse then
		ZNSidebarFrame.collapsed = true
		ZNSidebarFrame.btnCollapseSidebar:SetNormalTexture("Interface\\AddOns\\ZeroNotes\\Media\\Texture\\arrow_right")
		ZNSidebarFrame.btnCollapseSidebar:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
		-- local left, bottom, width = ZNFrame:GetRect()
		--ZNFrame:ClearAllPoints()
		--ZNFrame:SetPoint('BOTTOMLEFT', UIParent, 'BOTTOMLEFT', left + 250, bottom)
		ZNSidebarFrame:SetWidth(50)
		-- ZNFrame:SetWidth(750)
		-- ZNHeaderFrame:SetWidth(750)
		
		for k,v in pairs(ZNSidebarFrame.Subframes) do
			if v.visible then
				v:SetShown(false)
			end
		end
		--for i=1, #ZN.SidebarElements do
		-- if ZN.SidebarElements[i].visible=true
		-- then classfilter.shown= not classfilter.shown
		--end

	elseif (ZNSidebarFrame.collapsed and not collapse and not expand) or expand then 
		ZNSidebarFrame.collapsed = false
		ZNSidebarFrame.btnCollapseSidebar:SetNormalTexture("Interface\\AddOns\\ZeroNotes\\Media\\Texture\\arrow_left")
		ZNSidebarFrame.btnCollapseSidebar:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
		--local left, bottom, width = ZNFrame:GetRect()
		--ZNFrame:ClearAllPoints()
		--ZNFrame:SetPoint('BOTTOMLEFT', UIParent, 'BOTTOMLEFT', left - 250, bottom)
		ZNSidebarFrame:SetWidth(300)
		-- ZNFrame:SetWidth(1000)
		-- ZNHeaderFrame:SetWidth(1000)
		for k,v in pairs(ZNSidebarFrame.Subframes) do
			if v.visible then
				v:SetShown(true)
			end
		end

	end
end

function ZN:ToggleImpExpView(frameToShow)
	if frameToShow == "ImpExpContent.PlayerDbSubframe" then
		--ImpExpContent.PlayerDbSubframe:Show()
		ImpExpContent.PlayerDbSubframe:SetShown(not ImpExpContent.PlayerDbSubframe:IsShown());
		ImpExpContent.BossTemplateSubframe:Hide()
		ImpExpContent.WeakaurasSubframe:Hide()
	elseif frameToShow == "ImpExpContent.BossTemplateSubframe" then
		ImpExpContent.PlayerDbSubframe:Hide()
		ImpExpContent.BossTemplateSubframe:SetShown(not ImpExpContent.BossTemplateSubframe:IsShown());
		--ImpExpContent.BossTemplateSubframe:Show()
		ImpExpContent.WeakaurasSubframe:Hide()
	elseif frameToShow == "ImpExpContent.WeakaurasSubframe" then
		ImpExpContent.PlayerDbSubframe:Hide()
		ImpExpContent.BossTemplateSubframe:Hide()
		ImpExpContent.WeakaurasSubframe:SetShown(not ImpExpContent.WeakaurasSubframe:IsShown());
		--ImpExpContent.WeakaurasSubframe:Show()
	end
end

function ZN:CreateDropdown(parentObj, list, order, width, dropDownBgColor, buttonAlign, buttonTextXOffset, hoverColor, strata)

	if not parentObj.dropdownInit then
		parentObj.dropdownInit = true
		local parentName = parentObj.name
		local dropdown = ZN.DropdownList(parentName.."Dropdown", parentObj.parent, "TOPLEFT", parentObj, "BOTTOMLEFT" , width, 30, dropDownBgColor, 1, "CENTER", true, #order, strata)
		parentObj.dropdown = dropdown
		
		for i = 1, #order do
			local dropdownItem = ZN.CreateGenericButton(nil, dropdown, "TOPLEFT", dropdown, "TOPLEFT", width, 30, 0, (-30*(i-1)), buttonTextXOffset, 0, 12, nil, dropDownBgColor, nil, list[order[i]]:upper() , buttonAlign ,true, hoverColor)
			dropdownItem.class = order[i]
			dropdownItem.coloredClass = list[order[i]]
			dropdownItem.parentObj = parentObj
			dropdownItem:SetScript("OnClick", function(self)
				self.parentObj.ZNText:SetText(dropdownItem.coloredClass:upper())
				self.parentObj.Update(dropdownItem.class)
				self.parentObj.dropdown:SetShown(not self.parentObj.dropdown:IsShown());
			end)
		end
	end
	local wasShown = parentObj.dropdown:IsShown();
	for i=1, #ZN.DropDowns do
		ZN.DropDowns[i]:SetShown(false)
	end

	parentObj.dropdown:SetShown(not wasShown);
end

function ZN:SendToExRT(template) 
	print(template)
end

function ZN:ShowNoteInEditor(template) 
	print(template)
end

function ZN:getTableOrder(arr) 
	local tmp = {}
	for k,v in pairs(arr) do
		table.insert(tmp, k)
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