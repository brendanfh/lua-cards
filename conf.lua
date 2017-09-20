local G = require "src/constants"

function love.conf(t)
    t.window.width = G.width * G.scale
    t.window.height = G.height * G.scale
    t.window.title = "Lua Card RPG Game"
end