///deselect_block()

///Deselect the graviblock and make into dirt

if (Player.number_of_selected_blocks > 0) {
    with (self) {
        is_selected = false;
    }
    instance_destroy();
    instance_create(x, y, Dirt);
    //Play audio effect
    //audio_play_sound(snd_step, 6, false);
    
    Player.selected_blocks[Player.number_of_selected_blocks] = 0;
    Player.number_of_selected_blocks -= 1;
}
