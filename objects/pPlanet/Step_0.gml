if (place_meeting(x, y, oProjectile))
{
	var _projectileGO = instance_place(x, y, oProjectile);
	instance_destroy(_projectileGO);
}

if (place_meeting(x, y, oEnemyProjectile))
{
	var _enemyProjectileGO = instance_place(x, y, oEnemyProjectile);
	instance_destroy(_enemyProjectileGO);
}

if (place_meeting(x, y, oPlayer))
{
	ScreenShake(4, 0.3);
	var _playerGO = instance_place(x, y, oPlayer);
	var _destroyedPlayerGO = instance_create_layer(_playerGO.x, _playerGO.y, layer, oPlayerDestroyed);
	with (_destroyedPlayerGO) image_angle = _playerGO.image_angle;
	instance_destroy(_playerGO);
}