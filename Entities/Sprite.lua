Class = require("libraries.middleclass")
anim8 = require("libraries.anim8")

local Sprite = Class("Sprite")

Sprite.instances = {} -- static variable keeping track of all sprites

function Sprite:initialize(x, y, spritesheet_path, spriteX, spriteY, idleCols, idleRow)
    self.x = x
    self.y = y
    self.animationSpeed = 0.05
    self.spritesheet = love.graphics.newImage(spritesheet_path)
    self.grid = anim8.newGrid(spriteX, spriteY, self.spritesheet:getWidth(), self.spritesheet:getHeight())
    self.animations = {
        idle = anim8.newAnimation(self.grid(idleCols, idleRow), self.animationSpeed)
    }
    self.current_animation = "idle"
    table.insert(Sprite.instances, self)
end

function Sprite:addAnimation(name, cols, row)
    local newAnimation = anim8.newAnimation(self.grid(cols, row), self.animationSpeed)
    self.animations[name] = newAnimation
end

function Sprite:addAnimationMirrored(name, source)
    local newAnimation = self.animations[source]:clone():flipH()
    self.animations[name] = newAnimation
end

function Sprite:update(dt)
    self.animations[self.current_animation]:update(dt)
end

function Sprite:updateAnimations(dt)
    for i, instance in ipairs(Sprite.instances) do
        instance.animations[instance.current_animation]:update(dt)
    end
end

function sortingFunction(a, b)
    return a.y < b.y
end

function Sprite:sortByY()
    table.sort(self.instances, sortingFunction)
end

function Sprite:draw()
    -- love.graphics.circle("fill", self.x, self.y, 20)
    self.animations[self.current_animation]:draw(self.spritesheet, self.x, self.y)
end

function Sprite:drawAll()
    --	Sprite:sortByY()
    for i, instance in ipairs(Sprite.instances) do
        instance:draw()
    end
end

return Sprite
