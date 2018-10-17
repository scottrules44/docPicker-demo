local docPicker = require("plugin.docPicker")
docPicker.init()
local widget = require("widget")
local json = require("json")
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

local importButton = widget.newButton( {
    onRelease = function (e)
    docPicker.import({"public.data"}, function(ev)
            native.showAlert( "File Imported", json.encode(ev),{"Ok"} )
        
    end)
    end,
    label = "Import Doc",
    x = display.contentCenterX,
    y = display.contentCenterY+30,
})
