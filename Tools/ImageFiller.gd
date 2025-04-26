@tool
extends EditorScript

const PATH: String = "res://assets/glitch/"
const RESOURCE_PATH: String = "res://Resources/image_files_list.tres"

func _run() -> void:
	var directory: DirAccess = DirAccess.open(PATH)
	var ifl: ImageFilesListResource = ImageFilesListResource.new()
	
	if directory:
		var files: PackedStringArray = directory.get_files()
		for fileName in files:
			ifl.add_file(PATH + fileName)
	
	ResourceSaver.save(ifl,RESOURCE_PATH)
