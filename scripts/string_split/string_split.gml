/// @function				string_split()
/// @argument				{string} string
/// @argument				{string} separator
/// @returns				{string[]|string}
/// @description			Create multiple strings divided by the specified separator and return them
///							in an array.
///							Returns the string unmodified is no operation was performed.
/// @author					Mtax (github.com/Mtax-Development)
function string_split(_string, _separator)
{
	var _string_length = string_length(_string);
	var _separator_lenght = string_length(_separator);
	var _separator_count = string_count(_separator, _string);
	
	if ((_string_length > 1) and (_separator_lenght >= 1) and (_separator_count >= 1) 
	and (_string_length > (_separator_lenght + 1)))
	{
		var _copy_pos = 1;
		var _result = [];
		
		var _i = 2;
		var _loopCount = (_string_length + 1);
		repeat (_loopCount)
		{
			if ((string_copy(_string, _i, _separator_lenght) == _separator) or (_i == _loopCount))
			{
				var _segment = string_copy(_string, _copy_pos, (_i - _copy_pos));
				
				if ((string_length(_segment) > 0) and (_segment != _separator))
				{
					_result[array_length(_result)] = string_replace_all(_segment, _separator, "");
				}
				
				_i += _separator_lenght;
				_copy_pos = _i;
			}
			
			++_i;
		}
		
		return _result;
	}
	else
	{
		return _string;
	}
}
