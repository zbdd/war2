list = argument0;
for (var dx=0; dx < ds_list_size(list); dx++) {
   with (list[| dx]) { instance_destroy(); }
}
ds_list_destroy(list);
