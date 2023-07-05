//  @function				json_to_struct()
/// @argument				path {string:path}
/// @returns				{struct} | On error: {undefined}
/// @description			Load the specified JSON file and return it as a struct.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function json_to_struct(_path)
{
	if ((is_string(_path)) and (file_exists(_path)))
	{
		var _buffer = undefined;
		
		try
		{
			_buffer = buffer_load(_path);
			
			return json_parse(buffer_read(_buffer, buffer_string));
		}
		catch (_exception)
		{
			var _error_message = "Attempted to parse a file with invalid JSON formatting.";
		}
		finally
		{
			if ((is_real(_buffer) and (buffer_exists(_buffer))))
			{
				buffer_delete(_buffer);
			}
		}
	}
	else
	{
		var _error_message = "Attempted to parse an inaccessible file.";
	}
	
	var _callstack_raw = debug_get_callstack();
	var _callstack = [];
	array_copy(_callstack, 0, _callstack_raw, 1, (array_length(_callstack_raw) - 2)); 
	var _tabulation = string_repeat(" ", 4);
	var _callstack_formatted = "";
	var _i = 0;
	repeat (array_length(_callstack))
	{
		_callstack_formatted += ((((_i != 0) ? "\n" : "") + _tabulation + string(_callstack[_i])));
		
		++_i;
	}
	
	var _separator = string_repeat("#", 92);
	var _errorMessage = (_separator + "\n" +
						 "json_to_struct(): " + _error_message + "\n\n" +
						 "Callstack: " + "\n" + _callstack_formatted + "\n" +
						 _separator);
	
	show_debug_message(_errorMessage);
	
	return undefined;
}
