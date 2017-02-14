--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:197fbbb283068a7d82011199ce95842f:4a3bd2a170a34f6a4bf2e2632247a73a:95bbf7adb6676736cab2b88f5e8bb979$
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
            -- planet1
            x=272,
            y=1,
            width=176,
            height=185,

            sourceX = 2,
            sourceY = 8,
            sourceWidth = 186,
            sourceHeight = 197
        },
        {
            -- planet2
            x=1,
            y=1,
            width=269,
            height=179,

            sourceX = 4,
            sourceY = 49,
            sourceWidth = 279,
            sourceHeight = 279
        },
        {
            -- planet3
            x=1,
            y=182,
            width=263,
            height=178,

            sourceX = 16,
            sourceY = 52,
            sourceWidth = 279,
            sourceHeight = 286
        },
        {
            -- planet4
            x=1,
            y=362,
            width=174,
            height=179,

            sourceX = 4,
            sourceY = 8,
            sourceWidth = 186,
            sourceHeight = 197
        },
        {
            -- planet5
            x=266,
            y=188,
            width=176,
            height=182,

            sourceX = 27,
            sourceY = 13,
            sourceWidth = 228,
            sourceHeight = 216
        },
        {
            -- saucer
            x=177,
            y=372,
            width=142,
            height=136,

            sourceX = 10,
            sourceY = 9,
            sourceWidth = 154,
            sourceHeight = 154
        },
        {
            -- touch
            x=321,
            y=372,
            width=100,
            height=121,

            sourceX = 1,
            sourceY = 3,
            sourceWidth = 104,
            sourceHeight = 129
        },
    },
    
    sheetContentWidth = 449,
    sheetContentHeight = 542
}

SheetInfo.frameIndex =
{

    ["planet1"] = 1,
    ["planet2"] = 2,
    ["planet3"] = 3,
    ["planet4"] = 4,
    ["planet5"] = 5,
    ["saucer"] = 6,
    ["touch"] = 7,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
