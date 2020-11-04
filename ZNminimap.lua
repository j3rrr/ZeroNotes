local _, ZN, L = ...

--[[ ##############################################################################
	Databroker / Minimap Icon
############################################################################## --]]
ZN.ZNLDB = LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("ZeroNotes", {
	type = "launcher",
	text = "Zero Notes",
	label = "Zero Notes",
  icon = "Interface\\Addons\\ZeroNotes\\Media\\Texture\\zero_logo",
	OnClick = function(clickedframe, button)
		ZN:Toggle()
	end,
	OnTooltipShow = function(tooltip)
		tooltip:AddLine("Zero Notes")
		tooltip:AddLine(" ")
		tooltip:AddLine("Left click to toggle main window")
		tooltip:AddLine("Type '/zn minimap' to toggle minimap button")
	end,
})

ZN.icon = LibStub("LibDBIcon-1.0")

function ZN:UpdateMinimapButton()
  if (ZNotes.minimap.hide) then
    ZN.icon:Hide("ZNLDB")
  else
    ZN.icon:Show("ZNLDB")
  end
end