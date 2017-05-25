enemies      = {}                                 --Enemies table

local dkjson = require("json/luajson")

enemies.load = function ()
  
  local file = io.open("json/enemies_json.json", "r")  --opens enemies json
  
  local strg = file:read("*a")                    --reads enemies json
  
  tabl       = dkjson.decode(strg, 1, nil)        --decodes enemies json, and return the enmies table
  
  file:close()                                    --closes file
  
  return tabl                                     --return enemies table
  
end


--dont delete this commentary for backup reasons
--for i=1, 1 do 
  
  
  --local phase1 = {}
  --
  --local enemy1           = {}           --Enemy 1
  --enemy1.index = 1
  --enemy1.alive_image     = "iconplayer/otaco.png"
  --enemy1.dead_image      = "iconplayer/rip.png"
  --enemy1.hp              = 10           --hp
  --enemy1.sx               = 1
  --enemy1.sy               = 1
  --enemy1.x                = 400
  --enemy1.y                = 200
  --enemy1.alive           = true
  --enemy1.atk             = 7            --atk
  --enemy1.spatk           = 1            --sp atk
  --enemy1.def             = 4            --def
  --enemy1.spdef           = 2            --spdef
  --enemy1.spd             = 2            --spd
  --enemy1.skills          = {}           --enemy skils
  --table.insert(phase1, enemy1)          --adds enemy to phase 1 enemies
  --enemies["phase1"]      = phase1       --adds phase 1 enemie to the data enemies
  --
  --local file = io.open("enemies_json.json", "w")
  --
  ----io.output(file)
  --
  --local str = jjson.encode(enemies, {indent = true})
  --
  --file:write(str)
  --
  --file:close()
  --
  --local file = io.open("enemies_json.json", "r")
  --
  --local strg = file:read("*a")
  --
  ----strg = "[["..strg.."]]"  --to json decode format
  --
  --tabl = jjson.decode(strg, 1, nil)
  --
  --file:close()
  
--end