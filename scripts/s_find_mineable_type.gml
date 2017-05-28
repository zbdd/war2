// Messy, but means each char using this script won't write over another's waypoint.
var miner = argument0;
var type = argument1;
var waypoint = noone;
var distance = 10000;
var todo = ds_list_create();
var closest = noone;

for(var dx=0; dx < instance_number(o_b_resource); dx++) {
    var object = instance_find(o_b_resource,dx);
    if (object.type == type && object.available == true) ds_list_add(todo, object);
}
if (ds_list_size(todo) > 0) {
   for(var dx=0; dx < ds_list_size(todo); dx++) {
      with(todo[| dx]) {
         if (distance_to_object(miner) < distance) { 
            closest = self;
            distance = distance_to_object(miner);
         }
            
      }
   }
}
ds_list_destroy(todo);
return closest;
