--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:df38e80ccdfbdfeedfb0dc1eef8dfb0a:d6657796a96ec8ea076ffcf71d761a9d:72763bdea23d30b448d763998371fe38$
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
            y=165,
            width=173,
            height=173,

        },
        {
            -- blob_0001_Frame-9
            x=176,
            y=165,
            width=165,
            height=174,

        },
        {
            -- blob_0002_Frame-8
            x=377,
            y=1,
            width=152,
            height=190,

        },
        {
            -- blob_0003_Frame-7
            x=1,
            y=1,
            width=186,
            height=162,

        },
        {
            -- blob_0004_Frame-6
            x=343,
            y=193,
            width=202,
            height=143,

        },
        {
            -- blob_0005_Frame-5
            x=1,
            y=341,
            width=226,
            height=129,

        },
        {
            -- blob_0006_Frame-4
            x=1,
            y=341,
            width=226,
            height=129,

        },
        {
            -- blob_0007_Frame-3
            x=343,
            y=338,
            width=202,
            height=143,

        },
        {
            -- blob_0008_Frame-2
            x=189,
            y=1,
            width=186,
            height=162,

        },
        {
            -- blob_0009_Frame-1
            x=1,
            y=165,
            width=173,
            height=173,

        },
    },
    
    sheetContentWidth = 546,
    sheetContentHeight = 482
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
