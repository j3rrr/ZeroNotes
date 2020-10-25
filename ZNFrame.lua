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
local function createMainFrame(name, width, height, color, a)
	local NewFrame = CreateFrame('FRAME', name, UIParent)
	NewFrame:SetFrameStrata('DIALOG')
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

local function createSubFrame(name, parent, width, height, color, a, anchor, hide)
	local NewFrame = CreateFrame('FRAME', name, parent)
	NewFrame:SetFrameStrata('DIALOG')
	NewFrame:SetWidth(width)
	NewFrame:SetHeight(height)
	NewFrame:SetPoint(anchor, parent, anchor)
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
	return NewFrame
end

local function createScrollFrame(name, parent, width, height, color, a, anchor, hide)
	local NewFrame = CreateFrame('ScrollFrame', name, parent, "UIPanelScrollFrameTemplate,BackdropTemplate")
	--NewFrame:SetClipsChildren(true)
	NewFrame:SetFrameStrata('DIALOG')
	NewFrame:SetWidth(width)
	NewFrame:SetHeight(height)
	NewFrame:SetPoint(anchor, parent, anchor)

	NewFrame.background = NewFrame:CreateTexture(nil, 'BACKGROUND')
	NewFrame.background:SetAllPoints(NewFrame)
	
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
	
	local scrollButton = _G[name..'ScrollBarThumbTexture']
	scrollButton:SetHeight(100)
	scrollButton:SetWidth(3)
	scrollButton:SetColorTexture(tonumber("0x"..ZN.Colors.HD:sub(1,2))/255, tonumber("0x"..ZN.Colors.HD:sub(3,4))/255, tonumber("0x"..ZN.Colors.HD:sub(5,6))/255, a)
	NewFrame.scrollChild = CreateFrame("Frame", name.."ScrollChild", NewFrame);
	NewFrame.scrollChild:SetSize(width, 1000);
	NewFrame:SetScrollChild(NewFrame.scrollChild);



	if hide then
		NewFrame.visible=false
		NewFrame:SetShown(false)
	end
	return NewFrame
end

function ZN.CreateText(parent, point, anchorFrame, anchorPoint, width, height, xOffset, yOffset, font, fontSize, color, text)
		local newText = parent:CreateFontString()
		newText:SetPoint(point, anchorFrame, anchorPoint, xOffset, yOffset)
		newText:SetSize(width, height)
		newText:SetFont(font, fontSize)
		newText:SetTextColor(tonumber("0x"..color:sub(1,2))/255, tonumber("0x"..color:sub(3,4))/255, tonumber("0x"..color:sub(5,6))/255, 1)
		newText:SetJustifyH("LEFT")
		newText:SetJustifyV("BOTTOM")
		newText:SetText(text)
		return newText
end

function ZN.CreateIconButton(parent, point, anchorFrame, anchorPoint, width, height, xOffset, yOffset, texture, activeColor, inactiveColor, active)
	local btn = CreateFrame("Button", nil, parent)
	btn:SetPoint(point, anchorFrame, anchorPoint, xOffset, yOffset)
	btn:SetSize(width, height)
	btn:SetNormalTexture(texture)
	btn.activeColor = activeColor
	btn.inactiveColor = inactiveColor
	btn.active = active
	btn.btnColor = btn.activeColor
	if not btn.active then
		btn.btnColor = btn.inactiveColor
	end
	btn:GetNormalTexture():SetVertexColor(tonumber("0x"..btn.btnColor:sub(1,2))/255, tonumber("0x"..btn.btnColor:sub(3,4))/255, tonumber("0x"..btn.btnColor:sub(5,6))/255, 1)
	btn:SetScript('OnEnter', function(self)
		self.btnColor = self.inactiveColor
		if not self.active then
			self.btnColor = self.activeColor
		end
		self:GetNormalTexture():SetVertexColor(tonumber("0x"..self.btnColor:sub(1,2))/255, tonumber("0x"..self.btnColor:sub(3,4))/255, tonumber("0x"..self.btnColor:sub(5,6))/255, 1)
	end)
	btn:SetScript('OnLeave', function(self)
		self.btnColor = self.activeColor
		if not self.active then
			self.btnColor = self.inactiveColor
		end
		self:GetNormalTexture():SetVertexColor(tonumber("0x"..self.btnColor:sub(1,2))/255, tonumber("0x"..self.btnColor:sub(3,4))/255, tonumber("0x"..self.btnColor:sub(5,6))/255, 1)
	end)

	return btn
end

