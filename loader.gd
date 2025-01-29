@tool

class_name RbcResourceFormatLoader

extends ResourceFormatLoader

func _get_recognized_extensions() -> PackedStringArray:
	return PackedStringArray(["rbc"])

func _get_resource_type(path: String) -> String:
	if path.get_extension().to_lower() == "rbc":
		return "Resource"
		
	return ""

func _handles_type(type: StringName) -> bool:
	return ClassDB.is_parent_class(type, "Resource")

func _load(path: String, original_path: String, use_sub_threads: bool, cache_mode: int):
	var reader : FileAccess = FileAccess.open(path, FileAccess.READ)
	var error : Error = reader.get_error()
	if error != OK:
		return error
	
	var bytes : PackedByteArray = reader.get_buffer(reader.get_length())
	reader.close()
	
	var chart : RubiChart = RubiChart.new()
	chart.LoadBytes(bytes)	
	return chart
