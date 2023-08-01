//  @function				is_ipv4_address()
/// @argument				string {string}
/// @returns				{bool}
/// @description			Check if the specified string is an Internet Protocol version 4 address.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function is_ipv4_address(_string)
{
	if (!is_string(_string))
	{
		return false;
	}
	
	if (_string == "localhost")
	{
		return true;
	}
	
	var _segment_count = 4;
	var _separator = ".";
	var _separator_count = (_segment_count - 1);
	
	if (string_count(_separator, _string) != _separator_count)
	{
		return false;
	}
	
	var _position_separator = 0;
	var _i = 0;
	repeat (_segment_count)
	{
		var _position_segment_start = (_position_separator + 1);
		var _position_separator_next = ((_i == _separator_count)
										? (string_length(_string) + 1)
										: string_pos_ext(_separator, _string, _position_separator));
		var _segment_length = (_position_separator_next - _position_segment_start);
		
		if (_segment_length != clamp(_segment_length, 1, 3))
		{
			return false;
		}
		
		var _segment = string_copy(_string, _position_segment_start, _segment_length);
		
		if (string_digits(_segment) != _segment)
		{
			return false;
		}
		
		var _segment_number = real(_segment);
		
		if (_segment_number != clamp(_segment_number, 0, 255))
		{
			return false;
		}
		
		_position_separator = _position_separator_next;
		
		++_i;
	}
	
	return true;
}
