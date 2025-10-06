	object_const_def
	const MAHOGANYGYM_PRYCE
	const MAHOGANYGYM_BEAUTY1
	const MAHOGANYGYM_ROCKER1
	const MAHOGANYGYM_BEAUTY2
	const MAHOGANYGYM_ROCKER2
	const MAHOGANYGYM_ROCKER3
	const MAHOGANYGYM_GYM_GUIDE

MahoganyGym_MapScripts:
	def_scene_scripts

	def_callbacks

MahoganyGymPryceScript:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .Rematch
	checkevent EVENT_BEAT_PRYCE
	iftrue .FightDone
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Impressed, 0
	loadtrainer PRYCE, PRYCE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	opentext
	writetext Text_ReceivedGlacierBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_GLACIERBADGE
	readvar VAR_BADGES
	scall MahoganyGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM16_ICY_WIND
	iftrue PryceScript_Defeat
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_BEAT_BOARDER_RONALD
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	writetext PryceText_GlacierBadgeSpeech
	promptbutton
	verbosegiveitem TM_ICY_WIND
	iffalse MahoganyGym_NoRoomForIcyWind
	setevent EVENT_GOT_TM16_ICY_WIND
	writetext PryceText_IcyWindSpeech
	waitbutton
	closetext
	end

.Rematch
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, .FightDone
	checkflag ENGINE_PRYCE_REMATCH_DONE
	iftrue .FightDone
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Rematch, 0
	loadtrainer PRYCE, PRYCE2
	startbattle
	reloadmapafterbattle
	setflag ENGINE_PRYCE_REMATCH_DONE
	end

PryceScript_Defeat:
	writetext PryceText_CherishYourPokemon
	waitbutton
MahoganyGym_NoRoomForIcyWind:
	closetext
	end

MahoganyGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerSkierRoxanne:
	trainer SKIER, ROXANNE, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierRoxanneAfterBattleText
	waitbutton
	closetext
	end

TrainerSkierClarissa:
	trainer SKIER, CLARISSA, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierClarissaAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderRonald:
	trainer BOARDER, RONALD, EVENT_BEAT_BOARDER_RONALD, BoarderRonaldSeenText, BoarderRonaldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderRonaldAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderBrad:
	trainer BOARDER, BRAD, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderBradAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderDouglas:
	trainer BOARDER, DOUGLAS, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderDouglasAfterBattleText
	waitbutton
	closetext
	end

MahoganyGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .MahoganyGymGuideRematchScript
	checkevent EVENT_BEAT_PRYCE
	iftrue .MahoganyGymGuideWinScript
	writetext MahoganyGymGuideText
	waitbutton
	closetext
	end

.MahoganyGymGuideWinScript:
	writetext MahoganyGymGuideWinText
	waitbutton
	closetext
	end

.MahoganyGymGuideRematchScript:
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, .MahoganyGymGuideWinScript
	checkflag ENGINE_PRYCE_REMATCH_DONE
	iftrue .MahoganyGymGuideWinScript
	writetext MahoganyGymGuideRematchText
	waitbutton
	closetext
	end

MahoganyGymStatue:
	checkflag ENGINE_GLACIERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, PRYCE, PRYCE1
	jumpstd GymStatue2Script

PryceText_Intro:
	text "I #MON fanno"
	line "diverse esperienze"

	para "nella vita,"
	line "proprio come noi."

	para "Anch'io ho visto e"
	line "sofferto molto in"
	cont "vita mia."

	para "Visto che sono più"
	line "anziano, ti mostro"
	cont "cosa intendo."

	para "Vivo con i #MON"
	line "da quando tu non"

	para "eri neppure al"
	line "mondo."

	para "Non perdo tanto"
	line "facilmente."

	para "Ora io, ALFREDO,"
	line "l'allenatore dell'"

	para "inverno, ti mostro"
	line "la mia potenza!"
	done

PryceText_Impressed:
	text "La tua forza mi"
	line "ha impressionato!"

	para "La tua volontà ti"
	line "farà superare ogni"

	para "ostacolo della"
	line "vita."

	para "Meriti la MEDAGLIA"
	line "della PALESTRA!"
	done

PryceText_Rematch:
	text "La tua forza mi"
	line "ha impressionato!"

	para "La tua volontà ti"
	line "farà superare ogni"

	para "ostacolo della"
	line "vita."
	done

Text_ReceivedGlacierBadge:
	text "<PLAYER> riceve la"
	line "MEDAGLIA GELO."
	done

