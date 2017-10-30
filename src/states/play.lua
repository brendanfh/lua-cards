import {
    GameState = "src.util.intf:GameState";
    GameObject = "src.util.intf:GameObject";
    Vec2 = "src.util.vec2:";
}


class "Player" [GameObject] {
    init = function(self)
        self.pos = Vec2(0, 0)
        self.w = 32
        self.h = 32
    end;

    update = function(self, dt)
        local speed = 100
        local vel = Vec2(0, 0)

        if love.keyboard.isDown "a" then vel.x = vel.x - speed end
        if love.keyboard.isDown "d" then vel.x = vel.x + speed end
        if love.keyboard.isDown "w" then vel.y = vel.y - speed end
        if love.keyboard.isDown "s" then vel.y = vel.y + speed end

        self.pos = self.pos + vel * dt
    end;

    draw = function(self)
        love.graphics.rectangle("fill", self.pos.x, self.pos.y, self.w, self.h)
    end;
}

class "PlayState" [GameState] {
    init = function(self)
        self.player = Player()
    end;

    update = function(self, dt)
        self.player:update(dt)
    end;

    draw = function(self)
        love.graphics.clear()
        self.player:draw()
    end;
}

return module {
    PlayState;
}