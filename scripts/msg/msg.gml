//  @function				msg()
/// @argument				value... {any:string}
/// @returns				{string}
/// @description			Write the specified values in a string to the standard console output and
///							display it in a message box handled by the export target.
///							The string will be formatted to contain the information about its call.
///							Specified values will be stringified and separated by a comma, except for
///							string values ending with a colon and space.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function msg()
{
	var _callerName = undefined;
	
	try
	{
		if (is_struct(self))
		{
			var _instanceof_self = instanceof(self);
			
			if (_instanceof_self == "<unknown>")
			{
				_callerName = room_get_name(room);
			}
			else
			{
				var _separatorPosition = string_last_pos("@", _instanceof_self);
				
				_callerName = ((_separatorPosition > 0)
							   ? string_copy(_instanceof_self, 1, (_separatorPosition - 1))
							   : _instanceof_self);
			}
		}
		else
		{
			_callerName = ((id == 0) ? room_get_name(room) : object_get_name(object_index));
		}
	}
	catch (_) {}
	
	var _mark_start = ">> ";
	var _mark_section = ": ";
	var _mark_separator = ", ";
	var _mark_timeSeparator = " - ";
	var _mark_section_length = string_length(_mark_section);
	var _string_time = date_time_string(date_current_datetime());
	var _string = ((_callerName != undefined) ? (_callerName + _mark_section) : "");
	var _i = 0;
	repeat (argument_count)
	{
		var _value = string(argument[_i]);
		_string += _value;
		
		++_i;
		
		if ((_i != argument_count) and (!((string_length(_value) > _mark_section_length)
		and (string_copy(_value, (string_length(_value) - _mark_section_length + 1),
						 _mark_section_length) == _mark_section))))
		{
			_string += _mark_separator;
		}
	}
	
	show_debug_message(_mark_start + _string_time + _mark_timeSeparator + _string);
	show_message(_string);
	
	return _string;
}
