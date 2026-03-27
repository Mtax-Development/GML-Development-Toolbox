//  @function				is_ipv4_address()
/// @argument				address {string}
/// @returns				{string:IPv4+int[]|string|undefined}
/// @description			Parse the specified string to separate and return IPv4 address and port
///							included in it, as separated by a colon. The result will be returned
///							respectively in an array. If the specified string does not contain an
///							address port, it will be returned without change. If the specified value
///							is not a string, {undefined} will be returned.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function ipv4_address_port(_address)
{
	var _result = undefined;
	
	if (is_string(_address))
	{
		_result = _address;
		var _port = undefined;
		var _separator_position = string_last_pos(":", _address);
		
		if (_separator_position > 0)
		{
			var _IP = string_copy(_address, 1, (_separator_position - 1));
			var _string_port = string_copy(_address, (_separator_position + 1),
										   (string_length(_address) - _separator_position + 1));
			
			if (_string_port == string_digits(_string_port))
			{
				_port = real(_string_port);
				_result = [_IP, _port];
			}
			else
			{
				_result = _IP;
			}
		}
	}
	
	return _result;
}
