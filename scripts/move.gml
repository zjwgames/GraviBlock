///move(collision_object)
var collision_object = argument0;

// Horizontal Collisions
if (place_meeting(x+hspd, y, collision_object)) {
    while (!place_meeting(x+sign(hspd), y, collision_object)) {
        x += sign(hspd);
    }
    hspd = 0;
}
x += hspd;

// Vertical Collisions
if (place_meeting(x, y+vspd, collision_object)) {
    while (!place_meeting(x, y+sign(vspd), collision_object)) {
        y += sign(vspd);
    }
    vspd = 0;
}
y += vspd;


/*
if (vspd == 0 and hspd == 0) {
    move_successful = false;
} else {
    move_successful = true;
}

return move_successful
*/
