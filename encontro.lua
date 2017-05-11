encontro = {}
function encontro.load()
  local w, h = love.graphics.getWidth(), love.graphics.getHeight()
  encontro.player, encontro.enemy = nil, nil          --they are nil, for now
  selected_index     = 1                              --index of the selected skill
  previous_gameState = 0                              --previous state is 0 by default, but it will change  
  
  chooseAction, chooseSkill, inBattle, inBag, Flee = 0, 1, 2, 3, 4 --encontro states
  encotroState = chooseAction                         --starts with chooseAction
  
  actions={}                                          -- the action options
  table.insert(actions, {"Fight", (w/4)+(w*3/32), (h*3/4)+(h/24), w*3/16, h/24})
  table.insert(actions, {"Flee", (w/4)+(w*3/32)+(w*3/8), (h*3/4)+(h/24), w*3/16, h/24})
  table.insert(actions, {"Item", (w/4)+(w*3/32), (h*3/4)+(h/24)+(h/12)+(h/24), w*3/16, h/24})
  selected_action = 1                                 --action selected index, actions[1] = "Fight"
  
end

function encontro.setPlayers(jogador, inimigo, gameState)--players of the encontro, and the gameState they were
  
  encontro.player, encontro.enemy = jogador, inimigo  --set player and anemy to jogador and inimigo, so it can be used anywhere in here
  previous_gameState = gameState                      -- save the gameState before ente the battle
  
end
  
function encontro.update(dt)

end

function encontro.keypressed(key)
  if encotroState == chooseAction then
    
    if (key == "right") and (selected_action<3) then
      
      selected_action = selected_action + 1  -- add the index by 1, so it will move to the next one
      
    elseif (key == "left") and (selected_action>1) then
    
      selected_action = selected_action - 1  -- subtracts the index by 1, so it will move to the previous one
    end
    
  elseif encontroState == chooseSkill then
    
    if (key == "down") and (selected_index < #encontro.skills) then
      
      selected_index = selected_index + 1
      
    elseif (key == "up") and (selected_index > 1) then
      
      selected_index = selected_index - 1
      
    elseif key == "return" then
      
      
      
    end
    
  end
  
end

function endBattle()
  
  player, enemy      = nil, nil             --resets player anf enemy values
  gameState          = previous_gameState   --change the gameState
  
end

function encontro.draw()
  
  local w, h =  love.graphics.getWidth(), love.graphics.getHeight()
  
  for index=1, 6 do                          --draw the skills slots
    
    love.graphics.setColor(255, 255, 255)     --set the colorv (white)
    love.graphics.rectangle("line", 0, (index-1)*(h/6), w/4, h/6)
    
  end
  
  love.graphics.rectangle("line", w/4, h*3/4, w*3/4, h/4)  --draw the options rectangle
  
  for index=1, #actions do                    --draw the options
    
    if index == selected_action then          --check if the action is selected
      
      love.graphics.setColor(255, 255, 255)   --if so, change the background of the option to green
      love.graphics.rectangle("line", actions[selected_action][2], actions[selected_action][3], actions[selected_action][4], actions[selected_action][5])
    end
    
    love.graphics.setColor(255, 255, 255)
    love.graphics.printf(actions[index][1], actions[index][2], actions[index][3], actions[index][4], "center")
  
  end
  
end