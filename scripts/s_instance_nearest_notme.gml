//instance_nearest_notme(x, y, obj)
// by subjectgames
// fromhttps://www.reddit.com/r/gamemaker/comments/3cp721/how_to_make_instance_nearest_not_check_for_own/
{
var xx, yy, obj, nearest;
xx = argument[0];
yy = argument[1];
obj = argument[2];
nearest = noone;
dist = -1;
for (ii=0; ii<instance_number(obj); ii+=1) {
    var o, d;
    o = instance_find(obj, ii);
    d = point_distance(xx, yy, o.x, o.y);
    if (o != id) { if (nearest == noone || d < dist) { nearest = o; dist = d; } }
    }
return nearest;
}
