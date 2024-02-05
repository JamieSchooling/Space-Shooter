if (!global.gamePaused)
{
	// Input
	keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
	keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
	keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"));
	keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));
	keyFire = mouse_check_button_pressed(mb_left);

	// Movement
	inputDirection = point_direction(0, 0, keyRight - keyLeft, keyDown - keyUp);
	inputMagnitude = (keyRight - keyLeft !=0) || (keyDown - keyUp != 0);

	hsp = lengthdir_x(inputMagnitude * moveSpeed, inputDirection);
	vsp = lengthdir_y(inputMagnitude * moveSpeed, inputDirection);

	if (keyUp) image_angle = 90;
	if (keyRight) image_angle = 0;
	if (keyDown) image_angle = 270;
	if (keyLeft) image_angle = 180;

	if (keyUp && keyRight) image_angle = 45;
	if (keyRight && keyDown) image_angle = 315;
	if (keyDown && keyLeft) image_angle = 225;
	if (keyLeft && keyUp) image_angle = 135;

	x += hsp;
	y += vsp;


	// Shooting
	if (keyFire)
	{
		var _projectileGO = instance_create_layer(x, y, layer, oProjectile);
		with (_projectileGO)
		{
			direction = point_direction(x, y, mouse_x, mouse_y);
			image_angle = direction;
			speed = 6;
		}
	}

	if (place_meeting(x, y, oEnemyProjectile))
	{
		ScreenShake(4, 0.3);
		var _projectileGO = instance_place(x, y, oEnemyProjectile);
		var _destroyedPlayerGO = instance_create_layer(x, y, layer, oPlayerDestroyed);
		with (_destroyedPlayerGO) image_angle = image_angle;
		instance_destroy(_projectileGO);
		instance_destroy();
	}

	if (place_meeting(x, y, oEnemy))
	{
		ScreenShake(4, 0.3);
		var _enemyGO = instance_place(x, y, oEnemy);
		var _destroyedEnemyGO = instance_create_layer(_enemyGO.x, _enemyGO.y, layer, oEnemyDestroyed);
		with (_destroyedEnemyGO) image_angle = _enemyGO.image_angle;
		var _destroyedPlayerGO = instance_create_layer(x, y, layer, oPlayerDestroyed);
		with (_destroyedPlayerGO) image_angle = image_angle;
		instance_destroy(_enemyGO);
		instance_destroy();
	}
}


	x = min(x, room_width);
	y = min(y, room_height);
	x = max(x, 0);
	y = max(y, 0);