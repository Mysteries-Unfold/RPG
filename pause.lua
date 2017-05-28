

pause = {}


function pause.load()

	pause.font 		 = love.graphics.newFont(21)
	pause.title_font = love.graphics.newFont(42)

	pause.state		 = false

	pause.count		 = 0
	pause.selected   = 1

end


function pause.update(dt)

	pause.selected = pause.count % 3 

end


function pause.draw()

	local w, h = love.graphics.getWidth() , love.graphics.getHeight()

	love.graphics.setColor(0, 0, 0, 100)
		love.graphics.rectangle('fill', w / 2 - ((w / 2) / 2), h - w / 2, w, h)
 
	love.graphics.setColor(200, 200, 200)
		love.graphics.rectangle('fill', w / 2 - ((w / 3) / 2), h / 2 - ((h / 2) / 2), w / 3, h / 2)

   	love.graphics.setColor(151, 252, 151)
   		love.graphics.rectangle('fill',  w / 2 - ((w / 3) / 2), h / 2 + 20 + (30 * pause.selected), w / 3, 21)   	
   
   	love.graphics.setColor(55, 55, 55)
   		love.graphics.setFont(pause.font)
   			love.graphics.printf('Resume', 0, h / 2 + 20, w, 'center')
   			love.graphics.printf('Skill Tree', 0, h / 2 + 50, w, 'center')
   			love.graphics.printf('Go to Menu', 0, h / 2 + 80, w, 'center')
   		
   		love.graphics.setFont(pause.title_font)
   			love.graphics.printf('PAUSE', 0, h / 2 - 100, w, 'center')

end


function pause.select(key)

	if key == 's' then

		pause.count = pause.count + 1

	end

	if key == 'w' then

		pause.count = pause.count - 1

	end

	if key == 'return' then

		if pause.selected == 0 then

			pause.state = false

		elseif pause.selected == 1 then 

      selecting_skills=true

		elseif pause.selected == 2 then

			gameState = 0 
			pause.state = false
			love.load()

		end

	end

end

