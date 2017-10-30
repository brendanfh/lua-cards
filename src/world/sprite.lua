import {
    GameObject = "src.util.intf:GameObject";
}

class "Sprite" [GameObject] {
    init = function(self)
        self.pos = Vec2(0, 0)
        self.size = Vec2(0, 0)
    end;
}