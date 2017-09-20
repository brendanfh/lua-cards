import {
    G = "src.constants";
}

Screen = singleton {
    init = function(self)
        self.viewport = {
            x = 0;
            y = 0;
            w = G.width;
            h = G.height;
        }

        self.scale_x = love.graphics.getWidth() / G.width
        self.scale_y = love.graphics.getHeight() / G.height

        self.clearColor = { 0, 0, 0 }

        self.canvas = love.graphics.newCanvas(G.width, G.height)
        self.canvas:setFilter("nearest", "nearest", 1)
    end;

    centerOn = function(self, x, y)
        if type(x) == "table" then
            self:centerOn(x.x, x.y)
        else
            self.viewport.x = self.viewport.w / 2 - x
            self.viewport.y = self.viewport.h / 2 - y
        end
    end;

    begin = function(self)
        love.graphics.push()
        love.graphics.setCanvas(self.canvas)
        love.graphics.setColor(self.clearColor)
        love.graphics.rectangle("fill", 0, 0, G.width, G.height)
        love.graphics.translate(self.viewport.x, self.viewport.y)
    end;

    release = function(self)
        love.graphics.pop()
        love.graphics.setCanvas()
        love.graphics.scale(self.scale_x, self.scale_y)
        love.graphics.setColor(255, 255, 255)
        love.graphics.draw(self.canvas, 0, 0)
    end;
}

return module { Screen }