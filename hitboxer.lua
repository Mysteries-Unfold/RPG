

hitboxer = {}
r = {}
g = {}
b = {}


function hitboxer.load()
  walkingWarrior = love.graphics.newImage('iconplayer/animaWarrior/chrono_sample.png')
 
  player.height = walkingWarrior:getHeight()/4
  player.width = walkingWarrior:getWidth()/4
end

function hitboxer.update()

  map = floor.hitbox[floor.state][section.state]

  r[1],g[1],b[1],a = map:getPixel((player.x-phase.x+player.width/4)/2.5, (player.y-phase.y)/2.5)
  r[2],g[2],b[2],a = map:getPixel((player.x-phase.x+player.width/4)/2.5, (player.y-phase.y+player.height/2+10)/2.5)
  r[3],g[3],b[3],a = map:getPixel((player.x-phase.x)/2.5, (player.y-phase.y+player.height/4)/2.5)
  r[4],g[4],b[4],a = map:getPixel((player.x-phase.x+player.width/2)/2.5, (player.y-phase.y+player.height/4)/2.5)
 
 if r[1]==255 then
    player.uVel=0
  else
    player.uVel=player.vel
  end
  
  if r[2]==255 then
    player.dVel=0
  else
    player.dVel=player.vel
  end
  
  if r[3]==255 then
    player.lVel=0
  else
    player.lVel=player.vel
  end
  
  if r[4]==255 then
    player.rVel=0
  else
    player.rVel=player.vel
  end

  local w, h = love.graphics.getWidth(), love.graphics.getHeight()

  if b[1]==255 then
    section.state = section.state + 8
    player.y = h - player.height*2/3 - 3
  end

  if b[2]==255 then
    section.state = section.state - 8
    player.y = h/7 + 3
  end

  if b[3]==255 then
    section.state = section.state - 1
    player.x = w*3/4 - player.width/2 - 3
  end

  if b[4]==255 then
    section.state = section.state + 1
    player.x = w/4 + 3 
  end

end

