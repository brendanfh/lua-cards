import {
    GameObject = "src.util.intf:GameObject";
    GameState = "src.util.intf:GameState";
    FontManager = "src.util.font:";
    Screen = "src.gfx.screen:";

    MainMenuState = "src.states.mainmenu:";
}

class "Game" [GameObject] {
    init = function(self)
        love.graphics.setDefaultFilter("nearest", "nearest", 0)

        FontManager:addFont(48)
        FontManager:addFont(36)
        FontManager:addFont(18)

        self:setState(MainMenuState())
    end;

    setState = function(self, state)
        if self.state then self.state:close() end
        state:open(self.state)
        self.state = state
    end;

    update = function(self, dt)
        self.state:update(dt)
    end;

    draw = function(self)
        Screen:begin()

        self.state:draw(dt)

        Screen:release()
    end;
}

return module {
    Game
}