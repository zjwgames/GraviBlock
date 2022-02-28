///hurt_state()
//Set the sprite
sprite_index = spr_player_hurt;

if (hspd != 0) image_xscale = sign(hspd);

//Apply gravity
if (!place_meeting(x, y+1, Solid)) {
    vspd += grav;
} else {
    vspd = 0;
    
    //Use friction (x3 - a lot)
    apply_friction(3*acc);
}

direction_move_bounce(Solid);

//Change back to move state
if (hspd == 0 && vspd == 0) or (Player.y > room_height+32) {
    image_blend = c_white;
    
    if (PlayerStats.hp <= 0) {
        if (global.sapphires_collected_in_room < PlayerStats.sapphires) {
            PlayerStats.sapphires -= (global.sapphires_collected_in_room+1);
            PlayerStats.sapphires_to_be_deducted_gui = -(global.sapphires_collected_in_room+1);
        } else {
            PlayerStats.sapphires -= global.sapphires_collected_in_room;
            PlayerStats.sapphires_to_be_deducted_gui = -global.sapphires_collected_in_room;
        }
        PlayerStats.hp = PlayerStats.maxhp;
        if (audio_is_playing(snd_boss_music)) {
            audio_stop_sound(snd_boss_music);
        }
        //room_restart();
        global.currentRoom = room;
        room_goto(rm_death);
    }
    state = move_state;
}
