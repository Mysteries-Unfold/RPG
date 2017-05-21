

animasample = {}

local anim = require 'anim8'
local walkingWarrior

function animasample.load()

  walkingWarrior = love.graphics.newImage('iconplayer/animaWarrior/chrono_sample.png')
  
  parado = love.graphics.newQuad( 0, 0, walkingWarrior:getWidth()/4, walkingWarrior:getHeight()/4, walkingWarrior:getWidth(), walkingWarrior:getHeight())
  
  --grid routine
  local g 
  g = anim.newGrid( walkingWarrior:getWidth()/4, walkingWarrior:getHeight()/4, walkingWarrior:getWidth(), walkingWarrior:getHeight() )
  
  -- local animation speed
  vel = 0.2
  
  --temporary scale
  escale = 0.6
  
  --animation patern(s)
  baixo     = anim.newAnimation( g('1-4', 1), vel)
  esquerda  = anim.newAnimation( g('1-4', 2), vel)
  direita   = anim.newAnimation( g('1-4', 3), vel)
  cima      = anim.newAnimation( g('1-4', 4), vel)
  
  
end

function animasample.update(dt)
  if love.keyboard.isDown('a') then

    esquerda:update(dt)
    direcao ='left'
    
  elseif love.keyboard.isDown('d') then

    direita:update(dt)
    direcao ='right'
    
  elseif love.keyboard.isDown('w') then

    cima:update(dt)
    direcao ='up'
    
  elseif love.keyboard.isDown('s') then

    baixo:update(dt)
    direcao ='down'
  
  else 

    direcao ='parado'

  end

end

function animasample.draw()
  
  love.graphics.setColor(255,255,255)

  if not player.chicken then
    
    if direcao =='left' then
    
      esquerda:draw(walkingWarrior, player.x, player.y, 0, escale, escale)
    
    elseif direcao =='right' then
    
      direita:draw(walkingWarrior, player.x, player.y, 0, escale, escale)
    
    elseif direcao =='up' then
    
      cima:draw(walkingWarrior, player.x, player.y, 0, escale, escale)
    
    elseif direcao =='down' then
    
      baixo:draw(walkingWarrior, player.x, player.y, 0, escale, escale)
  
    else

      love.graphics.draw(walkingWarrior, parado, player.x, player.y, 0, escale, escale)
    
    end
    
  end
  
end

function animasample.drawB()

  love.graphics.setColor(255,255,255)
  direita:draw(walkingWarrior, 300, 200, 0, 2, 2)
  love.graphics.setColor(0,0,0)
  
end
