

require('enemies')

ANImy = {}

local anim = require 'anim8'
local wait, vel


function ANImy.load()
  
  --sprite sheets
  gravelord = love.graphics.newImage('iconplayer/SPOOKY/gravelord.png') --SP00K1
  
  --grid routine
  local g 
  g = anim.newGrid( gravelord:getWidth()/4, gravelord:getHeight()/6, gravelord:getWidth(), gravelord:getHeight() )
  
  
  -- local animation speed
  vel = 0.1 
  
  --animation patern(s)
  wait = anim.newAnimation( g('1-4', 1,'1-4', 2,'1-4', 3,'1-4', 4,'1-4', 5, '1-3', 6), vel) 
  
  
end


function ANImy.update(dt)
  
  wait:update(dt)

end


function ANImy.draw()

  --action draw
  local w, h = love.graphics.getWidth(), love.graphics.getHeight()
  
  love.graphics.setColor(255,255,255)
  wait:draw(gravelord,550,100,0,0.4,0.4)
  love.graphics.setColor(0,0,0)

end