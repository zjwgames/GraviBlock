///spider_idle_state()

var on_ground = place_meeting(x, y+1, Solid);
if !on_ground {
    vspd += grav;
} else {
    vspd = 0;
}

if (instance_exists(Player)) {
    var dis = distance_to_object(Player);
    
    if ((dis < sight && alarm[0] <= 0) and (Player.y < y)) {
        image_speed = .5;
        
        // Make sure we face the player
        if (Player.x != x) {
            image_xscale = sign(Player.x - x);
        }
    } else if (dis < sight) {
        //Moving state
        state = spider_chase_state;
    }
}
