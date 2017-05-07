

mainmenu = {}


function mainmenu.draw()

	love.graphics.setColor(255, 255, 255)
	love.graphics.print('PROJECT RPG', love.graphics.getWidth() / 2 - 155, 64, nil, 4)

	love.graphics.setColor(255, 255, 255)
	love.graphics.print('Press Enter to Start the Game', love.graphics.getWidth() / 2 - 140, love.graphics.getHeight() / 2, nil, 1.5)

end


function mainmenu.select(key)

	if key == 'return' then 

		gameState = 1

	end

	if key == 'escape' then

		love.event = 'quit'

	end

end