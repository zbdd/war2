// God forgive me for my sins.
var go_to = argument0;
var mover = argument1
var grid = argument2;
var path = path_add();
var attempt = 0;
var radius = 4
var force_break = 16;
go_to = instance_create(go_to.x, go_to.y, o_waypoint);
var default_goto = go_to;
var store = noone;
var cleanup = ds_list_create();
ds_list_add(cleanup, go_to);
var closer = 10000;

do {
   // Reset.
    go_to = default_goto;
    var tmp_waypoint = ds_list_create()
    var s_width = 0;
    var s_height = 0;
    var wd = 0;
    var ht = 0;

    for(var ida = 0; ida < 361; ida+=40) {
        cx = go_to.x + (attempt * 10) * cos(ida * pi / 180);
        cy = go_to.y + (attempt * 10) * sin(ida * pi / 180);
        var waypoint = instance_create(cx,cy,o_waypoint);
        ds_list_add(cleanup, waypoint);
        waypoint.parent = go_to;
        ds_list_add(tmp_waypoint, waypoint)
    }

    // Sorting.
    for(var idx = 0; idx < ds_list_size(tmp_waypoint); idx++) {
       var to_move = idx;
       with (tmp_waypoint[| idx]) { closer = distance_to_object(mover); }
       for (var idy = idx; idy < ds_list_size(tmp_waypoint); idy++) { 
          with (tmp_waypoint[| idy]) { if (distance_to_object(mover) < closer) { to_move = idy; closer = distance_to_object(mover); } }
       }
       if (to_move != idx) { hold = tmp_waypoint[| idx]; ds_list_replace(tmp_waypoint, idx, tmp_waypoint[| to_move]); ds_list_replace(tmp_waypoint,to_move,hold); } //ds_list_delete(tmp_waypoint, to_move+1)
    }
    
    // Find shortest valid path and store it. If already stored, break loop. (Helps with precise collision detection)
    for(var idw = 0; idw < ds_list_size(tmp_waypoint); idw++) {
        endpoint = tmp_waypoint[| idw];
        if (mp_grid_path(grid, path, mover.x, mover.y, endpoint.x, endpoint.y, true)) {
            if (!store) store = instance_create(endpoint.x, endpoint.y, o_waypoint);
            else { go_to = instance_create(endpoint.x, endpoint.y, o_waypoint); attempt = force_break;}
           break;
        }
    }

    // Use store if no valid path found.
    if (!go_to && store) { go_to = store; attempt = force_break; }
    attempt++;  
} until (attempt > force_break)
s_destroy_list(cleanup);
s_destroy_list(tmp_waypoint);
return go_to
