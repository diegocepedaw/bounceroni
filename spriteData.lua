--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:f47d2263e4b8de6828185bb6b53e2fd1:d98937dca7e3425113aabcb06de61ad6:95bbf7adb6676736cab2b88f5e8bb979$
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
            -- arrow-sketches-collection_23-2147499252
            x=179,
            y=366,
            width=216,
            height=70,

        },
        {
            -- planet1
            x=1,
            y=362,
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
            x=272,
            y=1,
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
            y=182,
            width=176,
            height=182,

            sourceX = 27,
            sourceY = 13,
            sourceWidth = 228,
            sourceHeight = 216
        },
        {
            -- saucer
            x=179,
            y=438,
            width=142,
            height=136,

            sourceX = 10,
            sourceY = 9,
            sourceWidth = 154,
            sourceHeight = 154
        },
        {
            -- touch
            x=323,
            y=438,
            width=100,
            height=121,

            sourceX = 1,
            sourceY = 3,
            sourceWidth = 104,
            sourceHeight = 129
        },
    },

    sheetContentWidth = 447,
    sheetContentHeight = 575
}

SheetInfo.frameIndex =
{

    ["arrow-sketches-collection_23-2147499252"] = 1,
    ["planet1"] = 2,
    ["planet2"] = 3,
    ["planet3"] = 4,
    ["planet4"] = 5,
    ["planet5"] = 6,
    ["saucer"] = 7,
    ["touch"] = 8,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
