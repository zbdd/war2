selected = ds_list_create();
for (var dx = 0; dx < instance_count; dx++) {
    if (object_is_ancestor(instance_id[dx].object_index, o_b_creep)) {
       if (instance_id[dx].is_selected == true) {
          ds_list_add(selected, instance_id[dx]);
       }
    }
}
return selected;
