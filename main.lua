local Player = require("Entities.Player")
local Sprite = require("Entities.Sprite")

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    player = Player(100, 100, 10)
end

function love.update(dt)
    player:handleMovement()
    Sprite:updateAnimations(dt)
end

function love.draw()
    Sprite:drawAll()
end
