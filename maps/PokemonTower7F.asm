	object_const_def
	const POKEMONTOWER7F_BURIEDALIVE

PokemonTower7F_MapScripts:
	def_scene_scripts

	def_callbacks

GengarFight:
	waitsfx
	cry GENGAR
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	loadwildmon GENGAR, 50
	startbattle
	disappear POKEMONTOWER7F_BURIEDALIVE
	reloadmapafterbattle
	end

PokemonTower7F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 16, POKEMON_TOWER_6F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 10,  3, SPRITE_GENGAR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, GengarFight, EVENT_POKEMON_TOWER_BURIEDALIVE