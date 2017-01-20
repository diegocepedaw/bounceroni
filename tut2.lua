local composer = require( "composer" )

local scene = composer.newScene()
local highScoresHeader 

local function gotoNext()
    composer.removeScene( "tut3")
    composer.gotoScene( "tut3", { time=100, effect="crossFade" } )
end

-- create()
function scene:create( event )

     local sceneGroup = self.view

    local background = display.newImageRect( sceneGroup, "tut2.png", 300, 538 )
    background.x = display.contentCenterX
    background.y = display.contentCenterY


    highScoresHeader = display.newText( sceneGroup, "Next", display.contentCenterX, 100, "IndieFlower.ttf", 40 )
    highScoresHeader:addEventListener( "tap", gotoNext )








end

-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase


	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then

          --composer.gotoScene( "menu" )

		-- Code here runs when the scene is entirely on screen

	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
              highScoresHeader:removeEventListener( "tap", gotoNext )
	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
     highScoresHeader:removeEventListener( "tap", gotoNext )
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
