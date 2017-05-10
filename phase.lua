

require('player')
	phase = {}

function phase_load()
  title_font = love.graphics.newFont(40)
	player_load()
	
	phase1, phase2 = 1, 2



	phase.state = 1

	phase.x 	= 240
	phase.y   	= 80
	phase.w   	= phase.x + 480 -- Phase.x + comprimento de phase
	phase.h   	= phase.y + 480 -- Phase.y + altura de phase

	ext = {}

	ext.x = phase.x + 480 - 32
	ext.y = phase.y
	ext.w = ext.x + 32
	ext.h = ext.y + 32

end

-- Todas as colisões
function phase_update(dt)

	player_update(dt)

	if phase.state == phase1 then

		if player.w > ext.x and player.y < ext.h then

			phase.state = 2
      cachang:play()

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
  
  --fundo da fase 2/objetos da fase
	if phase.state == phase2 then
    love.graphics.setColor(255, 255, 255)
    love.graphics.draw(phase.background2, phase.x, phase.y,0,0.48,0.65)
  end
  
  
  --fundo da fase 1
	if phase.state == phase1 then
    love.graphics.draw(phase.background1,phase.x,phase.y,0,1.37,1.37)
		love.graphics.setColor(255, 255, 255)
    -- saída
		love.graphics.draw(phase.exit1, ext.x-23, ext.y-23,0,0.2,0.2)


	end

	player_draw()

end

