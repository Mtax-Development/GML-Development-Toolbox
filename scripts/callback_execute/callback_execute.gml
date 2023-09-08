//  @function				callback_execute()
/// @argument				callback {function|method|[]}
/// @argument				argument? {any|any[]|any[+]}
/// @returns				{any|any[]}
/// @description			Execute the specified callback in form of function, method or an array of
///							them, by providing the specified arguments to them. If multiple callbacks
///							are being executed, the arguments can be a a single value provided to all
///							of them or an array of values, each of which will be provided to callbacks
///							at their respective array positions. These values can also be nested arrays
///							to provide multiple arguments to respective callbacks this way.
///							Values returned by callbacks will be returned by this function, either
///							directly or in an array if the callback argument was also an array.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function callback_execute(_callback, _argument = undefined)
{
	var _callback_isArray = is_array(_callback);
	var _argument_isArray = is_array(_argument);
	var _callback_array = ((_callback_isArray) ? _callback : [_callback]);
	var _callback_count = array_length(_callback_array);
	var _argument_array = ((_argument_isArray) ? _argument : array_create(_callback_count, _argument));
	var _result = array_create(_callback_count, undefined);
	var _i = 0;
	repeat (_callback_count)
	{
		var _callback_index = ((is_method(_callback_array[_i])) ? method_get_index(_callback_array[_i])
																: _callback_array[_i]);
		
		if (is_real(_callback_index))
		{
			_result[_i] = script_execute_ext(_callback_index,
											 (((!_callback_isArray) and (_argument_isArray))
											  ? _argument_array
											  : ((is_array(_argument_array[_i]))
												 ? _argument_array[_i] : [_argument_array[_i]])));
		}
		
		++_i;
	}
	
	return ((_callback_isArray) ? _result : _result[0]);
}
