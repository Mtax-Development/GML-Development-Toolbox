//  @function				sign_bool()
/// @argument				value {any:bool}
/// @returns				{int:1|int:-1}
/// @description			Return number one with a sign depending on boolean evaluation of the
///							specified value, positive for true and negative for false.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function sign_bool(_value)
{
	return ((_value) ? 1 : -1);
}
