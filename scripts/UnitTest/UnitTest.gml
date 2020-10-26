/// @function				UnitTest()
/// @argument				{string} name?
///	@description			Constructs a UnitTest Class, used for testing invidual pieces of code to
///							ensure they keep their intended behavior and stability.
/// @author					Mtax (github.com/Git-Mtax)
function UnitTest() constructor
{
	#region [Static Properties]
		
		/// @member {bool}			A property set and kept true only if any of the test had failures.
		static failuresExist = false;
		
	#endregion
	#region [Methods]
		#region <Management>
			
			// @description			Initialize the constructor.
			static construct = function(_name)
			{
				name = _name;
				
				testID = 0;
				testSuccess = [];
				testNames = [];
			}
			
		#endregion
		#region <Getters>
			
			// @description			Create a formatted string listing the saved results of the tests.
			static getResults = function()
			{
				var _string = "";
				
				if (name != undefined)
				{
					_string += (string(name) + " - ");
				}
				
				_string += "Test Results: \n\n";
				
				var _i = 0;
				repeat (array_length(testSuccess))
				{
					var _failures = [];
					
					var _j = 0;
					repeat (array_length(testSuccess[_i]))
					{
						if (!testSuccess[_i][_j])
						{
							array_push(_failures, (_j + 1));
						}
						
						++_j;
					}
					
					var _text_name = "";
					
					if (testNames[_i] != undefined)
					{
						_text_name = (" (" + string(testNames[_i]) + ")");
					}
					
					_string += (string(_i + 1) + _text_name + ": ");
					
					var _failures_length = array_length(_failures);
					
					if (_failures_length)
					{
						_string += "FAILURE (";
						
						var _i = 0;
						repeat (_failures_length)
						{
							if (_i != 0)
							{
								_string += ", ";
							}
							
							_string += string(_failures[_i]);
							
							++_i;
						}
						
						_string += ")";
					}
					else
					{
						_string += "SUCCESS";
					}
					
					_string += "\n";
					
					++_i;
				}
				
				return _string;
			}
			
		#endregion
		#region <Execution>
			
			// @argument			{string|undefined} name
			// @argument			{any} functionReturn
			// @argument			{any} expectedResult
			// @argument			... (Repeated arguments: argument[1] and argument[2])
			// @description			Check if the value returned by the function is the same as the
			//						specified expected one.
			//						A name of this test can be specified in the first argument of this
			//						function. Then the next arguments will accept any number of the 
			//						argument pairs for function return and their expected results.
			static assert_equal = function()
			{
				testNames[testID] = argument[0];
				
				var _i = 1;
				repeat ((argument_count - 1) div 2)
				{
					var _pair = ((_i - 1) div 2);
					
					var _functionReturn = argument[_i];
					var _expectedResult = argument[_i + 1];
					
					testSuccess[testID][_pair] = (_functionReturn == _expectedResult);
					
					if (!testSuccess[testID][_pair])
					{
						failuresExist = true;
					}
					
					_i += 2;
				}
				
				++testID;
			}
			
			// @argument			{string|undefined} name
			// @argument			{any} functionReturn
			// @argument			{any} expectedResult
			// @argument			...
			// @description			Check if the value returned by the function is different from the
			//						specified expected one.
			//						A name of this test can be specified in the first argument of this
			//						function. Then the next arguments will accept any number of the 
			//						argument pairs for function return and their expected results.
			static assert_notEqual = function()
			{
				testNames[testID] = argument[0];
				
				var _i = 1;
				repeat ((argument_count - 1) div 2)
				{
					var _pair = ((_i - 1) div 2);
					
					var _functionReturn = argument[_i];
					var _expectedResult = argument[_i + 1];
					
					testSuccess[testID][_pair] = (_functionReturn != _expectedResult);
					
					if (!testSuccess[testID][_pair])
					{
						failuresExist = true;
					}
					
					_i += 2;
				}
				
				++testID;
			}
			
		#endregion
	#endregion
	#region [Constructor]
		
		argument_original = array_create(argument_count, undefined);
		
		var _i = 0;
		repeat (argument_count)
		{
			argument_original[_i] = argument[_i];
			
			++_i;
		}
		
		script_execute_ext(method_get_index(self.construct), argument_original);
		
	#endregion
}
