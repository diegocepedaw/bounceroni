--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:3015888d5888695cd01098c12e1f5686:373c778a29a3d0851ec5669cb1484281:247da8482fc173a85c8b33cf435098ef$
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
            x=38,
            y=42,
            width=35,
            height=35,

        },
        {
            -- blob_0000_Frame-10
            x=75,
            y=44,
            width=35,
            height=35,

        },
        {
            -- blob_0001_Frame-9
            x=38,
            y=79,
            width=30,
            height=38,

        },
        {
            -- blob_0002_Frame-8
            x=98,
            y=1,
            width=26,
            height=41,

        },
        {
            -- blob_0003_Frame-7
            x=1,
            y=116,
            width=30,
            height=38,

        },
        {
            -- blob_0004_Frame-6
            x=33,
            y=119,
            width=37,
            height=32,

        },
        {
            -- blob_0005_Frame-5
            x=48,
            y=153,
            width=45,
            height=26,

        },
        {
            -- blob_0006_Frame-4
            x=1,
            y=156,
            width=45,
            height=14,

        },
        {
            -- blob_0007_Frame-3
            x=72,
            y=115,
            width=45,
            height=26,

        },
        {
            -- blob_0008_Frame-2
            x=70,
            y=81,
            width=37,
            height=32,

        },
        {
            -- blob_0009_Frame-1
            x=1,
            y=79,
            width=35,
            height=35,

        },
        {
            -- planet1
            x=59,
            y=1,
            width=37,
            height=39,

        },
        {
            -- planet2
            x=1,
            y=1,
            width=56,
            height=38,

            sourceX = 0,
            sourceY = 9,
            sourceWidth = 56,
            sourceHeight = 56
        },
        {
            -- planet3
            x=1,
            y=41,
            width=35,
            height=36,

        },
        {
            -- saucer
            x=95,
            y=143,
            width=31,
            height=29,

            sourceX = 0,
            sourceY = 1,
            sourceWidth = 31,
            sourceHeight = 31
        },
    },
    
    sheetContentWidth = 127,
    sheetContentHeight = 180
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
