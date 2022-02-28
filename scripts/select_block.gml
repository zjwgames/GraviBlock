///select_block()

///Select the block and make into graviblock

if (Player.number_of_selected_blocks < Player.max_number_of_selected_blocks) {
    instance_destroy();
    inst = instance_create(x, y, GraviBlock);
    Player.number_of_selected_blocks += 1;
    Player.selected_blocks[Player.number_of_selected_blocks] = inst;
    with (inst) {
        other.is_selected = true;
    }
}
