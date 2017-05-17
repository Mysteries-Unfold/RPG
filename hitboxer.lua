hitboxer={}
r={}
function hitboxer.load()
  walkingWarrior=love.graphics.newImage('iconplayer/animaWarrior/chrono_sample.png')
  map=love.image.newImageData('floor/hitbox1.png')

  player.height=walkingWarrior:getHeight()/4
  player.width=walkingWarrior:getWidth()/4
  teste=love.graphics.newImage('floor/hitboxphase1.png')
  up_l=love.graphics.newImage('floor/uper_image.png')
  
end

function hitboxer.update()
  r[1],g,b,a=map:getPixel(player.x-phase.x+player.width/4,       player.y-phase.y)
  r[2],g,b,a=map:getPixel(player.x-phase.x+player.width/4,       player.y-phase.y+player.height/2+10)
  r[3],g,b,a=map:getPixel(player.x-phase.x,                      player.y-phase.y+player.height/4)
  r[4],g,b,a=map:getPixel(player.x-phase.x+player.width/2,         player.y-phase.y+player.height/4)
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

end
function uperlayer_draw()
  love.graphics.draw(up_l,phase.x,phase.y)
end

