








local composer = require( "composer" )


local scene = composer.newScene()
local physics = require("physics")
physics.start()

local sheetInfo = require("spriteData")
local myImageSheet = graphics.newImageSheet( "spriteTextures.png", sheetInfo:getSheet() )
local bounceInfo = require("bounceSmallClean")
local bounceSheet = graphics.newImageSheet( "bounceSmallClean.png", bounceInfo:getSheet() )
local rocketInfo = require("rocket-_65")
local rocketSheet = graphics.newImageSheet( "rocket-_65.png", rocketInfo:getSheet() )
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
local tapText = 0
local counter
local addOn = 30
local score = 0
local gameOver
local outerGroup
local obj
local objectTable = {}
local r, g, b
local newHigh
local hsFlag = 0
local bounceSound = audio.loadSound( "bounce.wav" )
local bumpSound = audio.loadSound( "bump.wav" )
local launchSound = audio.loadSound( "star.wav" )
local over = audio.loadSound( "over.wav")
local hsSound = audio.loadSound( "high.ogg")
local rocketSound = audio.loadSound( "rocket.wav")
local backgroundMusic = audio.loadStream( "beetle.mp3" )
local typeOfPlanet
local lastObstacle = 1000
local arrow


audio.setVolume( 0.1, { channel=1 } )
math.randomseed( os.time() )


local json = require( "json" )

local scoresTable = {}

local filePath = system.pathForFile( "scores.json", system.DocumentsDirectory )

-- sequences table
local sequences_blobBounce = {

    {
        name = "normalBounce",
        frames ={10,9,8,7,6,5,4,3,2,1},
        time = 275,
        loopCount = 1
   },

   {
       name = "fastBounce",
       frames ={10,9,8,7,6,5,4,3,3,2,1},
       time = 200,
       loopCount = 1
   }
}

local sequences_rocket = {

    {
        name = "rocket",
        frames ={1,2,3},
        time = 400,
        loopCount = 0
   }
}

