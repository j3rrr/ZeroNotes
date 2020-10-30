--TODO
--Dropdown Layout / framework
--Textfeld (input)
--Checkbox
--minimapbutton
--

local _, ZN, L = ...


--ZN.SidebarElements = {
--	[1] = classfilter
--}
--
--classfilter.visible

--##############################################################################
-- Templates
function ZN.createMainFrame(name, width, height, color, a, strata)
	local NewFrame = CreateFrame('FRAME', name, UIParent)
	NewFrame:SetFrameStrata(strata)
	NewFrame:SetWidth(width)
	NewFrame:SetHeight(height)
	NewFrame:SetPoint('RIGHT', UIParent, 'CENTER',width/2)
	NewFrame:EnableMouse(true)
	NewFrame:SetMovable(true)
	NewFrame:RegisterForDrag('LeftButton')
	NewFrame:EnableKeyboard(true)
	NewFrame:SetPropagateKeyboardInput(true)
	NewFrame:SetClampedToScreen(true)
	--NewFrame:Hide()
	NewFrame.updateDelay = 0
	NewFrame.background = NewFrame:CreateTexture(nil, 'BACKGROUND')
	NewFrame.background:SetAllPoints(NewFrame)
	NewFrame.background:SetColorTexture(tonumber("0x"..color:sub(1,2))/255, tonumber("0x"..color:sub(3,4))/255, tonumber("0x"..color:sub(5,6))/255, a)
	NewFrame:SetScript('OnDragStart', function(self)
		self:StartMoving()
		end)
	NewFrame:SetScript('OnDragStop', function(self)
		self:StopMovingOrSizing()
		end)
	NewFrame:SetScript('OnKeyDown', function(self, key)
		if key == 'ESCAPE' then
			self:SetPropagateKeyboardInput(false)
			self:Hide()
		end
	end)
	return NewFrame
end

function ZN.createSubFrame(name, parent, width, height, color, a, anchor, strata, hide, xOffset, yOffset, anchorFrame, anchorPoint, noMouseDown)
	local NewFrame = CreateFrame('FRAME', name, parent)
	NewFrame.name = name
	NewFrame:SetFrameStrata(strata)
	NewFrame:SetWidth(width)
	NewFrame:SetHeight(height)
	NewFrame:SetPoint(anchor, anchorFrame and anchorFrame or parent, anchorPoint and anchorPoint or anchor, xOffset, yOffset)
	--NewFrame:Hide()
	NewFrame.updateDelay = 0
	NewFrame.background = NewFrame:CreateTexture(nil, 'BACKGROUND')
	NewFrame.background:SetAllPoints(NewFrame)
	if hide then
		NewFrame.visible=false
		NewFrame:SetShown(false)
	end
	if color then
		NewFrame.background:SetColorTexture(tonumber("0x"..color:sub(1,2))/255, tonumber("0x"..color:sub(3,4))/255, tonumber("0x"..color:sub(5,6))/255, a)
	end
	if not noMouseDown then
		NewFrame:SetScript("OnMouseDown", function(self, button)
			if button == "LeftButton" then
				for i=1, #ZN.DropDowns do
					ZN.DropDowns[i]:SetShown(false)
				end
			end
		end)
	end
	return NewFrame
end

