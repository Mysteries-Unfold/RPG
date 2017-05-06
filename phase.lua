

require('player')


function phase_load()

	player_load()
	
	phase1, phase2 = 1, 2

	phase = {}

	phase.state = 1

	phase.x 	= 240
	phase.y   	= 80
	phase.w   	= phase.x + 480 -- Phase.x + comprimento de phase
	phase.h   	= phase.y + 480 -- Phase.y + altura de phase

	ext = {}

	ext.x = phase.x + 480 - 32
	ext.y = phase.y + 0
	ext.w = ext.x + 32
	ext.h = ext.y + 32

end


function phase_update(dt)

	player_update(dt)

	if phase.state == phase1 then

		if player.w > ext.x and player.y < ext.h then

			phase.state = 2

		end

	end

	if player.y < phase.y then

		player.uVel = 0

	else

		player.uVel = player.vel

	end

	if player.w > phase.w then

		player.rVel = 0
	
	else

		player.rVel = player.vel

	end

	if player.h > phase.h then

		player.dVel = 0
	
	else

		player.dVel = player.vel

	end

	if player.x < phase.x then

		player.lVel = 0
	
	else

		player.lVel = player.vel

	end

end


function phase_draw()

	if phase.state == phase1 then 

		love.graphics.setColor(255, 255, 255)
		love.graphics.print('Phase 1', 480 - 30, 40)

	elseif phase.state == phase2 then

		love.graphics.setColor(255, 255, 255)
		love.graphics.print('Phase 2', 480 - 30, 40)

	end
	
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle('fill', phase.x, phase.y, 480, 480)

	if phase.state == phase1 then

		love.graphics.setColor(255, 0, 255)
		love.graphics.rectangle('fill', ext.x, ext.y, 32, 32)

	end

	player_draw()

end

