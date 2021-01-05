-- Powershell dir -Recurse *.lua | Get-Content | Measure-Object -Line
local _, ZN, L = ...

ZN.Title="Zero Notes"
ZN.Version="1.1.1"

function ZN:serializeTable(val, name, skipnewlines, depth)
  skipnewlines = skipnewlines or false
  depth = depth or 0

  local tmp = string.rep(" ", depth)

  if name then 
    if type(name) == "number" then
      name = "["..name.."]"
    end
      tmp = tmp .. name .. " = "       
  end
  if depth == 0 then      
    tmp = "return "
  end

  if type(val) == "table" then
      tmp = tmp .. "{" .. (not skipnewlines and "\n" or "")

      for k, v in pairs(val) do
          tmp =  tmp .. ZN:serializeTable(v, k, skipnewlines, depth + 1) .. "," .. (not skipnewlines and "\n" or "")
      end

      tmp = tmp .. string.rep(" ", depth) .. "}"
  elseif type(val) == "number" then
      tmp = tmp .. tostring(val)
  elseif type(val) == "string" then
      tmp = tmp .. string.format("%q", val)
  elseif type(val) == "boolean" then
      tmp = tmp .. (val and "true" or "false")
  else
      tmp = tmp .. "\"[inserializeable datatype:" .. type(val) .. "]\""
  end

  return tmp
end