function ZN.createScrollFrame(name, parent, width, height, color, a, anchor,strata,  hide, noMOuseDown, scrollColor)
	local NewFrame = CreateFrame('ScrollFrame', name, parent, "UIPanelScrollFrameTemplate,BackdropTemplate")
	--NewFrame:SetClipsChildren(true)
	NewFrame:SetFrameStrata(strata)
	NewFrame:SetWidth(width)
	NewFrame:SetHeight(height)
	NewFrame:SetPoint(anchor, parent, anchor)

	NewFrame.background = NewFrame:CreateTexture(nil, 'BACKGROUND')
	NewFrame.background:SetAllPoints(NewFrame)
	if color then
		NewFrame.background:SetColorTexture(tonumber("0x"..color:sub(1,2))/255, tonumber("0x"..color:sub(3,4))/255, tonumber("0x"..color:sub(5,6))/255, a)
	end
	
	NewFrame.ScrollBar:ClearAllPoints();
	NewFrame.ScrollBar:SetPoint("TOPRIGHT", parent, "TOPRIGHT", 0, 0);
	NewFrame.ScrollBar:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", 0, 0);
	NewFrame.ScrollBar.ScrollUpButton:SetNormalTexture(nil)
	NewFrame.ScrollBar.ScrollUpButton:SetDisabledTexture(nil)
	NewFrame.ScrollBar.ScrollUpButton:SetHeight(0)
	NewFrame.ScrollBar.ScrollDownButton:SetNormalTexture(nil)
	NewFrame.ScrollBar.ScrollDownButton:SetDisabledTexture(nil)
	NewFrame.ScrollBar.ScrollDownButton:SetHeight(0)
	NewFrame.ScrollBar:SetWidth(10)
	--test
	
	local scrollButton = _G[name..'ScrollBarThumbTexture']
	scrollButton:SetHeight(100)
	scrollButton:SetWidth(3)
	if not scrollColor then
		scrollButton:SetColorTexture(tonumber("0x"..ZN.Colors.HD:sub(1,2))/255, tonumber("0x"..ZN.Colors.HD:sub(3,4))/255, tonumber("0x"..ZN.Colors.HD:sub(5,6))/255, a)
	else
		scrollButton:SetColorTexture(tonumber("0x"..scrollColor:sub(1,2))/255, tonumber("0x"..scrollColor:sub(3,4))/255, tonumber("0x"..scrollColor:sub(5,6))/255, a)
	end
	NewFrame.scrollChild = CreateFrame("Frame", name.."ScrollChild", NewFrame);
	NewFrame.scrollChild:SetSize(width, NewFrame:GetHeight())
	--NewFrame.scrollChild:SetSize(width, scrollHeight and scrollHeight or 1000);
	NewFrame.scrollChild:SetFrameStrata(strata)
	NewFrame:SetScrollChild(NewFrame.scrollChild);
	if not noMouseDown then
		NewFrame:SetScript("OnMouseDown", function(self, button)
			if button == "LeftButton" then
				for i=1, #ZN.DropDowns do
					ZN.DropDowns[i]:SetShown(false)
				end
			end
		end)
	end


	if hide then
		NewFrame.visible=false
		NewFrame:SetShown(false)
	end
	return NewFrame
end

function ZN.CreateText(parent, point, anchorFrame, anchorPoint, width, height, xOffset, yOffset, font, fontSize, color, text, justifyH, justifyV, spacing)
		local newText = parent:CreateFontString()
		newText.Text = text
		newText:SetPoint(point, anchorFrame, anchorPoint, xOffset, yOffset)
		newText:SetSize(width, height)
		newText:SetFont(font, fontSize)
		newText:SetTextColor(tonumber("0x"..color:sub(1,2))/255, tonumber("0x"..color:sub(3,4))/255, tonumber("0x"..color:sub(5,6))/255, 1)
		newText:SetJustifyH(justifyH and justifyH or "LEFT")
		newText:SetJustifyV(justifyV and justifyV or "BOTTOM")
		newText:SetText(text)
		newText:SetSpacing(spacing and spacing or fontSize)
		return newText
end

