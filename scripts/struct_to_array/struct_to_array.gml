//  @function				struct_to_array()
/// @argument				struct... {struct}
/// @argument				sort? {function}
/// @returns				{any[]}
/// @description			Return an array containing values of one or multiple specified structs and
///							their nested structs. That array can be sorted using a sorting function if
///							it is specfied as the last argument.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function struct_to_array()
{
	var _result = [];
	
	var __recursion = function(__recursion, _result, _struct)
	{
		if (is_struct(_struct))
		{
			var _name = variable_struct_get_names(_struct);
			var _i = 0;
			repeat (array_length(_name))
			{
				var _value = variable_struct_get(_struct, _name[_i])
				
				if (instanceof(_value) == "struct")
				{
					__recursion(__recursion, _result, _value);
				}
				else
				{
					array_push(_result, _value);
				}
				
				++_i;
			}
		}
	}
	
	var _i = 0;
	repeat (argument_count)
	{
		__recursion(__recursion, _result, argument[_i]);
		
		++_i;
	}
	
	var __sort = argument[(argument_count - 1)];
	
	if (is_callable(__sort))
	{
		array_sort(_result, __sort);
	}
	
	return _result;
}
