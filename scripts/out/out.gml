/// @function			out()
/// @argument			{any} text?
/// @argument			{any} title?
/// @returns			{string}
/// @description		This function acts as a handler for the built-in show_debug_message() 
///						function with additional usability.
///						The output will provide the name of the object or room calling this
///						function. It can also have a title, but the function can be used without
///						it or any provided text to display.
/// @author				Mtax (github.com/Mtax-Development)
function out()
{
	var _text = ((argument_count > 0) ? string(argument[0]) : "");
	var _title = ((argument_count > 1) ? (" (" + string(argument[1]) + ")") : "");
	
	var _callerName = ((id == 0) ? room_get_name(room) : object_get_name(object_index));
	
	var _mark_section = ": ";
	var _mark_output_start = "> ";
	
	var _string = (_callerName + _title + _mark_section + _text);
	
	show_debug_message(_mark_output_start + _string);
	
	return _string;
}
