--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:cd3184ade44483386132d4e0ecd9a9c8:1c6eacb605e0935167ede72de766bce4:73925ab1e8df950d890eed32651393ff$
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
            x=209,
            y=1,
            width=204,
            height=61,

        },
        {
            -- rocket_0001_Frame-2
            x=1,
            y=1,
            width=206,
            height=61,

        },
        {
            -- rocket_0002_Frame-1
            x=415,
            y=1,
            width=204,
            height=61,

        },
    },
    
    sheetContentWidth = 620,
    sheetContentHeight = 63
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
