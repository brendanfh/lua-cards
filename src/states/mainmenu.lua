import {
    FontManager = "src.util.font:";
    MenuState = "src.menu.state:";
    Text = "src.menu.objs:Text";
    Button = "src.menu.objs:Button";
    G = "src.constants";

    PlayState = "src.states.play:";
}

class "MainMenuState" [MenuState] {
    init = function(self)
        MenuState.init(self)
        local w, h = G.width, G.height

        local title = Text(w / 2 - 200, 50, 400, "Something Amazing!", FontManager:getFont(36), {255, 0, 0})
        local playButton = Button(w / 2 - 100, 250, 200, 48, "Play", FontManager:getFont(18))
            :setOnClick(function()
                SET_GAME_STATE(PlayState())
            end)

        local optionsButton = Button(w / 2 - 100, 300, 200, 48, "Options", FontManager:getFont(18))
        local quitButton = Button(w / 2 - 100, 350, 200, 48, "Quit", FontManager:getFont(18))
            :setOnClick(function()
                love.event.push("quit")
            end)
        
        self:addItems(title, playButton, optionsButton, quitButton, test)
    end;

    draw = function(self)
        love.graphics.clear(30, 30, 30)
        MenuState.draw(self)
    end;
}

return module {
    MainMenuState;
}