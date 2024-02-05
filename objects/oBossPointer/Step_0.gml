
if (instance_exists(target))
{
	image_angle = point_direction(x, y, target.x, target.y);
	if (!global.gamePaused) 
	{
		move_towards_point(target.x, target.y, 25);

		x = clamp(x, camera_get_view_x(cam) + 25, camera_get_view_x(cam) + camera_get_view_width(cam) - 25);
		y = clamp(y, camera_get_view_y(cam) + 25, camera_get_view_y(cam) + camera_get_view_height(cam) - 25);
		
		currentX = x;
		currentY = y;
	}
	else
	{
		x = currentX;
		y = currentY;
	}
	
	if (target.x > camera_get_view_x(cam) && target.x < camera_get_view_x(cam) + camera_get_view_width(cam))
	{
		if (target.y > camera_get_view_y(cam) && target.y < camera_get_view_y(cam) + camera_get_view_height(cam))
		{
			visible = false;
		}
		else
		{
			visible = true;
		}
	}
	else
	{
		visible = true;
	}
}
else
{
	visible = true;
}