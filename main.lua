require "ball"
require "player"

function love.load()
  player.load()
  ball.load()
  isPlaying = false
  video = love.graphics.newVideo("jennie.ogv")
end


function love.update(dt)
 player.update(dt)
 ball.update(dt)
end

function love.keypressed(key)
  if key == 'j' then
    isPlaying = true
    video = love.graphics.newVideo("jennie.ogv")
    video:play()
  end 
  if key == 's' then
    isPlaying = false
    video:pause()
    video:release()
    end
 end

  

function love.draw()
   love.graphics.rectangle("fill", 120,120 , width-80,height-80)
  if isPlaying == true then 
    love.graphics.draw(video, 175,100 )
  end
    player.draw()
    ball.draw()
    love.graphics.setBackgroundColor(0 , 0, 0, 0)
  end