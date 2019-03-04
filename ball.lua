require "player"

ball = {}

function ball.load()
ball.image = love.graphics.newImage("ball.png")
ball.x  = 500
ball.y = 300
ball.radius = 5
ball.xvelocity = 0
ball.yvelocity = 0
ball.friction = 2
ball.xSpeed = 500
ball.ySpeed = 500
height = love.graphics.getHeight() - 200
width = love.graphics.getWidth() - 200
end


function ball.show(px, py, bx, by, pr, br)
    local dx = bx - px
    local dy = by - py
    local dist = math.sqrt(dx*dx + dy*dy)
    if dist < pr + br then
    return true
    end
end

function ball.physics(dt)
    ball.x =  ball.x + ball.xvelocity * dt;
    ball.y = ball.y + ball.yvelocity * dt;
     ball.xvelocity = ball.xvelocity * (1-math.min(dt*ball.friction, 1));
     ball.yvelocity = ball.yvelocity * (1-math.min(dt*ball.friction, 1));
end


function ball.isCollision(dt)
        if ball.show(player.x, player.y, ball.x, ball.y,player.radius, ball.radius) == true then
   
    if player.x > ball.x and  player.y > ball.y and ball.xvelocity < ball.xSpeed 
    and ball.yvelocity > -ball.ySpeed then  
      --right and top
        if love.keyboard.isDown('a') then
        ball.xvelocity = ball.xvelocity-400 - ball.xSpeed * dt;
        ball.yvelocity = ball.yvelocity-400 - ball.ySpeed * dt;
        
      end
      
        ball.xvelocity = ball.xvelocity - ball.xSpeed * dt;
        ball.yvelocity = ball.yvelocity - ball.ySpeed * dt;
        
    elseif player.x > ball.x and  player.y < ball.y and ball.xvelocity < ball.xSpeed 
    and ball.yvelocity > - ball.ySpeed
    then  --right and bottom
      
      if love.keyboard.isDown('a') then
        ball.xvelocity = ball.xvelocity-400 - ball.xSpeed * dt;
        ball.yvelocity = ball.yvelocity+400 + ball.ySpeed * dt;
      end
      
        ball.xvelocity = ball.xvelocity - ball.xSpeed *dt;
        ball.yvelocity = ball.yvelocity + ball.ySpeed * dt;
      
    elseif player.x < ball.x and player.y > ball.y and ball.xvelocity > -ball.xSpeed 
    and ball.yvelocity > - ball.ySpeed 
    then --left and top
      
        if love.keyboard.isDown('a') then
        ball.xvelocity = ball.xvelocity+400 + ball.xSpeed * dt;
        ball.yvelocity = ball.yvelocity-400 - ball.ySpeed * dt;
        end
        
        ball.xvelocity = ball.xvelocity + ball.xSpeed * dt;
        ball.yvelocity = ball.yvelocity - ball.ySpeed * dt;
        
    elseif player.x < ball.x and  player.y < ball.y and ball.xvelocity > -ball.xSpeed
    and ball.yvelocity > -ball.ySpeed
    then  --left and bottom
       
        if love.keyboard.isDown('a') then
        ball.xvelocity = ball.xvelocity+400 + ball.xSpeed * dt;
        ball.yvelocity = ball.yvelocity+400 + ball.ySpeed * dt;
        end
      
       ball.xvelocity = ball.xvelocity + ball.xSpeed * dt;
       ball.yvelocity = ball.yvelocity + ball.ySpeed * dt;
       
    end
  end
  
end



function ball.update(dt)
  if ball.y <= 100 then --top
    ball.y = 100
    ball.yvelocity = ball.yvelocity+200 + ball.ySpeed * dt;
   -- ball.yspeed = -ball.ySpeed
  
  elseif ball.y  >= height then --bottom
    ball.y = height
    ball.yvelocity = ball.yvelocity-200 - ball.ySpeed * dt;
  --  ball.ySpeed = -ball.ySpeed
  end
  
  if ball.x <= 100 then --left
     ball.x =  100
     ball.xvelocity = ball.xvelocity+200 + ball.xSpeed *dt;
    -- ball.xSpeed = -ball.xSpeed
  
elseif ball.x >= width then --right
    ball.x = width
    ball.xvelocity = ball.xvelocity-200 - ball.xSpeed *dt;
   -- ball.xSpeed = -ball.xSpeed
  end
  
  if ball.x <= 100 and ball.y >= height then --left and bottom
      ball.xvelocity = ball.xvelocity+200 + ball.xSpeed * dt;
      ball.yvelocity = ball.yvelocity-200 - ball.ySpeed * dt;
  end
  
  if ball.x <= 100 and ball.y < 100 then -- left and top
    ball.xvelocity = ball.xvelocity + ball.xSpeed * dt;
    ball.yvelocity = ball.yvelocity + ball.ySpeed * dt;
  end
  
  if ball.x >= width and ball.y >= height then --right and bottom
    ball.xvelocity = ball.xvelocity+200 - ball.xSpeed * dt;
    ball.yvelocity = ball.yvelocity+200 - ball.ySpeed * dt;
  end
  
  if ball.x <= 100 and ball.y < 100 then -- right and top
    ball.xvelocity = ball.xvelocity + 200 - ball.xSpeed * dt;
    ball.yvelocity = ball.yvelocity + 200 + ball.ySpeed * dt;
  end
      
  ball.isCollision(dt)
  ball.physics(dt)
--  ball.shot(dt)
  
end

function ball.draw()
  love.graphics.draw(ball.image, ball.x, ball.y)
  if ball.show(player.x, player.y, ball.x, ball.y,player.radius, ball.radius) == true then
    love.graphics.print("press 'a' to pick up ball", ball.x - 15, ball.y - 10)
  end
end