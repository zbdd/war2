var obj = argument0;
var peon = argument1;
var cy =0;
var cx =0;
var attempt = 0;
var tmp_waypoint = ds_list_create();
var spot = noone;
var waypoint = noone;
var cleanup = ds_list_create();

do {
   for(var ida = 0; ida < 361; ida+=10) {
      cx = (obj.x + obj.sprite_width/2) + (attempt * 10) * cos(ida * pi / 180);
      cy = (obj.y + obj.sprite_height/2) + (attempt * 10) * sin(ida * pi / 180);
      waypoint = instance_create(cx,cy,o_waypoint);
      ds_list_add(cleanup, waypoint)
      with (waypoint) {
          if(collision_circle(cx,cy,32,o_b_building,false,true) == noone
             && collision_circle(cx,cy,32,o_b_creep,false,true) == noone) {
             ds_list_add(tmp_waypoint, waypoint)
          }
      }
   }
   attempt++;
   if (attempt > 20) break;
} until(ds_list_size(tmp_waypoint) > 0);
if (ds_list_size(tmp_waypoint) > 0) {
   spot = tmp_waypoint[| random(ds_list_size(tmp_waypoint)-1)];
   spot = instance_create(spot.x, spot.y, o_waypoint);
}
s_destroy_list(tmp_waypoint);
s_destroy_list(cleanup);
return spot;

