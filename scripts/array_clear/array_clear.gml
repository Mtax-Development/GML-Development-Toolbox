//  @function			array_clear()
/// @argument			array {any[]}
/// @argument			newSize? {int}
/// @description		Empty the specified array without recreating it to keep its existing variable
///						references, then if a size was specified, resize it by setting that many of
///						its values to {undefined}.
//  @author				Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function array_clear(_array, _newSize = 0)
{
	array_resize(_array, _newSize);
	
	var _i = 0;
	repeat (_newSize)
	{
		_array[_i] = undefined;
		
		++_i;
	}
}
