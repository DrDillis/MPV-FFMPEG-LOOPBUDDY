# MPV-FFMPEG-LOOPBUDDY
3 scripts that'll knock your socks off. 🧦💥🦶

1) Export A-B loop to MP4 2) Adjust loop time 3) Move back to loop if outside range


USER MUST HAVE FFMPEG INSTALLED WITH PATH SET

Drag these 3 scripts into \AppData\Roaming\mpv\scripts




ffmpegExportandshow.lua
1 Make the directory and or change the line of code in this script for C:\Users\Computer\Videos\dump
2 Use your normal a-b loop l / L key, use f5 to show the current a-b loop time, press F6 to export from ffmpeg to mp4
3 exported video will have the title + 4 random digits at the end to prevent overwriting / ffmpeg warning prompts

adjustab.lua
use CTRL + [] and ALT + [] to add or reduce time to the A-B loop, each key press will  remove or add time to the loop

gobackf4.lua
if you end up outside of the a-b loop range from adjusting the time this will bring you back to the loop range


KNOWN ISSUES
1 loops too short will not export properly (1-2 seconds)
2 some exports might have no video adjust the ffmpeg prompt input output / codec to your liking in ffmegExportandshow.lua ...


LINE 42: local ffmpeg_command = string.format('ffmpeg -i "%s" -ss %.2f -to %.2f -c:v copy -c:a copy "%s"', input_file, start_time, end_time, output_file_path)
        os.execute(ffmpeg_command)
