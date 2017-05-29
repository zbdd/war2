char = argument0;

with (global.ui) { instance_destroy(); }
if (char == noone) return 0;

global.ui = noone;
global.ui = instance_create(0,0,o_ui);
global.ui.char = char;
