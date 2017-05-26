skills     = {}

local dkjson = require("json/luajson")

skills.load = function ()
  
  print('start')
  
  local file = io.open("json/skills.json", "r")  --opens skills json
  
  local strg = file:read("*a")                    --reads enemies json
  
  tabl       = dkjson.decode(strg, 1, nil)        --decodes enemies json, and return the enmies table
  
  file:close()                                    --closes file
  
  --[[
  for key, val in pairs(tabl['b']['2']) do
    
    print("    "..key..":")
    
    for key, val in pairs(tabl['b']['2'][key]) do
  
      print("        "..key..": "..val)
  
    end
  
  end
  ]]--
  
end