@tool
extends EditorPlugin

var editor_settings : EditorSettings

func _enter_tree() -> void:
	editor_settings = EditorInterface.get_editor_settings()
	
	var txt_extensions : Array = Array((editor_settings.get_setting("docks/filesystem/textfile_extensions") as String).split(","))
	if not txt_extensions.has("trbc"):
		txt_extensions.push_back("trbc")
	var txt_ext_str : String = ""
	for txt_ext in txt_extensions:
		if not (txt_ext as String).is_empty():
			txt_ext_str += txt_ext + ","
	editor_settings.set_setting("docks/filesystem/textfile_extensions", txt_ext_str)
	
	var extensions : Array = Array((editor_settings.get_setting("docks/filesystem/other_file_extensions") as String).split(","))
	if not extensions.has("rbc"):
		extensions.push_back("rbc")
	var ext_str : String = ""
	for ext in extensions:
		if not (ext as String).is_empty():
			ext_str += ext + ","
	editor_settings.set_setting("docks/filesystem/other_file_extensions", ext_str)

func _exit_tree() -> void:
	var txt_extensions : Array = Array((editor_settings.get_setting("docks/filesystem/textfile_extensions") as String).split(","))
	txt_extensions.erase("trbc")
	var txt_ext_str : String = ""
	for txt_ext in txt_extensions:
		if not (txt_ext as String).is_empty():
			txt_ext_str += txt_ext + ","
	editor_settings.set_setting("docks/filesystem/textfile_extensions", txt_ext_str)
	
	var extensions : Array = Array((editor_settings.get_setting("docks/filesystem/other_file_extensions") as String).split(","))
	extensions.erase("rbc")
	var ext_str : String = ""
	for ext in extensions:
		if not (ext as String).is_empty():
			ext_str += ext + ","
	editor_settings.set_setting("docks/filesystem/other_file_extensions", ext_str)
