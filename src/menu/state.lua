import {
    GameState = "src.util.intf:GameState";
}

class "MenuState" [GameState] {
    init = function(self)
        self.items = {}
    end;

    addItem = function(self, item)
        table.insert(self.items, item)
    end;

    addItems = function(self, ...)
        local t = { ... }

        for _, item in pairs(t) do
            self:addItem(item)
        end
    end;

    update = function(self, dt)
        for _, item in pairs(self.items) do
            item:update(dt)
        end
    end;

    draw = function(self)
        for _, item in pairs(self.items) do
            item:draw()
        end
    end;
}

return module {
    MenuState;
}