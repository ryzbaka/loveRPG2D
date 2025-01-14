local Sprite = require("Entities.Sprite")

local Player = Sprite:subclass("Player")

function Player:initialize(x, y, speed)
    Sprite:initialize(x, y)
    self.speed = speed
end

function Player:moveUp()
    self.y = self.y - self.speed
end

function Player:moveLeft()
    self.x = self.x - self.speed
end

function Player:moveDown()
    self.y = self.y + self.speed
end

function Player:moveRight()
    self.x = self.x + self.speed
end

function Player:handleMovement()
    if love.keyboard.isDown("w") then
        self:moveUp()
    end
    if love.keyboard.isDown("a") then
        self:moveLeft()
    end
    if love.keyboard.isDown("s") then
        self:moveDown()
    end
    if love.keyboard.isDown("d") then
        self:moveRight()
    end
end

return Player
