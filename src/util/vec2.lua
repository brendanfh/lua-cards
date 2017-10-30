import {}

class "Vec2" {
    init = function(self, x, y)
        self.x = x
        self.y = y
    end;

    __add = function(a, b)
        return Vec2(a.x + b.x, a.y + b.y)
    end;

    __sub = function(a, b)
        return Vec2(a.x - b.x, a.y - b.y)
    end;

    __mul = function(a, b)
        if type(b) == "number" then
            return Vec2(a.x * b, a.y * b)
        else
            return Vec2(a.x * b.x, a.y * b.y)
        end
    end;

    __div = function(a, b)
        if type(b) ~= "number" then
            error "Invalid division"
        end
        return Vec2(a.x / b, a.y / b)
    end;

    __len = function(a)
        return math.sqrt(a:sqrMagnitude())
    end;

    split = function(v)
        return v.x, v.y
    end;

    dot = function(a, b)
        return a.x * b.x + a.y * b.y
    end;

    sqrMagnitude = function(a)
        return a:dot(a)
    end;

    normalized = function(a)
        return a / #a
    end;
}

return module {
    Vec2
}