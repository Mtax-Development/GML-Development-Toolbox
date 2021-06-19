/// @function				array_average()
/// @argument				{real[]} array
/// @returns				{real|undefined}
/// @description			Return the average number of all numbers of the array by summing them and
///							then dividing by their count.
///							Returns {undefined} if the array is empty.
/// @author					Mtax (github.com/Mtax-Development)
function array_average(_array)
{
	var _arrayLength = array_length(_array);
	
	if (_arrayLength > 0)
	{
		var _sum = 0;
	
		var _i = 0;
		repeat (_arrayLength)
		{
			_sum += _array[_i];
		
			++_i;
		}
		
		return (_sum / _arrayLength);
	}
	else
	{
		return undefined;
	}
}
