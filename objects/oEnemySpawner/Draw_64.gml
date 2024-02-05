draw_set_font(fPixelUI)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

draw_text(25, 25, 
"enemies remaining: " + string(remaining) + " / " + string(total) +
"\ncurrent wave: " + string(currentWave)
);