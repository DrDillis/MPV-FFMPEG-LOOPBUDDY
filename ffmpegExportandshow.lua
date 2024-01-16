local utils = require 'mp.utils'

-- Display the current A-B loop as a string in hour:minute:second format
function display_ab_loop()
    local ab_loop_str = "A-B Loop: "
    local start_time = mp.get_property_number("ab-loop-a")
    local end_time = mp.get_property_number("ab-loop-b")

    if start_time and end_time and not (start_time == -1 or end_time == -1) then
        ab_loop_str = ab_loop_str .. format_time(start_time) .. " - " .. format_time(end_time)
    else
        ab_loop_str = ab_loop_str .. "Not set"
    end

    mp.osd_message(ab_loop_str, 2)  -- Display the message for 2 seconds
end

-- Helper function to format seconds to hour:minute:second
function format_time(time)
    local hours = math.floor(time / 3600)
    local mins = math.floor((time % 3600) / 60)
    local secs = math.floor(time % 60)
    return string.format("%02d:%02d:%02d", hours, mins, secs)
end

-- Adding a seed for the random generator to enhance randomness
math.randomseed(os.time())

-- Generate a video clip using ffmpeg from the current A-B loop with a unique filename
function generate_video_clip()
    local start_time = mp.get_property_number("ab-loop-a")
    local end_time = mp.get_property_number("ab-loop-b")

    if start_time and end_time and not (start_time == -1 or end_time == -1) then
        local input_file = mp.get_property("path")
        local input_file_name = mp.get_property("filename/no-ext")  -- Get the base name without extension
        local output_dir = "C:\\Users\\Computer\\Videos\\dump"
        local random_number = math.random(1000, 9999)  -- Generate a random 4-digit number
        local output_file_name = string.format("%s-%04d.mp4", input_file_name, random_number)
        local output_file_path = utils.join_path(output_dir, output_file_name)

        -- Ensure the output directory exists
        utils.subprocess({args = {"mkdir", output_dir}, cancellable = false})

        -- Using the libx264 codec to help prevent black video output issue
        local ffmpeg_command = string.format('ffmpeg -i "%s" -ss %.2f -to %.2f -c:v libx264 -c:a copy "%s"', input_file, start_time, end_time, output_file_path)
        os.execute(ffmpeg_command)

        mp.osd_message("Video clip generated: " .. output_file_path, 2)  -- Display the message for 2 seconds
    else
        mp.osd_message("A-B loop not defined", 2)
    end
end

-- Key bindings
mp.add_key_binding("f5", "display-ab-loop", display_ab_loop)
mp.add_key_binding("f6", "generate-video-clip", generate_video_clip)