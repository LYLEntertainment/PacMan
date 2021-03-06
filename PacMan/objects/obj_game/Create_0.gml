macros();
randomize();
global.map = layer_tilemap_get_id("Collisions");

global.grid = mp_grid_create(30, 30, (room_width - 60) / 60, (room_height - 60) / 60 , 60, 60);

for(var xx = 30; xx < room_width - 30; xx += 60) {
    for(var yy = 30; yy < room_height - 30; yy += 60) {
        var t1 = tilemap_get_at_pixel(global.map, xx, yy);
        if t1 != VOID {
            mp_grid_add_cell(global.grid, (xx - 30) / 60, (yy - 30) / 60);
        }
    }
}

///< map generator
spawn = true

num_fruits_eaten = 0;

// ghosts
left_ghosts = ds_list_create();
right_ghosts = ds_list_create();

ghost_spawn_left_list[0] = ds_grid_create(5, 2);
ghost_spawn_left_list[1] = ds_grid_create(5, 2);
ghost_spawn_left_list[2] = ds_grid_create(4, 2);
ghost_spawn_left_list[3] = ds_grid_create(2, 2);

ghost_spawn_right_list[0] = ds_grid_create(5, 2);
ghost_spawn_right_list[1] = ds_grid_create(5, 2);
ghost_spawn_right_list[2] = ds_grid_create(4, 2);
ghost_spawn_right_list[3] = ds_grid_create(2, 2);

// #1
ds_grid_set(ghost_spawn_left_list[0], 0, 0, 420)
ds_grid_set(ghost_spawn_left_list[0], 0, 1, 420)
ds_grid_set(ghost_spawn_left_list[0], 1, 0, 420)
ds_grid_set(ghost_spawn_left_list[0], 1, 1, 660)
ds_grid_set(ghost_spawn_left_list[0], 2, 0, 180)
ds_grid_set(ghost_spawn_left_list[0], 2, 1, 780)
ds_grid_set(ghost_spawn_left_list[0], 3, 0, 300)
ds_grid_set(ghost_spawn_left_list[0], 3, 1, 540)
ds_grid_set(ghost_spawn_left_list[0], 4, 0, 180)
ds_grid_set(ghost_spawn_left_list[0], 4, 1, 300)

ds_grid_set(ghost_spawn_right_list[0], 0, 0, 1500)
ds_grid_set(ghost_spawn_right_list[0], 0, 1, 420)
ds_grid_set(ghost_spawn_right_list[0], 1, 0, 1500)
ds_grid_set(ghost_spawn_right_list[0], 1, 1, 660)
ds_grid_set(ghost_spawn_right_list[0], 2, 0, 1740)
ds_grid_set(ghost_spawn_right_list[0], 2, 1, 780)
ds_grid_set(ghost_spawn_right_list[0], 3, 0, 1620)
ds_grid_set(ghost_spawn_right_list[0], 3, 1, 540)
ds_grid_set(ghost_spawn_right_list[0], 4, 0, 1740)
ds_grid_set(ghost_spawn_right_list[0], 4, 1, 300)

// #2
ds_grid_set(ghost_spawn_left_list[1], 0, 0, 120)
ds_grid_set(ghost_spawn_left_list[1], 0, 1, 840)
ds_grid_set(ghost_spawn_left_list[1], 1, 0, 120)
ds_grid_set(ghost_spawn_left_list[1], 1, 1, 240)
ds_grid_set(ghost_spawn_left_list[1], 2, 0, 420)
ds_grid_set(ghost_spawn_left_list[1], 2, 1, 780)
ds_grid_set(ghost_spawn_left_list[1], 3, 0, 420)
ds_grid_set(ghost_spawn_left_list[1], 3, 1, 300)
ds_grid_set(ghost_spawn_left_list[1], 4, 0, 540)
ds_grid_set(ghost_spawn_left_list[1], 4, 1, 540)

ds_grid_set(ghost_spawn_right_list[1], 0, 0, 1800)
ds_grid_set(ghost_spawn_right_list[1], 0, 1, 840)
ds_grid_set(ghost_spawn_right_list[1], 1, 0, 1800)
ds_grid_set(ghost_spawn_right_list[1], 1, 1, 240)
ds_grid_set(ghost_spawn_right_list[1], 2, 0, 1500)
ds_grid_set(ghost_spawn_right_list[1], 2, 1, 780)
ds_grid_set(ghost_spawn_right_list[1], 3, 0, 1500)
ds_grid_set(ghost_spawn_right_list[1], 3, 1, 300)
ds_grid_set(ghost_spawn_right_list[1], 4, 0, 1380)
ds_grid_set(ghost_spawn_right_list[1], 4, 1, 540)

