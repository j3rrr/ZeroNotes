-- Powershell dir -Recurse *.lua | Get-Content | Measure-Object -Line
local _, ZN, L = ...

ZN.Title="Zero Notes"
ZN.Version="1.0"

function table.copy(t)
  local u = { }
  for k, v in pairs(t) do u[k] = v end
  return setmetatable(u, getmetatable(t))
end

function ZN:SecondsToClock(seconds)
  local seconds = tonumber(seconds)

  if seconds <= 0 then
    return "00:00"
  else
    mins = string.format("%02.f", math.floor(seconds/60))
    secs = string.format("%02.f", math.floor(seconds - mins *60))
    return mins..":"..secs
  end
end

ZN.DropDowns = {}


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
  ["shadow"]= "ffffff",
	["rogue"]= "fff569",
	["shaman"]= "0070de",
	["warlock"]= "9482c9",
  ["warrior"]= "c79c6e",
  ["U"] = "ff7d0a",
  ["H"] = "abd473",
  ["I"] = "C41f3b",
  ["chatGeneral"] = "fec1c0", -- #fec1c0
  ["chatSystemMessages"] = "ffff00", -- #ffff00
  ["chatGuild"] = "3ce13f", -- #3ce13f
  ["chatOfficer"] = "40bc40", -- #40bc40
  ["chatParty"] = "aaabfe", -- #aaabfe
  ["chatPartyLeader"] = "77c8ff", -- #77c8ff
  ["chatLinkedSpells"] = "67bcff", -- #67bcff
  ["chatSay"] = "ffffff", -- #ffffff
  ["chatWhisper"] = "ff7eff", -- #ff7eff
  ["chatYell"] = "ff3f40", -- #ff3f40
  ["chatEmote"] = "ff7e40", -- #ff7e40
  ["chatInstance"] = "ff7d01", -- #ff7d01
  ["chatInstanceLeader"] = "ff4709", -- #ff4709
  ["chatRaidWarning"] = "ff4700", -- #ff4700
  ["chatAchievement"] = "fffc01", -- #fffc01
  ["chatBattleNetWhisper"] = "00faf6", -- #00faf6
  ["chatBattleNetConversation"] = "00adef", -- #00adef
  ["itemPoor"] = "889d9d", -- #889d9d
  ["itemCommon"] = "ffffff", -- #ffffff
  ["itemUncommon"] = "1eff0c", -- #1eff0c
  ["itemRare"] = "0070ff", -- #0070ff
  ["itemSuperior"] = "a335ee", -- #a335ee
  ["itemLegendary"] = "ff8000", -- #ff8000
  ["itemHeirloom"] = "e6cc80", -- #e6cc80
}

ZN.ColoredRoles = {
  ["heal"] = "|cffabd473Heal|r",
  ["tank"] = "|cffc5af2aTank|r",
  ["melee"] = "|cffd2728aMelee|r",
  ["range"] = "|cff6bbceeRange|r",
  --["util"] = "|cffff7d0aAll|r"
}

