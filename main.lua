-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local physics = require( "physics" )
physics.start()

local myTextObject = display.newText( "Hello World!", 160, 240, "Arial", 60 )

function screenTap()
    local r = math.random( 0, 100 )
    local g = math.random( 0, 100 )
    local b = math.random( 0, 100 )
    myTextObject:setFillColor( r/100, g/100, b/100 )
end

display.currentStage:addEventListener( "tap", screenTap )
