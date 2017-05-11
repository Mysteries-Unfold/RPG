encontro = {}
encontro.teste="none"
do
  local selected_skill
  local previous_gameState
  local actions
  local selected_action
  local player
  local enemy
  
  encontro.load = function ()
    local w, h = love.graphics.getWidth(), love.graphics.getHeight()
    selected_skill     = 1                              --index of the selected skill
    previous_gameState = 0                              --previous state is 0 by default, but it will change  
    
    chooseAction, chooseSkill, inBattle, inBag, Flee = 0, 1, 2, 3, 4 --encontro states
    encontro.state = chooseAction                         --starts with chooseAction
    
    actions={}                                          -- the action options
    table.insert(actions, {"Fight", (w/4)+(w*3/32), (h*3/4)+(h/24), w*3/16, h/24})         --x, y, width, height
    table.insert(actions, {"Flee", (w/4)+(w*3/32)+(w*3/8), (h*3/4)+(h/24), w*3/16, h/24})  --x, y, width, height
    table.insert(actions, {"Item", (w/4)+(w*3/32), (h*3/4)+(h/24)+(h/12)+(h/24), w*3/16, h/24})--x, y, width, height
    selected_action = 1                                 --action selected index, actions[1] = "Fight"
    
  end
  
  encontro.setPlayers = function (jogador, inimigo, gameState)--players of the encontro, and the gameState they were
    
    player, enemy = jogador, inimigo  --set player and anemy to jogador and inimigo, so it can be used anywhere in here
    previous_gameState = gameState                      -- save the gameState before ente the battle
    
  end
    
  encontro.update = function (dt)
    
    if encontro.state == inBattle then                  --do the animation of batle effects
      
    end
  
  end
  
  encontro.keypressed = function (key)
    
    if encontro.state == chooseAction then
      
      if key=="return" or key=="enter" then
        
        if actions[selected_action][1] == "Fight" then      --if the user choose to fight
          
          encontro.state = chooseSkill                   --change state choose skill
          
        elseif actions[selected_action][1] == "Item" then      --if the user choose to fight
          
          encontro.state = inBag                   --change state choose skill
          
        end
        
      elseif (key == "right") and (selected_action==1) then
        
        selected_action = selected_action + 1  -- add the index by 1, so it will move to the next one
        
      elseif (key == "left") and (selected_action==2) then
      
        selected_action = selected_action - 1  -- subtracts the index by 1, so it will move to the previous one
        
      elseif (key == "up") and (selected_action==3) then
        
        selected_action = selected_action - 2  -- add the index by 2, so it will move upwards
        
      elseif (key == "down") and (selected_action==1) then
      
        selected_action = selected_action + 2  -- subtracts the index by 2, so it will move downwards
        
      end
      
    elseif encontro.state == chooseSkill then
      
      if key == "return" then                  -- if the user choose the skill
      
        encontro.state = inBattle              -- change the state to battle
      
      elseif (key == "down") and (selected_skill < 6) then
        
        selected_skill = selected_skill + 1
        
      elseif (key == "up") and (selected_skill > 1) then
        
        selected_skill = selected_skill - 1
        
      end
      
    end
    
  end
  
  endBattle = function ()
    
    player, enemy      = nil, nil             --resets player anf enemy values
    gameState          = previous_gameState   --change the gameState
    
  end
  
  encontro.draw = function ()
    love.graphics.setColor(255, 255, 255)
    love.graphics.print(tostring(encontro.teste), 0, 0)
    
    local w, h, fy =  love.graphics.getWidth(), love.graphics.getHeight(), love.graphics.getFont():getHeight()
    
    -------------------------------------CHOOSE ACTION--------------------------------------------------------
    
    love.graphics.setColor(255, 255, 255)       --set color to white
    love.graphics.rectangle("line", w/4, h*3/4, w*3/4, h/4)  --draw the options rectangle
    
    for index=1, #actions do                    --draw the options
      
      if (index == selected_action) and (encontro.state == chooseAction) then --check if the action is selected
        
        love.graphics.setColor(0, 0, 255)       --if so, change the background of the option to blue
        
      else 
        
        love.graphics.setColor(255, 255, 255)   --if not, change the background of the option to white(normal)
        
      end
      
      love.graphics.rectangle("line", actions[index][2], actions[index][3], actions[index][4], actions[index][5])
  
      
      love.graphics.setColor(255, 255, 255)
      love.graphics.printf(actions[index][1], actions[index][2], actions[index][3]+(((h/24)-(fy))/2), actions[index][4], "center")
    
    end
    
    ---------------------------------------SKILLS--------------------------------------------------------------
    
    for index=1, 6 do                            --draw the not selected skills slots
      
      if (index ~= selected_skill) then 
        
        love.graphics.setColor(255, 255, 255)    --set the color (white)
        love.graphics.rectangle("line", 0, (index-1)*(h/6), w/4, h/6)  --draw the not selected skills
        
      end
    
    end
    --draw the selected slot
    if encontro.state~=chooseSkill then 
      love.graphics.setColor(255, 255, 255)       --set the color to blue (selected) if its time to select
    else
      love.graphics.setColor(0, 0, 255)           --set the color to white(normal) if its not the time to select
    end
    
    love.graphics.rectangle("line", 0, (selected_skill-1)*(h/6), w/4, h/6)  --draw the selected skill
    
    --apply dark filters 
    if encontro.state ~= chooseSkill then         --if its not the time to select skills
      love.graphics.setColor(0, 0, 0, 160)        -- set the color to black transparent
      love.graphics.rectangle("fill", 0, 0, w/4, h)  --draw the filter
    end
    if encontro.state ~= chooseAction then    --if its not the time to select skills
      love.graphics.setColor(0, 0, 0, 160)        -- set the color to black transparent
      love.graphics.rectangle("fill",  w/4, h*3/4, w*3/4, h/4)  --draw the filter
    end
  
  end
end