///boss_chase_state()
var dis = point_distance(x, y, Player.x, y); //horizontal dist

if (dis < sprite_width/2-16 || place_meeting(x-1, y, Solid) || place_meeting(x+1, y, Solid)) {
    state = boss_smash_state;
    audio_play_sound(snd_jump, 6, false);
    hspd = 0;
} else {
    hspd = (Player.x - x ) * .05;
}

move(Solid);
