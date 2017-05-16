hitboxer={}
function hitboxer.draw()
  hitbox=love.graphics.newImage('floor/hitboxphase1.png')
  love.graphics.draw(hitbox,phase.x,phase.y)
end 
currentMap = {}

function add_tile(x,y,type)
        table.insert(currentMap, {x=x,y=y,type=type}) -- Adds a tile to the currentMap Table
end
 
function read_map()
        map = love.image.newImageData("floor/hitboxphase1.png")
        for scanX = 1, map:getWidth()-1 do
              for scanY = 1, map:getHeight()-1 do
                        r,g,b,a = map:getPixel(scanX, scanY) -- Returns the R G B A value from the image data
                        if r==255 then
                                add_tile(scanX, scanY, "color")
                        else
                                add_tile(scanX, scanY, "black")
                        end
                end
        end
end

function hitboxer.update(dt)
        for i,v in ipairs(currentMap) do -- I = index, V = value. This for loop iterates over the currentmap table to return values to be used
          --A colisão ainda não tem a hitbox apropriada, mas eu só quero que execute por enquanto. Depois eu ajeito
                if v.type == "color" then
                        player.uVel = 0 -- CIMA
                        player.rVel = 0 -- DIREITA
                        player.dVel = 0 -- BAIXO
                        player.lVel = 0 -- ESQUERDA
                        
                      elseif v.type=="black" then
                        player.vel=100
                        player.uVel = player.vel -- CIMA
                        player.rVel = player.vel -- DIREITA
                        player.dVel = player.vel -- BAIXO
                        player.lVel = player.vel -- ESQUERDA
                        
                end
        end
end