

//get player input
/*
key_left = keyboard_check_direct(vk_left);
key_right = keyboard_check_direct(vk_right);
key_jump = keyboard_check_pressed(vk_up);
*/

key_jump = keyboard_check(vk_up);
key_left = keyboard_check(vk_left);
key_down = 0;// keyboard_check(vk_down);
key_right = keyboard_check(vk_right);
key_attack = keyboard_check(vk_rshift);

angle = 90

// calculate movement
var move = key_right - key_left;

hsp = move * walk_sp;

vsp = vsp + grv;

if(key_left)
{
	angle = 180;
}
if(key_right)
{
	angle = 0;
}
if(key_down)
{
	angle = 270;
}

//make jump
if (place_meeting(x,y+1,obj_wall)) && (key_jump) 
	{
		vsp = jumpval;
	}
	
	
//horisontal collision
if (place_meeting(x+hsp,y,obj_wall))
	{
		while (!place_meeting(x+sign(hsp),y,obj_wall))
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	
//vertical collision
if (place_meeting(x,y+vsp,obj_wall))
	{
		while (!place_meeting(x,y+sign(vsp),obj_wall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
//class
//make jump
if (place_meeting(x,y+1,obj_glass)) && (key_jump) 
	{
		vsp = jumpval;
	}
	
	
//horisontal collision
if (place_meeting(x+hsp,y,obj_glass))
	{
		while (!place_meeting(x+sign(hsp),y,obj_glass)) 
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	
//vertical collision
if (place_meeting(x,y+vsp,obj_glass))
	{
		while (!place_meeting(x,y+sign(vsp),obj_glass))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	

//move player
x = x + hsp;
y = y + vsp;



//Animation
if (hsp != 0) // checks what direction the player is moving
{	
	image_xscale = sign(hsp);
}

if(!place_meeting(x,y+1,obj_wall))
	{
		//sprite_index - spr_playerairborn;
		//image_speed = 0;
		if (sign(vsp) > 0)
			{
				//sprite_index - spr_playerfalling	
			}
	}
	

	if(hsp == 0)
	{
		sprite_index = spr_player_2;
	}
	else
	{
		sprite_index = spr_player_2_running;
	}


if (hp <= 0)
{
	
	game_restart()
}

