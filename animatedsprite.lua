local ManagerVersion = 1.0

spriteBank = {}
imageBank = {}

function LoadSprite (spriteDef)
  if spriteDef == nil then return nil end

  local defFile = loadfile(spriteDef)

  if defFile == nil then
    return nil
  end

  local oldSprite = spriteBank [spriteDef]
  spriteBank [spriteDef] = defFile()

  if spriteBank[spriteDef].serialization_version ~= ManagerVersion then
    spriteBank[spriteDef] = oldSprite
    return spriteBank[spriteDef]
  end

  local spriteSheet = spriteBank[spriteDef].spriteSheet

  local oldImage = imageBank [spriteSheet]
  imageBank [spriteSheet] = love.graphics.newImage(spriteSheet)

  if imageBank[spriteSheet] == nil then
    imageBank[spriteSheet] = oldImage
    spriteBank[spriteDef] = oldSprite
  end

  return spriteBank[spriteDef]

end

function GetInstance (spriteDef)
  if spriteDef == nil then return nil end

  if spriteBank[spriteDef] == nil then
    if LoadSprite(spriteDef) == nil then return nil end
  end

  return {
    sprite = spriteBank[spriteDef],
    currAnim = spriteBank[spriteDef].animationNames[1],
    currFrame = 1,
    elapsedTime = 0,
  }
end

function UpdateInstance(spr, dt)
  if spr == nil then return nil end

  spr.elapsedTime = spr.elapsedTime + dt

  if spr.elapsedTime > spr.sprite.frameDuration * spr.timeScale then
    if spr.currFrame < #spr.sprite.animations[spr.currAnim] then
      spr.currFrame = spr.currFrame + 1
    else
      spr.currFrame = 1
    end

    spr.elapsedTime = 0
  end
end

function DrawInstance(spr, x, y)
  love.graphics.draw(
    imageBank[spr.sprite.spriteSheet],
    spr.sprite.animations[spr.currAnim][spr.currFrame],
    x,
    y
  )
end
