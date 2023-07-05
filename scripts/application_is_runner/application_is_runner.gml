//  @function				application_is_runner()
/// @returns				{bool|undefined}
/// @description			Check if the application is currently ran on the Windows operating system
///							from runner of the GameMaker IDE and is not a built standalone executable.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function application_is_runner()
{
	if (os_type != os_windows)
	{
		return undefined;
	}
	
	var _i = 0;
	repeat (parameter_count())
	{
		if (parameter_string(_i) == "-game")
		{
			return true;
		}
		
		++_i;
	}
	
	return false;
}
