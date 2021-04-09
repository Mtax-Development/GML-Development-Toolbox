/// @function			out_m()
/// @argument			{any} text?
/// @returns			{string}
/// @description		This function acts as a handler for the built-in show_debug_message() 
///						function with additional usability.
///						The output will provide the name of the object or room calling this
///						function. It can also take multiple arguments, which will be shown
///						in the same line with separation between each.
/// @author				Mtax (github.com/Mtax-Development)
function out_m()
{	
	var _callerName = ((id == 0) ? room_get_name(room) : object_get_name(object_index));
	
	var _mark_section = ": ";
	var _mark_output_start = "> ";
	
	var _mark_separator = " | ";
	
	var _string = (_callerName + _mark_section);
	
	var _i = 0;
	
	repeat (argument_count)
	{
		_string += string(argument[_i]);
		
		++_i;
		
		if (_i != argument_count)
		{
			_string += _mark_separator;
		}
	}
	
	show_debug_message(_mark_output_start + _string);
	
	return _string;
}
