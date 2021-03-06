

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"

--local interstitialPlacement = "interstitial-1"

_G.soundOn = 1
_G.musicOn = 1
local soundOn = true
local soundOnBtn
local soundOffBtn

local ads = require( "ads" )
local bannerAppID = "ca-app-pub-9500453081096402/5560209378"  --for your iOS banner
local interstitialAppID = "ca-app-pub-nnnnnnnnnnn/nnnnnnnn"  --for your iOS interstitial
if ( system.getInfo( "platformName" ) == "Android" ) then
    bannerAppID = "ca-app-pub-9500453081096402/2606742973"  --for your Android banner
    interstitialAppID = "ca-app-pub-nnnnnnnnnnn/nnnnnnnnn"  --for your Android interstitial
end

local adProvider = "admob"
local function adListener( event )
    --(more on this later)
end

local function adListener( event )
    -- The 'event' table includes:
    -- event.name: string value of "adsRequest"
    -- event.response: message from the ad provider about the status of this request
    -- event.phase: string value of "loaded", "shown", or "refresh"
    -- event.type: string value of "banner" or "interstitial"
    -- event.isError: boolean true or false

    local msg = event.response
    -- Quick debug message regarding the response from the library
    print( "Message from the ads library: ", msg )

    if ( event.isError ) then
        print( "Error, no ad received", msg )


    else
        print( "Ah ha! Got one!" )
    end
end


ads.init( adProvider, "ca-app-pub-8636924388798547/1992452115", adListener )
ads.show( "banner", { x=0, y=100000, appId="ca-app-pub-8636924388798547/1992452115" } )

local function soundToggle(event)
    if soundOn then
        soundOn = false
        _G.musicOn = 0
        soundOnBtn.isVisible = false
        soundOffBtn.isVisible = true
    else
        soundOn = true
        _G.musicOn = 1
        soundOnBtn.isVisible = true
        soundOffBtn.isVisible = false
    end
    return true
end



--------------------------------------------

-- forward declarations and other locals
local playBtn
local highBtn

local function gotoGame()
    composer.removeScene( "level1")
    composer.gotoScene( "menu", { time=800, effect="crossFade" } )
end
-- 'onRelease' event listener for playBtn
local function onPlayBtnRelease()

	-- go to level1.lua scene
     composer.removeScene( "level1" )
	composer.gotoScene( "level1", "fade", 500 )

	return true	-- indicates successful touch
end

local function onhighBtnRelease()

	-- go to level1.lua scene
     --composer.removeScene( "highscores")
    composer.setVariable( "finalScore", score )
    composer.removeScene( "highscores" )
    composer.gotoScene( "highscores", "fade", 500 )

	return true	-- indicates successful touch
end

local function onHowToBtn()

	-- go to level1.lua scene
     --composer.removeScene( "highscores")
    composer.removeScene( "tut1")
    composer.gotoScene( "tut1", "fade", 500 )

	return true	-- indicates successful touch
end

local function onSoundBtnRelease()
     _G.musicOn = 1

end

local function onMusicBtnRelease()

     _G.musicOn = 0

end

function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	--
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	-- display a background image
	local background = display.newImageRect( "background2.png", display.actualContentWidth, display.actualContentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x = 0 + display.screenOriginX
	background.y = 0 + display.screenOriginY

	-- create/position logo/title image on upper-half of the screen
	local titleLogo = display.newImageRect( "logo.png", 313, 50 )
	titleLogo.x = display.contentCenterX
	titleLogo.y = 100




     soundOnBtn = display.newImageRect("MusicOn.PNG", 170, 79)
     soundOnBtn.x = display.contentCenterX
     soundOnBtn.y = display.contentHeight - 60
     soundOnBtn.isVisible = true
     soundOnBtn:addEventListener("tap", soundToggle)

     soundOffBtn = display.newImageRect("musicOff.png", 170, 79)
     soundOffBtn.x = display.contentCenterX
     soundOffBtn.y = display.contentHeight - 60
     --sceneGroup:insert(soundOffBtn)
     soundOffBtn:addEventListener("tap", soundToggle)


     soundOffBtn.isVisible = false



	-- create a widget button (which will loads level1.lua on release)
	playBtn = widget.newButton{
		defaultFile ="playBtn.png",
		overFile="playBtnOver.PNG",
		width=170, height=79,
		onRelease = onPlayBtnRelease	-- event listener function
	}


	playBtn.x = display.contentCenterX
	playBtn.y = display.contentHeight - 275

     highBtn = widget.newButton{
		defaultFile="highBtn.png",
		overFile="highBtnOver.PNG",
		width=170, height=79,
		onRelease = onhighBtnRelease	-- event listener function
	}
	highBtn.x = display.contentCenterX
	highBtn.y = display.contentHeight -205

     howBtn = widget.newButton{
		defaultFile="howToBtn.png",
		overFile="howToBtnOver.png",
		width=170, height=79,
		onRelease = onHowToBtn	-- event listener function
	}
	howBtn.x = display.contentCenterX
	howBtn.y = display.contentHeight -135






    -- Initialize Corona Ads (substitute your own API key when generated)

	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( titleLogo )
	sceneGroup:insert( playBtn )
     sceneGroup:insert( highBtn )
     sceneGroup:insert( howBtn )
     sceneGroup:insert(soundOnBtn)
     sceneGroup:insert(soundOffBtn)

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

	if phase == "will" then


		-- Called when the scene is still off screen and is about to move on screen

		-- Called when the scene is now on screen
		--
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
          --coronaAds.hide( bannerPlacement, false )

	elseif phase == "did" then
		-- Called when the scene is now off screen

	end
end

function scene:destroy( event )
	local sceneGroup = self.view

	-- Called prior to the removal of scene's "view" (sceneGroup)
	--
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
     if highBtn then
		highBtn:removeSelf()	-- widgets must be manually removed
		highBtn = nil
	end

	if playBtn then
		playBtn:removeSelf()	-- widgets must be manually removed
		playBtn = nil
	end
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
