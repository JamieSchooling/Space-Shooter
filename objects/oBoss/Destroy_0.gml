if (instance_exists(oEnemySpawner))
{
	with (oEnemySpawner)
	{
		remaining--;
	}
}

instance_destroy(pointer);