//  @function				approach()
/// @argument				value {real}
/// @argument				target {real}
/// @argument				rate? {real}
/// @returns				{real}
/// @description			Return the specified value after moving it towards its target value by the
///							specified rate without passing through it.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
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
