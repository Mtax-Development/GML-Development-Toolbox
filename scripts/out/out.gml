/// @function				out()
/// @argument				{any:string} value...
/// @returns				{string}
/// @description			Write the specified values in a string to the standard console output.
///							The string will be formatted to contain the information about its call.
///							The specified values will be stringified and separated by a comma, unless
///							a value was already a string ending with a colon and a space.
/// @author					Mtax (github.com/Mtax-Development)
function out()
{
	var _callerName;
	
	if (is_struct(self))
	{
		_callerName = instanceof(self);
	}
	else
	{
		_callerName = ((id == 0) ? room_get_name(room) : object_get_name(object_index));
	}
	
	var _mark_start = "> ";
	var _mark_section = ": ";
	var _mark_separator = ", ";
	var _mark_timeSeparator = " - ";
	var _mark_section_length = string_length(_mark_section);
	
	var _string_time = date_time_string(date_current_datetime());
	
	var _string = (_string_time + _mark_timeSeparator + _callerName + _mark_section);
	
	var _i = 0;
	repeat (argument_count)
	{
		var _value = string(argument[_i]);
		
		_string += _value;
		
		++_i;
		
		if (_i != argument_count)
		{
			if (!((is_string(_value)) and (string_length(_value) > _mark_section_length)
				  and (string_copy(_value, (string_length(_value) - _mark_section_length + 1),
				  _mark_section_length) == _mark_section)))
			{
				_string += _mark_separator;
			}
		}
	}
	
	show_debug_message(_mark_start + _string);
	
	return _string;
}
