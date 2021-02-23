-- Reference:
-- https://github.com/webrender/zoom-macos-global-mute
-- https://github.com/todbot/blink1-tool
if application "zoom.us" is running then
  tell application "System Events" to tell process "zoom.us"
    if menu item "Unmute Audio" of menu 1 of menu bar item "Meeting" of menu bar 1 exists then
      click menu item "Unmute Audio" of menu 1 of menu bar item "Meeting" of menu bar 1
      do shell script "/usr/local/bin/blink1-tool --off" 
    else
      if menu item "Mute Audio" of menu 1 of menu bar item "Meeting" of menu bar 1 exists then
        click menu item "Mute Audio" of menu 1 of menu bar item "Meeting" of menu bar 1
        do shell script "/usr/local/bin/blink1-tool --red" 
      end if
    end if
  end tell
end if