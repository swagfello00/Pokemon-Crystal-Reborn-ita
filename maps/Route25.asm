	object_const_def
	const ROUTE25_MISTY
	const ROUTE25_COOLTRAINER_M1
	const ROUTE25_YOUNGSTER1
	const ROUTE25_LASS1
	const ROUTE25_YOUNGSTER2
	const ROUTE25_LASS2
	const ROUTE25_YOUNGSTER3
	const ROUTE25_LASS3
	const ROUTE25_SUPER_NERD
	const ROUTE25_COOLTRAINER_M2
	const ROUTE25_POKE_BALL

Route25_MapScripts:
	def_scene_scripts
	scene_script Route25Noop1Scene, SCENE_ROUTE25_NOOP
	scene_script Route25Noop2Scene, SCENE_ROUTE25_MISTYS_DATE

	def_callbacks

TrainerCooltrainermDamian:
	faceplayer
	opentext
	checkevent EVENT_GOT_CHARMANDER
	iftrue .GotCharmander
	checkevent EVENT_KANTO_STARTERS
	iftrue .Cyndaquil
	writetext TakeThisCharmanderText
	yesorno
	iffalse .Refused
	writetext CharmanderImCountingOnYouText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedCharmanderText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke CHARMANDER, 5, BERRY
	setevent EVENT_GOT_CHARMANDER
	writetext CharmanderMayEvolveText
	waitbutton
	closetext
	end

.Cyndaquil
	writetext TakeThisCyndaquilText
	yesorno
	iffalse .Refused
	writetext CharmanderImCountingOnYouText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedCyndaquilText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke CYNDAQUIL, 5, BERRY
	setevent EVENT_GOT_CHARMANDER
	writetext CharmanderMayEvolveText
	waitbutton
	closetext
	end

.NoRoom:
	writetext CharmanderPartyFullText
	waitbutton
	closetext
	end

.Refused:
	writetext NoCharmanderText
	waitbutton
	closetext
	end

.GotCharmander:
	writetext CharmanderPopWontWorkText
	waitbutton
	closetext
	end

Route25Noop1Scene:
	end

Route25Noop2Scene:
	end

Route25MistyDate1Script:
	showemote EMOTE_HEART, ROUTE25_MISTY, 15
	pause 30
	showemote EMOTE_SHOCK, ROUTE25_COOLTRAINER_M1, 10
	turnobject ROUTE25_MISTY, DOWN
	applymovement ROUTE25_COOLTRAINER_M1, Route25MistysDateLeavesMovement1
	disappear ROUTE25_COOLTRAINER_M1
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	turnobject ROUTE25_MISTY, UP
	pause 10
	applymovement ROUTE25_MISTY, Route25MistyApproachesPlayerMovement1
	opentext
	writetext Route25MistyDateText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement ROUTE25_MISTY, Route25MistyLeavesPlayerMovement1
	turnobject PLAYER, LEFT
	applymovement ROUTE25_MISTY, Route25MistyLeavesMovement
	disappear ROUTE25_MISTY
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setscene SCENE_ROUTE25_NOOP
	special RestartMapMusic
	end

Route25MistyDate2Script:
	showemote EMOTE_HEART, ROUTE25_MISTY, 15
	pause 30
	showemote EMOTE_SHOCK, ROUTE25_COOLTRAINER_M1, 10
	turnobject ROUTE25_MISTY, DOWN
	applymovement ROUTE25_COOLTRAINER_M1, Route25MistysDateLeavesMovement2
	disappear ROUTE25_COOLTRAINER_M1
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	turnobject ROUTE25_MISTY, UP
	pause 10
	applymovement ROUTE25_MISTY, Route25MistyApproachesPlayerMovement2
	opentext
	writetext Route25MistyDateText
	waitbutton
	closetext
	turnobject PLAYER, UP
	applymovement ROUTE25_MISTY, Route25MistyLeavesPlayerMovement2
	turnobject PLAYER, LEFT
	applymovement ROUTE25_MISTY, Route25MistyLeavesMovement
	disappear ROUTE25_MISTY
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setscene SCENE_ROUTE25_NOOP
	special RestartMapMusic
	end

TrainerSchoolboyDudley:
	trainer SCHOOLBOY, DUDLEY, EVENT_BEAT_SCHOOLBOY_DUDLEY, SchoolboyDudleySeenText, SchoolboyDudleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyDudleyAfterBattleText
	waitbutton
	closetext
	end

TrainerLassEllen:
	trainer LASS, ELLEN, EVENT_BEAT_LASS_ELLEN, LassEllenSeenText, LassEllenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassEllenAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyJoe:
	trainer SCHOOLBOY, JOE, EVENT_BEAT_SCHOOLBOY_JOE, SchoolboyJoeSeenText, SchoolboyJoeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyJoeAfterBattleText
	waitbutton
	closetext
	end

