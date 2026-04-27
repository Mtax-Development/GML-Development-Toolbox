/// @description		Create an empty struct and switch scope to it by assigning this macro to a
///						variable declaration. Doing so it possible to declare its properties and
///						reference them immediately after.
///						This declaration can be nested within itself, in which case, the {other} scope
///						is preserved to refer to the owner of the first, unnested variable.
//						
//						Registered keywords through which this macro is to be used:
//						 - struct: Useable as a variable assignment while the scope can be changed.
//						 - root: Useable within a struct declared by the "struct" keyword.
//								 References the owner of the first unnested "struct" keyword
//								 declaration variable through a local variable.
//						 - parent_root: Useable within code of a constructor that was constructed
//										within the scope of a "struct" keyword.
//										References previous value of the "root" keyword through a
//										global variable.
//						
//						Occupied namespace for internal use only by the code of this macro:
//						 - ___ROOT: Only in the local scope of the "struct" keyword.
//						 - global.registerStruct: Global scope only.
//						 - global.parentRoot: Global scope only.
//						 - macro_struct: This script asset name.
//						
//	@example			data = struct
//						{
//							value1 = 5;
//							value2 = (value1 - 1);
//							value3 = value1++;
//							
//							ownerInformation = struct
//							{
//								instanceName = instanceof(root);
//							};
//						};
//						
//  @author				Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
#region [Public keywords]
	
	#macro struct																					  \
		global.registerStruct({});																	  \
																									  \
		var ___ROOT = ((instanceof(self) = "struct" ? ___ROOT : self));								  \
		global.parentRoot = ___ROOT;																  \
																									  \
		with (___ROOT) with (global.registerStruct())
		
	#macro root ___ROOT
	
	#macro parent_root global.parentRoot;
	
#endregion
#region [Internal code]
	
	/// @argument			struct? {struct}
	/// @description		Save a reference to the specified struct, or if no struct is specified,
	///						return a previously saved reference. This enables the "struct" keyword to
	///						being assigned to a variable declaration.			
	global.registerStruct = function(_struct)
	{
		static _struct_previous = undefined;
		
		if (_struct == undefined)
		{
			_struct = _struct_previous;
			_struct_previous = undefined;
		}
		else
		{
			_struct_previous = _struct;
		}
		
		return _struct;
	}
	
#endregion
