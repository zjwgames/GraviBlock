///snake_move_right_state
hspd = 1;

var wall_at_right = place_meeting(x+1, y, Solid);
var ledge_at_right = !position_meeting(bbox_right+1, bbox_bottom+1, Solid);

var wall_at_left = place_meeting(x-1, y, Solid);
var ledge_at_left = !position_meeting(bbox_left-1, bbox_bottom+1, Solid);

var on_ground = place_meeting(x, y+1, Solid);

if !on_ground {
    vspd += grav;
} else {
    vspd = 0;
}

if (wall_at_right || ledge_at_right) {
    state = snake_move_left_state;
}

if ((wall_at_left || ledge_at_left) and (wall_at_right || ledge_at_right)) {
    state = snake_idle_state; //idle state
}

// Control the snake sprite
image_xscale = 1;

// Move the snake
move(Solid);
