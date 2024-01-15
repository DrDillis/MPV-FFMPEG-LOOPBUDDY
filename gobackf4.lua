-- This script allows you to jump back to the A-B loop in MPV if you've gone past it.

-- Listener for when 'F4' is pressed.
function on_key_press()
    local ab_loop_a = mp.get_property_number("ab-loop-a", -1)
    local ab_loop_b = mp.get_property_number("ab-loop-b", -1)
    local current_pos = mp.get_property_number("time-pos", -1)

    -- Check if A-B loop is set and if the current position is beyond the loop
    if ab_loop_a ~= -1 and current_pos > ab_loop_b then
        -- Seek to the beginning of the loop
        mp.set_property_number("time-pos", ab_loop_a)
    end
end

-- Bind the key press event to function
mp.add_key_binding("F4", "go_back_to_ab_loop", on_key_press)