encontro = {}
encontro.teste="none" --for debug
encontro.turn = 0     --turn of the batlle
--do
local selected_skill
local previous_gameState
local actions
local selected_action
local player
local enemy
local active_background
local damage_count
local first
local skill_font
local cooldown_font
local w, h = love.graphics.getWidth(), love.graphics.getHeight()
  
encontro.load = function ()
  background = {}
  local background1 = love.graphics.newImage("battle/background/background-teste.jpg")
  table.insert(background, background1)
  
  cooldown_font      = love.graphics.newFont(16)     --cooldown font
  skill_font         = love.graphics.newFont(16)     --skill font
  
  selected_skill     = 1                             --index of the selected skill
  previous_gameState = 0                             --previous state is 0 by default, but it will change  
  
  chooseAction, chooseSkill, inBattle, inBag, Flee = 0, 1, 2, 3, 4 --encontro states
  encontro.state     = chooseAction                  --starts with chooseAction
  
  actions={}                                         -- the action options
  table.insert(actions, {"Fight", (w/4)+(w*3/32), (h*3/4)+(h/24), w*3/16, h/24})         --x, y, width, height
  table.insert(actions, {"Flee", (w/4)+(w*3/32)+(w*3/8), (h*3/4)+(h/24), w*3/16, h/24})  --x, y, width, height
  table.insert(actions, {"Item", (w/4)+(w*3/32), (h*3/4)+(h/24)+(h/12)+(h/24), w*3/16, h/24})--x, y, width, height
  selected_action    = 1                             --action selected index, actions[1] = "Fight"
  damage_count       = 0
  first              = true                          -- indicates if its the turn of the first one
end

encontro.setPlayers = function (jogador, inimigo, gameState)--players of the encontro, and the gameState they were
  
  player, enemy      = jogador, inimigo  --set player and anemy to jogador and inimigo, so it can be used anywhere in here
  for index=1, #player.skills do
    player.skills[index].cd_turn = 0
  end
  enemy.hpMax = enemy.hp                 --defines enemy hp max
  max_l = math.max(enemy.hpMax, player.hpMAX)
  previous_gameState = gameState                      -- save the gameState before ente the battle
  active_background  = background[gameState]
  local w, h = enemy.alive_image:getWidth(), enemy.alive_image:getHeight()
  enemy.w, enemy.h  = w, h
  
end
  
encontro.update = function (dt)
  
  if encontro.state == inBattle then                  --do the animation of batle effects
    
    if player.spd > enemy.spd then
      
      if first then
        enemy.hp = enemy.hp - (pdano*dt)
        if enemy.hp <= 0 then
          enemy.hp = 0
          --do end battle animation
          endBattle(false)
        end
        
        damage_count = damage_count - (pdano*dt)
        
        if damage_count <= 0  then
          damage_count = edano
          first = not first
        end
      else
        player.hp = player.hp - (edano*dt)
        if player.hp < 0 then
          player.hp = 0
        end
        
        damage_count = damage_count - (edano*dt)
        
        if damage_count <= 0  then
          damage_count = 0
          first = not first
          encontro.turn = encontro.turn + 1
          for index=1, #player.skills do                --reduce cooldowns of all skills
            player.skills[index].cd_turn = player.skills[index].cd_turn - 1
            if player.skills[index].cd_turn < 0 then
              player.skills[index].cd_turn = 0          --if cooldown negative, set to 0
            end
          end
          encontro.state = 0
        end
      end
      
    else
      
      if first then
        player.hp = player.hp - (edano*dt)
        if player.hp < 0 then
          player.hp = 0
        end
        
        damage_count = damage_count - (edano*dt)
        
        if damage_count <= 0  then
          damage_count = pdano
          first = not first
        end
      else
        enemy.hp = enemy.hp - (pdano*dt)
        if enemy.hp <= 0 then
          enemy.hp = 0
          --do end battle animation
          endBattle(false)
        end
        
        damage_count = damage_count - (pdano*dt)
        
        if damage_count <= 0  then
          damage_count = 0
          first = not first
          encontro.turn = encontro.turn + 1
          for index=1, #player.skills do      --reduce cooldowns of all skills
            player.skills[index].cd_turn = player.skills[index].cd_turn - 1
            if player.skills[index].cd_turn < 0 then   --if cooldown negative, set to 0
              player.skills[index].cd_turn = 0
            end
          end
          encontro.state = 0
        end
      end
    end
  end

end

