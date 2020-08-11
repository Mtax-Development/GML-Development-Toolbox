/// @function				application_is_runner()
/// @returns				{bool|undefined}
/// @description			Check if the application is currently ran by the application runner
///							of the GameMaker Studio 2 IDE and is not a built standalone executable.
///
///							This function is only valid for the Windows target and will return
///							{undefined} on any other platform (including UWP).
/// @author					Mtax (github.com/Git-Mtax)
function application_is_runner()
{
	if (os_type != os_windows)
	{
		return undefined;
	}
	
	var _parameter_runner = "-game";
	
	var _i = 0;

	repeat (parameter_count())
	{
		var _parameter_current = parameter_string(_i++);
		
		if (_parameter_current == _parameter_runner)
		{
			return true;
		}
	}
	
	return false;
}
