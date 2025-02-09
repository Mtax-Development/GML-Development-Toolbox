//  @function				struct_for_each()
/// @argument				struct {struct}
/// @argument				callback {function}
/// @argument				argument? {any[]}
/// @argument				recursive? {bool}
/// @returns				{any[]}
/// @description			Execute a function once for each property of the specified struct.
///							The execution can be specified as recursive to execute on content of nested
///							structs after themselves, unless they are constructors.
//							The following arguments will be provided to the function and can be
//							accessed in it by using their name or the argument array:
//							- argument[0]: _i {int|int[]}
//							- argument[1]: _value {any}
//							- argument[2]: _name {string|string[]}
//							- argument[3]: _argument {any}
//							Iterator and name arguments are provided as arrays during recursion to
//							include information about upper levels of current nested execution.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function struct_for_each(_struct, __callback, _argument, _recursive = false)
{
	var _result = [];
	
	if (_recursive)
	{
		var __recursion = function(__recursion, _argument_root, _local)
		{
			var _struct = _argument_root[0];
			var __callback = _argument_root[1];
			var _argument = _argument_root[2];
			var _result = _local[0];
			var _i_chain = _local[1];
			var _name_chain = _local[2];
			
			if (is_struct(_struct))
			{
				var _name = variable_struct_get_names(_struct);
				var _i = 0;
				repeat (array_length(_name))
				{
					var _value = variable_struct_get(_struct, _name[_i]);
					var _name_chain_current = [];
					array_push(_i_chain, _i);
					array_copy(_name_chain_current, 0, _name_chain, 0, array_length(_name_chain));
					array_push(_name_chain_current, _name[_i]);
					var _isRoot = (array_length(_i_chain) <= 1);
					array_push(_result, __callback(((_isRoot) ? _i : _i_chain), _value,
												   ((_isRoot) ? _name[_i] : _name_chain_current),
												   _argument));
					
					if (instanceof(_value) == "struct")
					{
						var _result_nested = [];
						
						__recursion(__recursion, [_value, __callback, _argument],
									[_result_nested, _i_chain, _name_chain_current])
						
						array_push(_result, _result_nested);
					}
					
					array_pop(_i_chain);
					
					++_i;
				}
			}
		}
		
		__recursion(__recursion, [_struct, __callback, _argument], [_result, [], []]);
	}
	else if (is_struct(_struct))
	{
		var _name = variable_struct_get_names(_struct);
		var _i = 0;
		repeat (array_length(_name))
		{
			var _value = variable_struct_get(_struct, _name[_i]);
			
			array_push(_result, __callback(_i, _value, _name[_i], _argument));
			
			++_i;
		}
	}
	
	return _result;
}
