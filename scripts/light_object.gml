///Light target object
lightTarget = argument0;
innerRadius = argument1;
outerRadius = argument2;
offset = argument3;

// Set circles
draw_set_blend_mode(bm_subtract);   

draw_set_colour(c_black);
outerCircleLightness=0.2;
draw_set_alpha(outerCircleLightness);

// Draw circles
var flickerLevel = 1; // amount of flickerLevel
var flickerRate = 0.5;

if (flickerRate < random(1)) { // Reduce the amount of flickering randomly => reducing flicker rate
    flickerLevel = 0;
}


with (lightTarget) {
    outerRadius = argument2 + random_range(-flickerLevel, flickerLevel);
    offset = argument3;
    //outerRadius = 80 + random_range(-flickerLevel,flickerLevel);
    //outerRadius += random_range(-flickerLevel, flickerLevel);
    draw_circle(x + random_range(-flickerLevel,flickerLevel) + offset, y + random_range(-flickerLevel, flickerLevel) + offset, outerRadius, false);
}

draw_set_colour(c_white);
innerCircleLightness = 1;
draw_set_alpha(innerCircleLightness);

with (lightTarget) {
    innerRadius = argument1 + random_range(-flickerLevel, flickerLevel);
    offset = argument3;
    //innerRadius = 50 + random_range(-flickerLevel,flickerLevel);
    //innerRadius += random_range(-flickerLevel, flickerLevel);
    draw_circle(x + random_range(-flickerLevel,flickerLevel) + offset, y + random_range(-flickerLevel, flickerLevel) + offset, innerRadius, false);
}

