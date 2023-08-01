//  @function				struct_merge()
/// @argument				target {struct}
/// @argument				source... {struct}
/// @returns				{struct}
/// @description			Modify the specified target struct to add the properties of the specified
///							source structs. Values of existing properties will be overwritten in the
///							same order as structs have been specified.
//  @author					Mtax (github.com/Mtax-Development)
function struct_merge(_target)
{
	var _i = [1, 0];
	repeat (argument_count - _i[0])
	{
		var _source = argument[_i[0]];
		
		if (is_struct(_source))
		{
			var _name = variable_struct_get_names(argument[_i[0]]);
			_i[1] = 0;
			repeat (array_length(_name))
			{
				var _name_current = _name[_i[1]];
				
				variable_struct_set(_target, _name_current,
									variable_struct_get(_source, _name_current));
				
				++_i[1];
			}
		}
		
		++_i[0];
	}
	
	return _target;
}
