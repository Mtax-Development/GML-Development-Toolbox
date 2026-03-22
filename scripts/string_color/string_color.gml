//  @function				string_color()
/// @argument				color? {int:color}
/// @argument				useHSV? {bool}
/// @returns				{string}
/// @description			Return the string representation of the specified color value. If it
///							equals one of the built-in color constants, its name will be returned,
///							except for the Silver constant, as it refers the same color as Light Gray.
///							Otherwise, the values measuring its red, green and blue components will be
///							used, unless specified to instead represent it with hue, saturation and
///							value components.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function string_color(_color, _useHSV = false)
{
	var _string = "";
	
	if (is_real(_color))
	{
		switch (_color)
		{
			case c_aqua: _string = "Aqua"; break;
			case c_black: _string = "Black"; break;
			case c_blue: _string = "Blue"; break;
			case c_dkgray: _string = "Dark Gray"; break;
			case c_fuchsia: _string = "Fuchsia"; break;
			case c_gray: _string = "Gray"; break;
			case c_green: _string = "Green"; break;
			case c_lime: _string = "Lime"; break;
			case c_ltgray: _string = "Light Gray"; break;
			case c_maroon: _string = "Maroon"; break;
			case c_navy: _string = "Navy"; break;
			case c_olive: _string = "Olive"; break;
			case c_orange: _string = "Orange"; break;
			case c_purple: _string = "Purple"; break;
			case c_red: _string = "Red"; break;
			case c_teal: _string = "Teal"; break;
			case c_white: _string = "White"; break;
			case c_yellow: _string = "Yellow"; break;
			default:
				var _mark_separator = ", ";
				
				if (_useHSV)
				{
					_string =
					("(" +
						"Hue: " + string(color_get_hue(_color)) + _mark_separator +
						"Saturation: " + string(color_get_saturation(_color)) + _mark_separator +
						"Value: " + string(color_get_value(_color)) +
					 ")");
				}
				else
				{
					_string =
					("(" +
						"Red: " + string(color_get_red(_color)) + _mark_separator +
						"Green: " + string(color_get_green(_color)) + _mark_separator +
						"Blue: " + string(color_get_blue(_color)) +
					 ")");
				}
			break;
		}
	}
	else
	{
		_string = string(_color);
	}
	
	return _string;
}
