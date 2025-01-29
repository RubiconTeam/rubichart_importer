@tool
extends EditorPlugin

const RubiChartPopupMenu = preload("res://addons/rubichart_importer/scenes/rubichart_popup.tscn")

var rubichart_popup_instance : PopupMenu

func _enter_tree() -> void:
	#rubichart_popup_instance = RubiChartPopupMenu.instantiate()
	#add_tool_submenu_item("RubiChart", rubichart_popup_instance)
	pass

func _exit_tree() -> void:
	#remove_tool_menu_item("RubiChart")
	pass
