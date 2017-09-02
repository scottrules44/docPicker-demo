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
    docPicker.import({"public.image"}, function(ev)
        if (ev.status == "document picked") then
            local platformVersion = system.getInfo( "platformVersion" ) or 0
            local iOSVersion = tonumber(string.sub( platformVersion, 1, 4 )) 
            if( iOSVersion >= 11 and system.getInfo("platform") == "ios" ) then 
                local json = require('json')
                native.showAlert( "File Imported", json.encode( ev.urls ),{"Ok"} )
            else
                native.showAlert( "File Imported", ev.url,{"Ok"} )
            end
            
        end
    end)
    end,
    label = "Import Doc",
    x = display.contentCenterX,
    y = display.contentCenterY+30,
})