local function loadScores()

    local file = io.open( filePath, "r" )

    if file then
        local contents = file:read( "*a" )
        io.close( file )
        scoresTable = json.decode( contents )
    end

    if ( scoresTable == nil or #scoresTable == 0  ) then
        scoresTable = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
    end
end

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


        physics.start()

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
        if group ~= nil then

             display.remove( obj )
             display.remove( arrow )
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

             rect:setFillColor(r,g,b )

             if totalLen > 20  then
                  physics.addBody( rect, "static", {bounce=1.5} )

             else
                   physics.addBody( rect, "static", {bounce=1.5} )
             end
             rect.y = rect.y - redCount
             camera:add(rect,2,false)
             table.insert( lastLine, rect )
        end






    else

          local group = e.target
          if group ~= nil then
               camera:add(group,2,false)


             group:removeEventListener("touch",touch)
             display.getCurrentStage():setFocus(nil)
              r, g, b = math.random(0,1), math.random(0,1), math.random(0,1)
              if (r +b+g == 0 ) then
                   g= 1

              end
          end


    end
    return true
end


local function createObstacle()
     --360, 570
     local typeOfObstacle = math.random( 2 )
     if typeOfObstacle == 1 then
          --stars sends things flying
          local newStar =  display.newImageRect( myImageSheet, 7, 50, 50 )
          table.insert( objectTable, newStar )
          outerGroup:insert(newStar)
          newStar.x = math.random(60, 300)
          newStar.y = redHerring.y - math.random(300, 700)
          physics.addBody( newStar, "static", { radius=15, bounce=1 } )
          newStar.myName = "star"
          newStar.isSensor = true
          camera:add(newStar,2,false)
     end
     if typeOfObstacle== 2 then
          --planet bumps and starts falling

          typeOfPlanet = math.random( 5 )
          local planetType
          if typeOfPlanet == 1 then
               local newPlanet =  display.newImageRect( myImageSheet, 2, 50, 50 )
               table.insert( objectTable, newPlanet )
               outerGroup:insert(newPlanet)
               newPlanet.x = math.random(80, 270)
               newPlanet.y = redHerring.y - math.random(300, 700)
               physics.addBody( newPlanet, "dynamic", {bounce = 0.6, density = 0.2})
               newPlanet.myName = "planet"
               newPlanet.gravityScale = 0
               camera:add(newPlanet,2,false)
               typeOfPlanet = math.random( 3 )
          end
          if typeOfPlanet == 2   then

               local newPlanet =  display.newImageRect( myImageSheet, 3, 110, 70 )
               table.insert( objectTable, newPlanet )
               outerGroup:insert(newPlanet)
               newPlanet.x = math.random(80, 270)
               newPlanet.y = redHerring.y - math.random(300, 700)
               physics.addBody( newPlanet, "dynamic", {bounce = 0.6, density = 0.2})
               newPlanet.myName = "planet"
               newPlanet.gravityScale = 0
               camera:add(newPlanet,2,false)
               typeOfPlanet = math.random( 3 )
          end
          if typeOfPlanet == 3 then

               local newPlanet =  display.newImageRect( myImageSheet, 4, 90, 60 )
               table.insert( objectTable, newPlanet )
               outerGroup:insert(newPlanet)
               newPlanet.x = math.random(80, 270)
               newPlanet.y = redHerring.y - math.random(300, 700)
               physics.addBody( newPlanet, "dynamic", {bounce = 0.6, density = 0.2})
               newPlanet.myName = "planet"
               newPlanet.gravityScale = 0
               camera:add(newPlanet,2,false)
               typeOfPlanet = math.random( 3 )
          end
          if typeOfPlanet == 4   then

               local newPlanet =  display.newImageRect( myImageSheet, 5, 70, 70 )
               table.insert( objectTable, newPlanet )
               outerGroup:insert(newPlanet)
               newPlanet.x = math.random(80, 270)
               newPlanet.y = redHerring.y - math.random(300, 700)
               physics.addBody( newPlanet, "dynamic", {bounce = 0.6, density = 0.2})
               newPlanet.myName = "planet"
               newPlanet.gravityScale = 0
               camera:add(newPlanet,2,false)
               typeOfPlanet = math.random( 3 )
          end
          if typeOfPlanet == 5  then

               local newPlanet =  display.newImageRect( myImageSheet, 6, 60, 60 )
               table.insert( objectTable, newPlanet )
               outerGroup:insert(newPlanet)
               newPlanet.x = math.random(80, 270)
               newPlanet.y = redHerring.y - math.random(300, 700)
               physics.addBody( newPlanet, "dynamic", {bounce = 0.6, density = 0.2})
               newPlanet.myName = "planet"
               newPlanet.gravityScale = 0
               camera:add(newPlanet,2,false)
               typeOfPlanet = math.random( 3 )
          end



     end
end



local function restorestar(obj)

    star.isBodyActive = false


    balloon:setLinearVelocity( 0, 0 )
    balloon.y = balloon.y -10
    local xForce = math.random(-0.2,0.2)
    local yForce = math.random(-0.04, -0.06)
    balloon:applyLinearImpulse( xForce, -0.1, balloon.x, balloon.y )

    -- Fade in the ship
    transition.to( star, { alpha=1, time=3000,
        onComplete = function()
            star.isBodyActive = true
        end
    } )
end


local function moreObstacles()
     if addOn > 60 then
          timer.performWithDelay(100, createObstacle, 1)
     end
     --timer.performWithDelay(100, createObstacle, 1)
     timer.performWithDelay(100, createObstacle, 1)
end

local function endGame()

    composer.setVariable( "finalScore", score )
    composer.removeScene( "highscores" )
    composer.gotoScene( "highscores", "fade", 800 )
end

local function gameLoop()

        balloon.rotation = 0
        if ( balloon.x < -5)
        then
             balloon.x = display.contentWidth
             balloon.y = balloon.y + 10
             balloon:applyLinearImpulse( -0.02, 0, balloon.x, balloon.y )
        end
        if ( balloon.x > display.contentWidth + 5)
        then
             balloon.x = 0
             balloon.y = balloon.y + 10
             balloon:applyLinearImpulse( 0.02, 0, balloon.x, balloon.y )
        end
        if (balloon.y ~= nil and redHerring.y ~= nil) then


             if (balloon.y > redHerring.y - addOn +500) then
                 gameOver = display.newText( "GAME OVER", display.contentCenterX, 60, "IndieFlower.ttf", 40 )
                 local laserChannel = audio.play( over )
                 table.insert( objectTable, gameOver )

                 endGame()

             end
         end

         if (score > scoresTable[1]and hsFlag == 0) then
              hsFlag = 1
              newHigh = display.newSprite( rocketSheet, sequences_rocket)
              newHigh:setSequence("rocket")
              newHigh:play()
              t1 = transition.to(newHigh, {time=4000, x=display.contentCenterX + 500 })
              table.insert( objectTable, newHigh )
              audio.play( rocketSound , { channel=3 } )
              audio.setVolume( 0.05, { channel=3 } )
              local hsChannel = audio.play( hsSound )
          end



end


local function test()
     redHerring.y = redHerring.y - addOn
     redCount = redCount + addOn
     if addOn < 150 then
       addOn = addOn + 1.5
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
             audio.play( bounceSound , { channel=2 } )
             audio.setVolume( 0.3, { channel=2 } )
             balloon:setSequence("normalBounce")
             balloon:play()
             if redHerring.y ~= nil then
                  redHerring.y = redHerring.y - addOn
                  redCount = redCount + addOn


             if addOn < 100 and counter%3 == 0 then
               addOn = addOn + 1
             end
              counter = counter + 1

              if counter >= 5 and lastObstacle - balloon.y > 100 then
                   counter = 0
                   lastObstacle = balloon.y
                   moreObstacles()
              end

             tapText.text = 0 -(redHerring.y-240)
             table.insert( objectTable, tapText )
             score = 0 -(redHerring.y-240)
             tapText:setFillColor( 0.72, 0.9, 0.16, 0.78 )  -- Tints image green
             end

             --camera:toPoint(redHerring.x, redHerring.y)

             for i = #lastLine, 1, -1 do
                  local thisLine = lastLine[i]
                  display.remove(thisLine)
                  table.remove( lastLine, i )
             end
        end

        if ( obj1.myName == "star" and obj2.myName == "balloon" ) then
             obj1.alpha = 0.2
                  audio.play( launchSound )
                  balloon:setLinearVelocity( 0, 0 )
                  balloon.y = balloon.y -10
                  local xForce = ((math.random(1,2)*2)-3)/10
                  balloon:applyLinearImpulse( xForce, -0.1, balloon.x, balloon.y )
                  display.remove( obj1 )
                  score = score + 44
                  tapText.text = score


            -- obj1.isBodyActive = false

             -- Fade in the ship

        end
        if  ( obj1.myName == "balloon" and obj2.myName == "star" )
        then
             obj2.alpha = 0.2


                  audio.play( launchSound )
                  balloon:setLinearVelocity( 0, 0 )
                  balloon.y = balloon.y -10
                  local xForce = ((math.random(1,2)*2)-3)/10
                  balloon:applyLinearImpulse( xForce, -0.1, balloon.x, balloon.y )
                  display.remove( obj2 )
                  score = score + 44
                  tapText.text = score

             --obj2.isBodyActive = false
             -- Fade in the ship

        end

        if ( obj1.myName == "planet" and obj2.myName == "balloon" ) then
             balloon:setSequence("fastBounce")
             balloon:play()
             obj1.gravityScale = 0.75
             obj1:applyTorque(3)
             local soundChannel = audio.play( bumpSound )
        end
        if  ( obj1.myName == "balloon" and obj2.myName == "planet" )
        then
            obj2.gravityScale = 0.75
            obj2:applyTorque(3)
            local soundChannel = audio.play( bumpSound )
        end

    end
end

local trans2
local t1

local function trans1 ()
        t1 = transition.to(obj, {time=800, x=display.contentCenterX - 40, onComplete=trans2})
end

trans2 = function ()
        t1= transition.to(obj, {time=430, x=display.contentCenterX + 40, onComplete=trans1})
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
     table.insert( objectTable, background )
     sceneGroup:insert(background)
     perspective=require("perspective")
     camera=perspective.createView()

    redHerring =  display.newCircle( 160, 240, 10 )
    sceneGroup:insert(redHerring)
    redHerring.alpha = 0
    table.insert( objectTable, redHerring )
    redHerring.x = display.contentCenterX
    redHerring.y = display.contentCenterY
    redCount = 0
    camera:add(redHerring,2,true)







    background.x = display.contentCenterX
    background.y = display.contentCenterY

    balloon =   display.newSprite( bounceSheet, sequences_blobBounce)
    balloon.myName = "balloon"
    balloon.x = display.contentCenterX
    balloon.y = display.contentCenterY - 55
    balloon.gravityScale = 2


    --physics.addBody( platform, "static" )
    physics.addBody( balloon, "dynamic", { radius=15, bounce=0 } )
    balloon.linearDamping = 0.3
    balloon.isFixedRotation = true

    camera:add(background,2,false)
    camera:add(balloon,2,false)



    camera:track()
    camera.damping = 10 -- A bit more fluid tracking



    tapText = display.newText( 0, display.contentCenterX, 20, "IndieFlower.ttf", 40 )
    sceneGroup:insert(tapText)


    tapText:setFillColor( 0, 0, 0 )

    arrow = display.newImageRect( myImageSheet, 1, 130, 50 )
    arrow.x = display.contentCenterX + 10
    arrow.y = 280

    obj = display.newImageRect( myImageSheet, 8, 40, 40 )
    obj.x = display.contentCenterX - 40
    obj.y = 300
    local firstTran = transition.to(obj, {time=600, x=display.contentCenterX + 40, onComplete=trans2})




     r,g,b = math.random(0.2,1), math.random(0.2,1), math.random(0.2,1)
     if (a == 0 and b == 0 and c == 0) then
          b = 1
     end
     loadScores()
     hsFlag = 0
     if _G.musicOn == 1 then
          audio.play( backgroundMusic , { channel=1 , loops=-1} )
     end











	--creator = timer.performWithDelay( 5000, acles, 0 )


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

		gameLoopTimer = timer.performWithDelay( 20, gameLoop, 0 )
          counter = 3
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
          if next(lastLine) ~= nil then
              for i = #lastLine, 1, -1 do
                   local thisLine = lastLine[i]
                   display.remove(thisLine)
                   table.remove( lastLine, i )
              end
         end
         display.remove( obj )
         display.remove( arrow )
	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
          physics.pause()
          Runtime:removeEventListener("touch",touch)
          Runtime:removeEventListener( "collision", onCollision )
          camera:cancel()
          for i = #objectTable, 1, -1 do
     		local thisObject = objectTable[i]
               display.remove( thisObject )
               table.remove( objectTable, i )
          end

             for i = #lastLine, 1, -1 do
                  local thisLine = lastLine[i]
                  display.remove(thisLine)
                  table.remove( lastLine, i )
             end
             audio.fadeOut( { channel=backgroundMusic, time=1000 } )

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
