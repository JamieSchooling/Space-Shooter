enum spawner
{
	WAVE = 0,
	TYPE = 1,
	SPAWN = 2,
	DELAY = 3
}

planets = [oPlanet1, oPlanet2, oPlanet3, oPlanet4, oPlanet5];

bossWave = false;
bossWaveHealth = 0;

bossWaveInterval = 5;

wave = false;
currentWave = 0;

enemiesInWave = 10;
enemyMultiplier = 1.3;

waveSpeed = 1.5;
speedMultiplier = 1.1;

waveShotCooldown = 2;
shotCooldownMultiplier = 1.05;

waveShotRange = 80;
shotRangeMultiplier = 1.1;

remaining = 0;
total = 0;

playerDead = false;