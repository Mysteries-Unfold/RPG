

player = {}

function player_load()
  
    player.skills = {{name="punch", typ="atk", cooldown="0", damage="5", color={0, 201, 87}}, {name="kick", typ="atk", cooldown="2", damage="7", color={255, 97, 3}}, {name="splash", typ="atk", cooldown="0", damage="0", color={0, 205, 205}}}

	player.x 	= love.graphics.getWidth() / 2 
	player.y 	= love.graphics.getHeight() / 2 - 32
  
  	player.chicken = false   -- if the user is chicken
  	player.chicken_time = 0  --time he is chicken
  	player.chicken_image = love.graphics.newImage("iconplayer/chicken_normal.png")

	player.vel 	= 100
	player.uVel = player.vel -- CIMA
	player.rVel = player.vel -- DIREITA
	player.dVel = player.vel -- BAIXO
	player.lVel = player.vel -- ESQUERDA

end

function player_flee(inimigo)
  
  player.x = player.x + inimigo.
  
  matrix[x][y]
  
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

  love.graphics.setColor(255,255,255)

  if player.chicken then
  	
    love.graphics.draw(player.chicken_image,player.icon,player.x,player.y,0,0.05,0.02)
  
  else
    
    --love.graphics.draw(player.image,player.icon,player.x,player.y,0,0.05,0.03)
  
  end

end