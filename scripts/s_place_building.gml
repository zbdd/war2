building = argument[0];

switch building {
   case "farm":
      o_mouse.sprite_index = spr_farm;
      o_mouse.next_state = "build";
      break;
}
