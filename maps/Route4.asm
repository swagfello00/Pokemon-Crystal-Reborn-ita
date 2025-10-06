	object_const_def
	const ROUTE4_YOUNGSTER
	const ROUTE4_LASS1
	const ROUTE4_LASS2
	const ROUTE4_POKE_BALL1

Route4_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBirdKeeperHank:
	trainer BIRD_KEEPER, HANK, EVENT_BEAT_BIRD_KEEPER_HANK, BirdKeeperHankSeenText, BirdKeeperHankBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperHankAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHope:
	trainer PICNICKER, HOPE, EVENT_BEAT_PICNICKER_HOPE, PicnickerHopeSeenText, PicnickerHopeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHopeAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerSharon:
	trainer PICNICKER, SHARON, EVENT_BEAT_PICNICKER_SHARON, PicnickerSharonSeenText, PicnickerSharonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerSharonAfterBattleText
	waitbutton
	closetext
	end

MtMoonSquareSign:
	jumptext MtMoonSquareSignText

Route4HPUp:
	itemball HP_UP

Route4HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_4_HIDDEN_ULTRA_BALL

BirdKeeperHankSeenText:
	text "Sto facendo"
	line "crescere i miei"
	cont "#MON. Vuoi"
	cont "lottare?"
	done

BirdKeeperHankBeatenText:
	text "Stavolta ho perso…"
	done

BirdKeeperHankAfterBattleText:
	text "Per far salire il"
	line "livello di un"

	para "#MON, fallo"
	line "entrare per primo"

	para "nella lotta, e"
	line "sostituiscilo"
	cont "immediatamente."

	para "È il miglior modo,"
	line "credimi."
	done

PicnickerHopeSeenText:
	text "Sento che vincerò"
	line "io."

	para "Vediamo se ho"
	line "ragione!"
	done

PicnickerHopeBeatenText:
	text "Aaah, sei troppo"
	line "forte!"
	done

PicnickerHopeAfterBattleText:
	text "Dicono che sul"
	line "MONTELUNA ci siano"
	cont "dei CLEFAIRY."

	para "Ma dove potranno"
	line "essere?"
	done

PicnickerSharonSeenText:
	text "Ehm…"
	line "Io…"
	done

PicnickerSharonBeatenText:
	text "<……>"
	done

PicnickerSharonAfterBattleText:
	text "…… Andrò ad"
	line "allenarmi ancora…"
	done

MtMoonSquareSignText:
	text "PIAZZA MONTELUNA"
	line "Salire le scale."
	done

Route4_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, MOUNT_MOON, 2

	def_coord_events

	def_bg_events
	bg_event  3,  9, BGEVENT_READ, MtMoonSquareSign
	bg_event 10,  5, BGEVENT_ITEM, Route4HiddenUltraBall

	def_object_events
	object_event 17, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperHank, -1
	object_event 11, 10, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerPicnickerHope, -1
	object_event 21,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerPicnickerSharon, -1
	object_event 26,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route4HPUp, EVENT_ROUTE_4_HP_UP
	object_event 40,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCaveEntranceGuyScript, EVENT_OPENED_MT_SILVER