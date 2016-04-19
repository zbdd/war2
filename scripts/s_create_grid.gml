cell_width = 16;
cell_height = 16;

var grid = mp_grid_create(0,0, room_width/cell_width, room_height/cell_height, cell_width, cell_height);

mp_grid_add_instances(grid, o_b_building, true);

return grid;
