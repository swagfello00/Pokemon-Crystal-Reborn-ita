	object_const_def
	const VIRIDIANGYM_BLUE
	const VIRIDIANGYM_GYM_GUIDE

ViridianGym_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianGymBlueScript:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .Rematch
	checkflag ENGINE_EARTHBADGE
	iftrue .FightDone
	writetext LeaderBlueBeforeText
	waitbutton
	closetext
	winlosstext LeaderBlueWinText, 0
	loadtrainer BLUE, BLUE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLUE
	opentext
	writetext Text_ReceivedEarthBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_EARTHBADGE
	writetext LeaderBlueAfterText
	waitbutton
	closetext
	end

.FightDone:
	writetext LeaderBlueEpilogueText
	waitbutton
	closetext
	end

.Rematch
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, .FightDone
	checkflag ENGINE_BLUE_REMATCH_DONE
	iftrue .FightDone
	writetext LeaderBlueBeforeRematchText
	waitbutton
	closetext
	winlosstext LeaderBlueRematchText, 0
	loadtrainer BLUE, BLUE1
	startbattle
	reloadmapafterbattle
	setflag ENGINE_BLUE_REMATCH_DONE
	end

ViridianGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .ViridianGymGuideRematchScript
	checkevent EVENT_BEAT_BLUE
	iftrue .ViridianGymGuideWinScript
	writetext ViridianGymGuideText
	waitbutton
	closetext
	end

.ViridianGymGuideWinScript:
	writetext ViridianGymGuideWinText
	waitbutton
	closetext
	end

.ViridianGymGuideRematchScript:
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, .ViridianGymGuideWinScript
	checkflag ENGINE_BLUE_REMATCH_DONE
	iftrue .ViridianGymGuideWinScript
	writetext ViridianGymGuideRematchText
	waitbutton
	closetext
	end

ViridianGymStatue:
	checkflag ENGINE_EARTHBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script

.Beaten:
	gettrainername STRING_BUFFER_4, BLUE, BLUE1
	jumpstd GymStatue2Script

LeaderBlueBeforeText:
	text "BLU: Eccoti"
	line "finalmente!"

	para "A ISOLA CANNELLA"
	line "non ero in vena,"

	para "ora sono pronto"
	line "a lottare con te."

	para "…"

	para "Vuoi dirmi che hai"
	line "conquistato tutte"
	cont "le PALESTRE"
	cont "di JOHTO?"

	para "Beh, allora le"
	line "PALESTRE di JOHTO"
	cont "devono essere"
	cont "proprio patetiche."

	para "No, non ti"
	line "preoccupare."

	para "Capirò quanto vali"
	line "lottando contro di"
	cont "te adesso."

	para "In guardia,"
	line "CAMPIONE di JOHTO!"
	done

LeaderBlueBeforeRematchText:
	text "BLU: Eccoti"
	line "finalmente!"

	para "ora sono pronto"
	line "a lottare con te."

	para "Capirò quanto vali"
	line "lottando contro di"
	cont "te adesso."

	para "In guardia,"
	line "CAMPIONE di JOHTO!"
	done

LeaderBlueWinText:
	text "BLU: Ma come?"

	para "Come ho potuto"
	line "perdere?"

	para "…"

	para "E va bene…"
	line "Prendi questa"
	cont "MEDAGLIA TERRA."
	done

LeaderBlueRematchText:
	text "BLU: Ma come?"

	para "Come ho potuto"
	line "perdere?"
	done

Text_ReceivedEarthBadge:
	text "<PLAYER> riceve"
	line "la MEDAGLIA TERRA."
	done

LeaderBlueAfterText:
	text "BLU: …"

	para "Ok, mi ero"
	line "sbagliato. Sei"

	para "davvero in gamba"
	line "con i #MON!"

	para "Ma un giorno o"
	line "l'altro ti"

	para "batterò: non"
	line "dimenticarlo!"
	done

LeaderBlueEpilogueText:
	text "BLU: Ehi, tu!"

	para "Non perdere fino"
	line "a che non ti avrò"
	cont "battuto io, ok?"
	done

ViridianGymGuideText:
	text "Ehi, CAMPIONE"
	line "in erba!"

	para "Come ti senti?"
	line "Pare che ti vada"
	cont "alla grande!"

	para "Il CAPOPALESTRA di"
	line "qui ha lottato con"

	para "il CAMPIONE"
	line "tre anni fa."

	para "È un osso duro."

	para "Cerca di"
	line "mettercela tutta!"
	done

ViridianGymGuideWinText:
	text "Ah, sei davvero un"
	line "tipo tosto…"

	para "Il tuo è stato"
	line "davvero un pezzo"

	para "di bravura. Ho gli"
	line "occhi lucidi!"
	done

ViridianGymGuideRematchText:
	text "BLU ti sta"
	line "aspettando!"
	
	para "Vuole battersi di"
	line "nuovo con te."
	done

ViridianGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, VIRIDIAN_CITY, 1
	warp_event  5, 17, VIRIDIAN_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, ViridianGymStatue
	bg_event  6, 13, BGEVENT_READ, ViridianGymStatue

	def_object_events
	object_event  5,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianGymBlueScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianGymGuideScript, EVENT_VIRIDIAN_GYM_BLUE
