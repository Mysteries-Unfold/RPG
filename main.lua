require('mainmenu')
require('phase')
require('player')
require('phase')
require('objectimage')
require('SFX')
require('playericons')
require('chooseclass')
require('encontro')
require('enemies')
require('currentstats')
require('pause')
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
	mainMenu, chooseclass.state, inGame, Encontro = 0, 1, 2, 3
	gameState = 0
	phase_load()
  chooseclass.load()
  pause.load()

end


function love.update(dt)
  
  if pause.state then
    pause.update(dt)
	elseif gameState == mainMenu then
    
  elseif gameState == chooseclass.state then
    
	elseif gameState == inGame then

		phase_update(dt)
    
  elseif gameState == Encontro then

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
    
  elseif gameState == Encontro then
    love.graphics.setFont(default_font)
		encontro.draw()
    battleHUD()
    
  end
  
  if pause.state then
    pause.draw()
  end


end


function love.keypressed(key)
  if pause.state then
    
    pause.select(key)
  
  end
  
  if key == 'p' and gameState==inGame then
    
    pause.state = not pause.state

  elseif gameState == mainMenu and not pause.state then

		mainmenu_select(key)
    
  elseif gameState == chooseclass.state and not pause.state then
    
    chooseclass.keypressed(key)
    chooseclass.keyEnter(key)
    
  elseif gameState == inGame and not pause.state then
    
    phase.keypressed(key)  --pass the keyboard input to the phase 
    
  elseif gameState == Encontro and not pause.state then
    
    encontro.keypressed(key)
	
  end


end
