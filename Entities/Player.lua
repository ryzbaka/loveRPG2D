Sprite = require("Entities.Sprite")

Player = Sprite:subclass("Player")

function Player:initialize(x, y, speed)
    Sprite.initialize(self, x, y, "spritesheets/characters/playerhair.png", 50, 50, 5, 2)
    self:addAnimation("right-move", "1-4", 4)
    self:addAnimation("right-idle", 5, 4)
    self:addAnimationMirrored("left-move", "right-move")
    self:addAnimationMirrored("left-idle", "right-idle")
    self:addAnimation("up-move", "1-4", 1)
    self:addAnimation("up-idle", "1-4", 4)
    self:addAnimation("down-move", "1-4", 2)
    self:addAnimation("down-idle", "1-4", 2)
    self.direction = "down"
    self.isMoving = false
    self.speed = speed
end

function Player:moveUp()
    self.isMoving = true
    self.direction = "up"
    self.current_animation = "up-move"
    self.y = self.y - self.speed
end

function Player:moveLeft()
    self.isMoving = true
    self.direction = "left"
    self.current_animation = "left-move"
    self.x = self.x - self.speed
end

function Player:moveDown()
    self.isMoving = true
    self.direction = "down"
    self.current_animation = "down-move"
    self.y = self.y + self.speed
end

function Player:moveRight()
    self.isMoving = true
    self.direction = "right"
    self.current_animation = "right-move"
    self.x = self.x + self.speed
end

function Player:handleMovement()
    if love.keyboard.isDown("w") then
        self:moveUp()
	moveString+=
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
    if not self.isMoving then
	    if self.direction=="right" then
		    self.current_animation = "right-idle"
            elseif self.direction=="left" then
		    self.current_animation = "left-idle"
	    else
		    self.current_animation = "idle"
            end
    end
    self.isMoving = false
end

return Player
