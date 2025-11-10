	object_const_def
	const POWERPLANT2F_POKE_BALL1
	const POWERPLANT2F_POKE_BALL2
	const POWERPLANT2F_ZAPDOS
	const POWERPLANT2F_ELECTRODE1
	const POWERPLANT2F_ELECTRODE2
	const POWERPLANT2F_ELECTRODE3
	const POWERPLANT2F_ELECTRODE4
	const POWERPLANT2F_CARBOS
	const POWERPLANT2F_ELECTRODE5
	const POWERPLANT2F_ELECTRODE6
	const POWERPLANT2F_MAX_POTION
	const POWERPLANT2F_TM25
	const POWERPLANT2F_ELECTRODE7
	const POWERPLANT2F_ELECTRODE8
	const POWERPLANT2F_LIGHT_BALL

PowerPlant2F_MapScripts:
	def_scene_scripts

	def_callbacks

PowerPlant2FHpUp:
	itemball HP_UP

PowerPlant2FRareCandy:
	itemball RARE_CANDY

ZapdosFight:
	loadmem wBuffer1, 0
	faceplayer
	opentext
	writetext RocktunnelB1FZapdosText
	pause 15
	cry ZAPDOS
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	loadwildmon ZAPDOS, 50
	startbattle
	disappear POWERPLANT2F_ZAPDOS
	reloadmapafterbattle
	readmem wBuffer1
	ifnotequal ZAPDOS, .end
	setevent EVENT_CAUGHT_ZAPDOS
.end
	end

PowerPlant2FElectrode1Fight:
	cry ELECTRODE
	loadwildmon ELECTRODE, 43
	startbattle
	disappear POWERPLANT2F_ELECTRODE1
	reloadmapafterbattle
	end

PowerPlant2FElectrode2Fight:
	cry ELECTRODE
	loadwildmon ELECTRODE, 43
	startbattle
	disappear POWERPLANT2F_ELECTRODE2
	reloadmapafterbattle
	end

PowerPlant2FElectrode3Fight:
	cry ELECTRODE
	loadwildmon ELECTRODE, 43
	startbattle
	disappear POWERPLANT2F_ELECTRODE3
	reloadmapafterbattle
	end

PowerPlant2FElectrode4Fight:
	cry ELECTRODE
	loadwildmon ELECTRODE, 43
	startbattle
	disappear POWERPLANT2F_ELECTRODE4
	reloadmapafterbattle
	end

PowerPlant2FCarbos:
	itemball CARBOS

PowerPlant2FElectrode5Fight:
	cry ELECTRODE
	loadwildmon ELECTRODE, 43
	startbattle
	disappear POWERPLANT2F_ELECTRODE5
	reloadmapafterbattle
	end

PowerPlant2FElectrode6Fight:
	cry ELECTRODE
	loadwildmon ELECTRODE, 43
	startbattle
	disappear POWERPLANT2F_ELECTRODE6
	reloadmapafterbattle
	end

PowerPlant2FMaxPotion:
	itemball MAX_POTION
	
PowerPlant2FTM25:
	itemball TM_THUNDER

PowerPlant2FElectrode7Fight:
	cry ELECTRODE
	loadwildmon ELECTRODE, 43
	startbattle
	disappear POWERPLANT2F_ELECTRODE7
	reloadmapafterbattle
	end

PowerPlant2FElectrode8Fight:
	cry ELECTRODE
	loadwildmon ELECTRODE, 43
	startbattle
	disappear POWERPLANT2F_ELECTRODE8
	reloadmapafterbattle
	end

PowerPlant2FLightBall:
	itemball LIGHT_BALL

PowerPlant2FHiddenPpUp:
	hiddenitem PP_UP, EVENT_POWER_PLANT_2F_HIDDEN_PP_UP

PowerPlant2FHiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_POWER_PLANT_2F_HIDDEN_MAX_ELIXER

RocktunnelB1FZapdosText:
	text "Gyaooh!"
	done

PowerPlant2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0, 11, ROUTE_10_NORTH, 3
	warp_event 39, 12, ROUTE_10_NORTH, 4

	def_coord_events

	def_bg_events
	bg_event 12,  1, BGEVENT_ITEM, PowerPlant2FHiddenPpUp
	bg_event 17, 16, BGEVENT_ITEM, PowerPlant2FHiddenMaxElixer

	def_object_events
	object_event 28,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PowerPlant2FHpUp, EVENT_POWER_PLANT_2F_HP_UP
	object_event 34,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PowerPlant2FRareCandy, EVENT_POWER_PLANT_2F_RARE_CANDY
	object_event  4,  9, SPRITE_ZAPDOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ZapdosFight, EVENT_ROCK_TUNNEL_B1F_ZAPDOS
	object_event 21, 14, SPRITE_ELECTRODE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlant2FElectrode1Fight, EVENT_POWER_PLANT_2F_ELECTRODE_1
	object_event 25, 18, SPRITE_ELECTRODE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlant2FElectrode2Fight, EVENT_POWER_PLANT_2F_ELECTRODE_2
	object_event 32, 18, SPRITE_ELECTRODE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlant2FElectrode3Fight, EVENT_POWER_PLANT_2F_ELECTRODE_3
	object_event  9, 20, SPRITE_ELECTRODE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlant2FElectrode4Fight, EVENT_POWER_PLANT_2F_ELECTRODE_4
	object_event  7, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PowerPlant2FCarbos, EVENT_POWER_PLANT_2F_CARBOS
	object_event 21, 25, SPRITE_ELECTRODE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlant2FElectrode5Fight, EVENT_POWER_PLANT_2F_ELECTRODE_5
	object_event 26, 28, SPRITE_ELECTRODE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlant2FElectrode6Fight, EVENT_POWER_PLANT_2F_ELECTRODE_6
	object_event 20, 32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PowerPlant2FMaxPotion, EVENT_POWER_PLANT_2F_MAX_POTION
	object_event 26, 32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PowerPlant2FTM25, EVENT_POWER_PLANT_2F_TM_THUNDER
	object_event 37, 32, SPRITE_ELECTRODE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlant2FElectrode7Fight, EVENT_POWER_PLANT_2F_ELECTRODE_7
	object_event 23, 34, SPRITE_ELECTRODE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlant2FElectrode8Fight, EVENT_POWER_PLANT_2F_ELECTRODE_8
	object_event  4, 34, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PowerPlant2FLightBall, EVENT_ROUTE_10_NORTH_LIGHT_BALL
	