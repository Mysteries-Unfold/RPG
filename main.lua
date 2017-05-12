

require('mainmenu')
require('player')
require('phase')
require('objectimage')
require('SFX')
require('currentstats')
require('playericons')
require('chooseclass')
require('encontro')
require('pause')


function love.load()

  -- icones de jogadores, futuramente spritesheets
  icons.load()

  -- fonte padrão chamada em lugares onde ela é necessária
  default_font = love.graphics.newFont(14)

  -- efeitos sonoros
  SFX.load()

  -- fundos e objetos
  objeto.load()
  
  --estados de jogo/fases
	mainMenu, chooseclass.state, inGame, Encontro = 0, 1, 2, 3
	gameState = 0
	phase.load()
  chooseclass.load()

end


function love.update(dt)

	if gameState == mainMenu then
    
  elseif gameState == chooseclass.state then
    
	elseif gameState == inGame then

		phase.update(dt)
    
  elseif gameState == Encontro then

	end

end


function love.draw()

	if gameState == mainMenu then
    
    love.graphics.setFont(default_font)
		mainmenu.draw()
    
	elseif gameState == chooseclass.state then

    love.graphics.setFont(chooseclass.font) --set the font the default font with the size 40
    chooseclass.draw()
    
	elseif gameState == inGame then

    love.graphics.setFont(default_font)
		phase.draw()
    currentstatsHUD()
    
  elseif gameState == Encontro then

    love.graphics.setFont(default_font)
		encontro.draw()
    
  end

end
  

function love.keypressed(key)

	if gameState == mainMenu then

		mainmenu.select(key)
    
  elseif gameState == chooseclass.state then
    
    chooseclass.keypressed(key)
    chooseclass.keyEnter(key)
    
  elseif gameState == inGame then
    
    phase.keypressed(key)  --pass the keyboard input to the phase 
    
  elseif gameState == Encontro then
    
    encontro.keypressed(key)
	
  end

end