TrainerLassLaura:
	trainer LASS, LAURA, EVENT_BEAT_LASS_LAURA, LassLauraSeenText, LassLauraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassLauraAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperLloyd:
	trainer CAMPER, LLOYD, EVENT_BEAT_CAMPER_LLOYD, CamperLloydSeenText, CamperLloydBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperLloydAfterBattleText
	waitbutton
	closetext
	end

TrainerLassShannon:
	trainer LASS, SHANNON, EVENT_BEAT_LASS_SHANNON, LassShannonSeenText, LassShannonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassShannonAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdPat:
	trainer SUPER_NERD, PAT, EVENT_BEAT_SUPER_NERD_PAT, SupernerdPatSeenText, SupernerdPatBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdPatAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermKevin:
	faceplayer
	opentext
	checkevent EVENT_BEAT_COOLTRAINERM_KEVIN
	iftrue .AfterBattle
	checkevent EVENT_CLEARED_NUGGET_BRIDGE
	iftrue .AfterNuggetBridge
	writetext CooltrainermKevinNuggetText
	promptbutton
	verbosegiveitem NUGGET
	iffalse .NoRoomForNugget
	setevent EVENT_CLEARED_NUGGET_BRIDGE
.AfterNuggetBridge:
	writetext CooltrainermKevinSeenText
	waitbutton
	closetext
	winlosstext CooltrainermKevinBeatenText, 0
	loadtrainer COOLTRAINERM, KEVIN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_KEVIN
	opentext
.AfterBattle:
	writetext CooltrainermKevinAfterBattleText
	waitbutton
.NoRoomForNugget:
	closetext
	end

BillsHouseSign:
	jumptext BillsHouseSignText

Route25Protein:
	itemball PROTEIN

Route25HiddenPotion:
	hiddenitem POTION, EVENT_ROUTE_25_HIDDEN_POTION

Route25MistysDateLeavesMovement1:
	big_step DOWN
	step_end

Route25MistysDateLeavesMovement2:
	big_step DOWN
	big_step DOWN
	step_end

Route25MistyApproachesPlayerMovement1:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end

Route25MistyApproachesPlayerMovement2:
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end

Route25MistyLeavesPlayerMovement1:
	step DOWN
	step LEFT
	step_end

Route25MistyLeavesPlayerMovement2:
	step UP
	step LEFT
	step_end

Route25MistyLeavesMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

Route25MistyDateText:
	text "MISTY: Ah! Perché"
	line "mai vieni ad"

	para "importunarci"
	line "adesso?"

	para "Sai come si chiama"
	line "una persona come"
	cont "te?"

	para "Una peste! Sì, sei"
	line "una vera peste!"

	para "…"

	para "… Eh? Quelle sono"
	line "MEDAGLIE delle"
	cont "PALESTRE DI JOHTO?"

	para "Ne hai otto, devi"
	line "essere in gamba."

	para "Ok, vieni alla"
	line "PALESTRA di"
	cont "CELESTOPOLI."

	para "Sarò felice di"
	line "sfidarti."

	para "Sono MISTY,"
	line "CAPOPALESTRA di"
	cont "CELESTOPOLI."
	done

SchoolboyDudleySeenText:
	text "Se ci batti tutti"
	line "avrai un premio"
	cont "fantastico!"

	para "Pensi di potercela"
	line "fare?"
	done

SchoolboyDudleyBeatenText:
	text "Uauh! Non male!"
	done

SchoolboyDudleyAfterBattleText:
	text "Ho fatto del mio"
	line "meglio! Pazienza!"
	done

LassEllenSeenText:
	text "Sono la seconda,"
	line "ora si fa sul"
	cont "serio!"
	done

LassEllenBeatenText:
	text "Come ho potuto"
	line "perdere?!"
	done

LassEllenAfterBattleText:
	text "Ho fatto il"
	line "massimo,"
	cont "non ho rimpianti."
	done

SchoolboyJoeSeenText:
	text "Ecco il numero 3!"
	line "Non sarà facile!"
	done

SchoolboyJoeBeatenText:
	text "Ehi, mi hai steso!"
	done

SchoolboyJoeAfterBattleText:
	text "Ho dato il meglio,"
	line "non ho rimpianti."
	done

LassLauraSeenText:
	text "Sono la numero 4!"
	line "Non ce la fai più?"
	done

LassLauraBeatenText:
	text "Ho perso anch'io…"
	done

LassLauraAfterBattleText:
	text "Non potevo fare di"
	line "più: pazienza!"
	done

CamperLloydSeenText:
	text "Ok! Sono il numero"
	line "5 e ti stenderò!"
	done

