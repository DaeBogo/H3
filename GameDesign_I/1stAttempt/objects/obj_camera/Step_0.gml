// cam steps


//update destination
if(instance_exists(follow))
{
		xTo = follow.x;
		yTo = follow.y;
}

//update object pos

x += (xTo - x) / 25;
y += (yTo - y) / 25;



// update cam view
camera_set_view_pos(cam,x-view_h_half,y-view_h_half)
