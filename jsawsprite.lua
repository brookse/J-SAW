require 'love.graphics'

local spriteW = 120
local spriteH = 160

local playerImg = love.graphics.newImage('J-SAW.png')
local spritesetW = playerImg:getWidth()
local spritesetH = playerImg:getHeight()

return {
  serialization_version = 1.0,

  spriteSheet = 'J-SAW.png',
  spriteName = 'jsaw',

  frameDuration = .10,

  animationNames = {
    'idleLeft',
    'idleRight',
    'walkLeft',
    'walkRight',
    'chopLeft',
    'chopRight'
  },

  animations = {
    idleLeft = {
      love.graphics.newQuad(0, 0, spriteW, spriteH, spritesetW, spritesetH),
      love.graphics.newQuad(spriteW, 0, spriteW, spriteH, spritesetW, spritesetH)
    },
    idleRight = {
      love.graphics.newQuad(5*spriteW , 0, spriteW, spriteH, spritesetW, spritesetH),
      love.graphics.newQuad(6*spriteW , 0, spriteW, spriteH, spritesetW, spritesetH)
    },
    walkLeft = {
      love.graphics.newQuad(2*spriteW, 0, spriteW, spriteH, spritesetW, spritesetH),
      love.graphics.newQuad(0, 0, spriteW, spriteH, spritesetW, spritesetH),
      love.graphics.newQuad(3*spriteW, 0, spriteW, spriteH, spritesetW, spritesetH),
      love.graphics.newQuad(0, 0, spriteW, spriteH, spritesetW, spritesetH)
    },
    walkRight = {
      love.graphics.newQuad(7*spriteW, 0, spriteW, spriteH, spritesetW, spritesetH),
      love.graphics.newQuad(5*spriteW, 0, spriteW, spriteH, spritesetW, spritesetH),
      love.graphics.newQuad(8*spriteW, 0, spriteW, spriteH, spritesetW, spritesetH),
      love.graphics.newQuad(5*spriteW, 0, spriteW, spriteH, spritesetW, spritesetH)
    },
    chopLeft = {
      love.graphics.newQuad(0, 0, spriteW, spriteH, spritesetW, spritesetH),
      love.graphics.newQuad(4*spriteW, 0, spriteW, spriteH, spritesetW, spritesetH)
    },
    chopRight = {
      love.graphics.newQuad(5*spriteW, 0, spriteW, spriteH, spritesetW, spritesetH),
      love.graphics.newQuad(9*spriteW, 0, spriteW, spriteH, spritesetW, spritesetH)
    }
  }
}
