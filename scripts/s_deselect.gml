todeselect = argument0;
for (var dx=0; dx < ds_list_size(global.selected); dx++) {
    var inst = global.selected[| dx];
    if (inst.instance_id == todeselect.instance_id) ds_list_delete(global.selected, dx);
}
if (ds_list_size(global.selected) < 1) with (global.ui) { instance_destroy(); }
