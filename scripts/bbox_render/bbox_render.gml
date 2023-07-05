//  @function				bbox_render()
/// @argument				full? {bool}
/// @argument				color? {int:color}
/// @argument				alpha? {real|real[]}
/// @description			Render the rectangular bounding box of the calling instance.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function bbox_render(_full = false, _color = c_aqua, _alpha)
{
	var _alpha_outline, _alpha_full;
	
	if (_alpha == undefined)
	{
		_alpha_outline = 0.9;
		_alpha_full = 0.5;
	}
	else if (is_array(_alpha))
	{
		_alpha_outline = _alpha[0];
		_alpha_full = _alpha[1];
	}
	else
	{
		_alpha_outline = _alpha;
		_alpha_full = _alpha;
	}
	
	var _color_original = draw_get_color();
	var _alpha_original = draw_get_alpha();
	
	draw_set_color(_color);
	draw_set_alpha(_alpha_full);
	
	if (_full)
	{
		draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
	}
	
	draw_set_alpha(_alpha_outline);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
	
	draw_set_color(_color_original);
	draw_set_alpha(_alpha_original);
}
