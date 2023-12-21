//  @function				get()
/// @argument				value {method}
/// @argument				argument? {any|any[]}
/// @returns				{any}
/// @description			Access the specified value uniformly by returning the result of its method
///							or by passing it through if it is not a method.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function get(_value, _argument)
{
	return ((is_method(_value))
			? script_execute_ext(method_get_index(_value), ((is_array(_argument)) ? _argument
																				  : [_argument]))
			: _value);
}
