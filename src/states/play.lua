import {
    GameState = "src.util.intf:GameState";
}

class "PlayState" [GameState] {
    init = function(self)
    end;

    draw = function(self)
        love.graphics.clear( 80, 40, 210 )
    end;
}

return module {
    PlayState;
}