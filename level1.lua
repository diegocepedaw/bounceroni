








local composer = require( "composer" )


local scene = composer.newScene()
local physics = require("physics")
physics.start()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local background2
local background
local perspective
local camera
local spawnCount = 0
local gameLoopTimer
local redHerring
local lastLine ={}
local PI = (4*math.atan(1))
local quickPI = 180 / PI
local totalLen = 0
local balloon
local star
local planet
local tapCount = 0
local tapText
local counter
local addOn = 30
local score = 0
local gameOver
local outerGroup = display.newGroup()


function lengthOf( a, b )
    local width, height = b.x-a.x, b.y-a.y
    return (width*width + height*height)^0.5 -- math.sqrt(width*width + height*height)
end




function angleOf( a, b )
    return math.atan2( b.y - a.y, b.x - a.x ) * quickPI
end





function touch(e)
    local t = e.target
    if (e.phase == "began") then
        display.getCurrentStage():setFocus(t)
        totalLen = 0
        local group = display.newGroup()

        group.e = e
        display.getCurrentStage():setFocus(group)
        group:addEventListener("touch",touch)
        if next(lastLine) ~= nil then
             for i = #lastLine, 1, -1 do
                  local thisLine = lastLine[i]
                  display.remove(thisLine)
                  table.remove( lastLine, i )
             end
        end
    elseif (e.phase == "moved") then
        local group = e.target

        local len, angle = lengthOf( group.e, e ), angleOf( group.e, e )
        totalLen = totalLen + len
        if totalLen > 100 then
             return true
        end

        local mid = { x=(group.e.x+e.x)/2, y=(group.e.y+e.y)/2 }
        group.e = e
        local rect = display.newRect( group, 0, 0, len, 5 )


        rect.myName = "line"

        rect.x, rect.y, rect.rotation = mid.x, mid.y, angle

        rect:setFillColor(0,255,0)
        if totalLen > 20  then
             physics.addBody( rect, "static", {bounce=1.28} )

        else
              physics.addBody( rect, "static", {bounce=0.8} )
        end
        rect.y = rect.y - redCount
        camera:add(rect,2,false)
        table.insert( lastLine, rect )


    else
          local group = e.target
          camera:add(group,2,false)


        group:removeEventListener("touch",touch)
        display.getCurrentStage():setFocus(nil)

    end
    return true
end


local function createObstacle()

     local typeOfObstacle = math.random( 2 )
     if typeOfObstacle == 1 then
          --stars sends things flying
          local newStar = display.newCircle( 160, 240, 10 )
          outerGroup:insert(newStar)
          newStar.x = redHerring.x- ((math.random(1,2)*2)-3)*math.random(1,200)
          newStar.y = 0 -((math.random(1,2)*2)-2)*math.random(1,500)  - redCount
          physics.addBody( newStar, "static", { radius=15, bounce=1 } )
          newStar.myName = "star"
          newStar.isSensor = true
          camera:add(newStar,2,false)
     end
     if typeOfObstacle== 2 then
          --planet bumps and starts falling
          local newPlanet = display.newRect( 0, 0, 30, 30 )
          outerGroup:insert(newPlanet)
          newPlanet.x = redHerring.x - ((math.random(1,2)*2)-3)* math.random(1,200)
          newPlanet.y =0 - ((math.random(1,2)*2)-2)* math.random(1,500) -redCount
          physics.addBody( newPlanet, "dynamic", {bounce = 0.6, density = 0.2})
          newPlanet.myName = "planet"
          newPlanet.gravityScale = 0
          camera:add(newPlanet,2,false)

     end
end


local function pushBalloon()
    balloon:applyLinearImpulse( 0, -0.08, balloon.x, balloon.y )
    tapCount = tapCount + 1

end


local function restorestar(obj)

    star.isBodyActive = false


    balloon:setLinearVelocity( 0, 0 )
    balloon.y = balloon.y -10
    local xForce = ((math.random(1,2)*2)-3)/5
    balloon:applyLinearImpulse( xForce, -0.1, balloon.x, balloon.y )

    -- Fade in the ship
    transition.to( star, { alpha=1, time=3000,
        onComplete = function()
            star.isBodyActive = true
        end
    } )
end


local function moreObstacles()
     if addOn > 45 then
          timer.performWithDelay(100, createObstacle, 1)
     end
     timer.performWithDelay(100, createObstacle, 1)
     timer.performWithDelay(100, createObstacle, 1)
end

local function endGame()

     composer.gotoScene( "highscores", { time=800, effect="crossFade" } )
end

local function gameLoop()


        if ( balloon.x < -5)
        then
             balloon.x = display.contentWidth
             balloon.y = balloon.y + 10
        end
        if ( balloon.x > display.contentWidth + 5)
        then
             balloon.x = 0
             balloon.y = balloon.y + 10
        end
        if (balloon.y > redCount+500) then
            gameOver = display.newText( "GAME OVER", display.contentCenterX, 60, native.systemFont, 40 )
            outerGroup:insert(gameOver)

            endGame()

        end