// #3
ds_grid_set(ghost_spawn_left_list[2], 0, 0, 540)
ds_grid_set(ghost_spawn_left_list[2], 0, 1, 780)
ds_grid_set(ghost_spawn_left_list[2], 1, 0, 180)
ds_grid_set(ghost_spawn_left_list[2], 1, 1, 780)
ds_grid_set(ghost_spawn_left_list[2], 2, 0, 540)
ds_grid_set(ghost_spawn_left_list[2], 2, 1, 300)
ds_grid_set(ghost_spawn_left_list[2], 3, 0, 180)
ds_grid_set(ghost_spawn_left_list[2], 3, 1, 300)

ds_grid_set(ghost_spawn_right_list[2], 0, 0, 1380)
ds_grid_set(ghost_spawn_right_list[2], 0, 1, 780)
ds_grid_set(ghost_spawn_right_list[2], 1, 0, 1740)
ds_grid_set(ghost_spawn_right_list[2], 1, 1, 780)
ds_grid_set(ghost_spawn_right_list[2], 2, 0, 1380)
ds_grid_set(ghost_spawn_right_list[2], 2, 1, 300)
ds_grid_set(ghost_spawn_right_list[2], 3, 0, 1740)
ds_grid_set(ghost_spawn_right_list[2], 3, 1, 300)

// #4
ds_grid_set(ghost_spawn_left_list[3], 0, 0, 720)
ds_grid_set(ghost_spawn_left_list[3], 0, 1, 420)
ds_grid_set(ghost_spawn_left_list[3], 1, 0, 720)
ds_grid_set(ghost_spawn_left_list[3], 1, 1, 660)

ds_grid_set(ghost_spawn_right_list[3], 0, 0, 1200)
ds_grid_set(ghost_spawn_right_list[3], 0, 1, 420)
ds_grid_set(ghost_spawn_right_list[3], 1, 0, 1200)
ds_grid_set(ghost_spawn_right_list[3], 1, 1, 660)

// populate the map with the initial ghosts
generate_ghosts(LEFT, 3);
generate_ghosts(RIGHT, 3);

// coins
left_coins = ds_list_create();
right_coins = ds_list_create();

coin_spawn_left_list[0] = ds_grid_create(13, 2);
coin_spawn_left_list[1] = ds_grid_create(6, 2);
coin_spawn_left_list[2] = ds_grid_create(12, 2);
coin_spawn_left_list[3] = ds_grid_create(18, 2);

coin_spawn_right_list[0] = ds_grid_create(13, 2);
coin_spawn_right_list[1] = ds_grid_create(6, 2);
coin_spawn_right_list[2] = ds_grid_create(12, 2);
coin_spawn_right_list[3] = ds_grid_create(18, 2);

// #1
ds_grid_set(coin_spawn_left_list[0], 0, 0, 780)
ds_grid_set(coin_spawn_left_list[0], 0, 1, 720)
ds_grid_set(coin_spawn_left_list[0], 1, 0, 780)
ds_grid_set(coin_spawn_left_list[0], 1, 1, 690)
ds_grid_set(coin_spawn_left_list[0], 2, 0, 780)
ds_grid_set(coin_spawn_left_list[0], 2, 1, 660)
ds_grid_set(coin_spawn_left_list[0], 3, 0, 780)
ds_grid_set(coin_spawn_left_list[0], 3, 1, 630)
ds_grid_set(coin_spawn_left_list[0], 4, 0, 780)
ds_grid_set(coin_spawn_left_list[0], 4, 1, 600)
ds_grid_set(coin_spawn_left_list[0], 5, 0, 780)
ds_grid_set(coin_spawn_left_list[0], 5, 1, 570)
ds_grid_set(coin_spawn_left_list[0], 6, 0, 780)
ds_grid_set(coin_spawn_left_list[0], 6, 1, 540)
ds_grid_set(coin_spawn_left_list[0], 7, 0, 780)
ds_grid_set(coin_spawn_left_list[0], 7, 1, 510)
ds_grid_set(coin_spawn_left_list[0], 8, 0, 780)
ds_grid_set(coin_spawn_left_list[0], 8, 1, 480)
ds_grid_set(coin_spawn_left_list[0], 9, 0, 780)
ds_grid_set(coin_spawn_left_list[0], 9, 1, 450)
ds_grid_set(coin_spawn_left_list[0], 10, 0, 780)
ds_grid_set(coin_spawn_left_list[0], 10, 1, 420)
ds_grid_set(coin_spawn_left_list[0], 11, 0, 780)
ds_grid_set(coin_spawn_left_list[0], 11, 1, 390)
ds_grid_set(coin_spawn_left_list[0], 12, 0, 780)
ds_grid_set(coin_spawn_left_list[0], 12, 1, 360)

