require('mainmenu')
require('phase')
require('player')
require('phase')
require('objectimage')
require('SFX')
require('playericons')
require('chooseclass')
require('currentstats')
function love.load()
  -- icones de jogadores, futuramente spritesheets
  icons.load()
  -- fonte padrão chamada em lugares onde ela é necessária
  default_font=love.graphics.newFont(14)
  -- efeitos sonoros
  SFX.load()
  -- fundos e objetos
  objeto.load()
  --estados de jogo/fases
	mainMenu, chooseclass.state, inGame = 0, 1 ,2
	gameState = 0 
	phase_load()
  chooseclass.load()

end


function love.update(dt)

	if gameState == mainMenu then
    
  elseif gameState == chooseclass.state then
    
	elseif gameState == inGame then

		phase_update(dt)

	end

end


function love.draw()

	if gameState == mainMenu then
    love.graphics.setFont(default_font)
		mainmenu_draw()
    
	elseif gameState == chooseclass.state then
    love.graphics.setFont(chooseclass.font) --set the font the default font with the size 40
    chooseclass.draw()
    
	elseif gameState == inGame then
    love.graphics.setFont(default_font)
		phase_draw()
    currentstatsHUD()

	end

end


function love.keypressed(key)

	if gameState == mainMenu then

		mainmenu_select(key)
    
  elseif gameState == chooseclass.state then
    
    chooseclass.keypressed(key)
    chooseclass.keyEnter(key)
	
  end
  --Volta ao menu
	if key == 'escape' and gameState ~= mainMenu then

			gameState = 0
      love.load()

	end

end
