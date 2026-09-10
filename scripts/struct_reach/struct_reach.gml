//  @function			struct_reach()
/// @argument			struct {struct}
/// @argument			name {string|string[]}
/// @returns			{any|undefined}
/// @description		Return either the value at the end of chain of structs with names specified
///						respectively in an array, which are are nested in the specified initial struct
///						or {undefined} if it does not contain such chain of names.
//  @author				Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function struct_reach(_struct, _name)
{
	var _value = _struct;
	var _name_chain = ((is_array(_name)) ? _name : [_name]);
	var _i = 0;
	repeat (array_length(_name_chain))
	{
		if ((is_struct(_value)) and (variable_struct_exists(_value, _name_chain[_i])))
		{
			_value = variable_struct_get(_value, _name_chain[_i]);
		}
		else
		{
			return undefined;
		}
		
		++_i;
	}
	
	return _value;
}