ds_grid_set(coin_spawn_right_list[0], 0, 0, 1140)
ds_grid_set(coin_spawn_right_list[0], 0, 1, 720)
ds_grid_set(coin_spawn_right_list[0], 1, 0, 1140)
ds_grid_set(coin_spawn_right_list[0], 1, 1, 690)
ds_grid_set(coin_spawn_right_list[0], 2, 0, 1140)
ds_grid_set(coin_spawn_right_list[0], 2, 1, 660)
ds_grid_set(coin_spawn_right_list[0], 3, 0, 1140)
ds_grid_set(coin_spawn_right_list[0], 3, 1, 630)
ds_grid_set(coin_spawn_right_list[0], 4, 0, 1140)
ds_grid_set(coin_spawn_right_list[0], 4, 1, 600)
ds_grid_set(coin_spawn_right_list[0], 5, 0, 1140)
ds_grid_set(coin_spawn_right_list[0], 5, 1, 570)
ds_grid_set(coin_spawn_right_list[0], 6, 0, 1140)
ds_grid_set(coin_spawn_right_list[0], 6, 1, 540)
ds_grid_set(coin_spawn_right_list[0], 7, 0, 1140)
ds_grid_set(coin_spawn_right_list[0], 7, 1, 510)
ds_grid_set(coin_spawn_right_list[0], 8, 0, 1140)
ds_grid_set(coin_spawn_right_list[0], 8, 1, 480)
ds_grid_set(coin_spawn_right_list[0], 9, 0, 1140)
ds_grid_set(coin_spawn_right_list[0], 9, 1, 450)
ds_grid_set(coin_spawn_right_list[0], 10, 0, 1140)
ds_grid_set(coin_spawn_right_list[0], 10, 1, 420)
ds_grid_set(coin_spawn_right_list[0], 11, 0, 1140)
ds_grid_set(coin_spawn_right_list[0], 11, 1, 390)
ds_grid_set(coin_spawn_right_list[0], 12, 0, 1140)
ds_grid_set(coin_spawn_right_list[0], 12, 1, 360)

// #2
ds_grid_set(coin_spawn_left_list[1], 0, 0, 660)
ds_grid_set(coin_spawn_left_list[1], 0, 1, 300)
ds_grid_set(coin_spawn_left_list[1], 1, 0, 690)
ds_grid_set(coin_spawn_left_list[1], 1, 1, 300)
ds_grid_set(coin_spawn_left_list[1], 2, 0, 720)
ds_grid_set(coin_spawn_left_list[1], 2, 1, 300)
ds_grid_set(coin_spawn_left_list[1], 3, 0, 660)
ds_grid_set(coin_spawn_left_list[1], 3, 1, 780)
ds_grid_set(coin_spawn_left_list[1], 4, 0, 690)
ds_grid_set(coin_spawn_left_list[1], 4, 1, 780)
ds_grid_set(coin_spawn_left_list[1], 5, 0, 720)
ds_grid_set(coin_spawn_left_list[1], 5, 1, 780)

ds_grid_set(coin_spawn_right_list[1], 0, 0, 1200)
ds_grid_set(coin_spawn_right_list[1], 0, 1, 300)
ds_grid_set(coin_spawn_right_list[1], 1, 0, 1230)
ds_grid_set(coin_spawn_right_list[1], 1, 1, 300)
ds_grid_set(coin_spawn_right_list[1], 2, 0, 1260)
ds_grid_set(coin_spawn_right_list[1], 2, 1, 300)
ds_grid_set(coin_spawn_right_list[1], 3, 0, 1200)
ds_grid_set(coin_spawn_right_list[1], 3, 1, 780)
ds_grid_set(coin_spawn_right_list[1], 4, 0, 1230)
ds_grid_set(coin_spawn_right_list[1], 4, 1, 780)
ds_grid_set(coin_spawn_right_list[1], 5, 0, 1260)
ds_grid_set(coin_spawn_right_list[1], 5, 1, 780)

