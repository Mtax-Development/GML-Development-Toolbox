//  @function				measure_execution_time()
/// @argument				function... {function}
/// @returns				{real|real[]|undefined}
/// @description			Test the average execution time of specified functions and return the
///							result as a number, an array of them if multiple functions were specified
///							or {undefined} if none. The time is measured in microseconds and saved in
///							a static variable to be later included in calculations, meaning the results
///							increase in accuracy as this function is being called repeatedly.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function measure_execution_time()
{
	static _executionTime = [];
	
	//|Initialize all data and functions used to gather timer difference.
	var _timer_before = 0;
	var _timer_after = 0;
	var _i = 0;
	repeat (argument_count)
	{
		var __function = argument[_i];
		get_timer();
		get_timer();
		__function();
		__function();
		
		++_i;
	}
	
	var _averageTime = [];
	var _i = [0, 0];
	repeat (argument_count)
	{
		var __function = argument[_i[0]];
		
		//|Initialize data and functions once again right before gathering timer difference.
		_timer_before = 0;
		_timer_after = 0;
		get_timer();
		get_timer();
		__function();
		__function();
		
		//|Execute the function to obtain timer difference.
		_timer_before = get_timer();
		__function();
		_timer_after = get_timer();
		var _timer_difference = (_timer_after - _timer_before);
		
		//|Save the timer difference for later calls of this entire function.
		var _function_identifier = string(__function);
		var _executionTime_index = undefined;
		_i[1] = 0;
		repeat (array_length(_executionTime))
		{
			var _executionTime_header = _executionTime[_i[1]][0];
			
			if (_executionTime_header == _function_identifier)
			{
				array_push(_executionTime[_i[1]][1], _timer_difference);
				_executionTime_index = _i[1];
				
				break;
			}
			
			++_i[1];
		}
		
		if (_executionTime_index == undefined)
		{
			array_push(_executionTime, [_function_identifier, [_timer_difference]]);
			_executionTime_index = _i[1];
		}
		
		//|Save the current average results for the specified functions.
		var _executionTime_current = _executionTime[_executionTime_index][1];
		var _executionTime_current_size = array_length(_executionTime[_executionTime_index][1]);
		var _sum = 0;
		_i[1] = 0;
		repeat (_executionTime_current_size)
		{
			_sum += _executionTime_current[_i[1]];
			
			++_i[1];
		}
		
		array_push(_averageTime, (_sum / _executionTime_current_size));
		
		++_i[0];
	}
	
	switch (argument_count)
	{
		case 0:
			return undefined;
		break;
		
		case 1:
			return _averageTime[0];
		break;
		
		default:
			return _averageTime;
		break;
	}
}
