if (!global.gamePaused)
{
	if (instance_exists(target))
	{
		xTo = target.x;
		yTo = target.y;
	}
	else
	{
		instance_destroy(pointer);
		instance_destroy();
	}

	direction = point_direction(x, y, xTo, yTo);
	image_angle = direction;

	if (place_meeting(x, y, oProjectile))
	{
		var _projectileGO = instance_place(x, y, oProjectile);
		instance_destroy(_projectileGO);
		if (bossHealth - 10 > 0) bossHealth -= 10;
		else bossHealth = 0;
		
		show_debug_message(bossHealth);
	}

	if (bossHealth = 0)
	{
		ScreenShake(4, 0.3);
		var _destroyedEnemyGO = instance_create_layer(x, y, layer, oBossDestroyed);
		with (_destroyedEnemyGO) image_angle = other.image_angle;
		instance_destroy();
	}

	var _distanceToPlayer = distance_to_object(oPlayer);
	if (_distanceToPlayer < shotRange)
	{
		startCount = true;
		if ((count / 60) > shotCooldown)
		{
			var _projectileGO = instance_create_layer(x, y, layer, oEnemyProjectile);
			with (_projectileGO)
			{
				image_index = 1;
				direction = point_direction(x, y, oPlayer.x, oPlayer.y);
				image_angle = direction;
				speed = 6;
			}
			count = 0;
		}
	}

	if (startCount) count++;


	var _pointerSize = 1.25 - (_distanceToPlayer / 1000);
	_pointerSize = clamp(_pointerSize, 0.5, 1);

	with (pointer)
	{
		image_xscale = _pointerSize;
		image_yscale = _pointerSize;
	}
}