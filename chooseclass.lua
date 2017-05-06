--CHOOSE CLASS SCREEN--

function chooseclass_load()             --load the classes
  
  --settings
  title_font              =  love.graphics.newFont(40)  -- title font

  --create the class
  classes                 = {}          --contain all the classes avaliable
  classes.selected_index  = 1           --the index of the class selected, to control the class change with the right and left button
  
  archer                  = {}          --archer class
  archer.image            = "none" 
  archer.hp               = 4           --hp
  archer.atk              = 10          --atk
  archer.spatk            = 5           --sp atk
  archer.def              = 2           --def
  archer.spd              = 7           --spd
  archer.selected         = true        --indicates if the user is selecting it
  table.insert(classes, archer)         --adds the class to the classes table  
  
  warrior                 = {}          --warrior class
  warrior.image           = "none"
  warrior.hp              = 5           --hp
  warrior.atk             = 8           --atk
  warrior.spatk           = 3           --sp atk
  warrior.def             = 10          --def
  warrior.spd             = 2           --spd
  warrior.selected        = false       --indicates if the user is selecting it      
  table.insert(classes, warrior)        --adds the class to the classes table
  
  mage                    = {}          --mage class 
  mage.image              = "none"
  mage.hp                 = 10          --hp
  mage.atk                = 3           --atk
  mage.spatk              = 7           --sp atk 
  mage.def                = 5           --def
  mage.spd                = 3           --spd
  mage.selected           = false       --indicates if the user is selecting it
  table.insert(classes, mage)           --adds the class to the classes table
  
  thief                   = {}          --thief class
  thief.image             = "none"
  thief.hp                = 3           --hp
  thief.atk               = 7           --atk
  thief.spatk             = 2           --sp atk
  thief.def               = 6           --def
  thief.spd               = 10          --spd
  thief.selected          = false       --indicates if the user is selecting it
  table.insert(classes, thief)          --adds the class to the classes table
  
  

end

function chooseclass_update(dt)
  
end

function chooseclass_select(key)                             --handle keyboard input, move selecte class, choose the class
  if (key == 'right') and (classes.selected_index<4) then    --checks if the user is changing the selected class, and if its possible
    
    classes.selected_index    = classes.selected_index + 1   --adds the index, so it will move the selected to the right
    
    for index=1, #classes do                              --sets all the classes item selected to false, so it will set the new one to true
      
      classes[index].selected = false                     --classes[index] is each class
    
    end
    
    classes[classes.selected_index].selected = true       --set the new selected class to true
    
  elseif (key == 'left') and (classes.selected_index>1) then --checks if the user is changing the selected class, and if its possible
    
    classes.selected_index    = classes.selected_index - 1   --subtracts the index, so it will move the selected to the left
    
    for index=1, #classes do                              --sets all the classes item selected to false, so it will set the new one to true
      
      classes[index].selected = false                     --classes[index] is each class
    
    end
    
    classes[classes.selected_index].selected = true       --set the new selected class to true
  
  elseif key=='enter' then                                --if the user selected the class, start the game
    
    gameState = 2
    
  end
  
end

function chooseclass_draw()                              --draw
  
  local width, height = love.graphics:getWidth(), love.graphics:getHeight() --sets width and heigh to the window width and height
  
  love.graphics.setColor(100, 100, 100)                  --set color to grey, so the background will be grey
  love.graphics.rectangle("fill", 0, 0, width, height)   --create a rectangle at 0, 0, with window width and height as background
  
  love.graphics.setColor(255, 255, 255)                  --set color to white, so the text color will be white
  love.graphics.setFont(title_font)                      --set the font the default font with the size 40
  love.graphics.printf("Choose Your Class", 0, height/100, width, "center")
  
  for index=1, #classes do                               --draw the options for each class
    
    if classes[index].selected == true then              --if the class is the selected one, draws selected
      
      love.graphics.setColor(151, 252, 151)              --light green, selected
      
    else                                                 --if its not the selected class, draws normal
      
      love.graphics.setColor(80, 80, 80)                 --grey darker than the background, not selected
      
    end
    
    if index==1 or index == 2 then                       -- checks if the box has to be on the upper half
      
      love.graphics.rectangle("fill", (width/4)*((index+1)%2), height/10, width/4, height*9/20) --draws the rectangle
      --[[x = (width/4)*((index+1)%2), (because index+1)%2 will be or 1 or 0, so the x position will be at the start, or at
      width/4, basically index 1 and 3 will be at start, and 2 and 4, at width/4
      ]]--
      
    else
      
      love.graphics.rectangle("fill", (width/4)*((index+1)%2), (height/10)+(height*9/20), width/4, height*9/20) --draws the rectangle
      --[[x = (width/4)*((index+1)%2), same thing as the previous, whats is different here is the y position, they are under the
      rectangle before, so their y will be the previous y + the previous height, y = (height/10)+(height*9/20)
      ]]--
      
    end
    
  end

end
Contact GitHub 
