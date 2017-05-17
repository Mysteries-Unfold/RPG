
player = {}
function player_load()
  
  player.skills = {}

	

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

	elseif love.keyboard.isDown('s') then

		player.y = player.y + player.dVel * dt

	elseif love.keyboard.isDown('d') then

		player.x = player.x + player.rVel * dt

	elseif love.keyboard.isDown('a') then

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