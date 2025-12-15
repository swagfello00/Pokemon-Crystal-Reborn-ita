	object_const_def
	const POKEMONTOWER6F_RARE_CANDY
	const POKEMONTOWER6F_X_ACCURACY

PokemonTower6F_MapScripts:
	def_scene_scripts

	def_callbacks

PokemonTower6FUnownEE:
	checkevent EVENT_EASTER_EGG_BURIEDALIVE_OPEN
	iftrue .end
	opentext
	writetext PokemonTower6FPointsText
	setval UNOWNWORDS_LAST
	special DisplayUnownWords
	setval UNOWNWORDS_MAROWAK
	special DisplayUnownWords
	setval UNOWNWORDS_OVAL_CHARM
	special DisplayUnownWords
	waitsfx
	readmem wPartySpecies + 5
	ifnotequal MAROWAK, .DontPass
	checkitem OVAL_CHARM
	iffalse .DontPass
	setevent EVENT_EASTER_EGG_BURIEDALIVE_OPEN
	playsound SFX_ENTER_DOOR
	closetext
.end
	end

.DontPass:
	writetext PokemonTower6FDontPassText
	waitbutton
	closetext
	applymovement PLAYER, Movement_PokemonTower6FDontPass
	end

PokemonTower6FRareCandy:
	itemball RARE_CANDY

PokemonTower6FXAccuracy:
	itemball X_ACCURACY

Movement_PokemonTower6FDontPass:
	step RIGHT
	step_end

PokemonTower6FDontPassText:
	text "VIA! VATTENE!"
	done

PokemonTower6FPointsText:
	text "…"
	done

PokemonTower6F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 19,  9, LAVENDER_TOWN, 8
	warp_event  9, 16, POKEMON_TOWER_7F, 1

	def_coord_events
	coord_event 10, 16, SCENE_ALWAYS, PokemonTower6FUnownEE
	
	def_bg_events

	def_object_events
	object_event  6,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonTower6FRareCandy, EVENT_POKEMON_TOWER_6F_RARE_CANDY
	object_event 14, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonTower6FXAccuracy, EVENT_POKEMON_TOWER_6F_X_ACCURACY