PryceText_GlacierBadgeSpeech:
	text "Questa MEDAGLIA"
	line "è tua!"

	para "permette"
	line "ai tuoi #MON"
	cont "di usare MULINELLO"
	cont "per superare i"
	cont "mulinelli d'acqua."

	para "E poi… Questo"
	line "è un mio regalo."
	done

PryceText_IcyWindSpeech:
	text "La MT contiene"
	line "VENTOGELATO."

	para "Arreca danni e"
	line "diminuisce la"
	cont "velocità."

	para "È il simbolo"
	line "della durezza"
	cont "dell'inverno."
	done

PryceText_CherishYourPokemon:
	text "Quando il ghiaccio"
	line "e la neve si"
	cont "sciolgono è"
	cont "primavera."

	para "Tu e i tuoi #-"
	line "MON sarete insieme"

	para "ancora per molti"
	line "anni."

	para "Goditi il tuo"
	line "tempo con loro!"
	done

BoarderRonaldSeenText:
	text "Congelerò i tuoi"
	line "#MON, così"
	cont "rimarrai immobile!"
	done

BoarderRonaldBeatenText:
	text "Sei tu che mi"
	line "hai bloccato!"
	done

BoarderRonaldAfterBattleText:
	text "Dev'esserci una"
	line "mossa che i #-"
	cont "MON possono usare"
	cont "anche se sono"
	cont "congelati."
	done

BoarderBradSeenText:
	text "Il pavimento della"
	line "PALESTRA è"

	para "scivoloso:"
	line "divertente, eh?"

	para "Sì, ma non siamo"
	line "di certo qui per"
	cont "divertirci!"
	done

BoarderBradBeatenText:
	text "Vuoi vedere quanto"
	line "siamo seri?"
	done

BoarderBradAfterBattleText:
	text "Questa PALESTRA è"
	line "grandiosa: adoro"
	cont "fare snowboard"
	cont "con i #MON!"
	done

BoarderDouglasSeenText:
	text "Conosco il segreto"
	line "di ALFREDO."
	done

BoarderDouglasBeatenText:
	text "Ok. Ti dirò il"
	line "segreto di"
	cont "ALFREDO."
	done

BoarderDouglasAfterBattleText:
	text "Il segreto della"
	line "forza di ALFREDO"
	cont "è questo…"

	para "Medita ogni giorno"
	line "sotto una cascata"

	para "per rinforzare la"
	line "mente e il corpo."
	done

SkierRoxanneSeenText:
	text "Per raggiungere"
	line "ALFREDO, il CAPO-"
	cont "PALESTRA, devi"
	cont "pensare prima di"
	cont "scivolare."
	done

SkierRoxanneBeatenText:
	text "Con gli sci"
	line "ti batterei!"
	done

SkierRoxanneAfterBattleText:
	text "Se non scivoli con"
	line "precisione, non"

	para "farai molta strada"
	line "nella PALESTRA."
	done

SkierClarissaSeenText:
	text "Guarda come curvo"
	line "a sci uniti!"
	done

SkierClarissaBeatenText:
	text "No! Mi hai fatto"
	line "cadere!"
	done

SkierClarissaAfterBattleText:
	text "Non avrei dovuto"
	line "vantarmi di come"
	cont "scio…"
	done

MahoganyGymGuideText:
	text "ALFREDO è un vete-"
	line "rano che si è"

	para "allenato per 50"
	line "anni con i"
	cont "#MON."

	para "Pare che sia abile"
	line "a congelare gli"

	para "avversari con le"
	line "sue mosse di tipo"
	cont "ghiaccio."

	para "Perciò, cerca di"
	line "arrostirlo con la"

	para "tua bruciante"
	line "ambizione!"
	done

MahoganyGymGuideRematchText:
	text "ALFREDO non vede"
	line "l'ora di sfidarti"
	cont "nuovamente."
	
	para "metticela tutta!"
	done

MahoganyGymGuideWinText:
	text "ALFREDO è forte,"
	line "ma tu sei tutta"
	cont "un'altra cosa!"

	para "È stata una"
	line "grande lotta, che"

	para "ha regolato i"
	line "conti tra due"
	cont "generazioni!"
	done

MahoganyGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, MAHOGANY_TOWN, 3
	warp_event  5, 17, MAHOGANY_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, MahoganyGymStatue
	bg_event  6, 15, BGEVENT_READ, MahoganyGymStatue

	def_object_events
	object_event  5,  3, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MahoganyGymPryceScript, -1
	object_event  4,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierRoxanne, -1
	object_event  0, 17, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderRonald, -1
	object_event  9, 17, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierClarissa, -1
	object_event  5,  9, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderBrad, -1
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderDouglas, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyGymGuideScript, -1
