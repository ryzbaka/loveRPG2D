Class = require("libraries.middleclass")
anim8 = require("libraries.anim8")

local Sprite = Class("Sprite")

function Sprite:initialize(x, y, spritesheet_path, spriteX, spriteY, idleCols, idleRow)
    self.x = x
    self.y = y
    self.spritesheet = love.graphics.newImage(spritesheet_path)
    self.grid = anim8.newGrid(spriteX, spriteY, self.spritesheet:getWidth(), self.spritesheet:getHeight())
    self.animations = {
        idle = anim8.newAnimation(self.grid(idleCols, idleRow), 0.1)
    }
    self.current_animation = "idle"
end

function Sprite:update(dt)
    self.animations[self.current_animation]:update(dt)
end

function Sprite:draw()
    -- love.graphics.circle("fill", self.x, self.y, 20)
    self.animations[self.current_animation]:draw(self.spritesheet, self.x, self.y)
end

return Sprite