local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/' -- You will need this for encoding/decoding
-- encoding
function ZN:enc(data)
  local encstr = "ZN:"
  local enc = ((data:gsub('.', function(x) 
    local r,b='',x:byte()
    for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
    return r;
  end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
    if (#x < 6) then return '' end
    local c=0
    for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
    return b:sub(c+1,c+1)
  end)..({ '', '==', '=' })[#data%3+1])
  encstr = encstr..enc
  return encstr
end

-- decoding
function ZN:dec(data)
  data = string.gsub(data, 'ZN:', '')
  data = string.gsub(data, '[^'..b..'=]', '')
  return (data:gsub('.', function(x)
    if (x == '=') then return '' end
    local r,f='',(b:find(x)-1)
    for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
    return r;
  end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
    if (#x ~= 8) then return '' end
    local c=0
    for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
    return string.char(c)
  end))
end

function table.copy(t)
  local u = { }
  for k, v in pairs(t) do u[k] = v end
  return setmetatable(u, getmetatable(t))
end

function table.deepcopy(orig)
  local orig_type = type(orig)
  local copy
  if orig_type == 'table' then
      copy = {}
      for orig_key, orig_value in next, orig, nil do
          copy[table.deepcopy(orig_key)] = table.deepcopy(orig_value)
      end
      setmetatable(copy, table.deepcopy(getmetatable(orig)))
  else -- number, string, boolean, etc
      copy = orig
  end
  return copy
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

ZN.encounter_list = ""
ZN.zoneId_list = ""
ZN.zoneGroupId_list = ""

-- code largely adapted from WeakAuras https://www.curseforge.com/wow/addons/weakauras-2
function ZN:getEncounterIDs()
  --print(string.len(ZN.encounter_list))
  if ZN.encounter_list ~= "" and string.len(ZN.encounter_list)>10 then
    return ZN.encounter_list
  else
    --print("else")
    ZN.encounter_list = ""
    ZN.zoneId_list = ""
    ZN.zoneGroupId_list = ""
  end

  EJ_SelectTier(EJ_GetCurrentTier())

  for _, inRaid in ipairs({false, true}) do
    local instance_index = 1
    local instance_id = EJ_GetInstanceByIndex(instance_index, inRaid)
    local title = inRaid and "Raids" or "Dungeons"
    ZN.zoneId_list = ("%s|cffffd200%s|r\n"):format(ZN.zoneId_list, title)
    ZN.zoneGroupId_list = ("%s|cffffd200%s|r\n"):format(ZN.zoneGroupId_list, title)

    while instance_id do
      EJ_SelectInstance(instance_id)
      local instance_name, _, _, _, _, _, dungeonAreaMapID = EJ_GetInstanceInfo(instance_id)
      local ej_index = 1
      local boss, _, _, _, _, _, encounter_id = EJ_GetEncounterInfoByIndex(ej_index, instance_id)

      -- zone ids and zone group ids
      if dungeonAreaMapID and dungeonAreaMapID ~= 0 then
        local mapGroupId = C_Map.GetMapGroupID(dungeonAreaMapID)
        if mapGroupId then
          ZN.zoneGroupId_list = ("%s%s: %d\n"):format(ZN.zoneGroupId_list, instance_name, mapGroupId)
          local maps = ""
          for k, map in ipairs(C_Map.GetMapGroupMembersInfo(mapGroupId)) do
            if map.mapID then
              maps = maps .. map.mapID .. ", "
            end
          end
          maps = maps:match "^(.*), \n?$" or "" -- trim last ", "
          ZN.zoneId_list = ("%s%s: %s\n"):format(ZN.zoneId_list, instance_name, maps)
        else
          ZN.zoneId_list = ("%s%s: %d\n"):format(ZN.zoneId_list, instance_name, dungeonAreaMapID)
        end
      end

      -- Encounter ids
      if inRaid then
        while boss do
          if encounter_id then
            if instance_name then
              ZN.encounter_list = ("%s|cffffd200%s|r\n"):format(ZN.encounter_list, instance_name)
              instance_name = nil -- Only add it once per section
            end
            ZN.encounter_list = ("%s%s: %d\n"):format(ZN.encounter_list, boss, encounter_id)
          end
          ej_index = ej_index + 1
          boss, _, _, _, _, _, encounter_id = EJ_GetEncounterInfoByIndex(ej_index, instance_id)
        end
        ZN.encounter_list = ZN.encounter_list .. "\n"
      end
      instance_index = instance_index + 1
      instance_id = EJ_GetInstanceByIndex(instance_index, inRaid)
    end
    ZN.zoneId_list = ZN.zoneId_list .. "\n"
    ZN.zoneGroupId_list = ZN.zoneGroupId_list .. "\n"
  end
  --ZN:DebugPrint(encounter_list)
  return ZN.encounter_list
  
end

ZN.DropDowns = {}
ZN.DropDownsEdit = {}
ZN.GroupPopups = {}
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
  ["black"] = "000000" -- #000000
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

function ZN.initLastTemplates()
  ZNotes.lastTemplates = ZNotes.lastTemplates or {
    ["lastGroupTemplate"] = "sample group",
    ["lastBossTemplate"] = "sampleboss",
    ["homeLastGroupTemplate"] = "sample group",
    ["homeLastBossTemplate"] = "sampleboss",
    ["homeIncludeMissing"] = true,
    ["homeSendToExRT"] = true,
    ["homeSendToZND"] = true,
  }
  ZN.selectedGroupTemplate = ZNotes.lastTemplates.lastGroupTemplate
  ZN.homeSelectedBossTemplate = ZNotes.lastTemplates.homeLastBossTemplate
  ZN.homeSelectedGroupTemplate = ZNotes.lastTemplates.homeLastGroupTemplate
end

ZN.DefaultPlayerSpells={
  {
    ["type"] = "heal",
    ["id"] = 81782,
    ["class"] = "diszi",
    ["stackable"] = true,
    ["role"] = "heal",
    ["name"] = "barrier",
    ["color"] = "ffffff",
    ["aoe"] = true,
    ["rating"] = 490,
    ["station"] = true,
    ["cd"] = 180,
  }, -- [1]
  {
    ["type"] = "heal",
    ["id"] = 47536,
    ["class"] = "diszi",
    ["stackable"] = true,
    ["role"] = "heal",
    ["name"] = "rapture",
    ["color"] = "ffffff",
    ["aoe"] = true,
    ["rating"] = 430,
    ["station"] = false,
    ["cd"] = 90,
  }, -- [2]
  {
    ["type"] = "heal",
    ["id"] = 246287,
    ["class"] = "diszi",
    ["stackable"] = true,
    ["role"] = "heal",
    ["name"] = "evang",
    ["color"] = "ffffff",
    ["aoe"] = true,
    ["rating"] = 420,
    ["station"] = false,
    ["cd"] = 90,
  }, -- [3]
  {
    ["type"] = "util",
    ["id"] = 33206,
    ["class"] = "diszi",
    ["role"] = "heal",
    ["name"] = "painsup",
    ["color"] = "ffffff",
    ["aoe"] = false,
    ["rating"] = 370,
    ["station"] = false,
    ["cd"] = 180,
  }, -- [4]
  {
    ["type"] = "heal",
    ["id"] = 740,
    ["class"] = "druid",
    ["stackable"] = true,
    ["role"] = "heal",
    ["name"] = "tranq",
    ["color"] = "ff7d0a",
    ["aoe"] = true,
    ["rating"] = 460,
    ["station"] = true,
    ["cd"] = 180,
  }, -- [5]
  {
    ["type"] = "heal",
    ["id"] = 33891,
    ["class"] = "druid",
    ["stackable"] = true,
    ["role"] = "heal",
    ["name"] = "tree",
    ["color"] = "ff7d0a",
    ["aoe"] = true,
    ["rating"] = 400,
    ["station"] = false,
    ["cd"] = 180,
  }, -- [6]
  {
    ["type"] = "util",
    ["id"] = 102342,
    ["class"] = "druid",
    ["role"] = "heal",
    ["name"] = "ironbark",
    ["color"] = "ff7d0a",
    ["aoe"] = false,
    ["rating"] = 350,
    ["station"] = false,
    ["cd"] = 60,
  }, -- [7]
  {
    ["type"] = "heal",
    ["id"] = 98008,
    ["class"] = "shaman",
    ["role"] = "heal",
    ["name"] = "slink",
    ["color"] = "0070de",
    ["aoe"] = true,
    ["rating"] = 480,
    ["station"] = true,
    ["cd"] = 180,
  }, -- [8]
  {
    ["type"] = "heal",
    ["id"] = 198838,
    ["class"] = "shaman",
    ["stackable"] = true,
    ["role"] = "heal",
    ["name"] = "wall",
    ["color"] = "0070de",
    ["aoe"] = true,
    ["rating"] = 380,
    ["station"] = true,
    ["cd"] = 60,
  }, -- [9]
  {
    ["type"] = "heal",
    ["id"] = 108280,
    ["class"] = "shaman",
    ["stackable"] = true,
    ["role"] = "heal",
    ["name"] = "htide",
    ["color"] = "0070de",
    ["aoe"] = true,
    ["rating"] = 450,
    ["station"] = false,
    ["cd"] = 180,
  }, -- [10]
  {
    ["type"] = "heal",
    ["id"] = 115310,
    ["class"] = "monk",
    ["stackable"] = true,
    ["role"] = "heal",
    ["name"] = "revival",
    ["color"] = "00ff96",
    ["aoe"] = true,
    ["rating"] = 390,
    ["station"] = false,
    ["cd"] = 180,
  }, -- [11]
  {
    ["type"] = "util",
    ["id"] = 116849,
    ["class"] = "monk",
    ["role"] = "heal",
    ["name"] = "cocoon",
    ["color"] = "00ff96",
    ["aoe"] = false,
    ["rating"] = 340,
    ["station"] = false,
    ["cd"] = 120,
  }, -- [12]
  {
    ["type"] = "heal",
    ["id"] = 64843,
    ["class"] = "priest",
    ["stackable"] = true,
    ["role"] = "heal",
    ["name"] = "hymne",
    ["color"] = "ffffff",
    ["aoe"] = true,
    ["rating"] = 470,
    ["station"] = true,
    ["cd"] = 180,
  }, -- [13]
  {
    ["type"] = "heal",
    ["id"] = 265202,
    ["class"] = "priest",
    ["stackable"] = true,
    ["role"] = "heal",
    ["name"] = "salvation",
    ["color"] = "ffffff",
    ["aoe"] = true,
    ["rating"] = 440,
    ["station"] = false,
    ["cd"] = 720,
  }, -- [14]
  {
    ["type"] = "util",
    ["id"] = 47788,
    ["class"] = "priest",
    ["role"] = "heal",
    ["name"] = "engel",
    ["color"] = "ffffff",
    ["aoe"] = false,
    ["rating"] = 360,
    ["station"] = false,
    ["cd"] = 180,
  }, -- [15]
  {
    ["type"] = "heal",
    ["id"] = 31821,
    ["class"] = "paladin",
    ["stackable"] = true,
    ["role"] = "heal",
    ["name"] = "mastery",
    ["color"] = "f58cba",
    ["aoe"] = true,
    ["rating"] = 500,
    ["station"] = false,
    ["cd"] = 180,
  }, -- [16]
  {
    ["type"] = "heal",
    ["id"] = 31884,
    ["class"] = "paladin",
    ["stackable"] = true,
    ["role"] = "heal",
    ["name"] = "wings",
    ["color"] = "f58cba",
    ["aoe"] = true,
    ["rating"] = 410,
    ["station"] = false,
    ["cd"] = 180,
  }, -- [17]
  {
    ["type"] = "util",
    ["id"] = 6940,
    ["class"] = "paladin",
    ["role"] = "heal",
    ["name"] = "sacrifice",
    ["color"] = "f58cba",
    ["aoe"] = false,
    ["rating"] = 300,
    ["station"] = false,
    ["cd"] = 300,
  }, -- [18]
  {
    ["type"] = "imun",
    ["id"] = 642,
    ["class"] = "paladin",
    ["role"] = "heal",
    ["name"] = "bubble",
    ["color"] = "f58cba",
    ["aoe"] = false,
    ["rating"] = 270,
    ["station"] = false,
    ["cd"] = 300,
  }, -- [19]
  {
    ["type"] = "util",
    ["id"] = 97462,
    ["class"] = "warrior",
    ["role"] = "melee",
    ["name"] = "rally",
    ["color"] = "c79c6e",
    ["aoe"] = true,
    ["rating"] = 330,
    ["station"] = false,
    ["cd"] = 180,
  }, -- [20]
  {
    ["type"] = "imun",
    ["id"] = 642,
    ["class"] = "paladin",
    ["role"] = "melee",
    ["name"] = "bubble",
    ["color"] = "c79c6e",
    ["aoe"] = false,
    ["rating"] = 270,
    ["station"] = false,
    ["cd"] = 300,
  }, -- [21]
  {
    ["type"] = "util",
    ["id"] = 196718,
    ["class"] = "dh",
    ["stackable"] = true,
    ["role"] = "melee",
    ["name"] = "darkness",
    ["color"] = "a330c9",
    ["aoe"] = true,
    ["rating"] = 310,
    ["station"] = true,
    ["cd"] = 180,
  }, -- [22]
  {
    ["type"] = "imun",
    ["id"] = 31224,
    ["class"] = "rogue",
    ["role"] = "melee",
    ["name"] = "cloak",
    ["color"] = "fff569",
    ["aoe"] = false,
    ["rating"] = 260,
    ["station"] = false,
    ["cd"] = 120,
  }, -- [23]
  {
    ["type"] = "util",
    ["id"] = 51052,
    ["class"] = "dk",
    ["stackable"] = true,
    ["role"] = "melee",
    ["name"] = "amz",
    ["color"] = "c41f3b",
    ["aoe"] = true,
    ["rating"] = 320,
    ["station"] = true,
    ["cd"] = 120,
  }, -- [24]
  {
    ["type"] = "util",
    ["id"] = 15286,
    ["class"] = "shadow",
    ["stackable"] = true,
    ["role"] = "range",
    ["name"] = "vamp",
    ["color"] = "ffffff",
    ["aoe"] = true,
    ["rating"] = 290,
    ["station"] = false,
    ["cd"] = 180,
  }, -- [25]
  {
    ["type"] = "imun",
    ["id"] = 186265,
    ["class"] = "hunter",
    ["role"] = "range",
    ["name"] = "turtle",
    ["color"] = "abd473",
    ["aoe"] = false,
    ["rating"] = 280,
    ["station"] = false,
    ["cd"] = 180,
  }, -- [26]
  {
    ["type"] = "imun",
    ["id"] = 45438,
    ["class"] = "mage",
    ["role"] = "range",
    ["name"] = "iceblock",
    ["color"] = "f58cba",
    ["aoe"] = false,
    ["rating"] = 250,
    ["station"] = true,
    ["cd"] = 240,
  }, -- [27]
  {
    ["type"] = "util",
    ["id"] = 97462,
    ["class"] = "warrior",
    ["role"] = "tank",
    ["name"] = "rally",
    ["color"] = "c79c6e",
    ["aoe"] = true,
    ["rating"] = 330,
    ["station"] = false,
    ["cd"] = 180,
  }, -- [28]
  {
    ["type"] = "util",
    ["id"] = 6940,
    ["class"] = "paladin",
    ["role"] = "tank",
    ["name"] = "sacrifice",
    ["color"] = "c79c6e",
    ["aoe"] = false,
    ["rating"] = 300,
    ["station"] = false,
    ["cd"] = 300,
  }, -- [29]
  {
    ["type"] = "util",
    ["id"] = 6940,
    ["class"] = "paladin",
    ["role"] = "melee",
    ["name"] = "sacrifice",
    ["color"] = "c79c6e",
    ["aoe"] = false,
    ["rating"] = 300,
    ["station"] = false,
    ["cd"] = 300,
  }, -- [30]
  {
    ["type"] = "imun",
    ["id"] = 642,
    ["class"] = "paladin",
    ["role"] = "tank",
    ["name"] = "bubble",
    ["color"] = "c79c6e",
    ["aoe"] = false,
    ["rating"] = 270,
    ["station"] = false,
    ["cd"] = 300,
  }, -- [31]
  {
    ["type"] = "util",
    ["id"] = 51052,
    ["class"] = "dk",
    ["stackable"] = true,
    ["role"] = "tank",
    ["name"] = "amz",
    ["color"] = "c41f3b",
    ["aoe"] = true,
    ["rating"] = 320,
    ["station"] = true,
    ["cd"] = 120,
  }, -- [32]
}

function ZN.initPlayerSpells()
  ZNotes.PlayerSpells={}
  for i=1, #ZN.DefaultPlayerSpells do
    ZNotes.PlayerSpells[i]={}
    for k,v in pairs(ZN.DefaultPlayerSpells[i]) do
      ZNotes.PlayerSpells[i][k]=v
    end
  end
  ZNotes.PlayerSpellsMigrated = true
end

function ZN.initBossTemplates()
  if ZNotes.BossTemplates and not ZNotes.BossTemplatesMigrated then
    for k,v in pairs(ZNotes.BossTemplates) do
      local BossTrennerIndex={}
      local spellI=1
      for i=1, #v do
          if v[i].trenner then
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
          local pivot = v[BossTrennerIndex[BossTrennerSortArray[i]]]["time"]
          for j=i+1,#BossTrennerIndex do
            local comp = v[BossTrennerIndex[BossTrennerSortArray[j]]]["time"]
            if  type(comp)=="number"  and comp<pivot then
              local saveUnit = BossTrennerSortArray[i]
              BossTrennerSortArray[i] = BossTrennerSortArray[j]
              BossTrennerSortArray[j] = saveUnit
            end
          end 
        end 
      end 

      for i=1, #BossTrennerSortArray do
        v[BossTrennerIndex[BossTrennerSortArray[i]]].phase=i
        v[BossTrennerIndex[BossTrennerSortArray[i]]].no=i
        if v[BossTrennerIndex[BossTrennerSortArray[i+1]]] then
          v[BossTrennerIndex[BossTrennerSortArray[i]]].duration = v[BossTrennerIndex[BossTrennerSortArray[i+1]]].time - v[BossTrennerIndex[BossTrennerSortArray[i]]].time
        else
          v[BossTrennerIndex[BossTrennerSortArray[i]]].duration = 0
        end
        v[BossTrennerIndex[BossTrennerSortArray[i]]].time=0
      end

      for i=1, #v do
        if not v[i].trenner then
          v[i].phase=0
        end
      end
    end

    ZNotes.BossTemplatesMigrated = true
  end
  ZNotes.BossTemplates = ZNotes.BossTemplates or {
    ["sampleboss"] = {
			{
				["repeatAfter"] = 20,
				["id"] = "100",
				["need"] = {
					{
						["ratingOverwrite"] = {
							["monk"] = 9000,
						},
						["type"] = "heal",
					}, -- [1]
					{
						["ratingOverwrite"] = {
							["tankpaladin"] = 9000,
						},
						["type"] = "imun",
					}, -- [2]
					{
						["ratingOverwrite"] = {
							["range"] = 9000,
						},
						["type"] = "util",
					}, -- [3]
				},
				["repeatX"] = 3,
				["prio"] = 1,
				["name"] = "Charge",
				["aoe"] = false,
				["phase"] = 1,
				["station"] = false,
				["time"] = 20,
			}, -- [1]
			{
				["repeatAfter"] = 0,
				["id"] = "163201",
				["need"] = {
					{
						["type"] = "heal",
					}, -- [1]
					{
						["type"] = "util",
					}, -- [2]
				},
				["repeatX"] = 1,
				["prio"] = 2,
				["name"] = "Execute",
				["aoe"] = true,
				["phase"] = 2,
				["station"] = true,
				["time"] = 5,
			}, -- [2]
			{
				["repeatAfter"] = 0,
				["id"] = "6544",
				["need"] = {
					{
						["type"] = "imun",
					}, -- [1]
					{
						["type"] = "imun",
					}, -- [2]
				},
				["repeatX"] = 1,
				["prio"] = 3,
				["name"] = "Heroic Leap",
				["aoe"] = true,
				["phase"] = 2,
				["station"] = true,
				["time"] = 20,
			}, -- [3]
			{
				["trenner"] = true,
				["prio"] = 9000,
				["time"] = 0,
				["no"] = 1,
				["phase"] = 1,
				["text"] = "Phase 1",
				["duration"] = 70,
				["raidicon"] = "{rt1}",
			}, -- [4]
			{
				["trenner"] = true,
				["prio"] = 9000,
				["time"] = 70,
				["no"] = 2,
				["phase"] = 2,
				["text"] = "Phase 2",
				["duration"] = 30,
				["raidicon"] = "{rt8}",
			}, -- [5]
			{
				["trenner"] = true,
				["prio"] = 9000,
				["time"] = 100,
				["phase"] = 1,
				["no"] = 3,
				["text"] = "Phase 1",
				["duration"] = 0,
				["raidicon"] = "{rt1}",
			}, -- [6]
			["bossid"] = "1234",
		}
}
end

function ZN.initGroupTemplates()
ZNotes.GroupTemplates = ZNotes.GroupTemplates or {
  ["Use Current Group"] = {}, 
  ["sample group"] = {
    {
      ["name"] = "Brattan",
      ["class"] = "warrior",
      ["spec"] = "arms",
    },
    {
      ["name"] = "Starplayer",
      ["class"] = "hunter",
      ["spec"] = "bm",
    },
    {
      ["name"] = "Kongfuzius",
      ["class"] = "monk",
      ["spec"] = "bm",
    },
    {
      ["name"] = "Pepe",
      ["class"] = "priest",
      ["spec"] = "shadow",
    },
    {
      ["name"] = "Nosoulshards",
      ["class"] = "warlock",
      ["spec"] = "affli",
    },
    {
      ["name"] = "xBeHiNdYoUsTyLeRx",
      ["class"] = "rogue",
      ["spec"] = "assa",
    },
    {
      ["name"] = "Tackschlitzpuff",
      ["class"] = "druid",
      ["spec"] = "feral",
    },
  }
}
end

function ZN.initSavedNotes()
ZNotes.SavedNotes = ZNotes.SavedNotes or {} end

ZN.SpecNames = {
  -- Death Knight
  [250] = 'Blood',
  [251] = 'Frost',
  [252] = 'Unholy',
  -- Demon Hunter
  [577] = 'Havoc',
  [581] = 'Vengeance',
  -- Druid 
  [102] = 'Balance',
  [103] = 'Feral',
  [104] = 'Guardian',
  [105] = 'Restoration',
  -- Hunter 
  [253] = 'Beast Mastery',
  [254] = 'Marksmanship',
  [255] = 'Survival',
  -- Mage 
  [62] = 'Arcane',
  [63] = 'Fire',
  [64] = 'Frost',
  -- Monk 
  [268] = 'Brewmaster',
  [269] = 'Windwalker',
  [270] = 'Mistweaver',
  -- Paladin 
  [65] = 'Holy',
  [66] = 'Protection',
  [70] = 'Retribution',
  -- Priest 
  [256] = 'Discipline',
  [257] = 'Holy',
  [258] = 'Shadow',
  -- Rogue 
  [259] = 'Assassination',
  [260] = 'Outlaw',
  [261] = 'Subtlety',
  -- Shaman 
  [262] = 'Elemental',
  [263] = 'Enhancement',
  [264] = 'Restoration',
  -- Warlock 
  [265] = 'Affliction',
  [266] = 'Demonology',
  [267] = 'Destruction',
  -- Warrior 
  [71] = 'Arms',
  [72] = 'Fury',
  [73] = 'Protection'
}

ZN.Specs = {
  ["zzz"] = {
    ["empty"] = ""
  },
  ["dk"] = {
    -- Death Knight
    ["blood"] = 'Blood',
    ["frost"] = 'Frost',
    ["unholy"] = 'Unholy',
  },
  ["dh"] = {
    -- Demon Hunter
    ["havoc"] = 'Havoc',
    ["vengeance"] = 'Veng',
  },
  ["druid"] = {
    -- Druid 
    ["balance"] = 'Balance',
    ["feral"] = 'Feral',
    ["guardian"] = 'Guardian',
    ["resto"] = 'Resto',
  },
  ["hunter"] = {
    -- Hunter 
    ["bm"] = 'BM',
    ["mm"] = 'MM',
    ["survial"] = 'Surv',
  },
  ["mage"] = {
    -- Mage 
    ["arcane"] = 'Arcane',
    ["fire"] = 'Fire',
    ["frost"] = 'Frost',
  },
  ["monk"] = {
    -- Monk 
    ["bm"] = 'BM',
    ["ww"] = 'WW',
    ["mw"] = 'MW',
  },
  ["paladin"] = {
    -- Paladin 
    ["holy"] = 'Holy',
    ["prot"] = 'Prot',
    ["ret"] = 'Ret',
  },
  ["priest"] = {
    -- Priest
    ["diszi"] = 'Disc',
    ["holy"] = 'Holy',
    ["shadow"] = 'Shadow',
  },
  ["rogue"] = {
    -- Rogue 
    ["assa"] = 'Assa',
    ["outlaw"] = 'Outlaw',
    ["sub"] = 'Sub',
  },
  ["shaman"] = {
    -- Shaman 
    ["ele"] = 'Ele',
    ["enh"] = 'Enh',
    ["resto"] = 'Resto',
  },
  ["warlock"] = {
    -- Warlock 
    ["affli"] = 'Affli',
    ["demo"] = 'Demo',
    ["destru"] = 'Destru',
  },
  ["warrior"] = {
    -- Warrior 
    ["arms"] = 'Arms',
    ["fury"] = 'Fury',
    ["prot"] = 'Prot'
  },
}

ZN.SpecsToRole = {
  ["zzz"] = {
    ["empty"] = ""
  },
  ["dk"] = {
    -- Death Knight
    ["blood"] = 'tank',
    ["frost"] = 'melee',
    ["unholy"] = 'melee',
  },
  ["dh"] = {
    -- Demon Hunter
    ["havoc"] = 'melee',
    ["Vengeance"] = 'tank',
  },
  ["druid"] = {
    -- Druid 
    ["balance"] = 'range',
    ["feral"] = 'melee',
    ["guardian"] = 'tank',
    ["resto"] = 'heal',
  },
  ["hunter"] = {
    -- Hunter 
    ["bm"] = 'range',
    ["mm"] = 'range',
    ["survial"] = 'melee',
  },
  ["mage"] = {
    -- Mage 
    ["arcane"] = 'range',
    ["fire"] = 'range',
    ["frost"] = 'range',
  },
  ["monk"] = {
    -- Monk 
    ["bm"] = 'tank',
    ["ww"] = 'melee',
    ["mw"] = 'heal',
  },
  ["paladin"] = {
    -- Paladin 
    ["holy"] = 'heal',
    ["prot"] = 'tank',
    ["ret"] = 'melee',
  },
  ["priest"] = {
    -- Priest
    ["diszi"] = 'heal',
    ["holy"] = 'heal',
    ["shadow"] = 'range',
  },
  ["rogue"] = {
    -- Rogue 
    ["assa"] = 'melee',
    ["outlaw"] = 'melee',
    ["sub"] = 'melee',
  },
  ["shaman"] = {
    -- Shaman 
    ["ele"] = 'range',
    ["enh"] = 'melee',
    ["resto"] = 'heal',
  },
  ["warlock"] = {
    -- Warlock 
    ["affli"] = 'range',
    ["demo"] = 'range',
    ["destru"] = 'range',
  },
  ["warrior"] = {
    -- Warrior 
    ["arms"] = 'melee',
    ["fury"] = 'melee',
    ["prot"] = 'tank'
  },
}

ZN.SpecsToClass = {
    ["priest"] = {
    -- Priest
    ["diszi"] = 'diszi',
    ["holy"] = 'priest',
    ["shadow"] = 'shadow',
  }
}

ZN.SpecIdToTemplateClass = {
  -- Death Knight
  [250] = 'blood',
  [251] = 'frost',
  [252] = 'unholy',
  -- Demon Hunter
  [577] = 'havoc',
  [581] = 'vengeance',
  -- Druid 
  [102] = 'balance',
  [103] = 'feral',
  [104] = 'guardian',
  [105] = 'resto',
  -- Hunter 
  [253] = 'bm',
  [254] = 'mm',
  [255] = 'survival',
  -- Mage 
  [62] = 'arcane',
  [63] = 'fire',
  [64] = 'frost',
  -- Monk 
  [268] = 'bm',
  [269] = 'ww',
  [270] = 'mw',
  -- Paladin 
  [65] = 'holy',
  [66] = 'prot',
  [70] = 'ret',
  -- Priest 
  [256] = 'diszi',
  [257] = 'holy',
  [258] = 'shadow',
  -- Rogue 
  [259] = 'assa',
  [260] = 'outlaw',
  [261] = 'sub',
  -- Shaman 
  [262] = 'ele',
  [263] = 'enh',
  [264] = 'resto',
  -- Warlock 
  [265] = 'affli',
  [266] = 'demo',
  [267] = 'destru',
  -- Warrior 
  [71] = 'arms',
  [72] = 'fury',
  [73] = 'prot'
}

ZN.RoleTable = {
  -- Death Knight
  [250] = 'tank',
  [251] = 'melee',
  [252] = 'melee',
  -- Demon Hunter
  [577] = 'melee',
  [581] = 'tank',
  -- Druid
  [102] = 'range',
  [103] = 'melee',
  [104] = 'tank',
  [105] = 'heal',
  -- Hunter
  [253] = 'range',
  [254] = 'range',
  [255] = 'melee',
  -- Mage
  [62] = 'range',
  [63] = 'range',
  [64] = 'range',
  -- Monk
  [268] = 'tank',
  [269] = 'melee',
  [270] = 'heal',
  -- Paladin
  [65] = 'heal',
  [66] = 'tank',
  [70] = 'melee',
  -- Priest
  [256] = 'heal',
  [257] = 'heal',
  [258] = 'range',
  -- Rogue
  [259] = 'melee',
  [260] = 'melee',
  [261] = 'melee',
  -- Shaman
  [262] = 'range',
  [263] = 'melee',
  [264] = 'heal',
  -- Warlock
  [265] = 'range',
  [266] = 'range',
  [267] = 'range',
  -- Warrior
  [71] = 'melee',
  [72] = 'melee',
  [73] = 'tank'
}

ZN.RegionString = {
  [1] = 'us',
  [2] = 'kr',
  [3] = 'eu',
  [4] = 'tw',
  [5] = 'cn'
}

ZN.ClassTable = {
  -- Death Knight
  [250] = 'dk',
  [251] = 'dk',
  [252] = 'dk',
  -- Demon Hunter
  [577] = 'dh',
  [581] = 'dh',
  -- Druid
  [102] = 'druid',
  [103] = 'druid',
  [104] = 'druid',
  [105] = 'druid',
  -- Hunter
  [253] = 'hunter',
  [254] = 'hunter',
  [255] = 'hunter',
  -- Mage
  [62] = 'mage',
  [63] = 'mage',
  [64] = 'mage',
  -- Monk
  [268] = 'monk',
  [269] = 'monk',
  [270] = 'monk',
  -- Paladin
  [65] = 'paladin',
  [66] = 'paladin',
  [70] = 'paladin',
  -- Priest
  [256] = 'diszi',
  [257] = 'priest',
  [258] = 'shadow',
  -- Rogue
  [259] = 'rogue',
  [260] = 'rogue',
  [261] = 'rogue',
  -- Shaman
  [262] = 'shaman',
  [263] = 'shaman',
  [264] = 'shaman',
  -- Warlock
  [265] = 'warlock',
  [266] = 'warlock',
  [267] = 'warlock',
  -- Warrior
  [71] = 'warrior',
  [72] = 'warrior',
  [73] = 'warrior'
}

ZN.PlayerTableColumns = {
  ["role"] = 100,
  ["class"] = 40,
  ["spellid"] = 110,
  ["spellname"] = 230,
  ["spelltype"] = 130,
  ["stackable"] = 70,
  ["aoe"] = 50,
  ["station"] = 50,
  ["spellcd"] = 50,
  ["spellrating"] = 50,
  ["delete"] = 50,
}

ZN.PlayerTableColumnHeaders = {
  "role",
  "class",
  "spellid",
  "spellname",
  "spelltype",
  "stackable",
  "aoe",
  "station",
  "spellcd",
  "spellrating",
  "delete",
}
ZN.HeadersToolTips = {
  ["playeraoe"] = {
    ["tooltip"] = true,
    ["text"] = "Utility only\n\nSet to |cff"..ZN.Colors.chatGuild.."true|r if your spell is AoE\ne.g. Rallying Cry\n\nSet to |cff"..ZN.Colors.chatYell.."false|r if your spell is single target\ne.g. Pain Suppression"
  },
  ["playerstackable"] = {
    ["tooltip"] = true,
    ["text"] = "Set to |cff"..ZN.Colors.chatGuild.."true|r if different players can use the same spell at the same time.\n\nSet to |cff"..ZN.Colors.chatYell.."false|r if only one player should use this CD\ne.g. Rallying Cry"
  },
  ["playerstation"] = {
    ["tooltip"] = true,
    ["text"] = "Set to |cff"..ZN.Colors.chatGuild.."true|r if you can't move while casting the spell or the effect is stationary\n\ne.g. Divine Hymn (channeling)\nor Power Word: Barrier (stationary)"
  },
  ["playerspellrating"] = {
    ["tooltip"] = true,
    ["text"] = "Highest Rating spells will be assigned first\n(if not overwritten in Bosstemplates)"
  },
  ["bosstime"] = {
    ["tooltip"] = true,
    ["text"] = "First Time the spell is casted (in seconds)"
  },
  ["bossprio"] = {
    ["tooltip"] = true,
    ["text"] = "Highest Prio spells will get highest rated Playerspells assigned first"
  },
  ["bossstation"] = {
    ["tooltip"] = true,
    ["text"] = "Set to |cff"..ZN.Colors.chatGuild.."true|r if the group is stacked and the player using a cooldown |cff"..ZN.Colors.chatPartyLeader.."has to|r stand still\n\nSet to |cff"..ZN.Colors.chatYell.."false|r if the player using a cooldown |cff"..ZN.Colors.chatPartyLeader.."has to|r move"
  },
  ["bossaoe"] = {
    ["tooltip"] = true,
    ["text"] = "Utility only\n\nSet to |cff"..ZN.Colors.chatGuild.."true|r if the spell affects the entire group\n\nSet to |cff"..ZN.Colors.chatYell.."false|r if the spell only affects one group member (e.g. active tank)"
  },
  ["bossrepeatX"] = {
    ["tooltip"] = true,
    ["text"] = "Spell will be repeated X times"
  },
  ["bossrepeatAfter"] = {
    ["tooltip"] = true,
    ["text"] = "Spell will be repeated every X seconds"
  },
  ["bossheal"] = {
    ["tooltip"] = true,
    ["text"] = "How many healing cooldowns do you want to assign"
  },
  ["bossutil"] = {
    ["tooltip"] = true,
    ["text"] = "How many utility cooldowns do you want to assign"
  },
  ["bossimun"] = {
    ["tooltip"] = true,
    ["text"] = "How many immunity cooldowns do you want to assign"
  },
  ["bossedit"] = {
    ["tooltip"] = true,
    ["text"] = "|cff"..ZN.Colors.itemHeirloom.."Advanced|r\nOverwrite settings to force specific cooldowns"
  },
  ["trennerno"] = {
    ["tooltip"] = true,
    ["text"] = "Phase order in which phases will occur"
  },
  ["trennerphase"] = {
    ["tooltip"] = true,
    ["text"] = "ID of the phase. Spells with the same phase assigned will automatically appear as member of this phase"
  },
}

ZN.PlayerTableColumnHeaderNames = {
  ["role"] = "Role",
  ["class"] = "Class",
  ["spellid"] = "ID",
  ["spellname"] = "Spellname",
  ["spelltype"] = "Type",
  ["stackable"] = "Stackable",
  ["aoe"] = "AOE",
  ["station"] = "Station",
  ["spellcd"] = "CD",
  ["spellrating"] = "Rating",
  ["delete"] = "Delete",
}

ZN.PlayerAttributeMapping = {
  ["role"] = "role",
  ["class"] = "class",
  ["spellid"] = "id",
  ["spellname"] = "name",
  ["spelltype"] = "type",
  ["stackable"] = "stackable",
  ["aoe"] = "aoe",
  ["station"] = "station",
  ["spellcd"] = "cd",
  ["spellrating"] = "rating",
}

-- ZN.PlayerTableColumnButtonTypes = {
--   ["role"] = "GenericButton",
--   ["class"] = "GenericButton",
--   ["spellid"] = "SingleLineEditBox",
--   ["spellname"] = "SingleLineEditBox",
--   ["spelltype"] = "GenericButton",
--   ["aoe"] = "IconButton",
--   ["station"] = "IconButton",
--   ["spellcd"] = "SingleLineEditBox",
--   ["spellrating"] = "SingleLineEditBox",
--   ["delete"] = "IconButton",
-- }

ZN.PlayerTableIconButton = {
  ["stackable"]= {["size"]= 16, ["xOffset"]=27, ["type"]="checkBox"},
  ["aoe"]= {["size"]= 16, ["xOffset"]=44, ["type"]="checkBox"},
  ["station"]= {["size"]= 16, ["xOffset"]=34, ["type"]="checkBox"},
  ["delete"]= {["size"]= 16, ["xOffset"]=17, ["type"]="delete", ["texture"]="Interface\\AddOns\\ZeroNotes\\Media\\Texture\\delete2"},
  ["square"]= {["size"]= 40, ["xOffset"]=0, ["type"]="square", ["texture"]="Interface\\AddOns\\ZeroNotes\\Media\\Texture\\square"}
}

ZN.CheckBoxTextures = {
  ["checked"] = "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\checkmark",
  ["checkedColor"] = ZN.Colors.hunter,
  ["unchecked"] = "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\x_big_active",
  ["uncheckedColor"] = ZN.Colors.dk,
}

ZN.SquareCheckBoxTextures = {
  ["checked"] = "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\check_true",
  ["checkedColor"] = ZN.Colors.ACTIVE,
  ["unchecked"] = "Interface\\AddOns\\ZeroNotes\\Media\\Texture\\check_false",
  ["uncheckedColor"] = ZN.Colors.INACTIVE,
}

ZN.PlayerTableRows = {
  ["title"] = 30,
  ["row"] = 40,
  ["rowgap"] = 2,
}

ZN.PlayerDropdowns = {
  ["role"] = {["content"]=ZN.ColoredRoles, ["order"]=ZN.ColoredRolesOrder},
  ["class"] = {["content"]=ZN.PlayerClassesColored, ["order"]=ZN.PlayerClassesColoredOrder},
  ["spelltype"] = {["content"]=ZN.Types, ["order"]=ZN.TypesOrder},
  ["spec"] = {["content"]=ZN.Types, ["order"]=ZN.TypesOrder},
}

ZN.RoleSelectionColor = {
  ["heal"] = "|cffabd473Heal|r",
  ["tank"] = "|cffc5af2aTank|r",
  ["melee"] = "|cffd2728aMelee|r",
  ["range"] = "|cff6bbceeRange|r",
  ["all"] = "|cfff8f8ffAll|r"
}

ZN.RoleSelectionOrder = {
  "all",
  "heal",
  "tank",
  "melee",
  "range",

}

ZN.TypeSelection = {
  ["heal"] = "Heal",
  ["util"] = "Utility",
  ["imun"] = "Immunity",
  ["all"] = "ALL",
}

ZN.TypeSelectionOrder = {
  "all",
  "heal",
  "util",
  "imun",
}

ZN.CheckBoxSelectionColor ={
  ["all"] = "|cfff8f8ffAll|r",
  ["checked"] = "|cff"..ZN.Colors.hunter.."Yes|r",
  ["unchecked"] = "|cff"..ZN.Colors.dk.."No|r",
}

ZN.CheckBoxSelectionOrder = {
  "all",
  "checked",
  "unchecked",
}

ZN.PlayerSortSelect = {
  ["rating"] = "Rating",
  ["role"] = "Role",
  ["class"] = "Class",
  ["type"] = "Type",
  ["cd"]= "CD",
}

ZN.PlayerSortOrder = {
  "rating",
  "role",
  "class",
  "type",
  "cd",
}

ZN.TextSortOrder = {
  ["heal"]=30,
  ["util"]=20,
  ["imun"]=10,
  ["tank"]=25,
  ["melee"]=20,
  ["range"]=10,
  ["all"] = 0,
  ["dk"]= 13,
  ["dh"]= 12,
  ["druid"]= 11,
  ["hunter"]= 10,
  ["mage"]= 9,
  ["monk"]= 8,
  ["paladin"]= 7,
  ["priest"]= 6,
  ["shadow"]= 5.5,
  ["diszi"]= 5,
  ["rogue"]= 4,
  ["shaman"]= 3,
  ["warlock"]= 2,
  ["warrior"]= 1,
}

ZN.RaidIconsList = {
	"Interface\\TargetingFrame\\UI-RaidTargetingIcon_1",
	"Interface\\TargetingFrame\\UI-RaidTargetingIcon_2",
	"Interface\\TargetingFrame\\UI-RaidTargetingIcon_3",
	"Interface\\TargetingFrame\\UI-RaidTargetingIcon_4",
	"Interface\\TargetingFrame\\UI-RaidTargetingIcon_5",
	"Interface\\TargetingFrame\\UI-RaidTargetingIcon_6",
	"Interface\\TargetingFrame\\UI-RaidTargetingIcon_7",
	"Interface\\TargetingFrame\\UI-RaidTargetingIcon_8",
}

ZN.ClassIconsList = {
  ["zzz"] = CreateTextureMarkup("Interface\\Addons\\ZeroNotes\\Media\\Texture\\x_active", 0, 0, 24, 24, 0, 0, 0, 0, 0, 0),
  ["dh"] = CreateTextureMarkup("Interface\\Addons\\ZeroNotes\\Media\\Texture\\class\\dh", 0, 0, 24, 24, 0, 0, 0, 0, 0, 0),
  ["dk"] = CreateTextureMarkup("Interface\\Addons\\ZeroNotes\\Media\\Texture\\class\\dk", 0, 0, 24, 24, 0, 0, 0, 0, 0, 0),
  ["druid"] = CreateTextureMarkup("Interface\\Addons\\ZeroNotes\\Media\\Texture\\class\\druid", 0, 0, 24, 24, 0, 0, 0, 0, 0, 0),
  ["hunter"] = CreateTextureMarkup("Interface\\Addons\\ZeroNotes\\Media\\Texture\\class\\hunter", 0, 0, 24, 24, 0, 0, 0, 0, 0, 0),
  ["mage"] = CreateTextureMarkup("Interface\\Addons\\ZeroNotes\\Media\\Texture\\class\\mage", 0, 0, 24, 24, 0, 0, 0, 0, 0, 0),
  ["monk"] = CreateTextureMarkup("Interface\\Addons\\ZeroNotes\\Media\\Texture\\class\\monk", 0, 0, 24, 24, 0, 0, 0, 0, 0, 0),
  ["paladin"] =CreateTextureMarkup("Interface\\Addons\\ZeroNotes\\Media\\Texture\\class\\paladin", 0, 0, 24, 24, 0, 0, 0, 0, 0, 0),
  ["priest"] = CreateTextureMarkup("Interface\\Addons\\ZeroNotes\\Media\\Texture\\class\\priest", 0, 0, 24, 24, 0, 0, 0, 0, 0, 0),
  ["rogue"] = CreateTextureMarkup("Interface\\Addons\\ZeroNotes\\Media\\Texture\\class\\rogue", 0, 0, 24, 24, 0, 0, 0, 0, 0, 0),
  ["shaman"] = CreateTextureMarkup("Interface\\Addons\\ZeroNotes\\Media\\Texture\\class\\shaman", 0, 0, 24, 24, 0, 0, 0, 0, 0, 0),
  ["warlock"] = CreateTextureMarkup("Interface\\Addons\\ZeroNotes\\Media\\Texture\\class\\warlock", 0, 0, 24, 24, 0, 0, 0, 0, 0, 0),
  ["warrior"] = CreateTextureMarkup("Interface\\Addons\\ZeroNotes\\Media\\Texture\\class\\warrior", 0, 0, 24, 24, 0, 0, 0, 0, 0, 0),
}

ZN.ClassIconsListOrder = {
  "zzz",
  "dk",
  "dh",
  "druid",
  "hunter",
  "mage",
  "monk",
  "paladin",
  "priest",
  "rogue",
  "shaman",
  "warlock",
  "warrior",
}

ZN.TrennerIconsList = {
  ["{rt1}"] = CreateTextureMarkup("Interface\\TargetingFrame\\UI-RaidTargetingIcon_1", 0, 0, 16, 16, 0, 0, 0, 0, 0, 0),
  ["{rt2}"] = CreateTextureMarkup("Interface\\TargetingFrame\\UI-RaidTargetingIcon_2", 0, 0, 16, 16, 0, 0, 0, 0, 0, 0),
  ["{rt3}"] = CreateTextureMarkup("Interface\\TargetingFrame\\UI-RaidTargetingIcon_3", 0, 0, 16, 16, 0, 0, 0, 0, 0, 0),
  ["{rt4}"] = CreateTextureMarkup("Interface\\TargetingFrame\\UI-RaidTargetingIcon_4", 0, 0, 16, 16, 0, 0, 0, 0, 0, 0),
  ["{rt5}"] = CreateTextureMarkup("Interface\\TargetingFrame\\UI-RaidTargetingIcon_5", 0, 0, 16, 16, 0, 0, 0, 0, 0, 0),
  ["{rt6}"] = CreateTextureMarkup("Interface\\TargetingFrame\\UI-RaidTargetingIcon_6", 0, 0, 16, 16, 0, 0, 0, 0, 0, 0),
  ["{rt7}"] = CreateTextureMarkup("Interface\\TargetingFrame\\UI-RaidTargetingIcon_7", 0, 0, 16, 16, 0, 0, 0, 0, 0, 0),
  ["{rt8}"] = CreateTextureMarkup("Interface\\TargetingFrame\\UI-RaidTargetingIcon_8", 0, 0, 16, 16, 0, 0, 0, 0, 0, 0),
}

ZN.TrennerIconsListOrder = {
  "{rt1}",
  "{rt2}",
  "{rt3}",
  "{rt4}",
  "{rt5}",
  "{rt6}",
  "{rt7}",
  "{rt8}",
}

ZN.ZeroGroupTemplate = {
  {
    ["class"] = "dh",
    ["name"] = "Fabi",
    ["spec"] = "havoc",
  }, -- [1]
  {
    ["class"] = "paladin",
    ["name"] = "Yabba",
    ["spec"] = "holy",
  }, -- [2]
  {
    ["class"] = "shaman",
    ["name"] = "Markus",
    ["spec"] = "resto",
  }, -- [3]
  {
    ["class"] = "druid",
    ["name"] = "Talli",
    ["spec"] = "resto",
  }, -- [4]
  {
    ["class"] = "dk",
    ["name"] = "Max",
    ["spec"] = "unholy",
  }, -- [5]
  {
    ["class"] = "druid",
    ["name"] = "Tobi",
    ["spec"] = "feral",
  }, -- [6]
  {
    ["class"] = "priest",
    ["name"] = "Freddy",
    ["spec"] = "diszi",
  }, -- [7]
  {
    ["class"] = "priest",
    ["name"] = "Mara",
    ["spec"] = "holy",
  }, -- [8]
  {
    ["class"] = "monk",
    ["name"] = "Jörg",
    ["spec"] = "bm",
  }, -- [9]
  {
    ["class"] = "paladin",
    ["name"] = "Micha",
    ["spec"] = "prot",
  }, -- [10]
  {
    ["class"] = "dk",
    ["name"] = "Marcel",
    ["spec"] = "frost",
  }, -- [11]
  {
    ["class"] = "paladin",
    ["name"] = "Stefan",
    ["spec"] = "ret",
  }, -- [12]
  {
    ["class"] = "rogue",
    ["name"] = "Gubin",
    ["spec"] = "assa",
  }, -- [13]
  {
    ["class"] = "shaman",
    ["name"] = "Oli",
    ["spec"] = "enh",
  }, -- [14]
  {
    ["class"] = "warrior",
    ["name"] = "Ike",
    ["spec"] = "fury",
  }, -- [15]
  {
    ["class"] = "priest",
    ["name"] = "Paddy",
    ["spec"] = "shadow",
  }, -- [16]
  {
    ["class"] = "druid",
    ["name"] = "Jonas",
    ["spec"] = "balance",
  }, -- [17]
  {
    ["class"] = "hunter",
    ["name"] = "Nici",
    ["spec"] = "bm",
  }, -- [18]
  {
    ["class"] = "hunter",
    ["name"] = "Jens",
    ["spec"] = "bm",
  }, -- [19]
  {
    ["class"] = "hunter",
    ["name"] = "Max",
    ["spec"] = "bm",
  }, -- [20]
  {
    ["class"] = "mage",
    ["name"] = "Nils",
    ["spec"] = "frost",
  }, -- [21]
  {
    ["class"] = "mage",
    ["name"] = "Martin",
    ["spec"] = "frost",
  }, -- [22]
  {
    ["class"] = "shaman",
    ["name"] = "Mario",
    ["spec"] = "ele",
  }, -- [23]
  {
    ["class"] = "warlock",
    ["name"] = "Basti",
    ["spec"] = "affli",
  }, -- [24]
  {
    ["class"] = "warlock",
    ["name"] = "Chris",
    ["spec"] = "affli",
  }, -- [25]
  {
    ["class"] = "warlock",
    ["name"] = "Andi",
    ["spec"] = "demo",
  }, -- [26]
  {
    ["class"] = "zzz",
    ["name"] = "Name",
    ["spec"] = "empty",
  }, -- [27]
  {
    ["class"] = "zzz",
    ["name"] = "Name",
    ["spec"] = "empty",
  }, -- [28]
  {
    ["class"] = "zzz",
    ["name"] = "Name",
    ["spec"] = "empty",
  }, -- [29]
  {
    ["class"] = "zzz",
    ["name"] = "Name",
    ["spec"] = "empty",
  }, -- [30]
}