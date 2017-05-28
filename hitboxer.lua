hitboxer = {}
r = {}
g = {}
b = {}
salto=433

function hitboxer.load()
  
  ph=35
  pw=30
  margin=3
  
end

function hitboxer.update(dt)
  
  map = floor.hitbox[floor.state][section.state]
  --LATERAL SUPERIOR
  --meio superior
    r[1],g[1],b[1],a = map:getPixel(player.x-phase.x+pw/2 , player.y-phase.y)
  --esquerda superior
    r[2],g[2],b[2],a = map:getPixel(player.x-phase.x+margin , player.y-phase.y)
  --direita superior
    r[3],g[3],b[3],a = map:getPixel(player.x-phase.x+pw-margin , player.y-phase.y)
  
  --LATERAL INFERIOR
  --meio inferior
    r[4],g[4],b[4],a = map:getPixel(player.x-phase.x+pw/2 , player.y-phase.y+ph)
  --esquerda inferior
    r[5],g[5],b[5],a = map:getPixel(player.x-phase.x+margin , player.y-phase.y+ph)
  --direita inferior
    r[6],g[6],b[6],a = map:getPixel(player.x-phase.x+pw-margin , player.y-phase.y+ph)
    
  --LATERAL DIREITA
  --meio direita
    r[7],g[7],b[7],a = map:getPixel(player.x-phase.x+pw , player.y-phase.y+ph/2)
  --superior direita
    r[8],g[8],b[8],a = map:getPixel(player.x-phase.x+pw , player.y-phase.y+margin)
  --inferior direita
    r[9],g[9],b[9],a = map:getPixel(player.x-phase.x+pw , player.y-phase.y+ph-margin)
  
  --LATERAL ESQUERDA
  --meio esquerda
    r[10],g[10],b[10],a = map:getPixel(player.x-phase.x , player.y-phase.y+ph/2)
  --superior esquerda
    r[11],g[11],b[11],a = map:getPixel(player.x-phase.x , player.y-phase.y+margin)
  --inferior esquerda
    r[12],g[12],b[12],a = map:getPixel(player.x-phase.x , player.y-phase.y+ph-margin)
  
  if r[1]==255 or r[2]==255 or r[3]==255 then
    player.y=player.y+player.vel*dt
  end
  
  if r[4]==255 or r[5]==255 or r[6]==255 then
    player.y=player.y-player.vel*dt
  end
  
  if r[7]==255 or r[8]==255 or r[9]==255 then
    player.x=player.x-player.vel*dt
  end
  
  if r[10]==255 or r[11]==255 or r[12]==255 then
    player.x=player.x+player.vel*dt
  end
  
  if player.x<=phase.x+4 then
    player.x=player.x+salto
    section.state = section.state -1
  end
  
  if player.x>=phase.x+436 then
    player.x=player.x-salto
    section.state = section.state +1
  end
  
  if player.y>=phase.y+436 then
    player.y=player.y-salto
    section.state = section.state - 8
  end
  
  if player.y<=phase.y+4 then
    player.y=player.y+salto
    section.state = section.state + 8
  end
end