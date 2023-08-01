//  @function				percent()
/// @argument				minimum {real}
/// @argument				maximum {real}
/// @argument				value {real}
/// @returns				{real}
/// @description			Return the percentage representing the position of the specified value in
///							the specified range.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function percent(_minimum, _maximum, _value)
{
	var _result = ((_value - _minimum) / (_maximum - _minimum));
	
	return ((is_nan(_result)) ? 1 : _result);
}
