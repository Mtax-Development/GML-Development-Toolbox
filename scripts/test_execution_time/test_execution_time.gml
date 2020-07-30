/// @function				test_execution_time()
/// @returns				{real|real[]}
/// @description			Test for the average execution time of provided functions and return it 
///							as a real number or an array of them if multiple functions are tested.
///							That time is counted in microseconds.
///							This function should be ran multiple times to gather a more accurate 
///							average over time.
/// @author					Mtax (github.com/Git-Mtax)
function test_execution_time()
{
	var array_average = function(_array)
	{
		var _valueNumber = array_length(_array);
	
		if (_valueNumber > 0)
		{
			var _sum = 0;
		
			var _i = 0;
		
			repeat (_valueNumber)
			{
				_sum += _array[_i++];
			}
		
			return (_sum / _valueNumber);
		}
		else
		{
			return undefined;
		}
	}
	
	//|Initial test run of all provided functions to avoid 
	// inflation of the results due to initialization time.
	var _i = 0;
		
	repeat (argument_count)
	{
		argument[_i++]();
	}
	
	//|Actual run of all provided functions, from which time results are saved
	// and then average is generated over multiple calls of this entire function.
	static _executionTimes = [];
	var _averageTimes = [];
	
	var _i = 0;
	
	repeat (argument_count)
	{
		//|Run the function to get the timer difference.
		var _timer_before = get_timer();
		
		argument[_i]();
		
		var _timer_after = get_timer();
		
		var _timerDifference = (_timer_after - _timer_before);
		
		//|Save the timer difference for later calls of this entire function.
		_executionTimes[_i][array_length(_executionTimes[_i])] = _timerDifference;
		
		//|Save the current average results for the provided function.
		_averageTimes[_i] = array_average(_executionTimes[_i]);
		
		_i++;
	}
	
	return (argument_count == 1 ? _averageTimes[0] : _averageTimes);
}
