///ledge_grab_state()

if (down) {
    state = move_state;
}

if (up) {
    state = move_state;
    vspd = -16;
}

//If block falls onto the ledge being grabbed
if (position_meeting(x+17*image_xscale, y-1, Solid)) {
    take_damage(1);
    audio_emitter_pitch(audio_em, 1.6);
    audio_emitter_gain(audio_em, 1.4);
    audio_play_sound_on(audio_em, snd_ouch, false, 8);
}

//If the ledge being grabbed falls
//If block falls on the ledge being grabbed
if (!position_meeting(x+17*image_xscale, y, Solid)) {
    state = hurt_state;
    audio_emitter_pitch(audio_em, 1.6);
    audio_emitter_gain(audio_em, 1.4);
    audio_play_sound_on(audio_em, snd_ouch, false, 8);
}

//Drain stamina
if (PlayerStats.stamina > 0) {
    PlayerStats.stamina -= 1;
} else {
    state = move_state;
}