// #3
ds_grid_set(coin_spawn_left_list[2], 0, 0, 780)
ds_grid_set(coin_spawn_left_list[2], 0, 1, 120)
ds_grid_set(coin_spawn_left_list[2], 1, 0, 780)
ds_grid_set(coin_spawn_left_list[2], 1, 1, 150)
ds_grid_set(coin_spawn_left_list[2], 2, 0, 780)
ds_grid_set(coin_spawn_left_list[2], 2, 1, 180)
ds_grid_set(coin_spawn_left_list[2], 3, 0, 780)
ds_grid_set(coin_spawn_left_list[2], 3, 1, 210)
ds_grid_set(coin_spawn_left_list[2], 4, 0, 780)
ds_grid_set(coin_spawn_left_list[2], 4, 1, 240)
ds_grid_set(coin_spawn_left_list[2], 5, 0, 780)
ds_grid_set(coin_spawn_left_list[2], 5, 1, 270)
ds_grid_set(coin_spawn_left_list[2], 6, 0, 780)
ds_grid_set(coin_spawn_left_list[2], 6, 1, 810)
ds_grid_set(coin_spawn_left_list[2], 7, 0, 780)
ds_grid_set(coin_spawn_left_list[2], 7, 1, 840)
ds_grid_set(coin_spawn_left_list[2], 8, 0, 780)
ds_grid_set(coin_spawn_left_list[2], 8, 1, 870)
ds_grid_set(coin_spawn_left_list[2], 9, 0, 780)
ds_grid_set(coin_spawn_left_list[2], 9, 1, 900)
ds_grid_set(coin_spawn_left_list[2], 10, 0, 780)
ds_grid_set(coin_spawn_left_list[2], 10, 1, 930)
ds_grid_set(coin_spawn_left_list[2], 11, 0, 780)
ds_grid_set(coin_spawn_left_list[2], 11, 1, 960)

ds_grid_set(coin_spawn_right_list[2], 0, 0, 1140)
ds_grid_set(coin_spawn_right_list[2], 0, 1, 120)
ds_grid_set(coin_spawn_right_list[2], 1, 0, 1140)
ds_grid_set(coin_spawn_right_list[2], 1, 1, 150)
ds_grid_set(coin_spawn_right_list[2], 2, 0, 1140)
ds_grid_set(coin_spawn_right_list[2], 2, 1, 180)
ds_grid_set(coin_spawn_right_list[2], 3, 0, 1140)
ds_grid_set(coin_spawn_right_list[2], 3, 1, 210)
ds_grid_set(coin_spawn_right_list[2], 4, 0, 1140)
ds_grid_set(coin_spawn_right_list[2], 4, 1, 240)
ds_grid_set(coin_spawn_right_list[2], 5, 0, 1140)
ds_grid_set(coin_spawn_right_list[2], 5, 1, 270)
ds_grid_set(coin_spawn_right_list[2], 6, 0, 1140)
ds_grid_set(coin_spawn_right_list[2], 6, 1, 810)
ds_grid_set(coin_spawn_right_list[2], 7, 0, 1140)
ds_grid_set(coin_spawn_right_list[2], 7, 1, 840)
ds_grid_set(coin_spawn_right_list[2], 8, 0, 1140)
ds_grid_set(coin_spawn_right_list[2], 8, 1, 870)
ds_grid_set(coin_spawn_right_list[2], 9, 0, 1140)
ds_grid_set(coin_spawn_right_list[2], 9, 1, 900)
ds_grid_set(coin_spawn_right_list[2], 10, 0, 1140)
ds_grid_set(coin_spawn_right_list[2], 10, 1, 930)
ds_grid_set(coin_spawn_right_list[2], 11, 0, 1140)
ds_grid_set(coin_spawn_right_list[2], 11, 1, 960)