function ZN.CreateIconButton(parent, point, anchorFrame, anchorPoint, width, height, xOffset, yOffset, texture, activeColor, inactiveColor, active, highlightColor, tooltip, tooltipText, tooltipColor)
	local btn = CreateFrame("Button", nil, parent)
	btn:SetPoint(point, anchorFrame, anchorPoint, xOffset, yOffset)
	btn:SetSize(width, height)
	btn:SetNormalTexture(texture)
	btn.activeColor = activeColor
	btn.inactiveColor = inactiveColor
	btn.highlightColor = highlightColor
	btn.active = active
	btn.btnColor = btn.activeColor
	btn.doOnUpdate = false
	btn.OnUpdate = nil
	btn.tableType = nil
	btn.Row = nil
	btn.Column = nil

	if not btn.active then
		btn.btnColor = btn.inactiveColor
	end
	if activeColor and inactiveColor then
		btn:GetNormalTexture():SetVertexColor(tonumber("0x"..btn.btnColor:sub(1,2))/255, tonumber("0x"..btn.btnColor:sub(3,4))/255, tonumber("0x"..btn.btnColor:sub(5,6))/255, 1)
		btn:SetScript('OnEnter', function(self)
			if self.highlightColor then
				self.btnColor = self.highlightColor
			else
				self.btnColor = self.inactiveColor
				if not self.active then
					self.btnColor = self.activeColor
				end
			end
			self:GetNormalTexture():SetVertexColor(tonumber("0x"..self.btnColor:sub(1,2))/255, tonumber("0x"..self.btnColor:sub(3,4))/255, tonumber("0x"..self.btnColor:sub(5,6))/255, 1)
			if tooltip then 
				ZN:ShowToolTip(tooltipText, tooltipColor, self)
			end
		end)
		btn:SetScript('OnLeave', function(self)
			self.btnColor = self.activeColor
			if not self.active then
				self.btnColor = self.inactiveColor
			end
			self:GetNormalTexture():SetVertexColor(tonumber("0x"..self.btnColor:sub(1,2))/255, tonumber("0x"..self.btnColor:sub(3,4))/255, tonumber("0x"..self.btnColor:sub(5,6))/255, 1)
			if tooltip then
				GameTooltip:Hide()
			end
		end)
	end

	return btn
end

