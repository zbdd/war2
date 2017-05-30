cell_width = 16;
cell_height = 16;
exclude = argument0;

var grid = s_create_grid();
/*for (var i=0; i < instance_number(o_b_creep); i++) {
    var inst = instance_find(o_b_creep, i);
    if (inst != noone) {
       if (inst.id != exclude.id)
          mp_grid_add_instances(grid, inst, true);
    }
}*/

return grid;
