if (instance_exists(Player)) {
    var dir = point_direction(x, y, Player.x, Player.y);
    hspd = lengthdir_x(spd, dir); // speed proportional to relative height of player
    //vspd = lengthdir_y(spd, dir);
    
    var on_ground = place_meeting(x, y+1, Solid);
    if !on_ground {
        vspd += grav;
    } else {
        vspd = 0;
    }
    
    if (on_ground and (Player.y < y+(sprite_height/2))) {
        state = spider_idle_state;
    }
    
    //Change to the chasing spider sprite
    //sprite_index = spr_bat_fly;
    
    //Face the right direction
    if (hspd != 0) image_xscale = sign(hspd);
    
    // Move
    move(Solid);
}
