//  @function				pencil()
/// @argument				color {int:color}
/// @description			Operate freehand drawing of debug lines with single pixel width and the
///							specified color, then render them to current Surface, based on following
///							cursor input:
///							- Left cursor button: Press and release to create a single point, hold and
///												  move the cursor to create a line.
///							- Middle cursor button: Input twice in quick succession to clear rendering
///													information.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function pencil(_color = c_white)
{
	static _point = [];
	static _time_input_clear = (-601);
	var _input_createPoint = mb_left;
	var _input_clear = mb_middle;
	
	if (mouse_check_button_released(_input_clear))
	{
		if ((current_time - _time_input_clear) <= 600)
		{
			array_resize(_point, 0);
			_time_input_clear = (-601);
		}
		else
		{
			_time_input_clear = current_time;
		}
	}
	else if (mouse_check_button(_input_createPoint))
	{
		if (mouse_check_button_pressed(_input_createPoint))
		{
			array_push(_point, []);	
		}
		
		if ((window_mouse_get_delta_x() == 0) and (window_mouse_get_delta_y() == 0))
		{
			array_push(array_last(_point), [(mouse_x - 0.5), (mouse_y - 0.5), _color]);
		}
		
		array_push(array_last(_point), [mouse_x, mouse_y, _color]);
	}
	
	var _i = [0, 0];
	repeat (array_length(_point))
	{
		var _point_connected_current = _point[_i[0]];
		var _point_connected_count = array_length(_point_connected_current);
		var _point_reachedVertexLimit = false;
		_i[1] = 0;
		repeat ((_point_connected_count div 1000) + 1)
		{
			draw_primitive_begin(pr_linestrip);
			{
				if (_point_reachedVertexLimit)
				{
					draw_vertex_color(_point_current[0], _point_current[1], _point_current[2], 1);
				}
				
				repeat (min((_point_connected_count - _i[1]), 1000))
				{
					var _point_current = _point_connected_current[_i[1]];
					
					draw_vertex_color(_point_current[0], _point_current[1], _point_current[2], 1);
					
					++_i[1];
				}
				
				_point_reachedVertexLimit = true;
			}
			draw_primitive_end();
		}
		
		++_i[0];
	}
}
