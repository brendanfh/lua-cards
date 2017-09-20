import {

}

FONT_NAME = "res/joystix.ttf"

class "FontMng" {
    init = function(self)
        self.fonts = {}
    end;

    addFont = function(self, size, name)
        name = name or FONT_NAME
        local font = love.graphics.newFont(name, size)
        font:setFilter("nearest", "nearest", 0)
        self.fonts[name .. size] = font
    end;

    useFont = function(self, size, name)
        name = name or FONT_NAME
        love.graphics.setFont(self.fonts[name .. size])
    end;
    
    getFont = function(self, size, name)
        name = name or FONT_NAME    
        return self.fonts[name .. size]
    end;
}

fontManager = FontMng()

return module {
    fontManager
}