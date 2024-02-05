if (global.gamePaused)
{
	keyUp = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	keyDown = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	pauseOptionSelected += (keyDown - keyUp);
	var _max = array_length(pauseOption) - 1;
	var _min = 0;
	if (pauseOptionSelected > _max) pauseOptionSelected = _min;
	if (pauseOptionSelected < _min) pauseOptionSelected = _max;
	
	keyActivate = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
	if (keyActivate)
	{
		switch (pauseOptionSelected)
		{
			case 0:
			{
				global.gamePaused = false;
				with (oEnemy)
				{
					speed = oEnemySpawner.waveSpeed;
				}
			}break;
			case 1:
			{
				game_end();
			}break;
		}
	}
}