/// @function				json_to_struct()
/// @argument				{string:path} path
/// @returns				{struct} | On error: {undefined}
/// @description			Load the specified JSON file and return its content as a struct.
/// @author					Mtax (github.com/Mtax-Development)
function json_to_struct(_path)
{
	if (file_exists(_path))
	{
		var _buffer = buffer_load(_path);
		var _json = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);
		
		try
		{
			return json_parse(_json);
		}
		catch (_exception)
		{
			var _string_separator = string_repeat("#", 92);
			
			var _errorMessage = (_string_separator + "\n" +
								 "json_to_struct(): " + _exception.message + "\n\n" +
								 "Callstack: " + "\n" + string(_exception.stacktrace) + "\n" +
								 _string_separator);
			
			show_debug_message(_errorMessage);
			
			return undefined;
		}
	}
	else
	{
		var _string_separator = string_repeat("#", 92);
		
		var _errorMessage = (_string_separator + "\n" +
							 "json_to_struct(): " + "Attempted to parse a non-existant file." +
							 "\n\n" + "Callstack: " + "\n" + string(debug_get_callstack()) + "\n" +
							 _string_separator);
		
		show_debug_message(_errorMessage);
		
		return undefined;
	}
}
