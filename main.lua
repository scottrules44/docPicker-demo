local docPicker = require("plugin.docPicker")
docPicker.init()
local widget = require("widget")
local bg = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
bg:setFillColor(.5)
local title = display.newText( "Doc Picker Plugin", display.contentCenterX, 20 , native.systemFontBold, 20 )


local exportButton = widget.newButton( {
    onRelease = function (e)
        docPicker.export(system.pathForFile("test.txt"), function(ev)
            if (ev.status == "document picked") then
                native.showAlert( "File Exported", {"Ok"} )
            end
        end)
    end,
    label = "Export Doc",
    x = display.contentCenterX,
    y = display.contentCenterY-30,
})

local exportButton = widget.newButton( {
    onRelease = function (e)
    docPicker.import({"public.image"}, system.pathForFile( "test.png", system.TemporaryDirectory ), function(ev)
        if (ev.status == "document picked") then
                     local testImage = display.newImage( "test.png", system.TemporaryDirectory, display.contentCenterX, display.contentCenterY+80 )
            native.showAlert( "File Imported", contents,{"Ok"} )
        end
    end)
    end,
    label = "Import Doc",
    x = display.contentCenterX,
    y = display.contentCenterY+30,
})