encontro.keypressed = function (key)
  
  if encontro.state == chooseAction then
    
    if key=="return" or key=="enter" then
      
      if actions[selected_action][1] == "Fight" then    --if the user choose to fight
        
        encontro.state = chooseSkill                    --change state choose skill
        
      elseif actions[selected_action][1] == "Item" then --if the user choose to fight
        
        encontro.state = inBag                          --change state choose skill
        
      elseif actions[selected_action][1] == "Flee" then --if the user choose to fight
        
        --do the quick time event
        --...
        endBattle(true)                            --end battle
        
      end
      
    elseif (key == "d") and (selected_action==1) then
      
      selected_action = selected_action + 1  -- add the index by 1, so it will move to the next one
      
    elseif (key == "a") and (selected_action==2) then
    
      selected_action = selected_action - 1  -- subtracts the index by 1, so it will move to the previous one
      
    elseif (key == "w") and (selected_action==3) then
      
      selected_action = selected_action - 2  -- add the index by 2, so it will move upwards
      
    elseif (key == "s") and (selected_action==1) then
    
      selected_action = selected_action + 2  -- subtracts the index by 2, so it will move downwards
      
    end
    
  elseif encontro.state == chooseSkill then
    
    if key == "return" and player.skills[selected_skill].cd_turn == 0 then  -- if the user choose the skill
      player.skills[selected_skill].cd_turn = player.skills[selected_skill].cd_turn + player.skills[selected_skill].cooldown                     --adds the cooldown
      
      pdano = (player.skills[selected_skill].damage)-(enemy.def)  --player total damage
      if pdano < 0 then         --damage cant be negative
        pdano = 0
      end
      
      edano = (6)-(player.def) --enemy total damage
      if edano < 0 then         --damage cant be negative
        edano = 0
      end
      
      if player.spd > enemy.spd then   --sets the damage count to whoever is the faster 
        
        damage_count = pdano
        
      else                             --sets the damage count to whoever is the faster 
        
        damage_count = edano
        
      end
      
      encontro.state = inBattle              -- change the state to battle
      
    elseif (key == "s") and (selected_skill < #player.skills) then
      
      selected_skill = selected_skill + 1
      
    elseif (key == "w") and (selected_skill > 1) then
      
      selected_skill = selected_skill - 1
      
    end
    
  end
  
end

endBattle = function (flee)
  
  --do end battle things...
  if flee then                              --check if the battle ended because the player fled
    player.chicken = true
  else
    local enemytt = enemies["phase1"][1]
    enemies["phase1"][1].alive_image, enemies["phase1"][1].dead_image = enemies["phase1"][1].dead_image, enemies["phase1"][1].alive_image
    enemies["phase1"][1].alive = false
  end
  
  player, enemy      = nil, nil             --resets player anf enemy values
  
  gameState          = 2                    --change the gameState
  
end

encontro.draw = function ()
  love.graphics.setColor(255, 255, 255)
  
  local w, h, fy =  love.graphics.getWidth(), love.graphics.getHeight(), love.graphics.getFont():getHeight()
  
  ----------------------------------------BATTLE------------------------------------------------------------
  
  love.graphics.draw(active_background, w/4, 0, 0, 3/4, 3/4) -- draw the battle background
  
  --love.graphics.draw(enemy.alive_image, (w*3/8)+(w/4), h/6, 0, ((h*12/24)/(enemy.h)), ((h*12/24)/(enemy.h)))
  
  --draw hp, hp total = 10/24 of (3*w/4)(  = battle screen)
  local tx = ((30*w/96)/max_l)
  love.graphics.setColor(0, 255, 0)
  love.graphics.rectangle("fill", (w/4)+(3*w/96), h/18, tx*player.hp, h/36)   --draw player hp
  
  love.graphics.rectangle("fill", (w)-(tx*enemy.hp)-(3*w/96), h/18, tx*enemy.hp, h/36)   --draw enemy hp
  
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("line", (w/4)+(3*w/96), h/18, tx*player.hpMAX, h/36)   --draw player total hp
  
  love.graphics.rectangle("line", (w)-(tx*enemy.hpMax)-(3*w/96), h/18, tx*enemy.hpMax, h/36) --draw enemy total hp 
  
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
  
  for index=1, #player.skills do                            --draw the not selected skills slots
    
    love.graphics.setColor(player.skills[index].color[1], player.skills[index].color[2], player.skills[index].color[3])    --set the color to the skill color
    love.graphics.rectangle("fill", 0, (index-1)*(h/6), w/4, h/6)  --draw the not selected skills
    
    if player.skills[index].cd_turn>0 then                           --check if the skills is in cooldown
      love.graphics.setColor(0, 0, 0, 100)                           --set filter color
      love.graphics.rectangle("fill", 0, (index-1)*(h/6), w/4, h/6)  --draw the cooldown filter
      love.graphics.setFont(cooldown_font)
      local ht = cooldown_font:getHeight()
      love.graphics.setColor(255, 255, 255)                           --set filter color
      love.graphics.printf("Cooldown: "..player.skills[index].cd_turn, 0, (((2*index)-1)*(h/12))-(ht/2), w/4, "center")
    else
      local ht = skill_font:getHeight()
      love.graphics.setFont(skill_font)
      love.graphics.setColor(255, 255, 255)                           --color
      love.graphics.printf(tostring(player.skills[index].name), w/12, (((4*index)-3)*(h/24))-(ht/2), w/6, "center")
      love.graphics.printf("cooldown: "..player.skills[index].cd_turn, w/12, (((4*index)-1)*(h/24))-(ht/2), w/6, "center")
      
    end
    
  end

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
  
  love.graphics.print(tostring(encontro.teste), 0, 0, 0)
end
--end