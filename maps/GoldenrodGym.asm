	object_const_def
	const GOLDENRODGYM_WHITNEY
	const GOLDENRODGYM_LASS1
	const GOLDENRODGYM_LASS2
	const GOLDENRODGYM_BEAUTY1
	const GOLDENRODGYM_BEAUTY2
	const GOLDENRODGYM_GYM_GUIDE

GoldenrodGym_MapScripts:
	def_scene_scripts
	scene_script GoldenrodGymNoop1Scene, SCENE_GOLDENRODGYM_NOOP
	scene_script GoldenrodGymNoop2Scene, SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING

	def_callbacks

GoldenrodGymNoop1Scene:
	end

GoldenrodGymNoop2Scene:
	end

GoldenrodGymWhitneyScript:
	faceplayer
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .Rematch
	checkevent EVENT_BEAT_WHITNEY
	iftrue .FightDone
	opentext
	writetext WhitneyBeforeText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer WHITNEY, WHITNEY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WHITNEY
	setevent EVENT_MADE_WHITNEY_CRY
	setscene SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING
	setevent EVENT_BEAT_BEAUTY_VICTORIA
	setevent EVENT_BEAT_BEAUTY_SAMANTHA
	setevent EVENT_BEAT_LASS_CARRIE
	setevent EVENT_BEAT_LASS_BRIDGET
.FightDone:
	opentext
	checkevent EVENT_MADE_WHITNEY_CRY
	iffalse .StoppedCrying
	writetext WhitneyYouMeanieText
	waitbutton
	closetext
	end

.StoppedCrying:
	checkevent EVENT_GOT_TM45_ATTRACT
	iftrue .GotAttract
	checkflag ENGINE_PLAINBADGE
	iftrue .GotPlainBadge
	writetext WhitneyWhatDoYouWantText
	promptbutton
	waitsfx
	writetext PlayerReceivedPlainBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_PLAINBADGE
	readvar VAR_BADGES
	scall GoldenrodGymActivateRockets
.GotPlainBadge:
	writetext WhitneyPlainBadgeText
	promptbutton
	verbosegiveitem TM_ATTRACT
	iffalse .NoRoomForAttract
	setevent EVENT_GOT_TM45_ATTRACT
	writetext WhitneyAttractText
	waitbutton
	closetext
	end

.GotAttract:
	writetext WhitneyGoodCryText
	waitbutton
.NoRoomForAttract:
	closetext
	end

.Rematch
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, .FightDone
	checkflag ENGINE_WHITNEY_REMATCH_DONE
	iftrue .FightDone
	opentext
	writetext WhitneyBeforeText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer WHITNEY, WHITNEY2
	startbattle
	reloadmapafterbattle
	setflag ENGINE_WHITNEY_REMATCH_DONE
	end

GoldenrodGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerLassCarrie:
	trainer LASS, CARRIE, EVENT_BEAT_LASS_CARRIE, LassCarrieSeenText, LassCarrieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassCarrieAfterBattleText
	waitbutton
	closetext
	end

WhitneyCriesScript:
	showemote EMOTE_SHOCK, GOLDENRODGYM_LASS2, 15
	applymovement GOLDENRODGYM_LASS2, BridgetWalksUpMovement
	turnobject PLAYER, DOWN
	opentext
	writetext BridgetWhitneyCriesText
	waitbutton
	closetext
	applymovement GOLDENRODGYM_LASS2, BridgetWalksAwayMovement
	setscene SCENE_GOLDENRODGYM_NOOP
	clearevent EVENT_MADE_WHITNEY_CRY
	end

TrainerLassBridget:
	trainer LASS, BRIDGET, EVENT_BEAT_LASS_BRIDGET, LassBridgetSeenText, LassBridgetBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassBridgetAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyVictoria:
	trainer BEAUTY, VICTORIA, EVENT_BEAT_BEAUTY_VICTORIA, BeautyVictoriaSeenText, BeautyVictoriaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyVictoriaAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautySamantha:
	trainer BEAUTY, SAMANTHA, EVENT_BEAT_BEAUTY_SAMANTHA, BeautySamanthaSeenText, BeautySamanthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautySamanthaAfterBattleText
	waitbutton
	closetext
	end

GoldenrodGymGuideScript:
	faceplayer
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .GoldenrodGymGuideRematchScript
	checkevent EVENT_BEAT_WHITNEY
	iftrue .GoldenrodGymGuideWinScript
	opentext
	writetext GoldenrodGymGuideText
	waitbutton
	closetext
	end

.GoldenrodGymGuideWinScript:
	opentext
	writetext GoldenrodGymGuideWinText
	waitbutton
	closetext
	end

.GoldenrodGymGuideRematchScript:
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, .GoldenrodGymGuideWinScript
	checkflag ENGINE_WHITNEY_REMATCH_DONE
	iftrue .GoldenrodGymGuideWinScript
	opentext
	writetext GoldenrodGymGuideRematchText
	waitbutton
	closetext
	end

GoldenrodGymStatue:
	checkflag ENGINE_PLAINBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, WHITNEY, WHITNEY1
	jumpstd GymStatue2Script

BridgetWalksUpMovement:
	step LEFT
	turn_head UP
	step_end

BridgetWalksAwayMovement:
	step RIGHT
	turn_head LEFT
	step_end

