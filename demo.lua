function lengthOf( a, b )
    local width, height = b.x-a.x, b.y-a.y
    return (width*width + height*height)^0.5 -- math.sqrt(width*width + height*height)
end


local PI = (4*math.atan(1))
local quickPI = 180 / PI
function angleOf( a, b )
    return math.atan2( b.y - a.y, b.x - a.x ) * quickPI
end


require("physics")
physics.start()
physics.setGravity(0,10)
physics.setDrawMode("normal") -- use "hybrid" to see the physics data on screen
function touch(e)
    if (e.phase == "began") then
        local group = display.newGroup()
        group.e = e
        display.getCurrentStage():setFocus(group)
        group:addEventListener("touch",touch)
    elseif (e.phase == "moved") then
        local group = e.target
        local len, angle = lengthOf( group.e, e ), angleOf( group.e, e )
        local mid = { x=(group.e.x+e.x)/2, y=(group.e.y+e.y)/2 }
        group.e = e
        local rect = display.newRect( group, 0, 0, len, 5 )
        rect.x, rect.y, rect.rotation = mid.x, mid.y, angle
        rect:setFillColor(0,255,0)
        physics.addBody( rect, "static" )
    else
        local group = e.target
        for i=1, 5 do
            local radius = math.random(10, 60 )
            local circle = display.newCircle( math.random( 100, display.contentWidth-100 ), 0, radius )
            circle:setFillColor(0,0,255)
            physics.addBody( circle, "dynamic", { radius=radius, bounce=.6} )
        end
        group:removeEventListener("touch",touch)
        display.getCurrentStage():setFocus(nil)
    end
    return true
end
Runtime:addEventListener("touch",touch)
