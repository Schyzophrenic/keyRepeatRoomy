local pd <const> = playdate
local gfx <const> = pd.graphics

class("RoomA").extends(Room)

function RoomA:enter()
    RoomA.super.enter(self)

    print("Entering Room A")
    self.counter = 0

    self.sprCounter = gfx.sprite.spriteWithText("Counter - " .. self.counter, 300, 50)
    self.sprCounter:moveTo(200, 120)
    self.sprCounter:add()
end

function RoomA:pause()
    RoomA.super.pause(self)
    print("In pause")
    if self.keyTimer ~= nil then
        print("Kill timer in Pause")
        self.keyTimer:remove()
    end
end

function RoomA:update()
    local img = gfx.imageWithText("Counter - " .. self.counter, 300, 50)
    self.sprCounter:setImage(img)
end

function RoomA:AButtonDown()
    local function incrementCounter()
        print(string.format("A Down - Counter at %d", self.counter))

        if self.counter > 10 then
            __roomManager:push(RoomPause())
            return -- Prevents the execution of the rest of AButtonDown
        end
        self.counter += 1
    end

    self.keyTimer = pd.timer.keyRepeatTimer(incrementCounter)
end

function RoomA:AButtonUp()
    if self.keyTimer ~= nil then
        print("Kill timer in Button Up")
        self.keyTimer:remove()
    end
end