CamperLloydBeatenText:
	text "Questo è troppo!"
	done

CamperLloydAfterBattleText:
	text "Ho fatto del mio"
	line "meglio! Pazienza!"
	done

LassShannonSeenText:
	text "Sono l'ultima,"
	line "ma sarà dura,"
	cont "te lo assicuro!"
	done

LassShannonBeatenText:
	text "Mi prendi in giro?"
	done

LassShannonAfterBattleText:
	text "È andata: di più"
	line "non potevo fare!"
	done

SupernerdPatSeenText:
	text "Ah ah ah…"

	para "Non c'entro niente"
	line "con gli altri sei"
	cont "allenatori."

	para "Ho aspettato che"
	line "ti stancassi"

	para "un po' prima di"
	line "affrontarti."
	done

SupernerdPatBeatenText:
	text "Non hai neppure"
	line "un po' di"
	cont "stanchezza?"
	done

SupernerdPatAfterBattleText:
	text "Scusa… Non"
	line "imbroglierò più…"
	done

CooltrainermKevinNuggetText:
	text "Le lotte sono"
	line "state più di"

	para "quelle che"
	line "credevi ma hai"
	cont "vinto ugualmente."

	para "Eccoti un premio,"
	line "come promesso."
	done

CooltrainermKevinSeenText:
	text "Dopo averti visto"
	line "lottare, voglio"

	para "vedere come"
	line "me la cavo."

	para "Che ne dici"
	line "di sfidarmi?"
	done

CooltrainermKevinBeatenText:
	text "Non ricordo una"
	line "lotta così bella!"
	done

CooltrainermKevinAfterBattleText:
	text "È stata una"
	line "lotta stupenda!"

	para "Tu e i tuoi #-"
	line "MON siete davvero"
	cont "eccellenti!"
	done

BillsHouseSignText:
	text "MIRAMARE"
	line "CASA DI BILL"
	done

UnusedBillsHouseSignText: ; unreferenced
	text "CASA DI BILL"
	done

TakeThisCharmanderText:
	text "Non sono un bravo"
	line "allenatore."
	
	para "Ti prenderesti"
	line "cura del mio"
	cont "CHARMANDER?"
	
	para "Non riesco proprio"
	line "ad allenarlo."
	
	para "Un allenatore come"
	line "te non avrebbe"
	cont "alcun problema."
	
	para "Lo vuoi?"
	done

TakeThisCyndaquilText:
	text "Non sono un bravo"
	line "allenatore."
	
	para "Ti prenderesti"
	line "cura del mio"
	cont "CYNDAQUIL?"
	
	para "Non riesco proprio"
	line "ad allenarlo."
	
	para "Un allenatore come"
	line "te non avrebbe"
	cont "alcun problema."
	
	para "Lo vuoi?"
	done

CharmanderImCountingOnYouText:
	text "Sapevo che non mi"
	line "avresti deluso!"
	done

ReceivedCharmanderText:
	text "<PLAYER> riceve"
	line "CHARMANDER!"
	done

ReceivedCyndaquilText:
	text "<PLAYER> riceve"
	line "CYNDAQUIL!"
	done

CharmanderMayEvolveText:
	text "Mi raccomando,"
	line "allenalo bene."
	done

CharmanderPartyFullText:
	text "Ah, ma non hai"
	line "posto per altri"
	cont "#MON!"
	done

NoCharmanderText:
	text "Oh… E ora come"
	line "faccio?"
	done

CharmanderPopWontWorkText:
	text "Com'è diventato"
	line "forte?"
	para "Si è evoluto?"
	done

Route25_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 47,  5, BILLS_HOUSE, 1

	def_coord_events
	coord_event 42,  6, SCENE_ROUTE25_MISTYS_DATE, Route25MistyDate1Script
	coord_event 42,  7, SCENE_ROUTE25_MISTYS_DATE, Route25MistyDate2Script

	def_bg_events
	bg_event 45,  5, BGEVENT_READ, BillsHouseSign
	bg_event  4,  5, BGEVENT_ITEM, Route25HiddenPotion

	def_object_events
	object_event 46,  9, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_25_MISTY_BOYFRIEND
	object_event 46, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_25_MISTY_BOYFRIEND
	object_event 12,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyDudley, -1
	object_event 16, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassEllen, -1
	object_event 21,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyJoe, -1
	object_event 22,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassLaura, -1
	object_event 25,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperLloyd, -1
	object_event 28, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassShannon, -1
	object_event 31,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerSupernerdPat, -1
	object_event 37,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerCooltrainermKevin, -1
	object_event 32,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route25Protein, EVENT_ROUTE_25_PROTEIN
	object_event  7,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerCooltrainermDamian, -1