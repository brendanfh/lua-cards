import {
    Screen = "src.gfx.screen:"
}

return {
    Mouse = factory {
        getX = function()
            local x = love.mouse.getX()
            x = x / Screen.scale_x
            return x
        end;

        getY = function()
            local y = love.mouse.getY()
            y = y / Screen.scale_y
            return y
        end;
    }
}