// #4
ds_grid_set(coin_spawn_left_list[3], 0, 0, 120)
ds_grid_set(coin_spawn_left_list[3], 0, 1, 180)
ds_grid_set(coin_spawn_left_list[3], 1, 0, 120)
ds_grid_set(coin_spawn_left_list[3], 1, 1, 210)
ds_grid_set(coin_spawn_left_list[3], 2, 0, 120)
ds_grid_set(coin_spawn_left_list[3], 2, 1, 240)
ds_grid_set(coin_spawn_left_list[3], 3, 0, 120)
ds_grid_set(coin_spawn_left_list[3], 3, 1, 270)
ds_grid_set(coin_spawn_left_list[3], 4, 0, 120)
ds_grid_set(coin_spawn_left_list[3], 4, 1, 300)
ds_grid_set(coin_spawn_left_list[3], 5, 0, 120)
ds_grid_set(coin_spawn_left_list[3], 5, 1, 330)
ds_grid_set(coin_spawn_left_list[3], 6, 0, 120)
ds_grid_set(coin_spawn_left_list[3], 6, 1, 360)
ds_grid_set(coin_spawn_left_list[3], 7, 0, 120)
ds_grid_set(coin_spawn_left_list[3], 7, 1, 390)
ds_grid_set(coin_spawn_left_list[3], 8, 0, 120)
ds_grid_set(coin_spawn_left_list[3], 8, 1, 420)
ds_grid_set(coin_spawn_left_list[3], 9, 0, 120)
ds_grid_set(coin_spawn_left_list[3], 9, 1, 660)
ds_grid_set(coin_spawn_left_list[3], 10, 0, 120)
ds_grid_set(coin_spawn_left_list[3], 10, 1, 690)
ds_grid_set(coin_spawn_left_list[3], 11, 0, 120)
ds_grid_set(coin_spawn_left_list[3], 11, 1, 720)
ds_grid_set(coin_spawn_left_list[3], 12, 0, 120)
ds_grid_set(coin_spawn_left_list[3], 12, 1, 750)
ds_grid_set(coin_spawn_left_list[3], 13, 0, 120)
ds_grid_set(coin_spawn_left_list[3], 13, 1, 780)
ds_grid_set(coin_spawn_left_list[3], 14, 0, 120)
ds_grid_set(coin_spawn_left_list[3], 14, 1, 810)
ds_grid_set(coin_spawn_left_list[3], 15, 0, 120)
ds_grid_set(coin_spawn_left_list[3], 15, 1, 840)
ds_grid_set(coin_spawn_left_list[3], 16, 0, 120)
ds_grid_set(coin_spawn_left_list[3], 16, 1, 870)
ds_grid_set(coin_spawn_left_list[3], 17, 0, 120)
ds_grid_set(coin_spawn_left_list[3], 17, 1, 900)

ds_grid_set(coin_spawn_right_list[3], 0, 0, 1800)
ds_grid_set(coin_spawn_right_list[3], 0, 1, 180)
ds_grid_set(coin_spawn_right_list[3], 1, 0, 1800)
ds_grid_set(coin_spawn_right_list[3], 1, 1, 210)
ds_grid_set(coin_spawn_right_list[3], 2, 0, 1800)
ds_grid_set(coin_spawn_right_list[3], 2, 1, 240)
ds_grid_set(coin_spawn_right_list[3], 3, 0, 1800)
ds_grid_set(coin_spawn_right_list[3], 3, 1, 270)
ds_grid_set(coin_spawn_right_list[3], 4, 0, 1800)
ds_grid_set(coin_spawn_right_list[3], 4, 1, 300)
ds_grid_set(coin_spawn_right_list[3], 5, 0, 1800)
ds_grid_set(coin_spawn_right_list[3], 5, 1, 330)
ds_grid_set(coin_spawn_right_list[3], 6, 0, 1800)
ds_grid_set(coin_spawn_right_list[3], 6, 1, 360)
ds_grid_set(coin_spawn_right_list[3], 7, 0, 1800)
ds_grid_set(coin_spawn_right_list[3], 7, 1, 390)
ds_grid_set(coin_spawn_right_list[3], 8, 0, 1800)
ds_grid_set(coin_spawn_right_list[3], 8, 1, 420)
ds_grid_set(coin_spawn_right_list[3], 9, 0, 1800)
ds_grid_set(coin_spawn_right_list[3], 9, 1, 660)
ds_grid_set(coin_spawn_right_list[3], 10, 0, 1800)
ds_grid_set(coin_spawn_right_list[3], 10, 1, 690)
ds_grid_set(coin_spawn_right_list[3], 11, 0, 1800)
ds_grid_set(coin_spawn_right_list[3], 11, 1, 720)
ds_grid_set(coin_spawn_right_list[3], 12, 0, 1800)
ds_grid_set(coin_spawn_right_list[3], 12, 1, 750)
ds_grid_set(coin_spawn_right_list[3], 13, 0, 1800)
ds_grid_set(coin_spawn_right_list[3], 13, 1, 780)
ds_grid_set(coin_spawn_right_list[3], 14, 0, 1800)
ds_grid_set(coin_spawn_right_list[3], 14, 1, 810)
ds_grid_set(coin_spawn_right_list[3], 15, 0, 1800)
ds_grid_set(coin_spawn_right_list[3], 15, 1, 840)
ds_grid_set(coin_spawn_right_list[3], 16, 0, 1800)
ds_grid_set(coin_spawn_right_list[3], 16, 1, 870)
ds_grid_set(coin_spawn_right_list[3], 17, 0, 1800)
ds_grid_set(coin_spawn_right_list[3], 17, 1, 900)