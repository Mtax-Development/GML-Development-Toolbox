//  @function				struct_match_value()
/// @argument				struct {struct[]}
/// @argument				name {string|string[]}
/// @argument				value {any}
/// @returns				{struct|undefined}
/// @description			Iterate through the specified array of structs to match the specified value
///							under specified property name chain and return the first struct containing
///							that value in that property.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function struct_match_value(_struct, _name, _value)
{
	var _name_chain = ((is_array(_name)) ? _name : [_name]);
	var _name_count = array_length(_name_chain);
	var _i = [0, 0];
	repeat (array_length(_struct))
	{
		var _struct_current = _struct[_i[0]];
		_i[1] = 0;
		repeat (_name_count)
		{
			var _name_current = _name_chain[_i[1]];
			
			++_i[1];
			
			if (_i[1] == _name_count)
			{
				if (variable_struct_exists(_struct_current, _name_current))
				and (variable_struct_get(_struct_current, _name_current) == _value)
				{
					return _struct_current;
				}
				else
				{
					break;
				}
			}
			else if ((is_struct(_struct_current))
			and (variable_struct_exists(_struct_current, _name_current)))
			{
				_struct_current = variable_struct_get(_struct_current, _name_current);
			}
			else
			{
				break;
			}
		}
		
		++_i[0];
	}
	
	return undefined;
}
