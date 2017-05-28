target = argument0;
target.o_health += target.repair_speed;
if (target.o_health > target.max_health) {
   target.o_health = target.max_health;
   return noone;
}
return target;
