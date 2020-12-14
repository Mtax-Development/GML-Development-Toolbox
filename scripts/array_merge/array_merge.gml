/// @argument			{any[]} array
/// @argument			...
/// @returns			{any[]}
/// @description		Create a single array holding all values of the specified arrays
/// @author				Mtax (github.com/Git-Mtax)
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
	var _i = 0;
	repeat (argument_count)
	{
		var _j = 0;
		repeat (_length[_i])
		{
			var _argument = argument[_i];
			_array[_position] = _argument[_j];
			
			++_position;
			++_j;
		}
		
		++_i;
	}
	
	return _array;
}
