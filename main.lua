debug = true
local anim8 = require('anim8')

function love.load(arg)
  love.graphics.setBackgroundColor(255,255,255)

  local spritesheet = love.graphics.newImage('J-SAW.png')
  local g = anim8.newGrid(120, 160, spritesheet:getWidth(), spritesheet:getHeight())

  player = {
    spritesheet = spritesheet,
    x = 100,
    y = 500,
    speed = 150,
    animations = {
      idleLeft = anim8.newAnimation(g(1,1, 2,1), .5),
      idleRight = anim8.newAnimation(g(6,1, 7,1), .5),
      walkLeft = anim8.newAnimation(g(3,1, 1,1, 4,1, 1,1), .25),
      walkRight = anim8.newAnimation(g(8,1, 6,1, 9,1, 6,1), .25),
      chopLeft = anim8.newAnimation(g(1,1, 5,1), .25),
      chopRight = anim8.newAnimation(g(6,1, 10,1), .25)
    }
  }
  player.animation = player.animations.idleLeft
end

function love.update(dt)
  if love.keyboard.isDown('left') then
    if player.x > 0 then
      player.x = player.x - (player.speed*dt)
      player.animation = player.animations.walkLeft
    end
  elseif love.keyboard.isDown('right') then
    if player.x < (love.graphics.getWidth() - 120) then
      player.x = player.x + (player.speed*dt)
      player.animation = player.animations.walkRight
    end
  elseif love.keyboard.isDown('space') then
    if player.animation == player.animations.idleLeft then
      player.animation = player.animations.chopLeft
    elseif player.animation == player.animations.idleRight then
      player.animation = player.animations.chopRight
    end
  end
  player.animation:update(dt)
end

function love.keyreleased(key)
  if key == 'left' then
    player.animation = player.animations.idleLeft
  elseif key == 'right' then
    player.animation = player.animations.idleRight
  elseif key == 'space' then
    if player.animation == player.animations.chopLeft then
      player.animation = player.animations.idleLeft
    elseif player.animation == player.animations.chopRight then
      player.animation = player.animations.idleRight
    end
  end
end

function love.draw(dt)
  player.animation:draw(player.spritesheet, player.x, player.y)

  love.graphics.print({{0, 0, 0, 255}, "< and > to move, space to chop"}, 100, 100, 0, 2, 2)
end
