cx = argument0;
cy = argument1;

if (collision_circle(cx,cy,16,o_b_building,false,true) == noone
   && collision_circle(cx,cy,16,o_b_creep,false,true) == noone)
   return false;
return true;
