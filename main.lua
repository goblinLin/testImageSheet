-----------------------------------------------------------------------------------------
--
-- main.lua
-- 本範例示範如何使用ImageSheet搭配Sprite來製作動畫效果	
-- Author: Zack Lin
-- Time: 2015/9/10
-----------------------------------------------------------------------------------------

--=======================================================================================
--引入各種函式庫
--=======================================================================================
display.setStatusBar( display.HiddenStatusBar )
local sheetInfo = require( "spriteSheet")
local widget = require( "widget")
math.randomseed(os.time())
--=======================================================================================
--宣告各種變數
--=======================================================================================
_SCREEN = {
	WIDTH = display.viewableContentWidth,
	HEIGHT = display.viewableContentHeight
}
_SCREEN.CENTER = {
	X = display.contentCenterX,
	Y = display.contentCenterY
}

-- 生成imagesheet
local imageSheet = graphics.newImageSheet( "spriteSheet.png", sheetInfo:getSheet() )

-- 設定每支動畫的參數
local sequenceData = {
				-- set up anmiation
                { 
                	name="effect1",     -- 動畫名稱 (used with setSequence)
                	sheet=imageSheet,   -- imageSheet參考
                	start=sheetInfo:getFrameIndex("0131-0"), -- 第一幀名稱
                	count=5, 			-- 該動畫張數
                	time=500, 			-- 該動畫總微秒時間
                	loopCount=1 		-- 連續播放次數
               	},
               	{ 
                	name="effect2", 		-- name of the animation (used with setSequence)
                	sheet=imageSheet, -- the image sheet
                	start=sheetInfo:getFrameIndex("0153-0"), -- name of the first frame
                	count=6, 			-- number of frames
                	time=540, 			-- speed
                	loopCount=1 		-- repeat
               	},
               	{ 
                	name="effect3", 		-- name of the animation (used with setSequence)
                	sheet=imageSheet, -- the image sheet
                	start=sheetInfo:getFrameIndex("0157-0"), -- name of the first frame
                	count=6, 			-- number of frames
                	time=540, 			-- speed
                	loopCount=1 		-- repeat
               	},
               	{ 
                	name="effect4", 		-- name of the animation (used with setSequence)
                	sheet=imageSheet, -- the image sheet
                	start=sheetInfo:getFrameIndex("0160-0"), -- name of the first frame
                	count=6, 			-- number of frames
                	time=540, 			-- speed
                	loopCount=1 		-- repeat
               	},
               	{ 
                	name="effect5", 		-- name of the animation (used with setSequence)
                	sheet=imageSheet, -- the image sheet
                	start=sheetInfo:getFrameIndex("0162-0"), -- name of the first frame
                	count=5, 			-- number of frames
                	time=450, 			-- speed
                	loopCount=1 		-- repeat
               	},
               	{ 
                	name="effect6", 		-- name of the animation (used with setSequence)
                	sheet=imageSheet, -- the image sheet
                	start=sheetInfo:getFrameIndex("0163-0"), -- name of the first frame
                	count=5, 			-- number of frames
                	time=450, 			-- speed
                	loopCount=1 		-- repeat
               	},
               	{ 
                	name="effect7", 		-- name of the animation (used with setSequence)
                	sheet=imageSheet, -- the image sheet
                	start=sheetInfo:getFrameIndex("0172-0"), -- name of the first frame
                	count=7, 			-- number of frames
                	time=630, 			-- speed
                	loopCount=1 		-- repeat
               	},
               	{ 
                	name="effect8", 		-- name of the animation (used with setSequence)
                	sheet=imageSheet, -- the image sheet
                	start=sheetInfo:getFrameIndex("0180-0"), -- name of the first frame
                	count=5, 			-- number of frames
                	time=450, 			-- speed
                	loopCount=1 		-- repeat
               	},
               	{ 
                	name="effect9", 		-- name of the animation (used with setSequence)
                	sheet=imageSheet, -- the image sheet
                	start=sheetInfo:getFrameIndex("0196-0"), -- name of the first frame
                	count=3, 			-- number of frames
                	time=540, 			-- speed
                	loopCount=1 		-- repeat
               	},
               	{ 
                	name="effect10", 		-- name of the animation (used with setSequence)
                	sheet=imageSheet, -- the image sheet
                	start=sheetInfo:getFrameIndex("0211-0"), -- name of the first frame
                	count=6, 			-- number of frames
                	time=540, 			-- speed
                	loopCount=1 		-- repeat
               	},
            }
local effect
--=======================================================================================
--宣告各種函式
--=======================================================================================

-- Function to handle button events
local function handleButtonEvent( event )
	effect.isVisible = true
	--設定所要播放的動畫名稱
	effect:setSequence( sequenceData[math.random(#sequenceData)].name )
	--播放動畫
	effect:play()
end

-- add the event listener to the sprite object
local function spriteListener( event )
    print( "Sprite event: " .. event.phase )
    if (event.phase == 'ended') then
    	effect.isVisible = false
    end
end

local function init( )
	--製作背景
	local bg = display.newImageRect( "images/background.jpg", _SCREEN.WIDTH, _SCREEN.HEIGHT )
	bg.x = _SCREEN.CENTER.X
	bg.y = _SCREEN.CENTER.Y

		-- Create the widget
	local button1 = widget.newButton
	{
	    left = 80,
	    top = 350,
	    defaultFile = "images/button.png",
	    overFile="images/button-over.png",
	    label = "請按我",
	    id = "button1",
	    labelColor = { default={ 1, 0, 0, 1 }, over={ 1, 0.1, 0.7, 0.4 } },
	    strokeColor = { default={ 1, 0.4, 0, 1 }, over={ 0.8, 0.8, 1, 1 } },
	    onRelease = handleButtonEvent
	}

	--生成sprite，第一個參數為imageSheet，第二個參數為option
	effect = display.newSprite( imageSheet, sequenceData )
	effect.x = _SCREEN.CENTER.X
	effect.y = _SCREEN.CENTER.Y
	effect.isVisible = false

	-- Add sprite listener
	effect:addEventListener( "sprite", spriteListener )

end

init()

