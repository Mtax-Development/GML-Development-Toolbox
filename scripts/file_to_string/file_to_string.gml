//  @function				file_to_string()
/// @argument				path {string:path}
/// @returns				{string}
/// @description			Load the specified text file and return it as a string.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function file_to_string(_path)
{
	var _result = "";
	
	if ((is_string(_path)) and (file_exists(_path)))
	{
		try
		{
			var _stream = file_text_open_read(_path);
			
			if (_stream >= 0)
			{
				while (!file_text_eof(_stream))
				{
					_result += file_text_readln(_stream);
				}
				
				file_text_close(_stream);
			}
			
			_result = string_replace_all(_result, "\u000d", "");
			
			return _result;
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
		var _error_reason = ("Failed opening file at path: " + "\"" + string(_path) + "\".");
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
						  "file_to_string(): " + _error_reason + "\n\n" +
						  "Callstack: " + "\n" + _callstack_formatted + "\n" +
						  _separator);
	show_debug_message(_error_message);
	
	return _result;
}
