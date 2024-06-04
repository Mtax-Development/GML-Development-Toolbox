//  @function				equals()
/// @argument				{any} first...
/// @argument				{any} second...
/// @returns				{bool}
/// @description			Check if all pairs of specified values are equivalent. If both values are
///							an array or a struct, their content is compared through recursion.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function equals()
{
	var __recursion = function(__recursion, _first, _second)
	{
		if (typeof(_first) == typeof(_second))
		{
			if (is_struct(_first))
			{
				var _property_first = variable_struct_get_names(_first);
				var _property_second = variable_struct_get_names(_second);
				var _size = array_length(_property_first)
				
				if (_size == array_length(_property_second))
				{
					var _i = 0;
					repeat (_size)
					{
						var _name = _property_first[_i];
						
						if (!__recursion(__recursion, _first[$ _name], _second[$ _name]))
						{
							return false;
						}
						
						++_i;
					}
				}
				else
				{
					return false;
				}
			}
			else if (is_array(_first))
			{
				var _size = array_length(_first);
				
				if (_size == array_length(_second))
				{
					var _i = 0;
					repeat (_size)
					{
						if (!__recursion(__recursion, _first[_i], _second[_i]))
						{
							return false;
						}
						
						++_i;
					}
				}
				else
				{
					return false;
				}
			}
			else
			{
				return (_first == _second);
			}
		}
		else
		{
			return false;
		}
		
		return true;
	}
	
	var _i = 0;
	repeat (argument_count div 2)
	{
		if (!__recursion(__recursion, argument[_i], argument[(_i + 1)]))
		{
			return false;
		}
		
		_i += 2;
	}
	
	return true;
}
