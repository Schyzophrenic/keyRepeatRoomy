import "CoreLibs/graphics"
import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "lib/roomy"

import "RoomA"
import "RoomPause"

local pd <const> = playdate
local gfx <const> = pd.graphics

__roomManager = Manager()
__roomManager:hook()

__roomManager:resetAndEnter(RoomA())

function pd.update()
	gfx.sprite.update()
	pd.timer.updateTimers()
	__roomManager:emit("update")
end