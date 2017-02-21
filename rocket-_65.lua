--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:9738a27a74208c2abb1ee82672427007:1c6eacb605e0935167ede72de766bce4:0c45914d441660f65ecb76087b3b523a$
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
            x=271,
            y=1,
            width=265,
            height=79,

        },
        {
            -- rocket_0001_Frame-2
            x=1,
            y=1,
            width=268,
            height=79,

        },
        {
            -- rocket_0002_Frame-1
            x=538,
            y=1,
            width=265,
            height=79,

        },
    },
    
    sheetContentWidth = 804,
    sheetContentHeight = 81
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
