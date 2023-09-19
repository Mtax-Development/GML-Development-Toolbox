//  @function				array_remove_value()
/// @argument				array {any[]}
/// @argument				value {any}
/// @returns				{any[]}
/// @description			Remove all entries of the specified value from the specified array and
///							return that array.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function array_remove_value(_array, _value)
{
	var _i = 0;
	repeat (array_length(_array))
	{
		if (_array[_i] == _value)
		{
			array_delete(_array, _i, 1);
		}
		else
		{
			++_i;
		}
	}
	
	return _array;
}
