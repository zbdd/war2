target = argument0;
if (object_get_name(target.object_index) != "o_waypoint") {
   target = instance_create(target.x + target.sprite_width/2, target.y + target.sprite_height/2, o_waypoint);
}
return target;
