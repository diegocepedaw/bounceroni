--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:25f77be18880240c866b80253acaacdc:1c6eacb605e0935167ede72de766bce4:c6b35f6f4dd1e78d2407839ed52d1697$
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
            x=415,
            y=1,
            width=408,
            height=121,

        },
        {
            -- rocket_0001_Frame-2
            x=1,
            y=1,
            width=412,
            height=121,

        },
        {
            -- rocket_0002_Frame-1
            x=825,
            y=1,
            width=408,
            height=121,

        },
    },
    
    sheetContentWidth = 1234,
    sheetContentHeight = 123
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
