go_to = argument0
mover = argument1
grid = argument2;
var path = path_add();
var attempt = 0;
var radius = 4
var force_break = 16;

do {
    tmp_waypoint = ds_list_create()
    var inst = instance_position(go_to.x, go_to.y, o_b_building);
    var s_width = 0;
    var s_height = 0;
    var wd = 0;
    var ht = 0;
 

    for(ida = 0; ida < 361; ida+=10) {
        cx = go_to.x + (attempt * 16) * cos(ida * pi / 180);
        cy = go_to.y + (attempt * 16) * sin(ida * pi / 180);
        var waypoint = instance_create(cx,cy,o_waypoint);
        waypoint.parent = go_to;
        ds_list_add(tmp_waypoint, waypoint)
    }
    
    // sort, closest to furthest
    /*for(idw = 0; idw < ds_list_size(tmp_waypoint); idw++) {
        show_debug_message("BEFORE:" + string(distance_to_object(tmp_waypoint[| idw])));
    }*/
    
    closer = 0;
    with (tmp_waypoint[| 0]) {
         other.closer = distance_to_object(other.mover);
    }
    
    //show_debug_message("before: " + string(closer));
    
    for(idw = 1; idw < ds_list_size(tmp_waypoint); idw++) {
        with (tmp_waypoint[| 0]) { 
             other.closer = distance_to_object(other.mover);     
        };
        with (tmp_waypoint[| idw]) {
            if(distance_to_object(other.mover) < other.closer) {
                //show_debug_message("Swapping...");
                for(idy = other.idw; idy != 0; idy--) {
                    other.tmp_waypoint[| idy] = other.tmp_waypoint[| idy-1];
                }
                other.tmp_waypoint[| 0] = instance_copy(false);
                
            }
        }
    }
    /*for(idw = 0; idw < ds_list_size(tmp_waypoint); idw++) {
        show_debug_message("AFTER:" + string(distance_to_object(tmp_waypoint[| idw])));
    }*/
    //show_debug_message("after: " + string(closer));

    for(idw = 0; idw < ds_list_size(tmp_waypoint); idw++) {
        go_to = tmp_waypoint[| idw];
        if (instance_exists(go_to)) {
            if (mp_grid_path(grid, path, mover.x, mover.y, go_to.x, go_to.y, true)) {
                with (tmp_waypoint[| idw]) { other.go_to = instance_copy(false) };
                //ds_list_destroy(tmp_waypoint);
                //show_debug_message("EXIT POINT 1");
                return go_to
            }
            //else with (tmp_waypoint[| idw]) instance_destroy() // release
        }
    }
    //ds_list_destroy(tmp_waypoint)
    go_to = argument0
    attempt++;
    if (attempt > force_break) {
    // show_debug_message("EXIT POINT 2");
      return noone
    }
} until (mp_grid_path(grid, path, mover.x, mover.y, go_to.x, go_to.y, true))
//show_debug_message("EXIT POINT 3");
return go_to
