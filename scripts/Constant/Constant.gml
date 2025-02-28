//  @function				Constant()
/// @argument				numerator {int|struct}
/// @argument				name {string}
/// @argument				value? {any}
/// @description			Constructs a numerated value represented by data of several types at once.
///							Implied to be used as a constant, unchanging value. Its numerator can be
///							specified directly or be numerated from a specified struct with the amount
///							of properties it had before this construction was finished.
//							
//							Construction types:
//							- New constructor
//							- From struct: numerator {int|struct}, struct {struct}
//							   Specified struct will have its "name" property read to assign it as the
//							   name of this Constant, then that struct will be assigned as the value.
//							- Empty: {void}
//
//  @example				globalvar Direction; Direction = {Left: new Constant(0, "Left", -1),
//															  Right: new Constant(1, "Right", 1)};
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function Constant() constructor
{
	#region [Methods]
		#region <Management>
			
			/// @description		Initialize this constructor.
			static construct = function()
			{
				//|Construction type: Empty.
				numerator = undefined;
				name = string(undefined);
				value = undefined;
				
				if (argument_count > 0)
				{
					numerator = ((is_struct(argument[0])) ? variable_struct_names_count(argument[0])
														  : argument[0]);
					
					if (is_struct(argument[1]))
					{
						//|Construction type: From struct.
						var _struct = argument[1];
						name = string(variable_struct_get(_struct, "name"));
						value = _struct;
					}
					else
					{
						//|Construction type: New constructor.
						name = string(argument[1]);
						value = argument[2];
					}
				}
			}
			
		#endregion
		#region <Conversion>
			
			/// @argument			multiline? {bool}
			/// @argument			full? {bool}
			/// @description		Create a string representing this constructor.
			///						Overrides the string() conversion.
			///						Content will be represented with the name of the value.
			static toString = function(_multiline = false, _full = false)
			{
				var _name = string(name);
				
				if (_full)
				{
					var _mark_separator = ((_multiline) ? "\n" : ", ");
					var _string = ("Numerator: " + string(numerator) + _mark_separator +
								   "Name: " + _name + _mark_separator +
								   "Value: " + string(value));
					
					return ((_multiline) ? _string : (instanceof(self) + "(" + _string + ")"));
				}
				else
				{
					return _name;
				}
				
				return ((_full) ? (instanceof(self) + "(" + _name + ")") : _name);
			}
			
		#endregion
		
	#endregion
	#region [Constructor]
		
		static constructor = Constant;
		
		var _argument = array_create(argument_count, undefined);
		var _i = 0;
		repeat (argument_count)
		{
			_argument[_i] = argument[_i];
			
			++_i;
		}
		
		script_execute_ext(self.construct, _argument);
		
	#endregion
}
