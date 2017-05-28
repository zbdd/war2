// Messy, but means each char using this script won't write over another's waypoint.
miner = argument0;
ds_map_add(global.waypoints, string(miner), noone);
ds_map_add(global.waypoints_dist, string(miner), 2000);
var closest = noone;

for(var dx=0; dx < instance_number(o_tree); dx++) {
    var object = instance_find(o_tree,dx);
    if (object.available == true) ds_list_add(todo, object);
}
if (ds_list_size(todo) > 0) {
   ds_map_add(global.waypoints, string(miner), todo[| 0]);
   with (miner) { global.waypoints_dist[? string(miner)] = distance_to_object(global.waypoints[? string(miner)]) }
   for(var dx=1; dx < ds_list_size(todo); dx++) {
      with(todo[| dx]) {
         if (distance_to_object(other) < global.waypoints_dist[? string(other.miner)]) { 
            global.waypoints[? string(other.miner)] = self;
            global.waypoints_dist[? string(other.miner)] = distance_to_object(other);
         }
            
      }
   }
}
closest = global.waypoints[? string(miner)];

return closest;