function ZN.CreateGenericButton(name, parent, point, anchorFrame, anchorPoint, width, height, xOffset, yOffset, fontxOffset, fontyOffset ,fontSize, color, bgcolor, label)
		local btn = CreateFrame("Button", nil, parent);
		btn.name = name
		btn.parent = parent
    btn.bg = btn:CreateTexture(nil, "BACKGROUND");
    btn.bg:SetAllPoints(true);
    btn.bg:SetColorTexture(tonumber("0x"..bgcolor:sub(1,2))/255, tonumber("0x"..bgcolor:sub(3,4))/255, tonumber("0x"..bgcolor:sub(5,6))/255, 1);
    btn:SetSize(width, height);

    btn.ZNText = btn:CreateFontString()
    btn.ZNText:SetPoint("LEFT", btn, "LEFT", fontxOffset, fontyOffset)
    btn.ZNText:SetSize(width, height)
    btn.ZNText:SetFont("Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", fontSize)
		if color then
			btn.ZNText:SetTextColor(tonumber("0x"..color:sub(1,2))/255, tonumber("0x"..color:sub(3,4))/255, tonumber("0x"..color:sub(5,6))/255, 1);
		end
    btn.ZNText:SetJustifyH("LEFT");
    btn.ZNText:SetJustifyV("CENTER");
    btn.ZNText:SetText(label:upper());

    btn:SetPoint(point, anchorFrame, anchorPoint, xOffset, yOffset);

	return btn
end

function ZN.DropdownList(name, parent, point, anchorFrame, anchorPoint, width, height, color, a, anchor, hide, contents)
	local Dropdown = CreateFrame('FRAME', name, parent)
	Dropdown:SetFrameStrata('DIALOG')
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
	return Dropdown
end

