///exit_state()
if (image_alpha > 0) {
    image_alpha -= .25;
} else {
    if (room != room_last) {
        //room_goto_next();
        //Choose random entry from list of strings
        PlayerStats.levelOverStr = PlayerStats.levelOverStrings[random(array_length_1d(PlayerStats.levelOverStrings))];
        room_goto(rm_levelOver);
         } else {
        //Calc score
        score = PlayerStats.hp*(1000 * PlayerStats.sapphires / (PlayerStats.time/room_speed));
        
        //Open the highscores
        ini_open("Settings.ini");
        PlayerStats.highscore = ini_read_real("Score", "Highscore", 0);
        
        //A new highscore case
        if (score > PlayerStats.highscore) {
            PlayerStats.highscore = score;
            ini_write_real("Score", "Highscore", PlayerStats.highscore);
        }
        
        //Close ini file
        ini_close();
        
        room_goto(rm_highscore);
    }
}