function ZN.CreateGenericButton(name, parent, point, anchorFrame, anchorPoint, width, height, xOffset, yOffset, fontxOffset, fontyOffset ,fontSize, fontcolor, bgcolor, label, buttonText, buttonTextAlign, hover, hoverColor)
	local btn = CreateFrame("Button", nil, parent);
	btn:SetFrameStrata(parent:GetFrameStrata())
	btn.name = name
	btn.parent = parent
    btn.bg = btn:CreateTexture(nil, "BACKGROUND");
    btn.bg:SetAllPoints(true);
    btn.bg:SetColorTexture(tonumber("0x"..bgcolor:sub(1,2))/255, tonumber("0x"..bgcolor:sub(3,4))/255, tonumber("0x"..bgcolor:sub(5,6))/255, 1);
	btn:SetSize(width, height);
	btn.doOnUpdate = false
	btn.OnUpdate = nil
	btn.tableType = nil
	btn.Row = nil
	btn.Column = nil
	btn.Update = function(newValue)
		if btn.doOnUpdate then
			btn.OnUpdate(btn.tableType, btn.Row, btn.Column, newValue)
		end
	end

    btn.ZNText = btn:CreateFontString()
    btn.ZNText:SetPoint("LEFT", btn, "LEFT", fontxOffset, fontyOffset)
    btn.ZNText:SetSize(width, height)
    btn.ZNText:SetFont("Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", fontSize)
	if fontcolor then
		btn.ZNText:SetTextColor(tonumber("0x"..fontcolor:sub(1,2))/255, tonumber("0x"..fontcolor:sub(3,4))/255, tonumber("0x"..fontcolor:sub(5,6))/255, 1);
	end
	btn.ZNText:SetJustifyH(buttonTextAlign);
	btn.ZNText:SetJustifyV("CENTER");
	btn.ZNText:SetText(buttonText:upper());
	
	if label then 
		btn.ZNLabel = btn:CreateFontString()
		btn.ZNLabel:SetPoint("BOTTOMLEFT", btn, "TOPLEFT", 0, 10)
		btn.ZNLabel:SetSize(width, height/2)
		btn.ZNLabel:SetFont("Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 12)
		btn.ZNLabel:SetJustifyH("LEFT");
		btn.ZNLabel:SetText(label);
	end

	if hover then 
		btn:SetScript('OnEnter', function(self)
			self.bg:SetColorTexture(tonumber("0x"..(hoverColor and hoverColor or ZN.Colors.ROWBG):sub(1,2))/255, tonumber("0x"..(hoverColor and hoverColor or ZN.Colors.ROWBG):sub(3,4))/255, tonumber("0x"..(hoverColor and hoverColor or ZN.Colors.ROWBG):sub(5,6))/255, 1);			
		end)
		btn:SetScript('OnLeave', function(self)
			self.bg:SetColorTexture(tonumber("0x"..bgcolor:sub(1,2))/255, tonumber("0x"..bgcolor:sub(3,4))/255, tonumber("0x"..bgcolor:sub(5,6))/255, 1);
		end)
	end

    btn:SetPoint(point, anchorFrame, anchorPoint, xOffset, yOffset);

	return btn
end

function ZN.DropdownList(name, parent, point, anchorFrame, anchorPoint, width, height, color, a, anchor, hide, contents, strata)
	local Dropdown = CreateFrame('FRAME', name, parent)
	Dropdown:SetFrameStrata(strata and strata or "DIALOG")
	Dropdown:SetWidth(width)
	Dropdown:SetHeight(height*contents)
	Dropdown:SetPoint(point, anchorFrame, anchorPoint)
	--NewFrame:Hide()
	Dropdown.updateDelay = 0
	Dropdown.background = Dropdown:CreateTexture(nil, 'BACKGROUND')
	Dropdown.background:SetAllPoints(Dropdown)
	if hide then
		Dropdown.visible=false
		Dropdown:SetShown(false)
	end
	if color then
		Dropdown.background:SetColorTexture(tonumber("0x"..color:sub(1,2))/255, tonumber("0x"..color:sub(3,4))/255, tonumber("0x"..color:sub(5,6))/255, a)
	end
	Dropdown:EnableMouse(true)
	-- Dropdown:SetScript('OnEnter', function(self)
	-- 	print("Test")
	-- end)
	Dropdown:SetScript('OnLeave', function(self)
		self:Hide()
	end)

	table.insert(ZN.DropDowns,Dropdown)
	return Dropdown
end

function ZN.SingleLineEditBox(name, parent, point, anchorFrame, anchorPoint, width, height, xOffset, yOffset, fontxOffset, fontyOffset ,fontSize, fontcolor, bgcolor, label, setText, setTextTextAlign)
	local editbox = CreateFrame("EditBox", nil, parent)
	editbox:SetMultiLine(false)
	editbox.name = name
	editbox.parent = parent
	editbox.bg = editbox:CreateTexture(nil, "BACKGROUND");
	editbox.bg:SetAllPoints(true);
	editbox.bg:SetColorTexture(tonumber("0x"..bgcolor:sub(1,2))/255, tonumber("0x"..bgcolor:sub(3,4))/255, tonumber("0x"..bgcolor:sub(5,6))/255, 1);
	editbox:SetWidth(width)
	editbox:SetHeight(height)
	editbox.doOnUpdate = false
	editbox.OnUpdate = nil
	editbox.tableType = nil
	editbox.Row = nil
	editbox.Column = nil

	-- editbox.DefaultText = editbox:CreateFontString()
	-- editbox.DefaultText:SetFont("Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", fontSize)
	-- editbox.DefaultText:SetJustifyH("CENTER");
	-- editbox.DefaultText:SetJustifyV("CENTER");
	-- editbox.DefaultText:SetText(setText)
	editbox:SetText(setText)
	editbox:SetFont("Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", fontSize)
	editbox:SetTextColor(tonumber("0x"..fontcolor:sub(1,2))/255, tonumber("0x"..fontcolor:sub(3,4))/255, tonumber("0x"..fontcolor:sub(5,6))/255, 1);
	editbox:SetTextInsets(fontxOffset, fontxOffset, 0, 0)
	--editbox:HighlightText()
	editbox:SetAutoFocus(false)
	editbox:SetJustifyH(setTextTextAlign)
	
	editbox:SetPoint(point, anchorFrame, anchorPoint, xOffset, yOffset);

	--editbox.oldText = setText

	editbox:SetScript("OnEnterPressed", function(self)
		self.oldText = self:GetText()
		self:ClearFocus()
		if self.doOnUpdate then
			self.OnUpdate(self.tableType,self.Row,self.Column, self:GetText())
		end
				
	end)
	editbox:SetScript("OnEscapePressed", function(self)
		self:ClearFocus()
		self:SetText(self.oldText)
	end)
	editbox:SetScript("OnEditFocusGained", function(self)
		self.oldText = self:GetText()
		self:SetTextColor(tonumber("0x"..ZN.Colors.ACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.ACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.ACTIVE:sub(5,6))/255, 1);
	end)
	editbox:SetScript("OnEditFocusLost", function(self)
		self:ClearFocus()
		self:SetText(self.oldText)
		self:SetTextColor(tonumber("0x"..fontcolor:sub(1,2))/255, tonumber("0x"..fontcolor:sub(3,4))/255, tonumber("0x"..fontcolor:sub(5,6))/255, 1);
	end)
	


	return editbox
end

function ZN.MultiLineEditBox(name, parent, point, anchorFrame, anchorPoint, width, height, xOffset, yOffset, fontxOffset, fontyOffset ,fontSize, fontcolor, bgcolor, label, setText, setTextTextAlign)
	local s = CreateFrame("ScrollFrame", name, parent, "UIPanelScrollFrameTemplate,BackdropTemplate") -- or you actual parent instead
	s:SetSize(width,height)
	s:SetPoint(point, anchorFrame, anchorPoint, xOffset, yOffset);
	--s:SetPoint(anchorPoint, parent, anchorPoint)

	s.background = s:CreateTexture(nil, 'BACKGROUND')
	s.background:SetAllPoints(s)
	s.background:SetColorTexture(tonumber("0x"..bgcolor:sub(1,2))/255, tonumber("0x"..bgcolor:sub(3,4))/255, tonumber("0x"..bgcolor:sub(5,6))/255, 1)
	
	s:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
		edgeFile = [[Interface\Buttons\WHITE8x8]],
    edgeSize = 1,
		-- tile = true, tileSize = 16, edgeSize = 16, 
		-- insets = { left = 4, right = 4, top = 4, bottom = 4 	}
	});
	s:SetBackdropColor(tonumber("0x"..bgcolor:sub(1,2))/255, tonumber("0x"..bgcolor:sub(3,4))/255, tonumber("0x"..bgcolor:sub(5,6))/255, 1);
	s:SetBackdropBorderColor(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, 1);
	
	s.ScrollBar:ClearAllPoints();
	s.ScrollBar:SetPoint("TOPRIGHT", s, "TOPRIGHT", 0, -5);
	s.ScrollBar:SetPoint("BOTTOMRIGHT", s, "BOTTOMRIGHT", 0, 5);
	s.ScrollBar.ScrollUpButton:SetNormalTexture(nil)
	s.ScrollBar.ScrollUpButton:SetDisabledTexture(nil)
	s.ScrollBar.ScrollUpButton:SetHeight(0)
	s.ScrollBar.ScrollDownButton:SetNormalTexture(nil)
	s.ScrollBar.ScrollDownButton:SetDisabledTexture(nil)
	s.ScrollBar.ScrollDownButton:SetHeight(0)
	s.ScrollBar:SetWidth(10)

	local scrollButton = _G[name..'ScrollBarThumbTexture']
	scrollButton:SetHeight(40)
	scrollButton:SetWidth(3)
	scrollButton:SetColorTexture(tonumber("0x"..ZN.Colors.INACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.INACTIVE:sub(5,6))/255, a)

	local e = CreateFrame("EditBox", nil, s)
	s.editbox = e
	e:SetMultiLine(true)
	e:SetFont("Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", fontSize)
	e:SetWidth(width)
	s:SetScrollChild(e)
	e:SetText(setText)
	e:SetSpacing(4)
	e:SetTextInsets(5, 15, 5, 15)
	e:HighlightText(false) 
	e:SetAutoFocus(false)
	e.doOnUpdate = false
	e.OnUpdate = nil
	
	s.child = s:GetScrollChild()
	s.child:SetHeight(height-10)
	
	e:SetScript("OnEnterPressed", function(self)
		self.oldText = self:GetText()
		if self.doOnUpdate then
			self.OnUpdate(self.tableType,self.Row,self.Column, self:GetText())
		end
		self:ClearFocus()		
	end)
	e:SetScript("OnEscapePressed", function(self)
		self:ClearFocus()
		self:SetText(self.oldText)
	end)
	e:SetScript("OnEditFocusGained", function(self)
		self.oldText = self:GetText()
		self:SetTextColor(tonumber("0x"..ZN.Colors.ACTIVE:sub(1,2))/255, tonumber("0x"..ZN.Colors.ACTIVE:sub(3,4))/255, tonumber("0x"..ZN.Colors.ACTIVE:sub(5,6))/255, 1);
	end)
	e:SetScript("OnEditFocusLost", function(self)
		self:ClearFocus()
		
		self:SetTextColor(tonumber("0x"..fontcolor:sub(1,2))/255, tonumber("0x"..fontcolor:sub(3,4))/255, tonumber("0x"..fontcolor:sub(5,6))/255, 1);
	end)

	s:SetScript("OnMouseDown", function(self, button)
		if button == "LeftButton" then
			e:SetFocus()
		end
	end)

	return s
