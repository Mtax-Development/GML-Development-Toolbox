/// @function			difference()
/// @argument			{real} number
/// @argument			...
/// @returns			{real}
/// @description		Return a difference of any count of numbers, which is an absolute value of all
///						numbers substracted from each other.
/// @author				Mtax (github.com/Mtax-Development)
function difference()
{
	var _value = argument[0];
	
	if (argument_count <= 1)
	{
		return 0;
	}
	else
	{
		var _i = 1;
		repeat (argument_count - 1)
		{
			_value -= argument[_i];
		
			++_i;
		}
		
		return abs(_value);
	}
}
