

function player_load()

	player = {}

	player.x 	= love.graphics.getWidth() / 2 - 32
	player.y 	= love.graphics.getHeight() / 2 - 32

	player.vel 	= 100
	player.uVel = player.vel -- CIMA
	player.rVel = player.vel -- DIREITA
	player.dVel = player.vel -- BAIXO
	player.lVel = player.vel -- ESQUERDA

end


function player_update(dt)

	player.w = player.x + 32 -- Player.x + comprimento de player
	player.h = player.y + 32 -- Player.y + altura de player

	-- Walk
	
	if love.keyboard.isDown('w') then

		player.y = player.y - player.uVel * dt

	end

	if love.keyboard.isDown('s') then

		player.y = player.y + player.dVel * dt

	end

	if love.keyboard.isDown('d') then

		player.x = player.x + player.rVel * dt

	end

	if love.keyboard.isDown('a') then

		player.x = player.x - player.lVel * dt

	end

end


function player_draw()
	
	love.graphics.setColor(0, 255, 0)
	love.graphics.rectangle('fill', player.x, player.y, 32, 32)

end