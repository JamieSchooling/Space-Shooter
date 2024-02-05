if (!global.gamePaused) && (!playerDead)
{
	if (!wave)
	{
		wave = true;
		currentWave++;
		
		if (currentWave % bossWaveInterval == 0) bossWave = true;
		
		if (!bossWave) || (currentWave > 10)
		{
			for (var i = 0; i < enemiesInWave; i++)
			{
				var _randIndex = irandom(4);
				var _spawnX = oPlayer.x + random_range(-500, 500);
				_spawnX += sign(_spawnX) * 800;
				var _spawnY = oPlayer.y - random_range(-500, 500);
				_spawnY += sign(_spawnY) * 800;
				var _enemyGO = instance_create_layer(_spawnX, _spawnY, "Enemy", oEnemy);
				with (_enemyGO)
				{
					speed = other.waveSpeed;
					var _pointerGO = instance_create_layer(xTo, yTo, "Enemy", oPointer);
					with (_pointerGO)
					{
						target = _enemyGO;
					}
			
					pointer = _pointerGO;
				}
				remaining++;
			}
			total = remaining;
		}
		global.currentWave = currentWave;
	}
	if (bossWave)
	{
		bossWaveHealth += 50;
		bossWave = false;
		var _closestPlanet = planets[0];
		with (oPlayer)
		{
			for (i = 0; i < array_length(other.planets); i++;)
			{
				if (distance_to_object(other.planets[i]) < distance_to_object(_closestPlanet))
				{
					_closestPlanet = other.planets[i];
				}
			}
		}
		var _spawnX = _closestPlanet.x + random_range(-90, 90);
		var _spawnY = _closestPlanet.y - random_range(150, 200);
		var _bossGO = instance_create_layer(_spawnX, _spawnY, "Enemy", oBoss);
		with (_bossGO)
			{
				bossHealth = other.bossWaveHealth;
				show_debug_message(bossHealth);
				speed = other.waveSpeed;
				var _pointerGO = instance_create_layer(xTo, yTo, "Enemy", oBossPointer);
				with (_pointerGO)
				{
					target = _bossGO;
				}
			
				pointer = _pointerGO;
			}
			remaining++;
			total = remaining;
	}

	if (remaining <= 0)
	{
		enemiesInWave = floor(enemiesInWave * enemyMultiplier);
		waveSpeed = waveSpeed * speedMultiplier;
		waveShotCooldown = round((waveShotCooldown / shotCooldownMultiplier) * 10) / 10;
		waveShotRange = waveShotRange * shotRangeMultiplier;
	
		wave = false;
		bossWave = false;
	}
}
