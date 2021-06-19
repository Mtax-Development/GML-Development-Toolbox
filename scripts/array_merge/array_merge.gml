/// @function				array_merge()
/// @argument				{any[]} array...
/// @returns				{any[]}
/// @description			Create a single array holding all values of the specified arrays
/// @author					Mtax (github.com/Mtax-Development)
function array_merge()
{
	var _length = array_create(argument_count, 0);
	var _totalLength = 0;
	
	var _i = 0;
	repeat (argument_count)
	{
		_length[_i] = array_length(argument[_i]);
		_totalLength += _length[_i];
		
		++_i;
	}
	
	var _array = array_create(_totalLength, undefined);
	
	var _position = 0;
	var _i = [0, 0];
	repeat (argument_count)
	{
		_i[1] = 0;
		repeat (_length[_i])
		{
			var _argument = argument[_i[0]];
			_array[_position] = _argument[_i[1]];
			
			++_position;
			++_i[1];
		}
		
		++_i[0];
	}
	
	return _array;
}
