-- Reference:
-- https://github.com/webrender/zoom-macos-global-mute
if application "zoom.us" is running then
  tell application "System Events" to tell process "zoom.us"
    if menu item "Unmute Audio" of menu 1 of menu bar item "Meeting" of menu bar 1 exists then
      click menu item "Unmute Audio" of menu 1 of menu bar item "Meeting" of menu bar 1
    else
      if menu item "Mute Audio" of menu 1 of menu bar item "Meeting" of menu bar 1 exists then
        click menu item "Mute Audio" of menu 1 of menu bar item "Meeting" of menu bar 1
      end if
    end if
  end tell
end if