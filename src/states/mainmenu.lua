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

        local title = Text(w / 2 - w * 5 / 16, 50, w * 10 / 16, "Something Amazing!", FontManager:getFont(36), {255, 0, 0})
        local playButton = Button(w / 2 - w * 5 / 32, 250, w * 5 / 16, h / 10, "Play", FontManager:getFont(18))
            :setOnClick(function()
                SET_GAME_STATE(PlayState())
            end)

        local optionsButton = Button(w / 2 - w * 5 / 32, 300, w * 5/ 16, h / 10, "Options", FontManager:getFont(18))
        local quitButton = Button(w / 2 - w * 5 / 32, 350, w * 5 / 16, h / 10, "Quit", FontManager:getFont(18))
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