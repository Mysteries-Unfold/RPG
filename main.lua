

require('mainmenu')
require('phase')
require('player')
require('phase')
require('objectimage')
require('SFX')
require('playericons')
require('chooseclass')


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
	chooseclass.load()
	phase.load()

end


function love.update(dt)

	if gameState == mainMenu then 

		phase.load()

	elseif gameState == inGame then

		phase.update(dt)

	end

end


function love.draw()

	if gameState == mainMenu then

		mainmenu.draw()
		
	elseif gameState == chooseClass then
		
		chooseclass.draw()

	elseif gameState == inGame then

		phase.draw()

	end

end


function love.keypressed(key)

	if gameState == mainMenu then

		mainmenu.select(key)
	
	elseif gameState == chooseClass then

		chooseclass.keypressed(key)	
		chooseclass.keyEnter(key)
		
	end
  	
	--Volta ao menu
	if key == 'escape' and gameState ~= mainMenu then

		gameState = 0

	end

end
