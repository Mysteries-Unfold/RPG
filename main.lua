require('mainmenu')
require('phase')
require('player')
require('phase')
require('objectimage')
require('SFX')
require('playericons')
function love.load()
  -- icones de jogadores, futuramente spritesheets
  icons.load()
  -- efeitos sonoros
  SFX.load()
  -- fundos e objetos
  objeto.load()
  --estados de jogo/fases
	mainMenu, inGame = 0, 1
	gameState = 0 
	phase_load()

end


function love.update(dt)

	if gameState == mainMenu then 

		phase_load()

	elseif gameState == inGame then

		phase_update(dt)

	end

end


function love.draw()

	if gameState == mainMenu then

		mainmenu_draw()

	elseif gameState == inGame then

		phase_draw()

	end

end


function love.keypressed(key)

	if gameState == mainMenu then

		mainmenu_select(key)

	end
  --Volta ao menu
	if key == 'escape' and gameState ~= mainMenu then

			gameState = 0

	end

end
