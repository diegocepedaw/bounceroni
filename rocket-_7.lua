--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:e64b2f5ae46f5bfcf9a6a6ba9b695081:1c6eacb605e0935167ede72de766bce4:9be557cc91458d168ab0f812f81395f9$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- rocket_0000_Frame-3
            x=291,
            y=1,
            width=286,
            height=85,

        },
        {
            -- rocket_0001_Frame-2
            x=1,
            y=1,
            width=288,
            height=85,

        },
        {
            -- rocket_0002_Frame-1
            x=579,
            y=1,
            width=286,
            height=85,

        },
    },
    
    sheetContentWidth = 866,
    sheetContentHeight = 87
}

SheetInfo.frameIndex =
{

    ["rocket_0000_Frame-3"] = 1,
    ["rocket_0001_Frame-2"] = 2,
    ["rocket_0002_Frame-1"] = 3,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
