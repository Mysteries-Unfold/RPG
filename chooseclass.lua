--CHOOSE CLASS SCREEN--
chooseclass={}
function chooseclass.load()             --load the classes
  
  --settings
  chooseclass.font        =  love.graphics.newFont(40)  -- title font
  chooseclass.stats_font  =  love.graphics.newFont(17)  --stats font

  --create the class
  classes                 = {}          --contain all the classes avaliable
  classes.selected_index  = 1           --the index of the class selected, to control the class change with the right and left button
  
  archer                  = {}          --archer class
  archer.image            = love.graphics.newImage("iconplayer/archer.jpg") 
  archer.hp               = 4           --hp
  archer.mp               = 2
  archer.atk              = 10          --atk
  archer.spatk            = 5           --sp atk
  archer.def              = 2           --def
  archer.spd              = 7           --spd
  archer.spdef            = 0           --sp def
  archer.selected         = true        --indicates if the user is selecting it
  table.insert(classes, archer)         --adds the class to the classes table  
  
  warrior                 = {}          --warrior class
  warrior.image           = love.graphics.newImage("iconplayer/saber.jpg")
  warrior.hp              = 5           --hp
  warrior.mp              = 1
  warrior.atk             = 8           --atk
  warrior.spatk           = 3           --sp atk
  warrior.def             = 10          --def
  warrior.spd             = 2           --spd
  warrior.spdef           = 0           --sp def
  warrior.selected        = false       --indicates if the user is selecting it      
  table.insert(classes, warrior)        --adds the class to the classes table
  
  mage                    = {}          --mage class 
  mage.image              = love.graphics.newImage("iconplayer/sorcerer.jpg")
  mage.hp                 = 7           --hp
  mage.mp                 = 10 
  mage.atk                = 3           --atk
  mage.spatk              = 10          --sp atk 
  mage.def                = 5           --def
  mage.spd                = 3           --spd
  mage.spdef              = 0           --sp def
  mage.selected           = false       --indicates if the user is selecting it
  table.insert(classes, mage)           --adds the class to the classes table
  
  thief                   = {}          --thief class
  thief.image             = love.graphics.newImage("iconplayer/thief.jpg")
  thief.hp                = 3           --hp
  thief.mp                = 1
  thief.atk               = 7           --atk
  thief.spatk             = 2           --sp atk
  thief.def               = 6           --def
  thief.spd               = 10          --spd
  thief.spdef             = 0           --sp def
  thief.selected          = false       --indicates if the user is selecting it
  table.insert(classes, thief)          --adds the class to the classes table
  
  

end

function chooseclass.update(dt)
  
end
function chooseclass.keyEnter(key)
  if key=='return' then               --if the user selected the class, start the game
    gameState = 2
    --check which class os the selected one, and then loads the class image
    if thief.selected then
      
      player.image = thief.image      --load the thief image
      
    elseif mage.selected then
      
      player.image = mage.image       --load the mage image
      
    elseif archer.selected then
      
      player.image = archer.image     --load the archer image
      
    elseif warrior.selected then
      
      player.image = warrior.image    --load the warrior image
      
    end  
    
    player.icon=love.graphics.newQuad(50,100,650,1090,player.image:getDimensions())
    player.currentstatsload()
  end
end

function chooseclass.keypressed(key)
  
  --handle keyboard input, move selecte class, choose the class
  if (key == 'd') and (classes.selected_index<4) then    --checks if the user is changing the selected class, and if its possible
    
    classes.selected_index    = classes.selected_index + 1   --adds the index, so it will move the selected to the right
    
    for index=1, #classes do                              --sets all the classes item selected to false, so it will set the new one to true
      
      classes[index].selected = false                     --classes[index] is each class
    
    end
    
    classes[classes.selected_index].selected = true       --set the new selected class to true
    
  elseif (key == 'a') and (classes.selected_index>1) then --checks if the user is changing the selected class, and if its possible
    
    classes.selected_index    = classes.selected_index - 1   --subtracts the index, so it will move the selected to the left
    
    for index=1, #classes do                              --sets all the classes item selected to false, so it will set the new one to true
      
      classes[index].selected = false                     --classes[index] is each class
    
    end
    
    classes[classes.selected_index].selected = true       --set the new selected class to true
  
  end
  
end

function chooseclass.draw()                              --draw
  
  local width, height = love.graphics:getWidth(), love.graphics:getHeight() --sets width and heigh to the window width and height
  
  love.graphics.setColor(100, 100, 100)                  --set color to grey, so the background will be grey
  love.graphics.rectangle("fill", 0, 0, width, height)   --create a rectangle at 0, 0, with window width and height as background
  
  love.graphics.setColor(255, 255, 255)                  --set color to white, so the text color will be white
  love.graphics.setFont(chooseclass.font)                --set the font to the title font
  love.graphics.printf("Choose Your Class", 0, height/100, width, "center")
  
  local class = classes[classes.selected_index] --assigns the selected class to the local variable
  
  love.graphics.draw(class.image, (width/2)+(width/100), (height/10)+(height/50), 0, 4816/12800, 4816/12800) --draw the user sprite on the right
  
  --draw the stats bar for each stats
  local stats_x = (width/2)+(width/50)+(class.image:getWidth()*4816/12800)--do the math of the stats_x here
  
  love.graphics.setFont(chooseclass.stats_font)          --set font
  love.graphics.setColor(255, 255, 255)                  --set color to white
  
  love.graphics.printf("HP: "..tostring(class.hp), stats_x, (height*2/10)-chooseclass.stats_font:getHeight(), width-stats_x, "left")
  love.graphics.rectangle("fill", stats_x, height*2/10, (width-stats_x-(width/100))*(class.hp/10), height/50)
  
  love.graphics.printf("ATK: "..tostring(class.atk), stats_x, (height*3/10)-chooseclass.stats_font:getHeight(), width-stats_x, "left")
  love.graphics.rectangle("fill", stats_x, height*3/10, (width-stats_x-(width/100))*(class.atk/10), height/50)
  
  love.graphics.printf("SP ATK: "..tostring(class.spatk), stats_x, (height*4/10)-chooseclass.stats_font:getHeight(), width-stats_x, "left")
  love.graphics.rectangle("fill", stats_x, height*4/10, (width-stats_x-(width/100))*(class.spatk/10), height/50)
  
  love.graphics.printf("DEF: "..tostring(class.def), stats_x, (height*5/10)-chooseclass.stats_font:getHeight(), width-stats_x, "left")
  love.graphics.rectangle("fill", stats_x, height*5/10, (width-stats_x-(width/100))*(class.def/10), height/50)
  
  love.graphics.printf("SPD: "..tostring(class.spd), stats_x, (height*6/10)-chooseclass.stats_font:getHeight(), width-stats_x, "left")
  love.graphics.rectangle("fill", stats_x, height*6/10, (width-stats_x-(width/100))*(class.spd/10), height/50)
  
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
--Contact GitHub 
