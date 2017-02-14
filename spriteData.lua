--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:6532b3a71f1470ac4598b5b549c0bb9f:373c778a29a3d0851ec5669cb1484281:95bbf7adb6676736cab2b88f5e8bb979$
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
            -- blob
            x=177,
            y=427,
            width=174,
            height=175,

            sourceX = 0,
            sourceY = 2,
            sourceWidth = 174,
            sourceHeight = 177
        },
        {
            -- blob_0000_Frame-10
            x=176,
            y=604,
            width=173,
            height=173,

        },
        {
            -- blob_0001_Frame-9
            x=353,
            y=468,
            width=152,
            height=190,

        },
        {
            -- blob_0002_Frame-8
            x=377,
            y=263,
            width=132,
            height=203,

        },
        {
            -- blob_0003_Frame-7
            x=351,
            y=660,
            width=152,
            height=190,

        },
        {
            -- blob_0004_Frame-6
            x=1,
            y=252,
            width=186,
            height=162,

        },
        {
            -- blob_0005_Frame-5
            x=272,
            y=1,
            width=226,
            height=129,

        },
        {
            -- blob_0006_Frame-4
            x=1,
            y=182,
            width=226,
            height=68,

        },
        {
            -- blob_0007_Frame-3
            x=272,
            y=132,
            width=226,
            height=129,

        },
        {
            -- blob_0008_Frame-2
            x=189,
            y=263,
            width=186,
            height=162,

        },
        {
            -- blob_0009_Frame-1
            x=1,
            y=777,
            width=173,
            height=173,

        },
        {
            -- planet1
            x=1,
            y=416,
            width=174,
            height=179,

            sourceX = 4,
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
            y=597,
            width=173,
            height=178,

            sourceX = 2,
            sourceY = 0,
            sourceWidth = 175,
            sourceHeight = 182
        },
        {
            -- saucer
            x=176,
            y=779,
            width=142,
            height=136,

            sourceX = 10,
            sourceY = 9,
            sourceWidth = 154,
            sourceHeight = 154
        },
    },
    
    sheetContentWidth = 510,
    sheetContentHeight = 951
}

SheetInfo.frameIndex =
{

    ["blob"] = 1,
    ["blob_0000_Frame-10"] = 2,
    ["blob_0001_Frame-9"] = 3,
    ["blob_0002_Frame-8"] = 4,
    ["blob_0003_Frame-7"] = 5,
    ["blob_0004_Frame-6"] = 6,
    ["blob_0005_Frame-5"] = 7,
    ["blob_0006_Frame-4"] = 8,
    ["blob_0007_Frame-3"] = 9,
    ["blob_0008_Frame-2"] = 10,
    ["blob_0009_Frame-1"] = 11,
    ["planet1"] = 12,
    ["planet2"] = 13,
    ["planet3"] = 14,
    ["saucer"] = 15,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
