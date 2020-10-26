local _, ZN, L = ...

function ZN:Toggle(self)
	ZNFrame:SetShown(not ZNFrame:IsShown());
end

function ZN:ToggleInfo(self)
	ZNInfoFrame:SetShown(not ZNInfoFrame:IsShown());
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
end

function ZN:ClickCollapse(ZNFrame, ZNHeaderFrame, ZNSidebarFrame)
	if not ZNSidebarFrame.collapsed then
		ZNSidebarFrame.collapsed = true
		ZNSidebarFrame.btnCollapseSidebar:SetNormalTexture("Interface\\AddOns\\ZeroNotes\\Media\\Texture\\arrow_right")
		ZNSidebarFrame.btnCollapseSidebar:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
		local left, bottom, width = ZNFrame:GetRect()
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

	else
		ZNSidebarFrame.collapsed = false
		ZNSidebarFrame.btnCollapseSidebar:SetNormalTexture("Interface\\AddOns\\ZeroNotes\\Media\\Texture\\arrow_left")
		ZNSidebarFrame.btnCollapseSidebar:GetNormalTexture():SetVertexColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1)
		local left, bottom, width = ZNFrame:GetRect()
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

function ZN:CreateDropdown(parentObj, list, order, width, dropDownBgColor, buttonAlign, buttonTextXOffset)

	if not parentObj.dropdownInit then
		parentObj.dropdownInit = true
		local parentName = parentObj.name
		local dropdown = ZN.DropdownList(parentName.."Dropdown", parentObj.parent, "TOPLEFT", parentObj, "BOTTOMLEFT" , width, 30, dropDownBgColor, 1, "CENTER", true, #order)
		parentObj.dropdown = dropdown
		
		for i = 1, #order do
			local dropdownItem = ZN.CreateGenericButton(nil, dropdown, "TOPLEFT", dropdown, "TOPLEFT", width, 30, 0, (-30*(i-1)), buttonTextXOffset, 0, 12, nil, dropDownBgColor, nil, list[order[i]]:upper() , buttonAlign ,true)
			dropdownItem.class = order[i]
			dropdownItem.coloredClass = list[order[i]]
			dropdownItem.parentObj = parentObj
			dropdownItem:SetScript("OnClick", function(self)
				self.parentObj.ZNText:SetText(dropdownItem.coloredClass:upper())
				self.parentObj.dropdown:SetShown(not self.parentObj.dropdown:IsShown());
			end)
		end
	end
	
	parentObj.dropdown:SetShown(not parentObj.dropdown:IsShown());
end

function ZN:SendToExRT(template) 
	print(template)
end

function ZN:ShowNoteInEditor(template) 
	print(template)
end