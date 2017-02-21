--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:63da02c57e139f12d8aede41c57bea7e:1c6eacb605e0935167ede72de766bce4:2cf0a1870177bc29f39ab1c35f4f6dcc$
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
            x=333,
            y=1,
            width=326,
            height=97,

        },
        {
            -- rocket_0001_Frame-2
            x=1,
            y=1,
            width=330,
            height=97,

        },
        {
            -- rocket_0002_Frame-1
            x=661,
            y=1,
            width=326,
            height=97,

        },
    },
    
    sheetContentWidth = 988,
    sheetContentHeight = 99
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
