///collision_damage_below(hit_sound, hit_sound_volume, damage_script, amount_of_damage_per_frame)

// Collide with object, bounce off, destroy it and play sound
var hit_sound = argument0;
var hit_sound_volume = argument1;
var damage_script = argument2;
var damage = argument3;

var above_enemy = (y < other.y+vspd);
var falling = (vspd > 0);

if (above_enemy && falling) {
    /*
    //Bounce off object
    if (!place_meeting(x, yprevious, Solid)) {
        y = yprevious;
    }
    */
    
    //Fall
    while(!place_meeting(x, y+1, other)) {
        y++;
    }
    
    //Hit the object
    with (other) {
        script_execute(damage_script, damage);
    }
    
    //Play the sound
    audio_play_sound(hit_sound, 6, false);
}
