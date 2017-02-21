--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:c93c8903389ca1acd966779e6a13e244:1c6eacb605e0935167ede72de766bce4:cfb545ad27f0dba671e9bf0c4d608a1b$
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
            x=312,
            y=1,
            width=306,
            height=91,

        },
        {
            -- rocket_0001_Frame-2
            x=1,
            y=1,
            width=309,
            height=91,

        },
        {
            -- rocket_0002_Frame-1
            x=620,
            y=1,
            width=306,
            height=91,

        },
    },
    
    sheetContentWidth = 927,
    sheetContentHeight = 93
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
