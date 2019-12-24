#!/bin/bash
# Source: https://www.tylerewing.co/tmux-now-playing 

NOW_PLAYING=$(osascript <<EOF
set music_state to false
if is_app_running("Music") then
    tell application "Music" to set music_state to (player state as text)
end if

if music_state is equal to "playing" then
    tell application "Music"
    set track_name to name of current track
    set artist_name to artist of current track
    return track_name & " - #[bold]" & artist_name & "#[nobold]"
    end tell
else
    return "Nothing playing :("
end if
on is_app_running(app_name)
    tell application "System Events" to (name of processes) contains app_name
end is_app_running
EOF)

echo $NOW_PLAYING