--##############################################################################
-- Frame Stuff
local ZNFrame = createMainFrame("ZNFrame", 1000, 600, ZN.Colors.BG, 1)
local ZNHeaderFrame = createSubFrame("ZNHeader", ZNFrame, 1000, 58, ZN.Colors.HD, 1, "TOPRIGHT")
local ZNSidebarFrame = createSubFrame("ZNSideBar", ZNFrame, 300, 540, ZN.Colors.HD, 1, "BOTTOMLEFT")
ZNSidebarFrame.collapsed = false
local ZNBodyFrame = createSubFrame("ZNBody", ZNFrame, 700, 540, ZN.Colors.BG, 1, "BOTTOMRIGHT")
--##############################################################################
-- Header
ZNHeaderFrame.Title = ZN.CreateText(ZNHeaderFrame, "LEFT", ZNHeaderFrame, "LEFT", 100, 20, 30, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNVers.ttf", 18, ZN.Colors.ACTIVE, ZN.Title)
ZNHeaderFrame.Version = ZN.CreateText(ZNHeaderFrame, "BOTTOMLEFT", ZNHeaderFrame.Title, "BOTTOMRIGHT", 30, 20, 0, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNVers.ttf", 12, ZN.Colors.INACTIVE, ZN.Version)
ZNHeaderFrame.btnClose = ZN.CreateIconButton(ZNHeaderFrame, "RIGHT", ZNHeaderFrame, "RIGHT", 28, 28, -20, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
ZNHeaderFrame.btnHome = ZN.CreateIconButton(ZNHeaderFrame, "RIGHT", ZNHeaderFrame.btnClose, "LEFT", 32, 32, -30, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\home_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
ZNHeaderFrame.btnImpExp = ZN.CreateIconButton(ZNHeaderFrame, "RIGHT", ZNHeaderFrame.btnHome, "LEFT", 32, 32, -30, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\impexp_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
ZNHeaderFrame.btnBoss = ZN.CreateIconButton(ZNHeaderFrame, "RIGHT", ZNHeaderFrame.btnImpExp, "LEFT", 32, 32, -30, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\boss_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
ZNHeaderFrame.btnPlayer = ZN.CreateIconButton(ZNHeaderFrame, "RIGHT", ZNHeaderFrame.btnBoss, "LEFT", 32, 32, -30, 0, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\player_active", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
-- Header Functions
ZNHeaderFrame.btnClose:SetScript("OnClick", function(self) ZN:Toggle(self) end)
ZNHeaderFrame.btnHome:SetScript("OnClick", function(self) ZN:ClickHome(ZNHeaderFrame, ZNSidebarFrame, ZNBodyFrame) end)
ZNHeaderFrame.btnImpExp:SetScript("OnClick", function(self) ZN:ClickImpExp(ZNHeaderFrame, ZNSidebarFrame, ZNBodyFrame) end)
ZNHeaderFrame.btnBoss:SetScript("OnClick", function(self) ZN:ClickBoss(ZNHeaderFrame, ZNSidebarFrame, ZNBodyFrame) end)
ZNHeaderFrame.btnPlayer:SetScript("OnClick", function(self) ZN:ClickPlayer(ZNHeaderFrame, ZNSidebarFrame, ZNBodyFrame) end)
--##############################################################################
-- Sidebar 
ZNSidebarFrame.btnCollapseSidebar = ZN.CreateIconButton(ZNSidebarFrame, "BOTTOMRIGHT", ZNSidebarFrame, "BOTTOMRIGHT", 20, 20, -13, 15, "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\arrow_left", ZN.Colors.ACTIVE, ZN.Colors.INACTIVE, false)
ZNSidebarFrame.Subframes = {}
ZNSidebarFrame.Subframes.Home = createSubFrame("ZNSideBarHomeContent", ZNSidebarFrame, 240, 540, nil, 1, "CENTER", true)
ZNSidebarFrame.Subframes.ImpExp = createSubFrame("ZNSideBarImpExpContent", ZNSidebarFrame, 240, 540, nil, 1, "CENTER", true)
ZNSidebarFrame.Subframes.Boss = createSubFrame("ZNSideBarBossContent", ZNSidebarFrame, 240, 540, nil, 1, "CENTER", true)
ZNSidebarFrame.Subframes.Player = createSubFrame("ZNSideBarPlayerContent", ZNSidebarFrame, 240, 540, nil, 1, "CENTER", true)
-- Sidebar Functions
ZNSidebarFrame.btnCollapseSidebar:SetScript("OnClick", function(self) ZN:ClickCollapse(ZNFrame, ZNHeaderFrame, ZNSidebarFrame) end)
-- Home Sidebar
ZNSidebarFrame.Subframes.Home.ClassSelectLabel = ZN.CreateText(ZNSidebarFrame.Subframes.Home, "TOPLEFT", ZNSidebarFrame.Subframes.Home, "TOPLEFT", 240, 30, 0, -30, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 12, ZN.Colors.ACTIVE, "Filter by Class")
ZNSidebarFrame.Subframes.Home.ClassSelectButton = ZN.CreateGenericButton("ZNClassSelectButton", ZNSidebarFrame.Subframes.Home, "TOPLEFT", ZNSidebarFrame.Subframes.Home.ClassSelectLabel, "BOTTOMLEFT", 240, 30, 0, -5,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, "Select Class..." )
ZNSidebarFrame.Subframes.Home.TemplateSelectLabel = ZN.CreateText(ZNSidebarFrame.Subframes.Home, "TOPLEFT", ZNSidebarFrame.Subframes.Home.ClassSelectButton, "TOPLEFT", 240, 30, 0, -30, "Interface\\AddOns\\ZeroNotes\\Media\\Font\\ZNReg.ttf", 12, ZN.Colors.ACTIVE, "Select Encounter Template")
ZNSidebarFrame.Subframes.Home.TemplateSelectButton = ZN.CreateGenericButton("ZNTemplateSelectButton", ZNSidebarFrame.Subframes.Home, "TOPLEFT", ZNSidebarFrame.Subframes.Home.TemplateSelectLabel, "BOTTOMLEFT", 240, 30, 0, -5,10,0, 12, ZN.Colors.ACTIVE, ZN.Colors.SBButtonBG, "Select Template..." )

-- Home Sidebar Functions
ZNSidebarFrame.Subframes.Home.ClassSelectButton:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN.DropdownFake, ZN.DropdownFakeOrder) end)
ZNSidebarFrame.Subframes.Home.TemplateSelectButton:SetScript("OnClick", function(self) ZN:CreateDropdown(self, ZN.DropdownFake2, ZN.DropdownFake2Order) end)
--##############################################################################
-- Body
ZNBodyFrame.Subframes = {}
ZNBodyFrame.Subframes.Home = createSubFrame("ZNBodyHomeContent", ZNBodyFrame, 680, 540, nil, 1, "CENTER", true)
ZNBodyFrame.Subframes.ImpExp = createSubFrame("ZNBodyImpExpContent", ZNBodyFrame, 680, 540, nil, 1, "CENTER", true)
ZNBodyFrame.Subframes.Boss = createScrollFrame("ZNBodyBossContent", ZNBodyFrame, 680, 540, nil, 1, "CENTER", true)
ZNBodyFrame.Subframes.Player = createScrollFrame("ZNBodyPlayerContent", ZNBodyFrame, 680, 540, nil, 1, "CENTER", true)
-- Frame Stuff End
--##############################################################################


--##############################################################################
-- Slashcommand etc.
ZN:ClickHome(ZNHeaderFrame, ZNSidebarFrame, ZNBodyFrame)

local function handler(msg)
	ZN:Toggle()
end

SLASH_ZERONOTES1 = '/ZN'
SlashCmdList['ZERONOTES'] = handler;