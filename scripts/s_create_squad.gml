base_x = argument0;
base_y = argument1;
type = argument2;
size = argument3;
randomize();
do {
      squad_id = irandom(100000);
} until (! ds_list_find_index(global.squads, squad_id));

var squad = ds_list_create();

for (var i = 0; i < size; i++) {
    var squadie = instance_create(0, 0, type);
    
    x = base_x - squadie.sprite_width/2;
    y = base_y - squadie.sprite_height/2;
    
    squadie.x = x + irandom(squadie.sprite_width * 3);
    squadie.y = y + irandom(squadie.sprite_height * 3);
    
    
    if (i == 0) {
       squadie.is_leader = true;
       squadie.x = base_x;
       squadie.y = base_y;
    }
    squadie.squad_id = squad_id;
    ds_list_add(squad, squadie);
}
ds_list_add(global.squads, squad);
