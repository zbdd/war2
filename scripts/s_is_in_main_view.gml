xx = window_view_mouse_get_x(1);
yy = window_view_mouse_get_y(1);
if(xx >= 0 && xx <= view_wview[0] && yy >= 0 && yy <= view_hview[0]) return true
return false;
