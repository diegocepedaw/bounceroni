--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:b70b896fce79ad95895e02e9773d43b4:1c6eacb605e0935167ede72de766bce4:6842acff601d6bf342d6aeab6a2776b0$
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
            x=621,
            y=1,
            width=612,
            height=182,

        },
        {
            -- rocket_0001_Frame-2
            x=1,
            y=1,
            width=618,
            height=182,

        },
        {
            -- rocket_0002_Frame-1
            x=1235,
            y=1,
            width=612,
            height=182,

        },
    },
    
    sheetContentWidth = 1848,
    sheetContentHeight = 184
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
