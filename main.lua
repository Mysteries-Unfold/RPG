require('mainmenu')
require('phase')
require('player')
require('phase')
require('objectimage')
require('SFX')
require('playericons')
require('chooseclass')
require('encontro')

function love.load()
  --
  pause = false
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

end


function love.update(dt)
  
  if pause then

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
    
  elseif gameState == Encontro then
    love.graphics.setFont(default_font)
		encontro.draw()
    
  end
  
  if pause then
    local w, h = love.graphics.getWidth() , love.graphics.getHeight()          --get width and height of window
    love.graphics.setColor(11, 104, 70)                                          --set color
    love.graphics.rectangle("fill", (w/2)-(w/6)-(w/100), (h/2)-(h*3/10)-(h/100)-(h/200), (w/3)+(w/50), (h*3/5)+(h*3/100)) --draw pause box
    love.graphics.setColor(5, 43, 29)
    love.graphics.rectangle("fill", (w/2) - (w/6) , (h/2)-(h*3/10),  w/3, h/5)
    love.graphics.rectangle("fill", (w/2) - (w/6) , (h/2)-(h*3/10)+(h/5)+(h/200),  w/3, h/5)
    love.graphics.rectangle("fill", (w/2) - (w/6) , (h/2)-(h*3/10)+(h*2/5)+(h/100),  w/3, h/5)
  end


end


function love.keypressed(key)
  
  if key == 'p' then
    
    pause = not pause

	elseif gameState == mainMenu and not pause then

		mainmenu_select(key)
    
  elseif gameState == chooseclass.state and not pause then
    
    chooseclass.keypressed(key)
    chooseclass.keyEnter(key)
    
  elseif gameState == inGame and not pause then
    
    phase.keypressed(key)  --pass the keyboard input to the phase 
    
  elseif gameState == Encontro and not pause then
    
    encontro.keypressed(key)
	
  end

  --Volta ao menu
	if key == 'escape' and gameState ~= mainMenu then

			gameState = 0
      love.load()

	end

end
