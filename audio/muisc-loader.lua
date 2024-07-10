local path_main = "__MOD__/audio/"
-- local ambientMusic = mod_ambient_music_config.value
-- local menuMusic = mod_menu_music_config.value

data:extend({
    {
        type = "ambient-sound",
        name = "music_name",
        track_type = "interlude",
        sound =
        {
            filename = path_main .. "music.ogg",
            volume = 1.2
        }
    }
})

data:extend({
    {
        type = "ambient-sound",
        name = "tttheme2",
        track_type = "menu-track",
        sound =
        {
            filename = path_main .. "tttheme2.ogg",
            volume = 1.2
        }
    }
})