WhitneyBeforeText:
	text "Ciao, sono CHIARA!"

	para "Tutti sono nel"
	line "mondo dei #MON,"
	cont "così ci sono"
	cont "entrata anch'io."

	para "I #MON sono"
	line "carinissimi!"

	para "Vuoi lottare? Sono"
	line "forte, t'avverto!"
	done

WhitneyShouldntBeSoSeriousText:
	text "Sigh…"

	para "… Ueeeh!"
	line "Che cattiveria!"

	para "Io stavo solo"
	line "scherzando! Come"
	cont "sei suscettibile!"
	done

WhitneyYouMeanieText:
	text "Ueeeh!"

	para "Ueeeh!"

	para "… Sigh, sigh…"
	line "… Che rabbia!"
	done

WhitneyWhatDoYouWantText:
	text "… Sigh…"

	para "Che vuoi ancora?"
	line "Una MEDAGLIA?"

	para "Ah, dimenticavo."
	line "Eccoti la MEDAGLIA"
	cont "PIANA."
	done

PlayerReceivedPlainBadgeText:
	text "<PLAYER> riceve la"
	line "MEDAGLIA PIANA."
	done

WhitneyPlainBadgeText:
	text "Con la MEDAGLIA"
	line "PIANA i #MON"

	para "possono usare"
	line "FORZA anche fuori"
	cont "dalla lotta."

	para "Ho ancora qualcosa"
	line "per te: tieni!"
	done

WhitneyAttractText:
	text "È ATTRAZIONE."
	line "Serve per"

	para "sfruttare appieno "
	line "il fascino dei"
	cont "#MON."

	para "Si addice ad una"
	line "carina come me,"
	cont "vero?"
	done

WhitneyGoodCryText:
	text "Piangere mi ha"
	line "fatto bene! Torna"

	para "a farmi visita, mi"
	line "raccomando!"
	done

LassCarrieSeenText:
	text "Non pensare che il"
	line "mio #MON sia"

	para "debole solo perché"
	line "è così carino!"
	done

LassCarrieBeatenText:
	text "Ehi… Ti avevo"
	line "sottovalutato…"
	done

LassCarrieAfterBattleText:
	text "Chissà se il mio"
	line "#MON mi"
	cont "trova carina?"
	done

LassBridgetSeenText:
	text "Preferisco i"
	line "#MON carini a"
	cont "quelli forti."

	para "Ma io ho #MON"
	line "forti e carini."
	done

LassBridgetBeatenText:
	text "Oh, no, no, no!"
	done

LassBridgetAfterBattleText:
	text "Provo a battere"
	line "CHIARA, ma…"
	cont "È deprimente."

	para "Però sono forte."
	line "Se perdo, dovrò"

	para "solo impegnarmi"
	line "di più!"
	done

BridgetWhitneyCriesText:
	text "Oh, no. Hai fatto"
	line "piangere CHIARA."

	para "Ma non è niente,"
	line "presto starà"

	para "meglio. Fa sempre"
	line "così quando perde."
	done

BeautyVictoriaSeenText:
	text "Sei una persona"
	line "davvero simpatica!"

	para "Ma non mi farò"
	line "intenerire!"
	done

BeautyVictoriaBeatenText:
	text "Vediamo… Oh,"
	line "è già finita?"
	done

BeautyVictoriaAfterBattleText:
	text "Uauh, ma allora"
	line "sei forte!"
	cont "Continua così!"
	done

BeautySamanthaSeenText:
	text "Vedi d'impegnarti,"
	line "o ti distruggerò!"
	done

BeautySamanthaBeatenText:
	text "No! Oh, MEOWTH,"
	line "mi dispiace!"
	done

BeautySamanthaAfterBattleText:
	text "Al mio MEOWTH ho"
	line "insegnato mosse"
	cont "per tener testa a"

	para "qualsiasi tipo."
	done

GoldenrodGymGuideText:
	text "Ehi, CAMPIONE in"
	line "erba!"

	para "Questa PALESTRA è"
	line "per allenatori di"
	cont "#MON di tipo"
	cont "normale."

	para "Ti raccomando di"
	line "usare #MON di"
	cont "tipo lotta."
	done

GoldenrodGymGuideWinText:
	text "Hai vinto? Grande!"
	line "Io ero occupato ad"
	cont "ammirare queste"
	cont "signorine."
	done

GoldenrodGymGuideRematchText:
	text "CHIARA oggi è più"
	line "agguerrita che"
	cont "mai!"
	
	para "Sfidala di nuovo,"
	line "coraggio!"
	done

GoldenrodGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 17, GOLDENROD_CITY, 1
	warp_event  3, 17, GOLDENROD_CITY, 1

	def_coord_events
	coord_event  8,  5, SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING, WhitneyCriesScript

	def_bg_events
	bg_event  1, 15, BGEVENT_READ, GoldenrodGymStatue
	bg_event  4, 15, BGEVENT_READ, GoldenrodGymStatue

	def_object_events
	object_event  8,  3, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGymWhitneyScript, -1
	object_event  9, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerLassCarrie, -1
	object_event  9,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassBridget, -1
	object_event  0,  2, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyVictoria, -1
	object_event 19,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautySamantha, -1
	object_event  5, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGymGuideScript, -1
