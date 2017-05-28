require('mainmenu')
require('phase')
require('player')
require('phase')
require('SFX/SFX')
require('chooseclass')
require('encontro')
require('enemies')
require('currentstats')
require('pause')
require('Animations/ANIMsample')
require('Animations/ANIMenemies')
require('Animations/ANIMarmed')
require('hitboxer')
require('skill_tree/SkillTreeMove')

function love.load()
  
  -- fonte padrão chamada em lugares onde ela é necessária
  default_font=love.graphics.newFont(14)
  
  -- efeitos sonoros
  SFX.load()
  
  --estados de jogo/fases
	mainMenu, chooseclass.state, inGame, Encontro = 0, 1, 2, 3
	gameState = 0
	phase_load()
  chooseclass.load()
  pause.load()
  
  --PROTOTIPO DE ANIMAÇÃO
  ANImy.load()
  animasample.load()
  
  --hitbox
  hitboxer.load()
  
  --skill_tree
  skill_tree_load()

end


function love.update(dt)
  
  if pause.state then
    pause.update(dt)
	elseif gameState == mainMenu then
    
  elseif gameState == chooseclass.state then
    
	elseif gameState == inGame then

		phase_update(dt)
    
    --hitbox
    hitboxer.update(dt)
    
    --animação
    animasample.update(dt)
    
  elseif gameState == Encontro then
    
    encontro.update(dt)
    
    --PROTOTIPO DE ANIMAÇÃO
    ANImy.update(dt)
  
    direita:update(dt)
    
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

    
    animasample.draw()
    
  elseif gameState == Encontro then
    
    love.graphics.setFont(default_font)
    
    --CAIXAS
		encontro.draw()
    
    --INIMIGO PROTOTIPO DE ANIMAÇÃO
    ANImy.draw()
    
    
    --BARRAS DE HP/MP
    --battleHUD()
    
    --JOGADOR PROTOTIPO DE ANIMAÇÃO
    animasample.drawB()
    
    
    
  end
  
  if pause.state then
    
    pause.draw()
    
    if selecting_skills then
      
      love.graphics.setColor(255,255,255)
      skill_tree_draw()
      love.graphics.setColor(55,55,55)
      
    end
  end


end


function love.keypressed(key)
  if selecting_skills then
    
      skill_tree_keypressed(key)
      
  elseif pause.state then
    
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