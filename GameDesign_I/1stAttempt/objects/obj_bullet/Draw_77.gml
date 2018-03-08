if (place_meeting(x,y,obj_wall))
{
	instance_destroy();
}
if (place_meeting(x,y,obj_wall_grass))
{
	instance_destroy();
}
/*
	tempvarX = sign(x);
	tempvarX = tempvarX * 10;

	tempvarY = sign(y);
	tempvarY = tempvarY * 10;
*/

if (place_meeting(x,y,obj_player_1))
{
	with (obj_player_1)
		{
		hp--;
		}
	instance_destroy()
}
if (place_meeting(x,y,obj_player_2))
{
	with (obj_player_2)
		{
		hp--;
		}
	instance_destroy()	
}
	
/*
if (place_meeting(x,y,obj_bullet))
{
	instance_destroy();
}
*/