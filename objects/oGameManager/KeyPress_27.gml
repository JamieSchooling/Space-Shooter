if (!global.gamePaused) 
{
	show_debug_message("paused")
	global.gamePaused = true;
	with (oEnemy)
	{
		speed = 0;
	}
}
else if (global.gamePaused) 
{
	show_debug_message("paused n'more")
	global.gamePaused = false;
	with (oEnemy)
	{
		speed = oEnemySpawner.waveSpeed;
	}
}