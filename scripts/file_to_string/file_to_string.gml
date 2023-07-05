//  @function				file_to_string()
/// @argument				path {string:path}
/// @returns				{string}
/// @description			Load the specified text file and return it as a string.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function file_to_string(_file)
{
	var _result = "";
	
	if (file_exists(_file))
	{
		var _stream = file_text_open_read(_file);
		{
			while (!file_text_eof(_stream))
			{
				_result += file_text_readln(_stream);
			}
		}
		file_text_close(_stream);
		
		_result = string_replace_all(_result, "\u000d", "");
	}
	
	return _result;
}
