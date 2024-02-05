// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function ScreenShake(magnitude, duration){
	with (oCamera)
	{
		duration = duration * 60;
	
		if (magnitude > shakeRemain)
		{
			shakeMagnitude = magnitude;
			shakeRemain = shakeMagnitude;
			shakeLength = duration;
		}
	}
}