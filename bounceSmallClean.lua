--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:f35f8e8ff7d000747736c9b240155234:e20f55e65a6055f7c2dff162768d278b:8bd2114c63749137633c4c6ecfddae5d$
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
            -- blob_0000_Frame-10
            x=1,
            y=41,
            width=39,
            height=40,

            sourceX = 7,
            sourceY = 8,
            sourceWidth = 55,
            sourceHeight = 56
        },
        {
            -- blob_0001_Frame-9
            x=85,
            y=1,
            width=39,
            height=40,

            sourceX = 8,
            sourceY = 8,
            sourceWidth = 55,
            sourceHeight = 56
        },
        {
            -- blob_0002_Frame-8
            x=46,
            y=1,
            width=37,
            height=44,

            sourceX = 8,
            sourceY = 4,
            sourceWidth = 55,
            sourceHeight = 56
        },
        {
            -- blob_0003_Frame-7
            x=1,
            y=1,
            width=43,
            height=38,

            sourceX = 6,
            sourceY = 10,
            sourceWidth = 55,
            sourceHeight = 56
        },
        {
            -- blob_0004_Frame-6
            x=42,
            y=47,
            width=45,
            height=34,

            sourceX = 5,
            sourceY = 14,
            sourceWidth = 55,
            sourceHeight = 56
        },
        {
            -- blob_0005_Frame-5
            x=1,
            y=83,
            width=49,
            height=32,

            sourceX = 3,
            sourceY = 16,
            sourceWidth = 55,
            sourceHeight = 56
        },
        {
            -- blob_0006_Frame-4
            x=1,
            y=83,
            width=49,
            height=32,

            sourceX = 3,
            sourceY = 16,
            sourceWidth = 55,
            sourceHeight = 56
        },
        {
            -- blob_0007_Frame-3
            x=52,
            y=83,
            width=45,
            height=32,

            sourceX = 5,
            sourceY = 15,
            sourceWidth = 55,
            sourceHeight = 56
        },
        {
            -- blob_0008_Frame-2
            x=85,
            y=1,
            width=39,
            height=40,

            sourceX = 8,
            sourceY = 8,
            sourceWidth = 55,
            sourceHeight = 56
        },
        {
            -- blob_0009_Frame-1
            x=85,
            y=1,
            width=39,
            height=40,

            sourceX = 8,
            sourceY = 8,
            sourceWidth = 55,
            sourceHeight = 56
        },
    },
    
    sheetContentWidth = 125,
    sheetContentHeight = 116
}

SheetInfo.frameIndex =
{

    ["blob_0000_Frame-10"] = 1,
    ["blob_0001_Frame-9"] = 2,
    ["blob_0002_Frame-8"] = 3,
    ["blob_0003_Frame-7"] = 4,
    ["blob_0004_Frame-6"] = 5,
    ["blob_0005_Frame-5"] = 6,
    ["blob_0006_Frame-4"] = 7,
    ["blob_0007_Frame-3"] = 8,
    ["blob_0008_Frame-2"] = 9,
    ["blob_0009_Frame-1"] = 10,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
