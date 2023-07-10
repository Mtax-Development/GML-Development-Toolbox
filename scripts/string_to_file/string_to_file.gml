//  @function				string_to_file()
/// @argument				path {string:path}
/// @argument				string {string}
/// @returns				{bool}
/// @description			Save the specified string to a file at the specified path and return
///							whether this operation was a success. The file will be created if it does
///							not exists, otherwise its contents will be overwritten.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function string_to_file(_path, _string)
{
	if (is_string(_path))
	{
		try
		{
			var _stream = file_text_open_write(_path);
			
			if (_stream >= 0)
			{
				file_text_write_string(_stream, _string);
				file_text_close(_stream);
				
				return true;
			}
			else
			{
				var _error_reason = ("Could not open or create a text file at path: " +
									 "\"" + string(_path) + "\".");
			}
		}
		catch (_exception)
		{
			var _path_string = string(_path);
			var _error_reason = (_exception.message + " " +
								 ((string_count(_path_string, _exception.message) > 0)
								  ? "" :"File path: " + "\"" + _path_string + "\"."));
		}
	}
	else
	{
		var _error_reason = ("File path invalid: " + string(_path));
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
	var _error_message = (_separator + "\n" +
						  "string_to_file(): " + _error_reason + "\n\n" +
						  "Callstack: " + "\n" + _callstack_formatted + "\n" +
						  _separator);
	show_debug_message(_error_message);
	
	return false;
}
