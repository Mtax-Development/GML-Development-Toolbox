//  @function				Constant()
/// @argument				numerator {int|struct}
/// @argument				name {string}
/// @argument				value? {any}
/// @description			Constructs a numerated value represented by data of several types at once.
///							Implied to be used as a constant, unchanging value. The numerator can be
///							specified either directly as a number or as a struct, to numerate with the
///							amount of properties it had before this construction was finished.
//  @example				globalvar Direction; Direction = {Left: new Constant(0, "Left", -1),
//															  Right: new Constant(1, "Right", 1)};
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function Constant(_numerator, _name, _value) constructor
{
	#region [Properties]
		
		numerator = ((is_struct(_numerator)) ? variable_struct_names_count(_numerator) : _numerator);
		name = _name;
		value = _value;
		
	#endregion
	#region [Method]
		
		/// @argument			full? {bool}
		/// @description		Create a string representing this constructor.
		///						Overrides the string() conversion.
		///						Content will be represented with the name of the value.
		static toString = function(_full = false)
		{
			var _name = string(name);
			
			return ((_full) ? (instanceof(self) + "(" + _name + ")") : _name);
		}
	
	#endregion
}
