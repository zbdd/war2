miner = argument0;
distance = -1;
closest = noone;

for(var dx=0; dx < instance_number(o_tree); dx++) {
    var object = instance_find(o_tree,dx);
    if (object.available == true) ds_list_add(todo, object);
}
if (ds_list_size(todo) > 0) {
   closest = todo[| 0];
   distance = distance_to_object(closest);
   
   for(var dx=1; dx < ds_list_size(todo); dx++) {
      with(todo[| dx]) {
         if (distance_to_object(miner) < miner.distance) 
            other.closest = self;
      }
   }
}
return closest;
