local _, ZN, L = ...

ZN.Title="Zero Notes"
ZN.Version="1.0"

ZN.Colors = {
	["BG"] = "15191C",
	["HD"] = "292E32",
	["INACTIVE"] = "555F6A",
	["ACTIVE"] = "F8F8FF",
	["ROWBG"] = "1F2227",
	["SBButtonBG"] = "353C44",
	["dk"]= "c41f3b",
	["dh"]= "a330c9",
	["druid"]= "ff7d0a",
	["hunter"]= "abd473",
	["mage"]= "69ccf0",
	["monk"]= "00ff96",
	["paladin"]= "f58cba",
	["priest"]= "ffffff",
	["diszi"]= "ffffff",
	["rogue"]= "fff569",
	["shaman"]= "0070de",
	["warlock"]= "9482c9",
	["warrior"]= "c79c6e",
}

ZN.Roles = {
  ["heal"] = "|cff23e130Heal|r",
  ["tank"] = "|cffc5af2aTank|r",
  ["melee"] = "|cffd2728aMelee|r",
  ["range"] = "|cff6bbceeRange|r",
}

ZN.RolesOrder = {
  "heal",
  "tank",
  "melee",
  "range",
}

ZN.Types = {
  ["heal"] = "Heal",
  ["util"] = "Utility",
  ["imun"] = "Immunity",
}

ZN.TypesOrder = {
  "heal",
  "util",
  "imun",
}

ZN.DropdownFake = {
  ["all"] = "|cff"..ZN.Colors.ACTIVE.."All|r",
  ["dk"]= "|cff"..ZN.Colors.dk.."Death Knight|r",
  ["dh"]= "|cff"..ZN.Colors.dh.."Demon Hunter|r",
  ["druid"]= "|cff"..ZN.Colors.druid.."Druide|r",
  ["hunter"]= "|cff"..ZN.Colors.hunter.."Hunter|r",
  ["mage"]= "|cff"..ZN.Colors.mage.."Mage|r",
  ["monk"]= "|cff"..ZN.Colors.monk.."Monk|r",
  ["paladin"]= "|cff"..ZN.Colors.paladin.."Paladin|r",
  ["priest"]= "|cff"..ZN.Colors.priest.."Priest|r",
  ["diszi"]= "|cff"..ZN.Colors.priest.."Priest - Disc|r",
  ["rogue"]= "|cff"..ZN.Colors.rogue.."Rogue|r",
  ["shaman"]= "|cff"..ZN.Colors.shaman.."Schamane|r",
  ["warlock"]= "|cff"..ZN.Colors.warlock.."Warlock|r",
  ["warrior"]= "|cff"..ZN.Colors.warrior.."Warrior|r",
}

ZN.DropdownFakeOrder = {
	"all",
  "dk",
  "dh",
  "druid",
  "hunter",
  "mage",
  "monk",
  "paladin",
  "priest",
  "diszi",
  "rogue",
  "shaman",
  "warlock",
  "warrior",
}

ZN.DropdownFake2 = {
  ["shriek1"] = "Shriekwing Test",
  ["shriek2"]= "Shriekwing Zwei",
  ["sludge1"]= "Sludgefist Template",
  ["denathrius"]= "Denathrius der Penis",
  ["azshara"]= "Tentakelfrau",
}

ZN.DropdownFake2Order = {
  "shriek1",
  "shriek2",
  "sludge1",
  "denathrius",
  "azshara",
}