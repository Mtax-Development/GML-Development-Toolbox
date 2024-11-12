//  @function				file_find_included()
/// @argument				file? {string:path}
/// @argument				directory? {string:path}
/// @returns				{string[]}
/// @description			Search for files in the same directory as the executeble of the application
///							or specified subsidiary directories to return their names in an array.
///							The operation is performed by specifying search masks, meaning that names
///							of directories, files and file extension can be replaced with an asterix
///							to match results containing everything other than these replaced parts.
//  @author					Mtax (github.com/Mtax-Development/GML-Development-Toolbox)
function file_find_included(_file = "*", _directory = "")
{
	var _result = [];
	var _searchMask = "";
	
	switch (os_type)
	{
		case os_android:
			_searchMask = _file;
		break;
		default:
			_searchMask = (((string_length(_directory) > 0) ? (_directory + @"\") : "") +
						   _file);
		break;
	}
	
	var _file_name = file_find_first(_searchMask, fa_none);
	while (_file_name != "")
	{
		array_push(_result, _file_name);
		
		_file_name = file_find_next();
	}
	file_find_close();
	
	return _result;
}
