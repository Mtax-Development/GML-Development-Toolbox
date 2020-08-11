/// @function				out()
/// @argument				{any} text?
/// @argument				{any} title?
/// @description			This function acts as a handler for the built-in show_debug_message() 
///							function, while providing additional information, better convenience
///							of use and visibility. It will provide the name of the object/room 
///							calling this function. The output can also have a title, but the 
///							function can be used without it or any provided text to display.
/// @author					Mtax (github.com/Git-Mtax)
function out()
{
	var _text = ((argument_count > 0) ? string(argument[0]) : "");
	var _title = ((argument_count > 1) ? (" (" + string(argument[1]) + ")") : "");
	
	var _callerName = ((id == 0) ? room_get_name(room) : object_get_name(object_index));
	
	var _separator = ": ";
	var _mark = "> ";
	
	show_debug_message(_mark + _callerName + _title + _separator + _text);
}
