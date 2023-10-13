extends TileMap





func get_world_position_to_map_tile(global_position_reference: Vector2):
	var local_position = self.to_local(global_position_reference)
	var global_positio_to_tile_map = self.local_to_map(local_position)
	
	var final_tile_position = self.map_to_local(global_positio_to_tile_map)
	return(final_tile_position)
