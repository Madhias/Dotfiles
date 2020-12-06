local airpods = require('airpods')

-- Define monitor names for layout purposes
local display_oben = "CS2420"
local display_macbook = "Color LCD"

-- Define Wifi
local workWifi = "Schawk"

-- Define keyboard shortcuts
hyper_short = {"cmd", "alt"}
hyper = {"cmd", "alt", "ctrl"}

require('position')

-- MacOS window settings
hs.window.animationDuration = 0
hs.window.setShadows(false)
hs.grid.setMargins({w=10, h=10})

-- Hotkeys to move window layouts
hs.hotkey.bind(hyper, '4', function() hs.layout.apply(mono_display) end)
hs.hotkey.bind(hyper, '5', function() hs.layout.apply(dual_display) end)

-- Define windows layouts
local mono_display = {
    {"Safari", nil, display_oben, hs.geometry.unitrect(0.15, 0, 0.7, 1), nil, nil},
    {"Finder", nil, display_oben, hs.geometry.unitrect(0, 0.5, 0.5, 0.5), nil, nil},
    {"Google Chrome", nil, display_oben, hs.geometry.unitrect(0.15, 0, 0.7, 1), nil, nil},
    {"KeePassX", nil, display_macbook, hs.geometry.unitrect(0, 0, 0, 0), nil, nil}
}

local dual_display = {
--    {"Safari", nil, display_macbook, hs.layout.maximized, nil, nil}, 
    {"Microsoft Outlook", nil, display_links, hs.geometry.unitrect(0, 0, 1, 1), nil, nil},
    {"Mail", nil, display_links, hs.geometry.unitrect(0, 0.2, 1, 0.8), nil, nil},
    {"Safari", nil, display_oben, hs.geometry.unitrect(0.1, 0, 0.8, 1), nil, nil},
    {"Finder", nil, display_macbook, hs.geometry.unitrect(0, 0, 1, 1), nil, nil},
    {"KeePassX", nil, display_macbook, hs.geometry.unitrect(0, 0, 0, 0), nil, nil},
    {"Kalender", nil, display_macbook, hs.geometry.unitrect(0.1, 0.1, 0.8, 0.8), nil, nil},
    {"Automation Engine Pilot", nil, display_macbook, hs.geometry.unitrect(0, 0, 1, 1), nil, nil},
    {"iTerm2", nil, display_macbook, hs.geometry.unitrect(0.2, 0, 0.8, 1), nil, nil},
    {"TextEdit", nil, display_macbook, hs.geometry.unitrect(0, 0.5, 0.3, 0.5), nil, nil}
}

hs.hotkey.bind(hyper, '1', function()
    local win = hs.window.focusedWindow()
    if (win) then
        win:moveToScreen(hs.screen(display_macbook))
    end
end)

hs.hotkey.bind(hyper, '2', function()
    local win = hs.window.focusedWindow()
    if (win) then
        win:moveToScreen(hs.screen(display_oben))
    end
end)

hs.hotkey.bind(hyper, 'a', nil, function()
  local ok, output = airpods.toggle('Evan’s AirPods')
  if ok then
    hs.alert.show(output)
  else
    hs.alert.show("Couldn't connect to AirPods!")
  end
end)

-- Reload Config
hs.hotkey.bind(hyper, "R", function() hs.reload() end)
hs.alert.show("Config loaded")

-- Bring all Finder windows forward when one gets activated
function applicationWatcher(appName, eventType, appObject)
    if (eventType == hs.application.watcher.activated) then
        if (appName == "Finder") then
           appObject:selectMenuItem({"Window", "Bring All to Front"})
        end
    end
end
local appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()

-- Applications launch
local function newChromeWindow()
  os.execute("/Applications/'Google Chrome.app'/Contents/MacOS/'Google Chrome' --new-window")
  visibleWindows = hs.window.orderedWindows()
  visibleWindows[2]:focus()
end

hs.hotkey.bind(hyper, "c", function()
  newChromeWindow()
end)

hs.hotkey.bind(hyper, "9", function () hs.keycodes.setLayout("US International - PC") end)

-- Wifi Settings
hs.wifi.watcher.new(function ()
    local currentWifi = hs.wifi.currentNetwork()
    if not currentWifi then return end

local note = hs.notify.new({
    title="Mit WLAN verbunden",
    informativeText="Name: " .. currentWifi
}):send()

if currentWifi == hotspotWifi then
    hs.keycodes.setLayout("US International - PC")
  end
end):start()