ZN.ColoredRolesOrder = {
  "heal",
  "tank",
  "melee",
  "range",
  --"util",
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

ZN.PlayerClassesColored = {
  ["all"] = "|cff"..ZN.Colors.ACTIVE.."All|r",
  ["dk"]= "|cff"..ZN.Colors.dk.."Death Knight|r",
  ["dh"]= "|cff"..ZN.Colors.dh.."Demon Hunter|r",
  ["druid"]= "|cff"..ZN.Colors.druid.."Druid|r",
  ["hunter"]= "|cff"..ZN.Colors.hunter.."Hunter|r",
  ["mage"]= "|cff"..ZN.Colors.mage.."Mage|r",
  ["monk"]= "|cff"..ZN.Colors.monk.."Monk|r",
  ["paladin"]= "|cff"..ZN.Colors.paladin.."Paladin|r",
  ["priest"]= "|cff"..ZN.Colors.priest.."Holy Priest|r",
  ["diszi"]= "|cff"..ZN.Colors.priest.."Disc Priest|r",
  ["shadow"]= "|cff"..ZN.Colors.priest.."Shadow Priest|r",
  ["rogue"]= "|cff"..ZN.Colors.rogue.."Rogue|r",
  ["shaman"]= "|cff"..ZN.Colors.shaman.."Shaman|r",
  ["warlock"]= "|cff"..ZN.Colors.warlock.."Warlock|r",
  ["warrior"]= "|cff"..ZN.Colors.warrior.."Warrior|r",
}

ZN.PlayerClassesColoredOrder = {
	"all",
  "dk",
  "dh",
  "druid",
  "hunter",
  "mage",
  "monk",
  "paladin",
  "diszi",
  "priest",
  "shadow",
  "rogue",
  "shaman",
  "warlock",
  "warrior",
}

ZN.PlayerClassesColored2 = {
  ["shriek1"] = "Shriekwing Test",
  ["shriek2"]= "Shriekwing Zwei",
  ["sludge1"]= "Sludgefist Template",
  ["denathrius"]= "Denathrius der Penis",
  ["azshara"]= "Tentakelfrau",
}

ZN.PlayerClassesColored2Order = {
  "shriek1",
  "shriek2",
  "sludge1",
  "denathrius",
  "azshara",
}

function ZN.initMinimapButton()
 ZNotes.minimap = ZNotes.minimap or {
        hide = false,
      }
end

ZN.DefaultPlayerSpells={
  {
    ["type"] = "heal",
    ["id"] = 81782,
    ["class"] = "diszi",
    ["role"] = "heal",
    ["cd"] = 180,
    ["color"] = "ffffff",
    ["aoe"] = true,
    ["rating"] = 490,
    ["station"] = true,
    ["name"] = "barrier",
  }, -- [1]
  {
    ["type"] = "heal",
    ["id"] = 47536,
    ["class"] = "diszi",
    ["role"] = "heal",
    ["cd"] = 90,
    ["color"] = "ffffff",
    ["aoe"] = true,
    ["rating"] = 430,
    ["station"] = false,
    ["name"] = "rapture",
  }, -- [2]
  {
    ["type"] = "heal",
    ["id"] = 246287,
    ["class"] = "diszi",
    ["role"] = "heal",
    ["cd"] = 90,
    ["color"] = "ffffff",
    ["aoe"] = true,
    ["rating"] = 420,
    ["station"] = false,
    ["name"] = "evang",
  }, -- [3]
  {
    ["type"] = "util",
    ["id"] = 33206,
    ["class"] = "diszi",
    ["role"] = "heal",
    ["cd"] = 180,
    ["color"] = "ffffff",
    ["aoe"] = false,
    ["rating"] = 370,
    ["station"] = false,
    ["name"] = "painsup",
  }, -- [4]
  {
    ["type"] = "heal",
    ["id"] = 740,
    ["class"] = "druid",
    ["role"] = "heal",
    ["cd"] = 180,
    ["color"] = "ff7d0a",
    ["aoe"] = true,
    ["rating"] = 460,
    ["station"] = true,
    ["name"] = "tranq",
  }, -- [5]
  {
    ["type"] = "heal",
    ["id"] = 33891,
    ["class"] = "druid",
    ["role"] = "heal",
    ["cd"] = 180,
    ["color"] = "ff7d0a",
    ["aoe"] = true,
    ["rating"] = 400,
    ["station"] = false,
    ["name"] = "tree",
  }, -- [6]
  {
    ["type"] = "util",
    ["id"] = 102342,
    ["class"] = "druid",
    ["role"] = "heal",
    ["cd"] = 60,
    ["color"] = "ff7d0a",
    ["aoe"] = false,
    ["rating"] = 350,
    ["station"] = false,
    ["name"] = "ironbark",
  }, -- [7]
  {
    ["type"] = "heal",
    ["id"] = 98008,
    ["class"] = "shaman",
    ["role"] = "heal",
    ["cd"] = 180,
    ["color"] = "0070de",
    ["aoe"] = true,
    ["rating"] = 480,
    ["station"] = true,
    ["name"] = "slink",
  }, -- [8]
  {
    ["type"] = "heal",
    ["id"] = 198838,
    ["class"] = "shaman",
    ["role"] = "heal",
    ["cd"] = 60,
    ["color"] = "0070de",
    ["aoe"] = true,
    ["rating"] = 380,
    ["station"] = true,
    ["name"] = "wall",
  }, -- [9]
  {
    ["type"] = "heal",
    ["id"] = 108280,
    ["class"] = "shaman",
    ["role"] = "heal",
    ["cd"] = 180,
    ["color"] = "0070de",
    ["aoe"] = true,
    ["rating"] = 450,
    ["station"] = false,
    ["name"] = "htide",
  }, -- [10]
  {
    ["type"] = "heal",
    ["id"] = 115310,
    ["class"] = "monk",
    ["role"] = "heal",
    ["cd"] = 180,
    ["color"] = "00ff96",
    ["aoe"] = true,
    ["rating"] = 390,
    ["station"] = false,
    ["name"] = "revival",
  }, -- [11]
  {
    ["type"] = "util",
    ["id"] = 116849,
    ["class"] = "monk",
    ["role"] = "heal",
    ["cd"] = 120,
    ["color"] = "00ff96",
    ["aoe"] = false,
    ["rating"] = 340,
    ["station"] = false,
    ["name"] = "cocoon",
  }, -- [12]
  {
    ["type"] = "heal",
    ["id"] = 64843,
    ["class"] = "priest",
    ["role"] = "heal",
    ["cd"] = 180,
    ["color"] = "ffffff",
    ["aoe"] = true,
    ["rating"] = 470,
    ["station"] = true,
    ["name"] = "hymne",
  }, -- [13]
  {
    ["type"] = "heal",
    ["id"] = 265202,
    ["class"] = "priest",
    ["role"] = "heal",
    ["cd"] = 720,
    ["color"] = "ffffff",
    ["aoe"] = true,
    ["rating"] = 440,
    ["station"] = false,
    ["name"] = "salvation",
  }, -- [14]
  {
    ["type"] = "util",
    ["id"] = 47788,
    ["class"] = "priest",
    ["role"] = "heal",
    ["cd"] = 180,
    ["color"] = "ffffff",
    ["aoe"] = false,
    ["rating"] = 360,
    ["station"] = false,
    ["name"] = "engel",
  }, -- [15]
  {
    ["type"] = "heal",
    ["id"] = 31821,
    ["class"] = "paladin",
    ["role"] = "heal",
    ["cd"] = 180,
    ["color"] = "f58cba",
    ["aoe"] = true,
    ["rating"] = 500,
    ["station"] = false,
    ["name"] = "mastery",
  }, -- [16]
  {
    ["type"] = "heal",
    ["id"] = 31884,
    ["class"] = "paladin",
    ["role"] = "heal",
    ["cd"] = 180,
    ["color"] = "f58cba",
    ["aoe"] = true,
    ["rating"] = 410,
    ["station"] = false,
    ["name"] = "wings",
  }, -- [17]
  {
    ["type"] = "util",
    ["id"] = 6940,
    ["class"] = "paladin",
    ["role"] = "heal",
    ["cd"] = 300,
    ["color"] = "f58cba",
    ["aoe"] = false,
    ["rating"] = 300,
    ["station"] = false,
    ["name"] = "sacrifice",
  }, -- [18]
  {
    ["type"] = "imun",
    ["id"] = 642,
    ["class"] = "paladin",
    ["role"] = "heal",
    ["cd"] = 300,
    ["color"] = "f58cba",
    ["aoe"] = false,
    ["rating"] = 270,
    ["station"] = false,
    ["name"] = "bubble",
  }, -- [19]
  {
    ["type"] = "util",
    ["id"] = 97462,
    ["class"] = "warrior",
    ["role"] = "melee",
    ["cd"] = 180,
    ["color"] = "c79c6e",
    ["aoe"] = true,
    ["rating"] = 330,
    ["station"] = false,
    ["name"] = "rally",
  }, -- [20]
  {
    ["type"] = "imun",
    ["id"] = 642,
    ["class"] = "paladin",
    ["role"] = "melee",
    ["cd"] = 300,
    ["color"] = "c79c6e",
    ["aoe"] = false,
    ["rating"] = 270,
    ["station"] = false,
    ["name"] = "bubble",
  }, -- [21]
  {
    ["type"] = "util",
    ["id"] = 196718,
    ["class"] = "dh",
    ["role"] = "melee",
    ["cd"] = 180,
    ["color"] = "a330c9",
    ["aoe"] = true,
    ["rating"] = 310,
    ["station"] = true,
    ["name"] = "darkness",
  }, -- [22]
  {
    ["type"] = "imun",
    ["id"] = 31224,
    ["class"] = "rogue",
    ["role"] = "melee",
    ["cd"] = 120,
    ["color"] = "fff569",
    ["aoe"] = false,
    ["rating"] = 260,
    ["station"] = false,
    ["name"] = "cloak",
  }, -- [23]
  {
    ["type"] = "util",
    ["id"] = 51052,
    ["class"] = "dk",
    ["role"] = "melee",
    ["cd"] = 120,
    ["color"] = "c41f3b",
    ["aoe"] = true,
    ["rating"] = 320,
    ["station"] = true,
    ["name"] = "amz",
  }, -- [24]
  {
    ["type"] = "util",
    ["id"] = 15286,
    ["class"] = "priest",
    ["role"] = "range",
    ["cd"] = 180,
    ["color"] = "ffffff",
    ["aoe"] = true,
    ["rating"] = 290,
    ["station"] = false,
    ["name"] = "vamp",
  }, -- [27]
  {
    ["type"] = "imun",
    ["id"] = 186265,
    ["class"] = "hunter",
    ["role"] = "range",
    ["cd"] = 180,
    ["color"] = "abd473",
    ["aoe"] = false,
    ["rating"] = 280,
    ["station"] = false,
    ["name"] = "turtle",
  }, -- [28]
  {
    ["type"] = "imun",
    ["id"] = 45438,
    ["class"] = "mage",
    ["role"] = "range",
    ["cd"] = 240,
    ["color"] = "f58cba",
    ["aoe"] = false,
    ["rating"] = 250,
    ["station"] = true,
    ["name"] = "iceblock",
  }, -- [29]
  {
    ["type"] = "util",
    ["id"] = 97462,
    ["class"] = "warrior",
    ["role"] = "tank",
    ["cd"] = 180,
    ["color"] = "c79c6e",
    ["aoe"] = true,
    ["rating"] = 330,
    ["station"] = false,
    ["name"] = "rally",
  }, -- [30]
  {
    ["type"] = "util",
    ["id"] = 6940,
    ["class"] = "paladin",
    ["role"] = "tank",
    ["cd"] = 300,
    ["color"] = "c79c6e",
    ["aoe"] = false,
    ["rating"] = 300,
    ["station"] = false,
    ["name"] = "sacrifice",
  }, -- [31]
  {
    ["type"] = "imun",
    ["id"] = 642,
    ["class"] = "paladin",
    ["role"] = "tank",
    ["cd"] = 300,
    ["color"] = "c79c6e",
    ["aoe"] = false,
    ["rating"] = 270,
    ["station"] = false,
    ["name"] = "bubble",
  }, -- [32]
  {
    ["type"] = "util",
    ["id"] = 51052,
    ["class"] = "dk",
    ["role"] = "tank",
    ["cd"] = 120,
    ["color"] = "c41f3b",
    ["aoe"] = true,
    ["rating"] = 320,
    ["station"] = true,
    ["name"] = "amz",
  }, -- [33]
}

function ZN.initPlayerSpells()
  ZNotes.PlayerSpells={}
  for i=1, #ZN.DefaultPlayerSpells do
    ZNotes.PlayerSpells[i]={}
    for k,v in pairs(ZN.DefaultPlayerSpells[i]) do
      ZNotes.PlayerSpells[i][k]=v
    end
  end

end

function ZN.initBossTemplates()
ZNotes.BossTemplates = ZNotes.BossTemplates or {
  ["SampleBoss"] = {
    {
      ["name"]= "Charge",
      ["id"]= "100",
      ["time"]= 20,
      ["prio"]= 1,    
      ["station"]= false,
      ["need"]= {
        {
          ["type"]= "heal",
          ["ratingOverwrite"] = {
            ["monk"] = 9000
          }
        },
        {
          ["type"]= "imun",
          ["ratingOverwrite"] = {
            ["tankpaladin"] = 9000
          }
        },
        {
          ["type"]= "util",
          ["ratingOverwrite"] = {
            ["range"] = 9000
          }
        }
      },
      ["aoe"]= false,
      ["repeatX"]= 4,
      ["repeatAfter"]= 40
    },
    {
      ["name"]= "Execute",
      ["id"]= "163201",
      ["time"]= 35,
      ["prio"]= 2,    
      ["station"]= true,
      ["need"]= {
        {
          ["type"]= "heal"
        },
        {
          ["type"]= "util"
        }
      },
      ["aoe"]= true,
      ["repeatX"]= 2,
      ["repeatAfter"]= 60
    },
    {
      ["name"]= "Heroic Leap",
      ["id"]= "6544",
      ["time"]= 125,
      ["prio"]= 2,    
      ["station"]= true,
      ["need"]= {
        {
          ["type"]= "imun"
        },
        {
          ["type"]= "imun"
        }
      },
      ["aoe"]= true,
      ["repeatX"]= 2,
      ["repeatAfter"]= 30
    },
    {
      ["text"]= "Phase 1",
      ["time"]= 0,
      ["prio"]= 9000,
      ["trenner"]= true,
      ["raidicon"]= "{1}"
    },
      {
      ["text"]= "Phase 2",
      ["time"]= 110,
      ["prio"]= 9000,
      ["trenner"]= true,
      ["raidicon"]= "{8}"
    },
  }
}
end

ZN.BossTemplatesOrder = {
  "SampleBoss",
}