end


local function test()
     redHerring.y = redHerring.y - addOn
     redCount = redCount + addOn
     if addOn < 150 then
       addOn = addOn + 1
     end
      counter = counter + 1
      if counter == 6 then
           counter = 0
           moreObstacles()
      end
end


local function onCollision( event )

    if ( event.phase == "began" ) then



        local obj1 = event.object1
        local obj2 = event.object2
        if ( ( obj1.myName == "line" and obj2.myName == "balloon" ) or
             ( obj1.myName == "balloon" and obj2.myName == "line" ) )

        then
             redHerring.y = redHerring.y - addOn
             redCount = redCount + addOn
             if addOn < 150 then
               addOn = addOn + 1
             end
              counter = counter + 1

              if counter == 5 then
                   counter = 0
                   moreObstacles()
              end

             tapText.text = 0 -(redHerring.y-240)
             score = 0 -(redHerring.y-240)
             tapText:setFillColor( 0.72, 0.9, 0.16, 0.78 )  -- Tints image green


             --camera:toPoint(redHerring.x, redHerring.y)

             for i = #lastLine, 1, -1 do
                  local thisLine = lastLine[i]
                  display.remove(thisLine)
                  table.remove( lastLine, i )
             end
        end

        if ( obj1.myName == "star" and obj2.myName == "balloon" ) then
             obj1.alpha = 0.2
             if obj.isBodyActive == true then
                  balloon:setLinearVelocity( 0, 0 )
                  balloon.y = balloon.y -10
                  local xForce = ((math.random(1,2)*2)-3)/10
                  balloon:applyLinearImpulse( xForce, -0.1, balloon.x, balloon.y )
                  display.remove( obj1 )
             end
             obj1.isBodyActive = false

             -- Fade in the ship

        end
        if  ( obj1.myName == "balloon" and obj2.myName == "star" )
        then
             obj2.alpha = 0.2


             if obj2.isBodyActive == true then
                  balloon:setLinearVelocity( 0, 0 )
                  balloon.y = balloon.y -10
                  local xForce = ((math.random(1,2)*2)-3)/10
                  balloon:applyLinearImpulse( xForce, -0.1, balloon.x, balloon.y )
                  display.remove( obj2 )
             end
             obj2.isBodyActive = false
             -- Fade in the ship

        end

        if ( obj1.myName == "planet" and obj2.myName == "balloon" ) then
             obj1.gravityScale = 0.75
             obj1:applyTorque(3)
        end
        if  ( obj1.myName == "balloon" and obj2.myName == "planet" )
        then
            obj2.gravityScale = 0.75
            obj2:applyTorque(3)
        end

    end
end





-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )
     local sceneGroup = self.view

     outerGroup = display.newGroup()  -- Display group for the background image
	sceneGroup:insert( outerGroup )

     physics.setGravity(0,10)
	physics.pause()
	background2 = display.newImageRect( "space.jpg", 360, 570 )
     sceneGroup:insert(background2)
     background2.x = display.contentCenterX
     background2.y = display.contentCenterY
     background = display.newImageRect( "background.png", 533, 800 )
     sceneGroup:insert(background)
     perspective=require("perspective")
     camera=perspective.createView()

    redHerring =  display.newCircle( 160, 240, 10 )
    sceneGroup:insert(redHerring)
    redHerring.x = display.contentCenterX
    redHerring.y = display.contentCenterY
    redCount = 0
    camera:add(redHerring,2,true)







    background.x = display.contentCenterX
    background.y = display.contentCenterY

    balloon =  display.newCircle( 160, 240, 10 )
    balloon.myName = "balloon"
    balloon.x = display.contentCenterX
    balloon.y = display.contentCenterY
    balloon.alpha = 0.8
    balloon.gravityScale = 2
    balloon:setFillColor( 0.72, 0.9, 0.16, 0.78 )

    --physics.addBody( platform, "static" )
    physics.addBody( balloon, "dynamic", { radius=15, bounce=0 } )


    camera:add(background,2,false)
    camera:add(balloon,2,false)



    camera:track()
    camera.damping = 10 -- A bit more fluid tracking



    tapText = display.newText( 0, display.contentCenterX, 20, native.systemFont, 40 )
    sceneGroup:insert(tapText)


    tapText:setFillColor( 0, 0, 0 )





	--creator = timer.performWithDelay( 5000, moreObstacles, 0 )


	--gameLoopTimer = timer.performWithDelay( 500, test, 0 )




	 -- Tints image green
	-- Code here runs when the scene is first created but has not yet appeared on screen

end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
		physics.start()
		gameLoopTimer = timer.performWithDelay( 20, gameLoop, 0 )
          counter = 0
          Runtime:addEventListener("touch",touch)
          Runtime:addEventListener( "collision", onCollision )





	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)
          timer.cancel( gameLoopTimer)
	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen

          Runtime:removeEventListener("touch",touch)
          Runtime:removeEventListener( "collision", onCollision )
          physics.pause()

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
