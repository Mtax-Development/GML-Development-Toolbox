/// @description		Create a struct and switch scope to it by assigning this macro to a variable
///						declaration. Enables immediate references right after declaring properties.
///						Nested declarations {other} scope of the root declaration.
///						NOTE: Variable name "___ROOT" is reserved in this scope.
/// @example			var _data = struct {a = 5; b = (a - 1); c = a++;};
//  @author				Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
#macro struct global.registerStruct({}); var ___ROOT = ((instanceof(self) = "struct" ? ___ROOT : self)); with (___ROOT) with (global.registerStruct())
#macro root ___ROOT

global.registerStruct = function(_struct)
{
	static _struct_previous = undefined;
	
	if (_struct == undefined)
	{
		_struct = _struct_previous;
		_struct_previous = undefined;
	}
	else
	{
		_struct_previous = _struct;
	}
	
	return _struct;
}
