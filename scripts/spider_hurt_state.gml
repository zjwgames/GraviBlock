
image_blend = make_colour_rgb(220, 150, 150);

if (hspd != 0) image_xscale = sign(hspd);

//Apply gravity
if (!place_meeting(x, y+1, Solid)) {
    vspd += grav;
} else {
    vspd = 0;
    
    //Use friction
    apply_friction(2*acc);
}

direction_move_bounce(Solid);

//Destroy spider when it stops moving
if (hspd == 0 && vspd == 0) {
    instance_destroy();
}
