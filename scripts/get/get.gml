//  @function			get()
/// @argument			value {method}
/// @argument			argument? {any|any[]}
/// @returns			{any}
/// @description		Return the specified value either directly or by returning it from a method
///						call.
//  @author				Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function get(_value, _argument)
{
	return ((is_method(_value))
			? script_execute_ext(method_get_index(_value),
								 ((is_array(_argument)) ? _argument : [_argument]))
			: _value);
}
