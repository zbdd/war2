toselect = argument0;
found = false;
for (var dx=0; dx < ds_list_size(global.selected); dx++) {
    if (toselect.instance_id == global.selected[| dx].instance_id) found = true;
}
if (!found) ds_list_add(global.selected, toselect);
