{ hostname, ... }:
let
  wallpaper = ./wallpaper/grey.jpg;
in
''
background {
    monitor =
    path = ${wallpaper}
    rgba(200, 200, 200, 0.5)
    blur_passes = 5
    blur_size = 7
    noise = 0.0117
    contrast = 0.8916
    brightness = 0.8172
    vibrancy = 0.1696
    vibrancy_darkness = 0.0
}
label {
    monitor =
    text = $USER
    color = rgba(200, 200, 200, 1.0)
    font_size = 20
    font_family = monospace

    position = 0, 80
    halign = center
    valign = center
}
input-field {
    monitor =
    size = 200, 50
    outline_thickness = 3
    dots_size = 0.2
    dots_spacing = 0.15
    dots_center = false
    dots_rounding = -1
    outer_color = rgb(151515)
    inner_color = rgb(200, 200, 200)
    font_color = rgb(70,70,70)
    fade_on_empty = true
    fade_timeout = 1000
    placeholder_text = <i>Input Password...</i>
    hide_input = false
    rounding = -1
    check_color = rgb(204, 136, 34)
    fail_color = rgb(204, 34, 34)
    fail_text = <i>$FAIL <b>($ATTEMPTS)</b></i>
    fail_transition = 300
    capslock_color = -1
    numlock_color = -1
    bothlock_color = -1
    invert_numlock = false

    position = 0, -20
    halign = center
    valign = center
}
''