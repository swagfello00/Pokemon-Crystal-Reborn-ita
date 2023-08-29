	object_const_def
	const OLIVINEGYM_JASMINE
	const OLIVINEGYM_GYM_GUIDE

OlivineGym_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineGymJasmineScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JASMINE
	iftrue .FightDone
	writetext Jasmine_SteelTypeIntro
	waitbutton
	closetext
	winlosstext Jasmine_BetterTrainer, 0
	loadtrainer JASMINE, JASMINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
	opentext
	writetext Text_ReceivedMineralBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE
	readvar VAR_BADGES
	scall OlivineGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM23_IRON_TAIL
	iftrue .GotIronTail
	writetext Jasmine_BadgeSpeech
	promptbutton
	verbosegiveitem TM_IRON_TAIL
	iffalse .NoRoomForIronTail
	setevent EVENT_GOT_TM23_IRON_TAIL
	writetext Jasmine_IronTailSpeech
	waitbutton
	closetext
	end

.GotIronTail:
	writetext Jasmine_GoodLuck
	waitbutton
.NoRoomForIronTail:
	closetext
	end

OlivineGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

OlivineGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_JASMINE
	iftrue .OlivineGymGuideWinScript
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iffalse .OlivineGymGuidePreScript
	opentext
	writetext OlivineGymGuideText
	waitbutton
	closetext
	end

.OlivineGymGuideWinScript:
	opentext
	writetext OlivineGymGuideWinText
	waitbutton
	closetext
	end

.OlivineGymGuidePreScript:
	opentext
	writetext OlivineGymGuidePreText
	waitbutton
	closetext
	end

OlivineGymStatue:
	checkflag ENGINE_MINERALBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, JASMINE, JASMINE1
	jumpstd GymStatue2Script

Jasmine_SteelTypeIntro:
	text "Grazie per il"
	line "tuo aiuto al FARO…"

	para "Ora però mi vedrai"
	line "in un'altra veste!"

	para "Lascia che mi"
	line "presenti."

	para "Sono JASMINE,"
	line "CAPOPALESTRA del"
	cont "tipo acciaio."

	para "Conosci il tipo"
	line "acciaio?"

	para "È stato scoperto"
	line "da poco."

	para "Dai, lottiamo!"
	done

Jasmine_BetterTrainer:
	text "Tu mi superi"
	line "sia come capacità"

	para "che come"
	line "gentilezza."

	para "Secondo le regole"
	line "della LEGA, ti"

	para "conferisco questa"
	line "MEDAGLIA."
	done

Text_ReceivedMineralBadge:
	text "<PLAYER> riceve la"
	line "MEDAGLIA MINERALE."
	done

Jasmine_BadgeSpeech:
	text "La MEDAGLIA MINE-"
	line "RALE migliora"
	cont "la DIFESA."

	para "…Ehm… Prendi"
	line "anche questo…"
	done

Text_ReceivedTM09: ; unreferenced
	text "<PLAYER> riceve"
	line "MT09."
	done

Jasmine_IronTailSpeech:
	text "Con questa MT"
	line "puoi insegnare"
	cont "CODACCIAIO."
	done

Jasmine_GoodLuck:
	text "Ehm… Non so come"
	line "dirlo, ma buona"
	cont "fortuna…"
	done

OlivineGymGuideText:
	text "JASMINE usa un"
	line "tipo appena"
	cont "scoperto: acciaio."

	para "Non ne so molto."
	done

OlivineGymGuideWinText:
	text "Incredibile il"
	line "tipo acciaio, eh?"
	cont "Un incontro"

	para "ravvicinato di non"
	line "saprei quale tipo!"
	done

OlivineGymGuidePreText:
	text "JASMINE, il CAPO-"
	line "PALESTRA, è al"
	cont "FARO."

	para "Sta curando un"
	line "#MON ammalato."

	para "Un forte allenato-"
	line "re deve avere"
	cont "compassione."
	done

OlivineGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, OLIVINE_CITY, 2
	warp_event  5, 15, OLIVINE_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, OlivineGymStatue
	bg_event  6, 13, BGEVENT_READ, OlivineGymStatue

	def_object_events
	object_event  5,  3, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymJasmineScript, EVENT_OLIVINE_GYM_JASMINE
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymGuideScript, -1
