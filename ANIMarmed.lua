

require('ANIMsample')

local anim = require 'anim8'
local arming, armed, vel 


function animasample.loadarmed()
  
  --sprite sheets
  armed = love.graphics.newImage('iconplayer/animaWarrior/armed.png')
  
  --grid routine
  local g 
  g = anim.newGrid( armed:getWidth()/3, armed:getHeight(), armed:getWidth(), armed:getHeight() )
  
  
  -- local animation speed
  vel = 0.2 
  
  --animation patern(s)
  arming = anim.newAnimation( g('1-3', 1), vel) 
  
end


function animasample.updatearmed(dt)
  
  arming:update(dt)

end


function animasample.drawarmed()

  --action draw
  love.graphics.setColor(255,255,255)
  arming:draw(armed,200,300,0,0.4,0.4)
  love.graphics.setColor(0,0,0)

end