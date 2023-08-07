local pd <const> = playdate
local gfx <const> = pd.graphics

class("RoomPause").extends(PauseRoom)

function RoomPause:enter(previous)
    RoomPause.super.enter(self, previous)

    print("entering Room Pause")
    self.spr = gfx.sprite.spriteWithText("PAUSE", 300, 20)
    self.spr:moveTo(200, 200)
    self.spr:add()
end

function RoomPause:BButtonUp()
    __roomManager:pop()
end