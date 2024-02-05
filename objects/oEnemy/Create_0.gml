target = oPlayer;
startCount = false;
count = 0;

planets = [oPlanet1, oPlanet2, oPlanet3, oPlanet4, oPlanet5];
planetTarget = false;

shotCooldown = 3;
shotRange = 50;

if (instance_exists(target))
{
	xTo = target.x;
	yTo = target.y;
}
else if (!planetTarget)
{
	var _closestPlanet = oPlanet1;
	for (var i = 0; i < array_length(planets); i++)
	{
		if (distance_to_object(planets[i]) < distance_to_object(_closestPlanet))
		{
			_closestPlanet = planets[i];
		}
	}
	planetTarget = true;
	xTo = _closestPlanet.x;
	yTo = _closestPlanet.y;
}