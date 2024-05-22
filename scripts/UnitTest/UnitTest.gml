//  @function				UnitTest()
/// @argument				name? {any:string}
/// @description			Constructs a testing environment used with invidual chunks of code to
///							automate assertion of their intended behavior and stability.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function UnitTest() constructor
{
	#region [Static Properties]
		#region [Configurable variables]
			
			// @type			{function|undefined}
			// @description		Function used for displaying the asserted values.
			static logAssertion = show_debug_message;
			
		#endregion
		#region [Operational variables]
			
			// @type			{bool}
			// @description		Value set and kept true only if any of the test had failures.
			static failuresExist = false;
			
		#endregion
	#endregion
	#region [Methods]
		#region <Management>
			
			// @description			Initialize the constructor.
			static construct = function(_name)
			{
				name = string(_name);
				testID = 0;
				testStatus = [];
				testNames = [];
			}
			
		#endregion
		#region <Getters>
			
			// @returns				{int}
			// @description			Get the number of failures, counting only one per each test ID.
			static getFailedTestCount = function()
			{
				var _failedTestCount = 0;
				var _i = [0, 0];
				repeat (array_length(testStatus))
				{
					_i[1] = 0;
					repeat (array_length(testStatus[_i[0]]))
					{
						if (!testStatus[_i[0]][_i[1]].success)
						{
							++_failedTestCount;
							break;
						}
						
						++_i[1];
					}
					
					++_i[0];
				}
				
				return _failedTestCount;
			}
			
			// @returns				{string}
			// @description			Create a formatted string listing the saved results of the tests.
			static getResults = function()
			{
				var _string_results = "";
				var _failures_exist = false;
				var _testStatus_number = array_length(testStatus);
				var _longestTestName = 0;
				var _i = [0, 0];
				repeat (_testStatus_number)
				{
					var _string_test = "";
					var _failures = [];
					var _failure_last = undefined;
					_i[1] = 0;
					repeat (array_length(testStatus[_i[0]]))
					{
						if (!testStatus[_i[0]][_i[1]].success)
						{
							array_push(_failures, (_i[1] + 1));
							_failure_last = (_i[1] + 1);
						}
						
						++_i[1];
					}
					
					var _string_testName = ((testNames[_i[0]] != undefined)
											? (" " + string(testNames[_i[0]])) : "");
					var _string_testID_primaryZero = (((_i[0] + 1) < 10) ? "0" : "");
					_string_test += ("Test #" + _string_testID_primaryZero + string(_i[0] + 1) + ": ");
					var _string_testName_length = string_length(_string_testName);
					
					if (_string_testName_length > 0)
					{
						_string_test += (_string_testName + ": ");
					}
					
					var _failures_length = array_length(_failures);
					var _mark_notEqual = " ≠ ";
					var _mark_failure_separator_single = ": ";
					var _mark_failure_separator_multi = ", ";
					
					if (_failures_length > 0)
					{
						_failures_exist = true;
						var _failure = testStatus[_i[0]][(_failures[0] - 1)];
						var _string_failureType;
						switch (_failure.type)
						{
							case "Assert: Executable":
								_string_failureType = "EXCEPTION";
							break;
							
							default:
								_string_failureType = "FAILURE";
							break;
						}
						
						var _string_multipleFailures = ((_failures_length > 1) ? "S" : "");
						var _string_detail = "";
						var _string_preDetail = "(";
						var _string_postDetail = ")";
						var _string_singleFailureNumber = "";
						
						if (_failures_length == 1)
						{
							_string_singleFailureNumber = (string(_failure_last) +
														   _mark_failure_separator_single);
							
							switch (_failure.type)
							{
								case "Assert: Equal":
								case "Assert: Not equal":
									_string_detail = (string(_failure.functionReturn) +
													  _mark_notEqual +
													  string(_failure.expectedValue));
								break;
								
								case "Assert: Executable":
									_string_detail = string(_failure.exception.message);
								break;
								
								case "Assert: Untested":
									_string_singleFailureNumber = "";
									_string_preDetail = "";
									_string_postDetail = "";
									_string_detail = "Untested";
								break;
							}
						}
						else
						{
							_i[1] = 0;
							repeat (_failures_length)
							{
								if (_i[1] != 0)
								{
									 _string_detail += _mark_failure_separator_multi;
								}
								
								 _string_detail += string(_failures[_i[1]]);
							
								++_i[1];
							}
						}
						
						_string_test += (_string_failureType + _string_multipleFailures + ": " +
										 _string_singleFailureNumber + _string_preDetail +
										 _string_detail + _string_postDetail);
					}
					else
					{
						switch (testStatus[_i[0]][0].type)
						{
							case "Assert: Executable": _string_test += "EXECUTABLE"; break;
							default: _string_test += "SUCCESS"; break;
						}
					}
					
					var _string_test_length = string_length(_string_test);
					
					if (_string_test_length > _longestTestName)
					{
						_longestTestName = _string_test_length;
					}
					
					_string_results += (_string_test + "\n");
					
					++_i[0];
				}
				
				var _string_title = ((name != undefined) ? string(name) + " - " : "");
				
				_string_title += ("Test Results" + " - ");
				
				if (_testStatus_number > 0)
				{
					_string_title += ((_failures_exist) ? "FAILURES PRESENT" : "ALL CLEAR");
					var _string_separator = string_repeat("-", _longestTestName);
				
					return (_string_title + ":\n" + _string_separator + "\n" + _string_results +
							_string_separator);
				}
				else
				{
					_string_title += "NO TESTS DONE";
					
					return _string_title;
				}
			}
			
		#endregion
		#region <Execution>
			
			/// @argument			name {string}
			/// @argument			functionReturn... {any}
			/// @argument			expectedValue... {any}
			/// @description		Add to this constructor information with the specified test name
			///						about pairs of specified values returned by a function matching
			///						their expected results and use it with the logging function.
			///						The test is considered successful if all values match their result.
			static assert_equal = function()
			{
				testNames[testID] = argument[0];
				
				var _i = [1, 0];
				repeat ((argument_count - 1) div 2)
				{
					var _pair = ((_i[0] - 1) div 2);
					var _functionReturn = argument[_i[0]];
					var _expectedValue = argument[(_i[0] + 1)];
					var _success;
					
					if ((is_array(_functionReturn)) and (is_array(_expectedValue)))
					{
						_success = array_equals(_functionReturn, _expectedValue);
					}
					else if ((is_struct(_functionReturn)) and (is_struct(_expectedValue)))
					{
						var _functionReturn_instanceof = instanceof(_functionReturn);
						var _expectedValue_instanceof = instanceof(_expectedValue);
						
						if (_functionReturn_instanceof == _expectedValue_instanceof)
						{
							var _functionReturn_property = variable_struct_get_names(_functionReturn);
							var _expectedValue_property = variable_struct_get_names(_expectedValue);
							var _expectedPropertyCount = array_length(_expectedValue_property);
							
							if (array_length(_functionReturn_property) == _expectedPropertyCount)
							{
								_success = true;
								_i[1] = 0;
								repeat (_expectedPropertyCount)
								{
									var _property = _expectedValue_property[_i[1]];
									
									if (string_copy(_property, 1, 8) != "argument")
									{
										if ((_functionReturn_property[_i[1]] != _property)
										or  (!variable_struct_exists(_functionReturn, _property))
										or  (_functionReturn[$ _property] !=
											 _expectedValue[$ _property]))
										{
											_success = false;
											
											break;
										}
									}
									
									++_i[1];
								}
							}
							else
							{
								_success = false;
							}
						}
						else
						{
							_success = false;
						}
					}
					else
					{
						_success = (_functionReturn == _expectedValue);
					}
					
					testStatus[testID][_pair] =
					{
						type: "Assert: Equal",
						success: _success,
						functionReturn: _functionReturn,
						expectedValue: _expectedValue
					}
					
					var _status = testStatus[testID][_pair];
					
					if (!_status.success)
					{
						failuresExist = true;
					}
					
					if (logAssertion != undefined)
					{
						var _string_assertionSuccess = ((_status.success) ? " = " : " ≠ ");
						var _string_logAssertion = (testNames[testID] + " [" + string((_pair + 1)) +
													"]" + ": {" + string(_status.functionReturn) +
													_string_assertionSuccess +
													string(_status.expectedValue) + "}");
						
						logAssertion(_string_logAssertion);
					}
					
					_i[0] += 2;
				}
				
				++testID;
			}
			
			/// @argument			name {string}
			/// @argument			functionReturn... {any}
			/// @argument			expectedValue... {any}
			/// @description		Add to this constructor information with the specified test name
			///						about pairs of specified values returned by a function matching
			///						their expected results and use it with the logging function.
			///						The test is considered successful if no value matches its result.
			static assert_notEqual = function()
			{
				testNames[testID] = argument[0];
				
				var _i = [1, 0];
				repeat ((argument_count - 1) div 2)
				{
					var _pair = ((_i[0] - 1) div 2);
					var _functionReturn = argument[_i[0]];
					var _expectedValue = argument[(_i[0] + 1)];
					var _success;
					
					if ((is_array(_functionReturn)) and (is_array(_expectedValue)))
					{
						_success = array_equals(_functionReturn, _expectedValue);
					}
					else if ((is_struct(_functionReturn)) and (is_struct(_expectedValue)))
					{
						var _functionReturn_instanceof = instanceof(_functionReturn);
						var _expectedValue_instanceof = instanceof(_expectedValue);
						
						if (_functionReturn_instanceof == _expectedValue_instanceof)
						{
							var _functionReturn_property = variable_struct_get_names(_functionReturn);
							var _expectedValue_property = variable_struct_get_names(_expectedValue);
							var _expectedPropertyCount = array_length(_expectedValue_property);
							
							if (array_length(_functionReturn_property) == _expectedPropertyCount)
							{
								_success = true;
								_i[1] = 0;
								repeat (_expectedPropertyCount)
								{
									var _property = _expectedValue_property[_i[1]];
									
									if (string_copy(_property, 1, 8) == "argument")
									{
										if ((_functionReturn_property[_i[1]] != _property)
										or  (!variable_struct_exists(_functionReturn, _property))
										or  (_functionReturn[$ _property] !=
											 _expectedValue[$ _property]))
										{
											_success = false;
											
											break;
										}
									}
									
									++_i[1];
								}
							}
							else
							{
								_success = false;
							}
						}
						else
						{
							_success = false;
						}
					}
					else
					{
						_success = (_functionReturn == _expectedValue);
					}
					
					testStatus[testID][_pair] =
					{
						type: "Assert: Not equal",
						success: (!_success),
						functionReturn: _functionReturn,
						expectedValue: _expectedValue
					}
					
					var _status = testStatus[testID][_pair];
					
					if (!_status.success)
					{
						failuresExist = true;
					}
					
					if (logAssertion != undefined)
					{
						var _string_assertionSuccess = ((_status.success) ? " = " : " ≠ ");
						var _string_logAssertion = (testNames[testID] + " [" + string((_pair + 1)) +
													"]" + ": {" + string(_status.functionReturn) +
													_string_assertionSuccess +
													string(_status.expectedValue) + "}");
						
						logAssertion(_string_logAssertion);
					}
					
					_i[0] += 2;
				}
				
				++testID;
			}
			
			/// @argument			name {string}
			/// @argument			executedFunction... {function}
			/// @argument			functionArgument?... {any[]}
			/// @description		Add to this constructor information with the specified test name
			///						about specified functions executed with their arguments and use it
			///						with the logging function.
			///						The test is considered successful if no errors are thrown.
			static assert_executable = function(_name)
			{
				testNames[testID] = _name;
				
				var _i = 1;
				repeat (ceil((argument_count - 1) / 2))
				{
					var _pair = ((_i - 1) div 2);
					var __executedFunction = argument[_i];
					var _functionArgument = ((argument_count > (_i + 1)) ? argument[_i + 1] : []);
					
					if (!is_array(_functionArgument))
					{
						_functionArgument = ((_functionArgument == undefined) ? []
																			  : [_functionArgument]);
					}
					
					var _error = undefined;
					var __execution = ((is_method(__executedFunction))
									   ? method_get_index(__executedFunction) : __executedFunction);
					
					try
					{
						script_execute_ext(__execution, _functionArgument);
					}
					catch (_exception)
					{
						_error = _exception;
					}
					
					testStatus[testID][_pair] =
					{
						type: "Assert: Executable",
						success: (_error == undefined),
						executedFunction: __executedFunction,
						functionArgument: _functionArgument,
						exception: _error
					}
					
					var _status = testStatus[testID][_pair];
					
					if (!_status.success)
					{
						failuresExist = true;
					}
					
					if (logAssertion != undefined)
					{
						var _string_assertionSuccess = ((_status.success) ? "Executable" :
														"Exception: " + string(_status.exception));
						var _string_functionArguments = "";
						var _functionArgumentCount = array_length(_status.functionArgument);
						
						if (_functionArgumentCount > 0)
						{	
							var _i = 0;
							repeat (_functionArgumentCount)
							{
								_string_functionArguments += string(_status.functionArgument[_i]);
								
								++_i;
								
								if (_i < _functionArgumentCount)
								{
									_string_functionArguments += ", ";
								}
							}
						}
						
						var _string_logAssertion = (testNames[testID] + " [" + string((_pair + 1)) +
													"]" + ": {" + string(_status.executedFunction) +
													"(" + _string_functionArguments + ")" + ": " +
													_string_assertionSuccess + "}");
						
						logAssertion(_string_logAssertion);
					}
					
					_i += 2;
				}
				
				++testID;
			}
			
			/// @argument			name {string}
			/// @description		Add to this constructor information with the specified test name
			///						to note that it cannot be executed to test it.
			///						This test is never considered unsuccessful.
			static assert_untestable = function(_name)
			{
				testNames[testID] = _name;
				testStatus[testID][0] =
				{
					type: "Assert: Untestable",
					success: true,
					executedFunction: undefined,
					functionArgument: undefined,
					exception: undefined
				}
				
				if (logAssertion != undefined)
				{
					var _string_logAssertion = (testNames[testID] + ": Untestable");
					
					logAssertion(_string_logAssertion);
				}
				
				++testID;
			}
			
			/// @argument			name {string}
			/// @description		Add to this constructor information with the specified test name
			///						to note that it has not been created yet.
			///						This test is always considered unsuccessful.
			static assert_untested = function(_name)
			{
				testNames[testID] = _name;
				testStatus[testID][0] =
				{
					type: "Assert: Untested",
					success: false,
					executedFunction: undefined,
					functionArgument: undefined,
					exception: undefined
				}
				
				if (logAssertion != undefined)
				{
					var _string_logAssertion = (testNames[testID] + ": Untested!");
					
					logAssertion(_string_logAssertion);
				}
				
				++testID;
			}
			
		#endregion
		#region <Conversion>
			
			/// @returns			{string}
			/// @description		Create a string representing this constructor.
			///						Overrides the string() conversion.
			///						Content will be represented by the name of this Unit Test.
			static toString = function()
			{
				return (instanceof(self) + "(" + string(name) + ")");
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
