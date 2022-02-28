///get_input()

//Keyboard
right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
up = keyboard_check_pressed(vk_up);
up_release = keyboard_check_released(vk_up);
down = keyboard_check(vk_down);
control = keyboard_check(vk_control);
space_pressed = keyboard_check_pressed(vk_space);
pinch = keyboard_check_pressed(ord('Z'));

lmb = mouse_check_button_pressed(mb_left);

//Map arrow keys to WASD

keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("D"), vk_right);
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("S"), vk_down);

keyboard_set_map(vk_shift, vk_control);

//Override the controls for a gamepad
var gp_id = 0;
var thresh = .5;

if (gamepad_is_connected(gp_id)) {
    right = (gamepad_axis_value(gp_id, gp_axislh) > thresh) or (gamepad_button_check(gp_id, gp_padr)); // Right on Left Thumbstick OR Right on Dpad
    left = (gamepad_axis_value(gp_id, gp_axislh) < -thresh) or (gamepad_button_check(gp_id, gp_padl)); // Left on Left Thumbstick OR Left on Dpad
    up = gamepad_button_check_pressed(gp_id, gp_face1); // A
    up_release = gamepad_button_check_released(gp_id, gp_face1); // A released
    down = (gamepad_axis_value(gp_id, gp_axislv) > thresh) or (gamepad_button_check(gp_id, gp_padd)); // Down on Left Thumbstick OR Down on Dpad
    control = gamepad_button_check(gp_id, gp_shoulderlb); // Left Trigger     // or gamepad_button_check(gp_id, gp_shoulderrb);
    space_pressed = gamepad_button_check_pressed(gp_id, gp_face3); // X
    lmb = gamepad_button_check_pressed(gp_id, gp_shoulderrb); // Right Trigger
    pinch = gamepad_button_check(gp_id, gp_face4);
}
