	object_const_def
	const ROUTE14_POKEFAN_M1
	const ROUTE14_YOUNGSTER
	const ROUTE14_POKEFAN_M2
	const ROUTE14_KIM

Route14_MapScripts:
	def_scene_scripts

	def_callbacks

Kim:
	faceplayer
	opentext
	trade NPC_TRADE_KIM
	waitbutton
	closetext
	end

TrainerPokefanmCarter:
	trainer POKEFANM, CARTER, EVENT_BEAT_POKEFANM_CARTER, PokefanmCarterSeenText, PokefanmCarterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmCarterAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperRoy:
	trainer BIRD_KEEPER, ROY, EVENT_BEAT_BIRD_KEEPER_ROY, BirdKeeperRoySeenText, BirdKeeperRoyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRoyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmTrevor:
	trainer POKEFANM, TREVOR, EVENT_BEAT_POKEFANM_TREVOR, PokefanmTrevorSeenText, PokefanmTrevorBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmTrevorAfterBattleText
	waitbutton
	closetext
	end

PokefanmCarterSeenText:
	text "Lascia che te lo"
	line "dica, è stata dura"

	para "catturare i miei"
	line "preziosi #MON."
	done

PokefanmCarterBeatenText:
	text "Aaah!"
	done

PokefanmCarterAfterBattleText:
	text "WARTORTLE, CHARME-"
	line "LEON e IVYSAUR…"

	para "Questa mi pare una"
	line "squadra"
	cont "bilanciata."
	done

BirdKeeperRoySeenText:
	text "Il mio sogno è"
	line "di volare con i"
	cont "miei #MON"
	cont "uccello."
	done

BirdKeeperRoyBeatenText:
	text "Posso sognare, ma"
	line "non volerò mai…"
	done

BirdKeeperRoyAfterBattleText:
	text "Tu hai dei #MON"
	line "che conoscono la"

	para "MN VOLO, vero?"
	line "Come ti invidio!"
	done

PokefanmTrevorSeenText:
	text "Lo sapevi?"

	para "I #MON sono"
	line "più amichevoli se"

	para "li alleni in un"
	line "luogo che"
	cont "ricordano."
	done

PokefanmTrevorBeatenText:
	text "Dove ho trovato"
	line "questo GOLDUCK?"
	done

PokefanmTrevorAfterBattleText:
	text "Chissà se c'è un"
	line "modo per sapere"

	para "con certezza dove"
	line "ho trovato i miei"
	cont "#MON?"
	done

Route14_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event 11, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmCarter, -1
	object_event 11, 27, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRoy, -1
	object_event  6, 11, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmTrevor, -1
	object_event  7,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 4, Kim, -1
