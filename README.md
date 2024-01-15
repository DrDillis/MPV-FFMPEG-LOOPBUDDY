# MPV-FFMPEG-LOOPBUDDY
3 scripts that'll knock your socks off. Export A-B loop to MP4, Move back to loop, Play with loop

USER MUST HAVE FFMPEG INSTALLED WITH PATH SET

Drag these 3 scripts into \AppData\Roaming\mpv\scripts

ffmpegExportandshow.lua
1 Make the directory and or change the line of code in this script for C:\Users\Computer\Videos\dump
2 Use your normal a-b loop l / L key, use f5 to show the current a-b loop time, press F6 to export from ffmpeg to mp4
3 exported video will have the title + 4 random digits at the end to prevent overwriting / ffmpeg warning prompts

adjustab.lua
use CTRL + [] and ALT + [] to add or reduce time to the A-B loop, each press with remove or add time to the loop, each button click will 
report the new time 

gobackf4.lua
if you end up outside of the a-b loop range this will bring you back to the loop range


KNOWN ISSUES
loops too short will not export properly it'll be black
some exports have just exported black
adjust the ffmpeg prompt input output / codec...
