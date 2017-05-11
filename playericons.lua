

require('player')

icons = {}


function icons.load()

  player.image = love.graphics.newImage("iconplayer/otaco.png")
  player.icon  = love.graphics.newQuad(110,0,220,220,player.image:getDimensions())

end