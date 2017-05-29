// God forgive me for my sins.
var go_to = argument0
var mover = argument1
var grid = argument2;
var path = path_add();
var attempt = 0;
var radius = 4
var force_break = 16;
var default_goto = instance_create(go_to.x + go_to.sprite_width/2, go_to.y + go_to.sprite_height/2, o_waypoint);
go_to = default_goto;
var closer = 0;

do {
    var tmp_waypoint = ds_list_create()
    var s_width = 0;
    var s_height = 0;
    var wd = 0;
    var ht = 0;

    for(var ida = 0; ida < 361; ida+=40) {
        cx = go_to.x + (attempt * 6) * cos(ida * pi / 180);
        cy = go_to.y + (attempt * 6) * sin(ida * pi / 180);
        var waypoint = instance_create(cx,cy,o_waypoint);
        waypoint.parent = go_to;
        ds_list_add(tmp_waypoint, waypoint)
    }
    
    closer = 0;
    with (tmp_waypoint[| 0]) {
         closer = distance_to_object(mover);
    }
    
    for(var idw = 1; idw < ds_list_size(tmp_waypoint); idw++) {
        with (tmp_waypoint[| 0]) { 
             closer = distance_to_object(mover);     
        };
        with (tmp_waypoint[| idw]) {
            if(distance_to_object(mover) < closer) {
                for(var idy = idw; idy != 0; idy--) {
                    tmp_waypoint[| idy] = tmp_waypoint[| idy-1];
                }
                tmp_waypoint[| 0] = instance_copy(false);
                
            }
        }
    }

    for(var idw = 0; idw < ds_list_size(tmp_waypoint); idw++) {
        go_to = tmp_waypoint[| idw];
        if (instance_exists(go_to)) {
            if (mp_grid_path(grid, path, mover.x, mover.y, go_to.x, go_to.y, true)) {
                with (tmp_waypoint[| idw]) { go_to = instance_copy(false) };
                return go_to
            }
        }
    }
    ds_list_destroy(tmp_waypoint)
    go_to = default_goto;
    attempt++;
    if (attempt > force_break) {
      return noone
    }
} until (mp_grid_path(grid, path, mover.x, mover.y, go_to.x, go_to.y, true))
return go_to
