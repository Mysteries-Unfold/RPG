

require('player')
--require('enemies')

phase   = {}
floor   = {}
section = {}

floor.image  = {}
floor.hitbox = {}

floor.state   = 1 -- First Floor
section.state = 3 -- First Section

function phase_load()

	for i = 1, 1 do -- i = 1, 12
		
		floor.image[i] = {}
		
		for j = 1, 64 do
			if love.filesystem.exists('background/floor1/sprite/' .. j .. '.png') then

				floor.image[i][j] = love.graphics.newImage('background/floor1/sprite/' .. j .. '.png')

			end

		end

	end

	for i = 1, 1 do -- i = 1, 12
		
		floor.hitbox[i] = {}
		
		for j = 1, 64 do

			

			if love.filesystem.exists('background/floor1/hitbox/' .. j .. '.png') then

				floor.hitbox[i][j] = love.image.newImageData('background/floor1/hitbox/' .. j .. '.png')

			end
			
		end

	end

  	title_font = love.graphics.newFont(40)
    
	player_load()                    --Load Player
  --enemies table (*dont change to enemies, because it will overwrite the enemies table at enemies.lua)
  enemies_table = enemies.load()   --Load Enemies
  
  for enemy=1, #enemies_table["phase1"] do --load for every enemy on enmies_table.phase1 (enemies of phase1 of all the enemies)
    
    enemies_table["phase1"][enemy].alive_image = love.graphics.newImage(enemies_table["phase1"][enemy].alive_image)  --set the dead and alive image, to a love image object, instead of the string path of the file
    enemies_table["phase1"][enemy].dead_image = love.graphics.newImage(enemies_table["phase1"][enemy].dead_image)   --set the dead and alive image, to a love image object, instead of the string path of the file
    
  end
	
	phase1, phase2 = 1, 2

	phase.state = 1

	phase.x 	= 240
	phase.y   	= 80
	phase.w   	= phase.x + 480 -- Phase.x + comprimento de phase
	phase.h   	= phase.y + 480 -- Phase.y + altura de phase

end

-- Todas as colisões
function phase_update(dt)

	player_update(dt)
  
  	if player.chicken then   --if the user is chicken
   		
   		player.chicken_time = player.chicken_time + dt  --adds chicken time
    	
    	if player.chicken_time >= 3 then                 --if it already chicken for 3 seconds
      	
      		player.chicken = false                        --its not chicken anymore
      		player.chicken_time = 0                       --resets chicken time
    	
    	end

  	end

	if phase.state == phase1 then
    
    	if (enemies_table["phase1"][1].alive) and (not player.chicken) and (player.x+32>= 290) and (player.x<=290+(37.5)) and (player.y+32>= 400) and (player.y<=400+(41))then
      		
      		encontro.load()
      		encontro.setPlayers(player, enemies_table["phase1"][1], phase.state)  --pass the player, enemy, and phase state to the encontro
      		gameState = 3
     
    	end

	end

end


function phase.keypressed(key)
  
  if key == "b" then

    encontro.load()
    encontro.setPlayers(player, nil, phase.state)  --pass the player, enemy, and phase state to the encontro
    gameState = 3
     
  end

end


function phase_draw()

	local w, h = love.graphics.getWidth(), love.graphics.getHeight()
		
	love.graphics.draw(floor.image[floor.state][section.state], w/4, h/7, 0, 2.5)

    --draw the enemy (to debug)
    love.graphics.draw(enemies_table["phase1"][1].alive_image, enemies_table["phase1"][1].x, enemies_table["phase1"][1].y,0,0.05, 0.05)

	player_draw()

end


