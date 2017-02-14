--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:b1d129f62edc3fcbc82da15d14e2fcf6:d6657796a96ec8ea076ffcf71d761a9d:0797c04bf227b7c0963dfd50b237e9f4$
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
            y=29,
            width=35,
            height=35,

        },
        {
            -- blob_0001_Frame-9
            x=1,
            y=66,
            width=33,
            height=35,

        },
        {
            -- blob_0002_Frame-8
            x=77,
            y=32,
            width=30,
            height=38,

        },
        {
            -- blob_0003_Frame-7
            x=38,
            y=32,
            width=37,
            height=32,

        },
        {
            -- blob_0004_Frame-6
            x=48,
            y=1,
            width=40,
            height=29,

        },
        {
            -- blob_0005_Frame-5
            x=1,
            y=1,
            width=45,
            height=26,

        },
        {
            -- blob_0006_Frame-4
            x=1,
            y=1,
            width=45,
            height=26,

        },
        {
            -- blob_0007_Frame-3
            x=75,
            y=72,
            width=40,
            height=29,

        },
        {
            -- blob_0008_Frame-2
            x=36,
            y=66,
            width=37,
            height=32,

        },
        {
            -- blob_0009_Frame-1
            x=1,
            y=29,
            width=35,
            height=35,

        },
    },
    
    sheetContentWidth = 116,
    sheetContentHeight = 102
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
