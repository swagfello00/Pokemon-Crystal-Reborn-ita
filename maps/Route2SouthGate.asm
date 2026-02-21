Route2SouthGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route2SouthGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 0, VIRIDIAN_FOREST, 1
	warp_event  5, 0, VIRIDIAN_FOREST, 2
	warp_event  4, 7, ROUTE_2, 6
	warp_event  5, 7, ROUTE_2, 6

	def_coord_events

	def_bg_events

	def_object_events