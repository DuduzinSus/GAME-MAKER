#region CONTROLS

left = keyboard_check(ord("A"))
right = keyboard_check(ord("D"))
jump = keyboard_check(vk_space)

#endregion

#region MOTION

var move = right - left;

hspd = move * spd;
vspd = grv + vspd;

//COLISION HORIZONTAL

if place_meeting(x+hspd,y,obj_wall){
	while (!place_meeting(x+sign(hspd),y,obj_wall)){
		x = x + sign(hspd)
	}
	hspd = 0; 
}
x = x + hspd;

//COLISION VERTICAL

if place_meeting(x,y+vspd,obj_wall){
	while (!place_meeting(x,y+sign(vspd),obj_wall)){
		y = y + sign(vspd)
	}
	vspd = 0; 
}
y = y + vspd;

//JUMP

if place_meeting(x,y+1,obj_wall) and jump{
	vspd-=8;
}

#endregion

#region ANIMATION

if (hspd!=0) image_xscale = sign(hspd);

if(!place_meeting(x,y+1,obj_wall))
{
	sprite_index=spr_player_jump;
	if(sign(vspd) > 0.5) sprite_index = spr_player_fall; else sprite_index = spr_player_jump;
	
}
else
{
	if(hspd != 0)
	{
		sprite_index = spr_player_walk;
	}
}
if hspd = 0 {
	if place_meeting(x,y+1,obj_wall) {
		
		sprite_index = spr_player_idle;
}
}

if hspd != 0 {
	if place_meeting(x,y+1,obj_wall){
		sprite_index=spr_player_walk;
	}
}

#endregion