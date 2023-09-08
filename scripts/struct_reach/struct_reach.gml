//  @function				struct_reach()
/// @argument				struct {struct}
/// @argument				name {string|string[]}
/// @returns				{any}
/// @description			Return the nested value at the end of the specified name chain in the
///							specified struct.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function struct_reach(_struct, _name)
{
	var _value = _struct;
	var _name_chain = ((is_array(_name)) ? _name : [_name]);
	var _i = 0;
	repeat (array_length(_name_chain))
	{
		_value = variable_struct_get(_value, _name_chain[_i]);
		
		++_i;
	}
	
	return _value;
}