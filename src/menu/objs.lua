import {
    Rectangle = "src.util.rect:";
    Mouse = "src.util.input:Mouse";
    GameObject = "src.util.intf:GameObject";
}

class "Button" [GameObject] {
    init = function(self, x, y, w, h, text, font, onClick)
        self.x = x
        self.y = y
        self.w = w
        self.h = h
        self.text = text
        self.selected = false
        self.font = font
        self.onClick = onClick
        self.rect = Rectangle(x, y, w, h)

        self.bgColor = { 10, 10, 10 }
        self.textColor = { 255, 255, 255 }
        self.selectedColor = { 30, 240, 20 }
        self.fade = 0

        self.shape = shape or { 0.05, 0, 0.95, 0, 1, 0.5, 0.95, 1, 0.05, 1, 0, 0.5 }

        self.__mdTrigger = false

        self.tx = self.x + (self.w - self.font:getWidth(self.text)) / 2
        self.ty = self.y + (self.h - self.font:getHeight()) / 2
    end;

    update = function(self, dt)
        local mx = Mouse.getX()
        local my = Mouse.getY()
        self.selected = self.rect ^ Rectangle(mx, my, 1, 1)

        if self.selected and not love.mouse.isDown(1) and self.__mdTrigger then
            self.__mdTrigger = false
            if type(self.onClick) == "function" then
                self.onClick()
            end
        end

        if self.selected then
            self.fade = math.min(self.fade + 8 * dt, 1)
        else
            self.fade = math.max(self.fade - 8 * dt, 0)
        end

        if self.selected and love.mouse.isDown(1) then
            self.__mdTrigger = true
        elseif not self.selected then
            self.__mdTrigger = false
        end
    end;

    setOnClick = function(self, onClick)
        self.onClick = onClick;
        return self;
    end;

    draw = function(self)
        love.graphics.setFont(self.font)

        love.graphics.push()
        love.graphics.translate(self.x, self.y)
        love.graphics.scale(self.w, self.h)
        love.graphics.setColor(self.bgColor)
        love.graphics.polygon("fill", self.shape)
        love.graphics.setColor(self.selectedColor[1], self.selectedColor[2], self.selectedColor[3], self.fade * 255)
        love.graphics.polygon("fill", self.shape)
        love.graphics.pop()

        love.graphics.setColor(self.textColor)
        love.graphics.print(self.text, self.tx, self.ty)
    end;
}

class "Text" [GameObject] {
    init = function(self, x, y, w, text, font, color)
        self.x = x
        self.y = y
        self.text = text
        self.font = font
        self.color = color

        if x and w and font and text then
            self.x = self.x + (w - self.font:getWidth(self.text)) / 2
        end
    end;

    draw = function(self)
        love.graphics.setFont(self.font)
        love.graphics.setColor(self.color)
        love.graphics.print(self.text, self.x, self.y)
    end;
}

return module {
    Button = Button;
    Text = Text;
}