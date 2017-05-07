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
	mainMenu, chooseClass, inGame = 0, 1, 2
	gameState = 0 
	phase_load()
	chooseclass.load()


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
		
	elseif gameState == chooseClass then
		
		chooseclass.draw()

	elseif gameState == inGame then

		phase_draw()

	end

end


function love.keypressed(key)

	if gameState == mainMenu then

		mainmenu_select(key)
	
	elseif gameState == chooseClass then

		chooseclass.select(key)	
		
	end
  	
	--Volta ao menu
	if key == 'escape' and gameState ~= mainMenu then

		gameState = 0

	end

end
