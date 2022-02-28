hspd = 0;
image_speed = 0.025;

var dist = abs(sprite_width/2); //how far the snake sees forward before turning around

var on_ground = place_meeting(x, y+1, Solid);

var wall_at_left = place_meeting(x-dist, y, Solid);
var ledge_at_left = !position_meeting(bbox_left-dist, bbox_bottom+1, Solid);

var wall_at_right = place_meeting(x+dist, y, Solid);
var ledge_at_right = !position_meeting(bbox_right+dist, bbox_bottom+1, Solid);

if !on_ground {
    vspd += grav;
} else {
    vspd = 0;
}

//Face the player
if (Player.x <= self.x) {
    image_xscale = -1;
    //facing_right=false;
}
if (Player.x >= self.x) {
    image_xscale = 1;
    //facing_right=true;
}

// Go back into moving state if a walkable block is neighbouring
if !((wall_at_left || ledge_at_left) and (wall_at_right || ledge_at_right)) {
    //state = snake_idle_state; //idle state
    if (wall_at_left || ledge_at_left) {
        image_speed = 0.1;
        state = snake_move_right_state;
    }
    
    if (wall_at_right || ledge_at_right) {
        image_speed = 0.1;
        state = snake_move_left_state;
    }
}




// Move the snake
move(Solid);
