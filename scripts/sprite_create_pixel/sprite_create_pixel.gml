//  @function				sprite_create_pixel()
/// @returns				{int:sprite}
/// @description			Create smallest possible sprite on a separate texture page.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function sprite_create_pixel()
{
	var _surface = surface_create(1, 1);
	
	surface_set_target(_surface);
	{
		draw_clear(c_white);
	}
	surface_reset_target();
	
	var _sprite = sprite_create_from_surface(_surface, 0, 0, 1, 1, false, false, 0, 0);
	surface_free(_surface);
	
	return _sprite;
}
