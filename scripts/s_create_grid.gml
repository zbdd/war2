cell_width = 16;
cell_height = 16;

var grid = mp_grid_create(0,0, room_width/cell_width, room_height/cell_height, cell_width, cell_height);

for (var i=0; i < instance_number(o_b_building); i++) {
    var inst = instance_find(o_b_building, i);
    if (inst != noone) {
       if (! inst.passable) mp_grid_add_instances(grid, inst, true);
    }
}

return grid;
