require "lib/oop"

local game = nil
function SET_GAME_STATE(state)
    game:setState(state)
end

import {
    Game = "src.game:";
}

function love.load()
    game = Game()
end

function love.update(dt)
    game:update(dt)
    if love.keyboard.isDown("escape") then
        love.event.push("quit")
    end
end

function love.draw()
    game:draw()
end