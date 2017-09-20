import {
}

class "Rectangle" {
    init = function(self, x, y, w, h)
        self.x = x
        self.y = y
        self.w = w
        self.h = h
    end;

    intersects = function(self, other)
        if self.x <= other.x + other.w and
            self.x + self.w >= other.x and
            self.y <= other.y + other.h and
            self.y + self.h >= other.y then
            return true
        else
            return false
        end
    end;

    __pow = function(self, other)
        return self:intersects(other)
    end;
}

return module {
    Rectangle
}