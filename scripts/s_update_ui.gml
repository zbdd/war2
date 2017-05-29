char = argument0;

with (global.ui) { instance_destroy(); }
global.ui = instance_create(0,0,o_ui);
if (char == noone || is_undefined(char)) return 0;
else global.ui.char = char;
