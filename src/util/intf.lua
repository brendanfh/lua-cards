import {}

interface "GameObject" {
    "update", "draw"
}

interface "GameState" [GameObject] {
    "open", "close"
}

return module {
    GameObject = GameObject;
    GameState = GameState;
}