extends Navigation2D

onready var to_avoid = load("res://Map/Buildings.tres")
onready var Walls = get_node("../Buildings")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#tileuse(Walls, 1)


func tileuse(Tilemap, ID):
	pass
	#var polygon = $NavigationPolygonInstance.get_navigation_polygon()
	#$NavigationPolygonInstance.set_navigation(polygon)
	#var used_wall_tiles = Tilemap.get_used_cells_by_id(ID)
	#for tile in used_wall_tiles:
	#	var newpolygon = PoolVector2Array()
	#	var polygon_offset = Tilemap.map_to_world(tile) - Vector2(Tilemap.get_cell_size()[0]/2, 0)
	#	var tileregion = Tilemap.get_cell_autotile_coord(tile[0], tile[1])
	#	var tiletransform = Tilemap.get_tileset().tile_get_shape_transform(ID, tileregion[0])
	#	var polygon_bp = Tilemap.get_tileset().tile_get_shape(ID,tileregion[0]).get_points()
	#	for vertex in polygon_bp:
	#		vertex += polygon_offset
	#		newpolygon.append(tiletransform.xform(vertex))
	#	polygon.add_outline(newpolygon)
	#polygon.make_polygons_from_outline()
	#$NavigationPolygonInstance.set_navigation_polygon(polygon)
	
	#var polygron_transform = get_node("res://Map/Buildings.tres")
	#var polygon_bp = get_node("res://Map/Buildings.tres")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
