/// @description		Operate execution time profiler to output into the console the average time
///						across multiple executions of the same code, by placing the beginning keyword
///						of this macro before measured code and ending code after it. This macro
///						obtains the execution timer with the least possible time spent on calling the
///						timer function itself itself to ensure accurate results. Each keyword of this
///						macro should be present in code only once per application execution to not
///						combine resulting timings.
//
//						Registered keywords through which this macro is to be used:
//						 - profiler_begin: Useable by itself anywhere local variables can be declared.
//						 - profiler_end: Useable in the same local scope "profiler_begin" keyword was
//										 previously used.
//						
//						Occupied namespace for internal use only by the code of this macro:
//						 - global.operateProfiler: Global scope only.
//
//  @example			profiler_begin;
//						
//						repeat (1000)
//						{
//							struct_get_names(global);
//						}
//						
//						profiler_end;
//						
//  @author				Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
#region [Public keywords]
	
	#macro profiler_begin var ___PROFILER_BEGINNING = get_timer();
	
	#macro profiler_end																				  \
		var ___PROFILER_END = get_timer();															  \
		global.operateProfiler(___PROFILER_END - ___PROFILER_BEGINNING);
	
#endregion
#region [Internal code]
	
	global.operateProfiler = function(_timer_difference)
	{
		static _executionTime = [];
		
		array_insert(_executionTime, 0, _timer_difference);
		var _executionTime_limit = 4000;
		
		if (array_length(_executionTime) > _executionTime_limit)
		{
			array_resize(_executionTime, _executionTime_limit);
		}
		
		var _sum = 0;
		var _count = array_length(_executionTime);
		var _i = 0;
		repeat (_count)
		{
			_sum += _executionTime[_i];
			
			++_i;
		}
		
		show_debug_message("> {0} - PROFILER: Execution time: {1}, Average: {2}",
						   date_time_string(date_current_datetime()), _timer_difference,
						   (_sum / _count))
	}
	
#endregion
