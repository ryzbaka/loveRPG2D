local Player = require("Entities.Player")
local Sprite = require("Entities.Sprite")

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.graphics.setBackgroundColor(100 / 255, 149 / 255, 237 / 255) -- RGB values for cornflower blue
    player = Player(100, 100, 3)
end

function love.update(dt)
    player:handleMovement()
    Sprite:updateAnimations(dt)
end

function love.draw()
    Sprite:drawAll()
end
