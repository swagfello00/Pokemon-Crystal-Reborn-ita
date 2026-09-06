	object_const_def
	const LAVENDERTOWN_POKEFAN_M
	const LAVENDERTOWN_TEACHER
	const LAVENDERTOWN_GRAMPS
	const LAVENDERTOWN_YOUNGSTER
	const LAVENDERTOWN_POKEBALL1

LavenderTown_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, LavenderTownFlypointCallback
	callback MAPCALLBACK_TILES, LavenderTownSilphScopeCallback

LavenderTownFlypointCallback:
	setflag ENGINE_FLYPOINT_LAVENDER
	endcallback

LavenderTownSilphScopeCallback:
	checkitem SILPH_SCOPE
	iftrue .end
	changeblock 18, 2, $91
.end
	endcallback

LavenderTownPokefanMScript:
	jumptextfaceplayer LavenderTownPokefanMText

LavenderTownTeacherScript:
	jumptextfaceplayer LavenderTownTeacherText

LavenderTownGrampsScript:
	jumptextfaceplayer LavenderTownGrampsText

LavenderTownYoungsterScript:
	jumptextfaceplayer LavenderTownYoungsterText

LavenderTownSign:
	jumptext LavenderTownSignText

KantoRadioStationSign:
	jumptext KantoRadioStationSignText

VolunteerPokemonHouseSign:
	jumptext VolunteerPokemonHouseSignText

SoulHouseSign:
	jumptext SoulHouseSignText

LavenderPokecenterSignText:
	jumpstd PokecenterSignScript

LavenderMartSignText:
	jumpstd MartSignScript

LavenderTownPolkadotBow:
	itemball POLKADOT_BOW

LavenderSilphScopeScript:
	jumptext LavenderSilphScopeText

LavenderTownPokefanMText:
	text "È un grande"
	line "edificio, vero?"

	para "È la TORRE RADIO"
	line "di KANTO."
	done

LavenderTownTeacherText:
	text "Molte trasmissioni"
	line "sono ben fatte."
	done

LavenderTownGrampsText:
	text "Vengono da ogni"
	line "parte del mondo"

	para "per onorare le"
	line "anime dei #MON"
	cont "scomparsi."
	done

LavenderTownYoungsterText:
	text "Per svegliare i"
	line "#MON ti serve"
	cont "un # FLAUTO."

	para "Un allenatore non"
	line "può non saperlo!"
	done

LavenderTownSignText:
	text "LAVANDONIA"

	para "Nobile città"
	line "viola."
	done

KantoRadioStationSignText:
	text "STAZIONE RADIO"
	line "di KANTO"

	para "I vostri programmi"
	line "preferiti in onda"
	cont "giorno e notte!"
	done

VolunteerPokemonHouseSignText:
	text "CASA VOLONTARIA"
	line "#MON di"
	cont "LAVANDONIA."
	done

SoulHouseSignText:
	text "CASA dell'ANIMA"

	para "Che le anime dei"
	line "#MON riposino"
	cont "in pace"
	done

LavenderSilphScopeText:
	text "Per entrare in"
	line "questo luogo è"
	cont "necessaria la"
	cont "SPETTROSONDA."
	done

LavenderTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, LAVENDER_POKECENTER_1F, 1
	warp_event  5, 11, MR_FUJIS_HOUSE, 1
	warp_event  3, 15, LAVENDER_SPEECH_HOUSE, 1
	warp_event  7, 15, LAVENDER_NAME_RATER, 1
	warp_event  1,  7, LAVENDER_MART, 2
	warp_event 13, 13, SOUL_HOUSE, 1
	warp_event 14,  7, LAV_RADIO_TOWER_1F, 1
	warp_event 18,  2, POKEMON_TOWER_6F, 1

	def_coord_events

	def_bg_events
	bg_event 11,  5, BGEVENT_READ, LavenderTownSign
	bg_event 15,  9, BGEVENT_READ, KantoRadioStationSign
	bg_event  3, 11, BGEVENT_READ, VolunteerPokemonHouseSign
	bg_event 15, 15, BGEVENT_READ, SoulHouseSign
	bg_event  6,  7, BGEVENT_READ, LavenderPokecenterSignText
	bg_event  2,  7, BGEVENT_READ, LavenderMartSignText
	bg_event 17,  2, BGEVENT_READ, LavenderSilphScopeScript

	def_object_events
	object_event 12,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderTownPokefanMScript, -1
	object_event  2, 17, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavenderTownTeacherScript, -1
	object_event 14, 14, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderTownGrampsScript, -1
	object_event  6, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 1, LavenderTownYoungsterScript, -1
	object_event 18,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LavenderTownPolkadotBow, EVENT_LAVENDER_TOWN_POLKADOT_BOW
