  player = {}

function player.load()
  player.image = love.graphics.newImage("player.png")
  player.x = (love.graphics.getWidth())/4;
  player.y = (love.graphics.getHeight())/2;
  player.speed = 250;
  player.friction = 1;
  player.xvelocity = 0;
  player.yvelocity = 0;
  player.radius = 50;
end


function player.physics(dt)
    player.x =  player.x + player.xvelocity * dt;
    player.y = player.y + player.yvelocity * dt;
    
    player.xvelocity = player.xvelocity * (1-math.min(dt*player.friction, 1));
    player.yvelocity = player.yvelocity * (1-math.min(dt*player.friction, 1));
end


function player.move(dt)
  
   if love.keyboard.isDown("right") and player.xvelocity < player.speed then
     player.xvelocity = player.xvelocity + player.speed * dt;
     end
  
  if love.keyboard.isDown("left") and player.xvelocity > -player.speed then
    player.xvelocity = player.xvelocity - player.speed *dt;
  end
  
  if love.keyboard.isDown("down") and player.yvelocity < player.speed then
    player.yvelocity = player.yvelocity + player.speed * dt;
  end
    
  if love.keyboard.isDown("up") and player.yvelocity > -player.speed then
    player.yvelocity = player.yvelocity - player.speed * dt;
  end
end

function player.update(dt)
    player.physics(dt)
    player.move(dt)
end

function player.draw()
    love.graphics.draw(player.image, player.x,player.y)
  end