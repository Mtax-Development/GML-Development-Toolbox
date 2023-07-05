//  @function				array()
/// @argument				value... {any|any[]}
/// @returns				{any[]}
/// @description			Create an array containing specified values or all values of specified
///							arrays. If the only specified value is an array, it will be returned
///							without change. If no values are provided, an empty array will be returned.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function array()
{
	if (argument_count == 1)
	{
		return ((is_array(argument[0])) ? argument[0] : [argument[0]]);
	}
	else
	{
		var _array = [];
		var _i = [0, 0];
		repeat (argument_count)
		{
			if (is_array(argument[_i[0]]))
			{
				_i[1] = 0;
				repeat (array_length(argument[_i[0]]))
				{
					array_push(_array, argument[_i[0]][_i[1]]);
						
					++_i[1];
				}
			}
			else
			{
				array_push(_array, argument[_i[0]]);
			}
				
			++_i[0];
		}
		
		return _array;
	}
}
