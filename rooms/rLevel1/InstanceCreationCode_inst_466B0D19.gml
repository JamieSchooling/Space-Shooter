var _planetIconGO = instance_create_layer(x, y, layer, oSunPointer);
target = oSun;

with (_planetIconGO)
{
	image_xscale = 0.05;
	image_yscale = 0.05;
	pointer = other;	
}