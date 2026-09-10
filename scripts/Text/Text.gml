//  @function			Text()
/// @argument			string? {any:string}
/// @description		Container for a string that can be changed while keeping the same variable
///						reference.
//  @author				Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function Text(_string = "") constructor
{
  #region [Methods]
	
	/// @argument			value? {any:string}
	/// @description		Set the value of this constructor to either the specified stringified
	///						value or an empty string.
	static set = function(_value = "")
	{
		ID = string(_value);
		
		return self;
	}
	
	/// @returns			{string}
	/// @description		Return the value of this constructor.
	///						Overrides the string() conversion.
	static toString = function()
	{
		return ID;
	}
	
  #endregion
  #region [Constructor]
	
	ID = string(_string);
	
  #endregion
}
