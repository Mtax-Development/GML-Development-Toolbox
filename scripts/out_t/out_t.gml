/// @function				out_t()
/// @argument				{any} value?
/// @argument				{any} title?
/// @returns				{string}
/// @description			This function acts as a handler for the built-in show_debug_message() 
///							function with additional usability.
///							The output will provide the name of the object or room calling this
///							function. It can also take multiple arguments in pairs of values and
///							titles, which will be shown in the same line with separation between 
///							each.
/// @author					Mtax (github.com/Git-Mtax)
function out_t()
{	
	var _callerName = ((id == 0) ? room_get_name(room) : object_get_name(object_index));
	
	var _mark_section = ": ";
	var _mark_output_start = "> ";
	
	var _mark_separator = " | ";
	
	var _string = (_callerName + _mark_section);
	
	var _pairCount = (argument_count div 2);
	var _i = 0;
	
	repeat (_pairCount)
	{
		var _value = string(argument[_i++]);
		var _title = string(argument[_i++]);
		
		_string += (_title + _mark_section + _value);
		
		if ((_i div 2) != _pairCount)
		{
			_string += _mark_separator;
		}
	}
	
	show_debug_message(_mark_output_start + _string);
	
	return _string;
}