end

-- function ZN.createToolTip(name, )
-- 	local tt = CreateFrame('FRAME', name, UIParent)
-- 	tt:SetFrameStrata(strata)
-- 	tt:SetWidth(width)
-- 	tt:SetHeight(height)
-- 	tt:SetPoint('RIGHT', UIParent, 'CENTER',width/2)
-- 	tt:EnableMouse(true)
-- 	tt:SetMovable(true)
-- 	tt:RegisterForDrag('LeftButton')
-- 	tt:EnableKeyboard(true)
-- 	tt:SetPropagateKeyboardInput(true)
-- 	tt:SetClampedToScreen(true)
-- 	--NewFrame:Hide()
-- 	tt.updateDelay = 0
-- 	tt.background = tt:CreateTexture(nil, 'BACKGROUND')
-- 	tt.background:SetAllPoints(tt)
-- 	tt.background:SetColorTexture(tonumber("0x"..color:sub(1,2))/255, tonumber("0x"..color:sub(3,4))/255, tonumber("0x"..color:sub(5,6))/255, a)
-- 	tt:SetScript('OnDragStart', function(self)
-- 		self:StartMoving()
-- 		end)
-- 	tt:SetScript('OnDragStop', function(self)
-- 		self:StopMovingOrSizing()
-- 		end)
-- 	tt:SetScript('OnKeyDown', function(self, key)
-- 		if key == 'ESCAPE' then
-- 			self:SetPropagateKeyboardInput(false)
-- 			self:Hide()
-- 		end
-- 	end)
-- 	return tt
-- end
-- Templates End
--##############################################################################

