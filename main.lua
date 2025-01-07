local Player = require("Entities.Player")

function love.load()
    player = Player(100, 100, 10)
end

function love.update(dt)
    player:handleMovement()
end

function love.draw()
    player:draw()
end
