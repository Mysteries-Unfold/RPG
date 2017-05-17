enemies                  = {}           --Enemies table
do 
  local phase1           = {}
  
  local enemy1           = {}           --Enemy 1
  enemy1.index = 1
  enemy1.alive_image     = love.graphics.newImage("iconplayer/otaco.png")
  enemy1.dead_image      = love.graphics.newImage("iconplayer/rip.png")
  enemy1.hp              = 10           --hp
  enemy1.sx               = 1
  enemy1.sy               = 1
  enemy1.x                = 400
  enemy1.y                = 200
  enemy1.alive           = true
  enemy1.atk             = 7            --atk
  enemy1.spatk           = 1            --sp atk
  enemy1.def             = 4            --def
  enemy1.spdef           = 2            --spdef
  enemy1.spd             = 2            --spd
  enemy1.skills          = {}           --enemy skils
  table.insert(phase1, enemy1)          --adds enemy to phase 1 enemies
  enemies["phase1"]      = phase1       --adds phase 1 enemie to the data enemies
end
