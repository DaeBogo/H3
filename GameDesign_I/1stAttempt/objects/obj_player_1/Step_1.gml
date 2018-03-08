

fireingdelay = fireingdelay -1;

if (key_attack) && (fireingdelay <0)
{
	tempvarX = sign(hsp);
	tempvarX = x + tempvarX * 15;

	tempvarY = sign(vsp);
	tempvarY = y + 20; //tempvarY * 25;

	fireingdelay = 15;
	with (instance_create_layer(tempvarX,y,"bullets", obj_bullet))
	{
		speed = 15;
		direction = other.angle;
		image_angle = direction;
	}
}