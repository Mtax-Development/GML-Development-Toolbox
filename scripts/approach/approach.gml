/// @function				approach()
/// @argument				{real} value
/// @argument				{real} target
/// @argument				{real} rate?
/// @returns				{real}
/// @description			Move the value towards its target by increasing or decreasing it by the 
///							specified rate.
/// @author					Mtax (github.com/Mtax-Development)
function approach(_value, _target, _rate = 1)
{
	if (_value < _target)
	{
		_value = clamp((_value + _rate), _value, _target);
	}
	else if (_value > _target)
	{
		_value = clamp((_value - _rate), _target, _value);
	}
	
	return _value;
}
