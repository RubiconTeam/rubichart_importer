@tool

class_name RubiChartResourceFormatLoader

extends ResourceFormatLoader

const RbcV1_1_0_0 = preload("res://addons/rubichart_importer/loaders/rbc_1.1.gd")

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
	
	var chart : RubiChart = null
	var extension : String = path.get_extension().to_lower()
	match extension:
		"rbc":
			var version : int = reader.get_32()
			match version:
				_:
					chart = RbcV1_1_0_0.convert(reader)
					
	reader.close()
	return chart

func sign_uint32(unsigned : int):
	return (unsigned + 1 << 31) % 1 << 32 - 1 << 31
