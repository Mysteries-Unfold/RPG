function player.currentstatsload()
  if thief.selected then
  
    player.hpMAX  =thief.hp
    player.hp     =player.hpMAX
    player.mpMAX  =thief.mp
    player.mp     =player.mpMAX
    player.atk    =thief.atk
    player.spatk  =thief.spatk
    player.def    =thief.def
    player.spd    =thief.spd
    player.spdef  =thief.spdef
      
    elseif mage.selected then
      
      player.hpMAX  =mage.hp
      player.hp     =player.hpMAX
      player.mpMAX  =mage.mp
      player.mp     =player.mpMAX
      player.atk    =mage.atk
      player.spatk  =mage.spatk
      player.def    =mage.def
      player.spd    =mage.spd
      player.spdef  =mage.spdef
      
    elseif archer.selected then
      
      player.hpMAX  =mage.hp
      player.hp     =player.hpMAX
      player.mpMAX  =archer.mp
      player.mp     =player.mpMAX
      player.atk    =mage.atk
      player.spatk  =mage.spatk
      player.def    =mage.def
      player.spd    =mage.spd
      player.spdef  =mage.spdef
      
    elseif warrior.selected then
      
      player.hpMAX  =warrior.hp
      player.hp     =player.hpMAX
      player.mpMAX  =warrior.mp
      player.mp     =player.mpMAX
      player.atk    =warrior.atk
      player.spatk  =warrior.spatk
      player.def    =warrior.def
      player.spd    =warrior.spd
      player.spdef  =warrior.spdef
      
    end  
end

--TABLES FOR HUD POSITIONING

function currentstatsHUD()
  HUD={}
  HUD.escala=10
  local width, height = love.graphics:getWidth(), love.graphics:getHeight()
  HUD.x=phase.x + 500
  HUD.y=730
  love.graphics.setColor(255, 255, 255)                  --set color to white
  
  --HP STAT
  love.graphics.printf("HP: ".. player.hpMAX .. "/" .. player.hp, HUD.x, (HUD.y*1.5/10)-chooseclass.stats_font:getHeight(), width-HUD.x)
  
  --HP BAR
  love.graphics.setColor(55,55,55)
  love.graphics.rectangle("fill",HUD.x,(HUD.y*2/10)-chooseclass.stats_font:getHeight(),player.hpMAX*HUD.escala,10)
  love.graphics.setColor(0,255,0)
  love.graphics.rectangle("fill",HUD.x,(HUD.y*2/10)-chooseclass.stats_font:getHeight(),player.hp*HUD.escala,10)
  love.graphics.setColor(255,255,255)
  
  --MP STAT
  love.graphics.printf("MP: ".. player.hpMAX .. "/" .. player.hp, HUD.x, (HUD.y*2.5/10)-chooseclass.stats_font:getHeight(), width-HUD.x)
  
  --MP BAR
  love.graphics.setColor(55,55,55)
  love.graphics.rectangle("fill",HUD.x,(HUD.y*3/10)-chooseclass.stats_font:getHeight(),player.mpMAX*HUD.escala,10)
  love.graphics.setColor(0,0,255)
  love.graphics.rectangle("fill",HUD.x,(HUD.y*3/10)-chooseclass.stats_font:getHeight(),player.mp*HUD.escala,10)
  love.graphics.setColor(255,255,255)
end
function battleHUD()
  local escala=10
  local width, height = love.graphics:getWidth(), love.graphics:getHeight()
  local x=width*4.3/16
  local y=height/2
  local barWidth=5

  love.graphics.setColor(255, 255, 255)                  --set color to white
  
  --HP STAT
  love.graphics.printf("HP: " .. player.hpMAX .. "/" ..  player.hp, x, (y*1.5/10)-chooseclass.stats_font:getHeight(), width-x)
  
  --HP BAR
  love.graphics.setColor(55,55,55)
  love.graphics.rectangle("fill",x,(y*2/10)-chooseclass.stats_font:getHeight(),player.hpMAX*escala,barWidth)
  love.graphics.setColor(0,255,0)
  love.graphics.rectangle("fill",x,(y*2/10)-chooseclass.stats_font:getHeight(),player.hp*escala,barWidth)
  love.graphics.setColor(255,255,255)
  
  --MP STAT
  love.graphics.printf("MP: " .. player.hpMAX .. "/" .. player.hp, x, (y*2.5/10)-chooseclass.stats_font:getHeight(), width-x)
  
  --MP BAR
  love.graphics.setColor(55,55,55)
  love.graphics.rectangle("fill",x,(y*3/10)-chooseclass.stats_font:getHeight(),player.mpMAX*escala,barWidth)
  love.graphics.setColor(0,0,255)
  love.graphics.rectangle("fill",x,(y*3/10)-chooseclass.stats_font:getHeight(),player.mp*escala,barWidth)
  love.graphics.setColor(255,255,255)
end