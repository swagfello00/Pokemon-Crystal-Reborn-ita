	object_const_def
	const CIANWOODPOKECENTER1F_NURSE
	const CIANWOODPOKECENTER1F_LASS
	const CIANWOODPOKECENTER1F_GYM_GUIDE
	const CIANWOODPOKECENTER1F_SUPER_NERD

CianwoodPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CianwoodPokecenter1FLassScript:
	jumptextfaceplayer CianwoodPokecenter1FLassText

CianwoodGymGuideScript:
	faceplayer
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .CianwoodGymGuideRematchScript
	checkevent EVENT_BEAT_CHUCK
	iftrue .CianwoodGymGuideWinScript
	opentext
	writetext CianwoodGymGuideText
	waitbutton
	closetext
	end

.CianwoodGymGuideWinScript:
	opentext
	writetext CianwoodGymGuideWinText
	waitbutton
	closetext
	end

.CianwoodGymGuideRematchScript:
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, .CianwoodGymGuideWinScript
	checkflag ENGINE_CHUCK_REMATCH_DONE
	iftrue .CianwoodGymGuideWinScript
	writetext CianwoodGymGuideRematchText
	waitbutton
	closetext
	end

CianwoodPokecenter1FSuperNerdScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer CianwoodPokecenter1FPreMobileText
	
.mobile
	jumptextfaceplayer CianwoodPokecenter1FMobileText

CianwoodPokecenter1FLassText:
	text "Hai visto il"
	line "#FANATICO?"

	para "Sta sempre a"
	line "vantarsi dei suoi"
	cont "#MON rari."
	done

CianwoodGymGuideText:
	text "Gli allenatori di"
	line "questa PALESTRA"
	cont "sono prepotenti."

	para "Se mi vedono in"
	line "giro potrebbero"
	cont "attaccarmi."

	para "Un consiglio: il"
	line "CAPOPALESTRA usa"

	para "#MON di tipo"
	line "lotta."

	para "Perciò, confondilo"
	line "con #MON di"
	cont "tipo psico."

	para "Togli di mezzo i"
	line "suoi #MON prima"

	para "che possano usare"
	line "la forza fisica."

	para "Inoltre, dovrai"
	line "spostare in modo"
	cont "corretto i massi"
	cont "che si trovano"
	cont "nella PALESTRA."

	para "Se fai un errore,"
	line "esci e rientra."
	done

CianwoodGymGuideWinText:
	text "Hai vinto,"
	line "<PLAYER>! Te lo si"
	cont "legge in faccia!"
	done

CianwoodPokecenter1FPreMobileText: ; unreferenced
	text "Non hai voglia di"
	line "mostrare i #MON"

	para "a tutti i tuoi"
	line "amici?"

	para "Vorrei mostrare il"
	line "#MON che ho"

	para "allenato ad un"
	line "mio amico di"
	cont "VIOLAPOLI."
	done

CianwoodPokecenter1FMobileText: ; unreferenced
	text "Ho lottato con un"
	line "mio amico in link"

	para "a VIOLAPOLI"
	line "utilizzando un"
	cont "ADATTATORE MOBILE."

	para "Sono a 5-7 contro"
	line "di lui. Devo"
	cont "darci dentro!"
	done

CianwoodPokecenter1FSuperNerdText:
	text "Mi piace mostrare"
	line "i #MON che ho"

	para "fatto crescere."
	line "Anche a te?"

	para "Penso che mostrerò"
	line "i miei #MON in"

	para "un bel po' di"
	line "lotte!"
	done

CianwoodGymGuideRematchText:
  text "FURIO ti sta"
  line "aspettando."
  
  para "Affrontalo di"
  line "nuovo con tutta la"
  cont "forza che hai!"
  done

CianwoodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, CIANWOOD_CITY, 3
	warp_event  4,  7, CIANWOOD_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FLassScript, -1
	object_event  5,  3, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodGymGuideScript, -1
	object_event  8,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FSuperNerdScript, -1