--##############################################################################
-- Frame Stuff
ZNFrame = ZN.createMainFrame("ZNFrame", 1000, 600, ZN.Colors.BG, 1, "HIGH")
ZNHeaderFrame = ZN.createSubFrame("ZNHeader", ZNFrame, 1000, 58, ZN.Colors.HD, 1, "TOPRIGHT", "HIGH",nil,nil,nil,nil,nil,true)
ZNSidebarFrame = ZN.createSubFrame("ZNSideBar", ZNFrame, 300, 540, ZN.Colors.HD, 1, "BOTTOMLEFT", "DIALOG")
ZNSidebarFrame.collapsed = false
ZNSidebarFrame:EnableMouse(true)
ZNBodyFrame = ZN.createSubFrame("ZNBody", ZNFrame, 950, 540, ZN.Colors.BG, 1, "BOTTOMRIGHT", "HIGH")
ZNInfoFrame = ZN.createSubFrame("ZNInfoFrame",ZNFrame, 300, 200, ZN.Colors.ROWBG, 1, 'CENTER', 'TOOLTIP', true)
--##############################################################################
-- Header
ZNHeaderFrame.btnLogo = ZN.CreateIconButton(ZNHeaderFrame, "LEFT", ZNHeaderFrame, "LEFT", 32, 32, 30, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\zero_logo", ZN.Colors.INACTIVE, ZN.Colors.ACTIVE, false)
ZNHeaderFrame.Title = ZN.CreateText(ZNHeaderFrame, "LEFT", ZNHeaderFrame.btnLogo, "LEFT", 100, 20, 40, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNVers.ttf", 18, ZN.Colors.ACTIVE, ZN.Title)
ZNHeaderFrame.Version = ZN.CreateText(ZNHeaderFrame, "BOTTOMLEFT", ZNHeaderFrame.Title, "BOTTOMRIGHT", 30, 20, 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNVers.ttf", 12, ZN.Colors.INACTIVE, ZN.Version)
ZNHeaderFrame.btnClose = ZN.CreateIconButton(ZNHeaderFrame, "RIGHT", ZNHeaderFrame, "RIGHT", 28, 28, -20, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
ZNHeaderFrame.btnHome = ZN.CreateIconButton(ZNHeaderFrame, "RIGHT", ZNHeaderFrame.btnClose, "LEFT", 32, 32, -30, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\home_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
ZNHeaderFrame.btnImpExp = ZN.CreateIconButton(ZNHeaderFrame, "RIGHT", ZNHeaderFrame.btnHome, "LEFT", 32, 32, -30, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\impexp_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, nil, true, "Import / Export", ZN.Colors.ACTIVE)
ZNHeaderFrame.btnBoss = ZN.CreateIconButton(ZNHeaderFrame, "RIGHT", ZNHeaderFrame.btnImpExp, "LEFT", 32, 32, -30, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\boss_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, nil, true, "Boss Template Editor", ZN.Colors.ACTIVE)
ZNHeaderFrame.btnPlayer = ZN.CreateIconButton(ZNHeaderFrame, "RIGHT", ZNHeaderFrame.btnBoss, "LEFT", 32, 32, -30, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\player_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false, nil, true, "Player DB Editor", ZN.Colors.ACTIVE)
-- Header Functions
ZNHeaderFrame.btnLogo:SetScript("OnClick", function(self) ZN:ToggleInfo(self) end)
ZNHeaderFrame.btnClose:SetScript("OnClick", function(self) ZN:Toggle(self) end)
ZNHeaderFrame.btnHome:SetScript("OnClick", function(self) ZN:ClickHome(ZNHeaderFrame, ZNSidebarFrame, ZNBodyFrame) end)
ZNHeaderFrame.btnImpExp:SetScript("OnClick", function(self) ZN:ClickImpExp(ZNHeaderFrame, ZNSidebarFrame, ZNBodyFrame) end)
ZNHeaderFrame.btnBoss:SetScript("OnClick", function(self) ZN:ClickBoss(ZNHeaderFrame, ZNSidebarFrame, ZNBodyFrame) end)
ZNHeaderFrame.btnPlayer:SetScript("OnClick", function(self) ZN:ClickPlayer(ZNHeaderFrame, ZNSidebarFrame, ZNBodyFrame) end)
--##############################################################################
-- Sidebar 
ZNSidebarFrame.btnCollapseSidebar = ZN.CreateIconButton(ZNSidebarFrame, "BOTTOMRIGHT", ZNSidebarFrame, "BOTTOMRIGHT", 20, 20, -14, 14, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\arrow_left", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
ZNSidebarFrame.Subframes = {}
ZNSidebarFrame.Subframes.Home = ZN.createSubFrame("ZNSideBarHomeContent", ZNSidebarFrame, 240, 540, nil, 1, "CENTER", "DIALOG",  true)
ZNSidebarFrame.Subframes.ImpExp = ZN.createSubFrame("ZNSideBarImpExpContent", ZNSidebarFrame, 240, 540, nil, 1, "CENTER", "DIALOG", true)
ZNSidebarFrame.Subframes.Boss = ZN.createSubFrame("ZNSideBarBossContent", ZNSidebarFrame, 240, 540, nil, 1, "CENTER", "DIALOG", true)
ZNSidebarFrame.Subframes.Player = ZN.createSubFrame("ZNSideBarPlayerContent", ZNSidebarFrame, 240, 500, nil, 1, "TOP","DIALOG", true)
-- Sidebar Functions
ZNSidebarFrame.btnCollapseSidebar:SetScript("OnClick", function(self) ZN:ClickCollapse(ZNFrame, ZNHeaderFrame, ZNSidebarFrame) end)
--##############################################################################
-- Body
ZNBodyFrame.Subframes = {}
ZNBodyFrame.Subframes.Home = ZN.createSubFrame("ZNBodyHomeContent", ZNBodyFrame, 640, 530, nil, 1, "RIGHT","HIGH", true, -30, 0)
ZNBodyFrame.Subframes.ImpExp = ZN.createSubFrame("ZNBodyImpExpContent", ZNBodyFrame, 680, 530, nil, 1, "RIGHT","HIGH", true, -10, 0)
ZNBodyFrame.Subframes.BossSpellHead = ZN.createSubFrame("ZNBodyBossSpellHead", ZNBodyFrame, 930, 30, nil, 1, "TOP","HIGH", true, 0, 0)
ZNBodyFrame.Subframes.BossSpells = ZN.createScrollFrame("ZNBodyBossSpellContent", ZNBodyFrame, 930, 300, ZN.Colors.dk, 1, "TOP","HIGH", true)
ZNBodyFrame.Subframes.BossTrennerHead = ZN.createSubFrame("ZNBodyBossTrennerHead", ZNBodyFrame, 460, 30, nil, 1, "TOP","HIGH", true, 0, 0)
ZNBodyFrame.Subframes.BossTrenner = ZN.createScrollFrame("ZNBodyBossTrennerContent", ZNBodyFrame, 460, 160, ZN.Colors.hunter, 1, "TOP","HIGH", true)
ZNBodyFrame.Subframes.BossNote = ZN.createSubFrame("ZNBodyBossNote", ZNBodyFrame, 460, 190, ZN.Colors.shaman, 1, "TOP","HIGH", true, 0, 0)
ZNBodyFrame.Subframes.PlayerHead = ZN.createSubFrame("ZNBodyPlayerHead", ZNBodyFrame, 930, 30, nil, 1, "TOP","HIGH", true, 0, 0)
ZNBodyFrame.Subframes.Player = ZN.createScrollFrame("ZNBodyPlayerContent", ZNBodyFrame, 930, 500, nil, 1, "TOP","HIGH", true)

ZNBodyFrame.Subframes.Player:SetPoint("TOP", ZNBodyFrame.Subframes.PlayerHead,"BOTTOM", -5, 0)
ZNBodyFrame.Subframes.BossSpells:SetPoint("TOP", ZNBodyFrame.Subframes.BossSpellHead,"BOTTOM", -5, 0)
ZNBodyFrame.Subframes.BossTrennerHead:SetPoint("TOPLEFT", ZNBodyFrame.Subframes.BossSpells,"BOTTOMLEFT", 5, 0)
ZNBodyFrame.Subframes.BossTrenner:SetPoint("TOP", ZNBodyFrame.Subframes.BossTrennerHead,"BOTTOM", -5, 0)
ZNBodyFrame.Subframes.BossSpells.ScrollBar:SetPoint("TOPRIGHT", ZNBodyFrame.Subframes.BossSpells, "TOPRIGHT", 0, 0);
ZNBodyFrame.Subframes.BossNote:ClearAllPoints()
ZNBodyFrame.Subframes.BossNote:SetPoint("BOTTOMLEFT", ZNBodyFrame.Subframes.BossTrenner,"BOTTOMRIGHT", 10, 0)
ZNBodyFrame.Subframes.BossSpells.ScrollBar:SetPoint("BOTTOMRIGHT", ZNBodyFrame.Subframes.BossSpells, "BOTTOMRIGHT", 0, 0);
ZNBodyFrame.Subframes.BossTrenner.ScrollBar:SetPoint("TOPRIGHT", ZNBodyFrame.Subframes.BossTrenner, "TOPRIGHT", 0, 0);
ZNBodyFrame.Subframes.BossTrenner.ScrollBar:SetPoint("BOTTOMRIGHT", ZNBodyFrame.Subframes.BossTrenner, "BOTTOMRIGHT", 0, 0);
-- Frame Stuff End
--##############################################################################


--##############################################################################
-- Slashcommand etc.
ZN:ClickHome(ZNHeaderFrame, ZNSidebarFrame, ZNBodyFrame)

local function handler(msg)
	if msg == "minimap" then
	ZNotes.minimap.hide = not ZNotes.minimap.hide
	DEFAULT_CHAT_FRAME:AddMessage("|cff00ffffZero|rNotes: Minimap button " .. (ZNotes.minimap.hide and "hidden" or "shown"))
	ZN:UpdateMinimapButton()
	else
		ZN:Toggle()
	end
end

SLASH_ZERONOTES1 = '/ZN'
SlashCmdList['ZERONOTES'] = handler;