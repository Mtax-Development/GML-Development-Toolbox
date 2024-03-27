//  @function				average()
/// @argument				array {real[]}
/// @returns				{real|undefined}
/// @description			Return the mean number of numeric values contained in the specified array
///							or {undefined} if it contains no numeric values.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function average(_array)
{
	var _numericValueCount = 0;
	var _sum = 0;
	var _i = 0;
	repeat (array_length(_array))
	{
		var _value = _array[_i];
		
		if (is_numeric(_value))
		{
			_sum += _value;
			++_numericValueCount;
		}
		
		++_i;
	}
	
	return ((_numericValueCount > 0) ? (_sum / _numericValueCount) : undefined);
}
