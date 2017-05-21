function add_tile(x,y,w,h,type)
        table.insert(currentMap, {x=x,y=y,w=w,h=h,type=type}) -- Adds a tile to the currentMap Table
end
 
function read_map()
        currentLevel = 1 -- Current Level
        map = love.image.newImageData("maps/level".. phase.state ..".png") -- Creates a new image data off of an image. Levels are named level + number so game can increment
        for scanX = 0, 31 do -- Scans the X axis of the image
                for scanY = 0, 31 do -- Scans the Y axis of the image
                        r,g,b,a = map:getPixel(scanX,scanY) -- Returns the R G B A value from the image data "level file".
                        if r == 255 then
                                add_tile(scanX,scanY,16,16,"red")
                        else
                                add_tile(scanX,scanY,16,16,"black")
                        end
                end
        end
end

 
function map_draw()
        for i,v in ipairs(currentMap) do -- I = index, V = value. This for loop iterates over the currentmap table to return values to be used
                if v.type == "red" then
                        love.graphics.draw(tex.wood_floor,v.x*v.w,v.y*v.h)
                end
        end
end