///move_state()
var _sprint_multiplier = sprint_multiplier;
if (!place_meeting(x, y+1, Solid)) {
    vspd += grav;
    _sprint_multiplier = 1;
    
    //Player is in the air
    sprite_index = spr_player_jump;
    image_speed = 0;
    image_index = (vspd > 0);    
    
    // Control jump height
    if (up_release && vspd < -6) {
        vspd = -6; //min jump height
    }
} else {
    //Player on ground
    vspd = 0;
    
    //Sprinting
    if (control and hspd !=0) and (PlayerStats.stamina > 0) {
        _sprint_multiplier = 1.4;
        
        /// Create some dust
        repeat (irandom_range(1, 2)*abs(hspd/3)) {
            // Create within an area
            var rand_x = irandom_range(-6, 1);
            var rand_y = irandom_range(-2, 2);
            instance_create(x+rand_x, y+rand_y+(sprite_height/2), Dust);
        }
        PlayerStats.stamina -= 2;
    } else {
        _sprint_multiplier = 1;
    }
    
    // Jump
    if (up) {
        if (control) {
            hspd *= _sprint_multiplier;
        }
        vspd = -jspd * sqrt(sqrt(_sprint_multiplier));
        audio_play_sound(snd_jump, 5, false);
        
        /// Create some dust
        repeat (irandom_range(4, 6)) {
            // Create within an area
            var rand_x = irandom_range(-6, 6);
            var rand_y = irandom_range(-4, 4);
            instance_create(x+rand_x, y+rand_y+(sprite_height/2), Dust);
        }
    }
    
    if (hspd == 0) {
        sprite_index = spr_player_idle;
        
        if (pinch) { // commit suicide with pinch button
            if (pinchTime <= pinchTimeMax+1) {
                pinchTime += 1;
                image_blend = make_colour_rgb(255 - pinchTime, 255, 255);
            } if (pinchTime > pinchTimeMax) {
                image_blend = c_white;
                take_damage(3);
                pinchTime = 0;
            }
        } else {
            pinchTime = 0;
            image_blend = c_white;
        }
    } else {
        sprite_index = spr_player_walk;
        image_speed = .6 * power(_sprint_multiplier, 2);
    }
}

if (right) {
    hspd = spd * _sprint_multiplier;
    hspd_dir = 1;
}

if (left) {
    hspd = -spd * _sprint_multiplier;
    hspd_dir = -1;    
}

if (right || left) {
    hspd += (right-left)*acc;
    hspd_dir = right-left;
    
    if (hspd > spd*_sprint_multiplier) hspd = spd*_sprint_multiplier;
    if (hspd < -spd*_sprint_multiplier) hspd = -spd*_sprint_multiplier;
} else {
    apply_friction(acc);
}

if (hspd != 0) {
    image_xscale = sign(hspd);
}

//Play the landing sound
if (place_meeting(x, y+vspd+1, Solid) && vspd > 0) {
    audio_emitter_pitch(audio_em, random_range(.8, 1.2));
    audio_emitter_gain(audio_em, .2);
    audio_play_sound_on(audio_em, snd_step, false, 6);
}

//Regen stamina
if (PlayerStats.stamina < PlayerStats.max_stamina) and (!control or hspd = 0) {
    PlayerStats.stamina += 1;
}

move(Solid);

/// Check for ledge grab state
var falling = (y-yprevious > 0);
var wasnt_wall = !position_meeting(x+17*image_xscale, yprevious, Solid);
var is_wall = position_meeting(x+17*image_xscale, y, Solid);

if (falling && wasnt_wall && is_wall) {
    hspd = 0;
    vspd = 0;
    
    // Move up against ledge in x
    while (!place_meeting(x+image_xscale, y, Solid)) {
        x += image_xscale;
    }
    // Move up against ledge in y
    while (position_meeting(x+17*image_xscale, y-1, Solid)) {
        y -= 1;
    }
    
    sprite_index = spr_player_ledge_grab;
    state = ledge_grab_state;
    
    //Play ledge grab sound
    audio_emitter_pitch(audio_em, 1.5);
    audio_emitter_gain(audio_em, .1);
    audio_play_sound_on(audio_em, snd_step, false, 6);
}
