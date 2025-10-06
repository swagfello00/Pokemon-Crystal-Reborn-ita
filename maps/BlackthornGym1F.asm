	object_const_def
	const BLACKTHORNGYM1F_CLAIR
	const BLACKTHORNGYM1F_COOLTRAINER_M1
	const BLACKTHORNGYM1F_COOLTRAINER_M2
	const BLACKTHORNGYM1F_COOLTRAINER_F
	const BLACKTHORNGYM1F_GYM_GUIDE
	const BLACKTHORNGYM1F_BOULDER1

BlackthornGym1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, BlackthornGym1FBouldersCallback
	callback MAPCALLBACK_CMDQUEUE, BlackthornGym1FSetUpStoneTableCallback

BlackthornGym1FSetUpStoneTableCallback:
	writecmdqueue .CommandQueue
	endcallback

.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

.StoneTable:
	stonetable 8, BLACKTHORNGYM1F_BOULDER1, .Boulder1
	db -1 ; end

.Boulder1:
	disappear BLACKTHORNGYM1F_BOULDER1
	sjump .Fall

.Fall:
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_2
	iftrue .placeboth
	changeblock 2, 4, $40 ; fallen boulder 3
	sjump .skip4
.placeboth
	changeblock 2, 4, $41 ; fallen boulder 4
.skip4
  refreshscreen
	reloadmappart
	end

BlackthornGym1FBouldersCallback:
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_1
	iffalse .skip1
	changeblock 8, 2, $3b ; fallen boulder 2
.skip1
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_2
	iffalse .skip2
	changeblock 2, 4, $3a ; fallen boulder 1
.skip2
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_3
	iffalse .skip3
	changeblock 8, 6, $3b ; fallen boulder 2
.skip3
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_4
	iffalse .skip4
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_2
	iftrue .placeboth
	changeblock 2, 4, $40 ; fallen boulder 3
	sjump .skip4
.placeboth
	changeblock 2, 4, $41 ; fallen boulder 4
.skip4
	endcallback

BlackthornGymClairScript:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .Rematch
	checkflag ENGINE_RISINGBADGE
	iftrue .AlreadyGotBadge
	checkevent EVENT_BEAT_CLAIR
	iftrue .FightDone
	writetext ClairIntroText
	waitbutton
	closetext
	winlosstext ClairWinText, 0
	loadtrainer CLAIR, CLAIR1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CLAIR
	opentext
	writetext ClairText_GoToDragonsDen
	waitbutton
	closetext
	setevent EVENT_BEAT_COOLTRAINERM_PAUL
	setevent EVENT_BEAT_COOLTRAINERM_CODY
	setevent EVENT_BEAT_COOLTRAINERM_MIKE
	setevent EVENT_BEAT_COOLTRAINERF_FRAN
	setevent EVENT_BEAT_COOLTRAINERF_LOLA
	clearevent EVENT_MAHOGANY_MART_OWNERS
	setevent EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	clearevent EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	end

.FightDone:
	writetext ClairText_TooMuchToExpect
	waitbutton
	closetext
	end

.AlreadyGotBadge:
	checkevent EVENT_GOT_TM24_DRAGONBREATH
	iftrue .GotTM24
	writetext BlackthornGymClairText_YouKeptMeWaiting
	promptbutton
	giveitem TM_DRAGONBREATH
	iffalse .BagFull
	getitemname STRING_BUFFER_3, TM_DRAGONBREATH
	writetext BlackthornGymText_ReceivedTM24
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext BlackthornGymClairText_DescribeTM24
	promptbutton
	sjump .GotTM24

.BagFull:
	writetext BlackthornGymClairText_BagFull
	waitbutton
	closetext
	end

.GotTM24:
	writetext BlackthornGymClairText_League
	waitbutton
	closetext
	end

.Rematch
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, .AlreadyGotBadge
	checkflag ENGINE_CLAIR_REMATCH_DONE
	iftrue .AlreadyGotBadge
	writetext ClairIntroText
	waitbutton
	closetext
	winlosstext ClairWinText, 0
	loadtrainer CLAIR, CLAIR2
	startbattle
	reloadmapafterbattle
	setflag ENGINE_CLAIR_REMATCH_DONE
	end

TrainerCooltrainermPaul:
	trainer COOLTRAINERM, PAUL, EVENT_BEAT_COOLTRAINERM_PAUL, CooltrainermPaulSeenText, CooltrainermPaulBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermPaulAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermMike:
	trainer COOLTRAINERM, MIKE, EVENT_BEAT_COOLTRAINERM_MIKE, CooltrainermMikeSeenText, CooltrainermMikeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermMikeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfLola:
	trainer COOLTRAINERF, LOLA, EVENT_BEAT_COOLTRAINERF_LOLA, CooltrainerfLolaSeenText, CooltrainerfLolaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLolaAfterBattleText
	waitbutton
	closetext
	end

BlackthornGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .BlackthornGymGuideRematchScript
	checkevent EVENT_BEAT_CLAIR
	iftrue .BlackthornGymGuideWinScript
	writetext BlackthornGymGuideText
	waitbutton
	closetext
	end

.BlackthornGymGuideWinScript:
	writetext BlackthornGymGuideWinText
	waitbutton
	closetext
	end

.BlackthornGymGuideRematchScript:
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, .BlackthornGymGuideWinScript
	checkflag ENGINE_CLAIR_REMATCH_DONE
	iftrue .BlackthornGymGuideWinScript
	writetext BlackthornGymGuideRematchText
	waitbutton
	closetext
	end

BlackthornGymStatue:
	checkflag ENGINE_RISINGBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, CLAIR, CLAIR1
	jumpstd GymStatue2Script

ClairIntroText:
	text "Sono SANDRA."

	para "Sono il più grande"
	line "Allenatore di"
	cont "#MON del"
	cont "tipo drago."

	para "Posso tener testa"
	line "persino ai SUPER-"
	cont "QUATTRO della"
	cont "LEGA #MON."

	para "Vuoi ancora"
	line "sfidarmi?"

	para "Bene."
	line "Fatti avanti!"

	para "Come CAPOPALESTRA,"
	line "userò tutta la mia"

	para "forza contro"
	line "chiunque!"
	done

ClairWinText:
	text "Come, ho perso?"

	para "Non posso creder-"
	line "ci. Dev'esserci un"
	cont "errore…"
	done

ClairText_GoToDragonsDen:
	text "Non accetterò"
	line "questa sconfitta."

	para "Posso anche aver"
	line "perso, ma non sei"

	para "abbastanza forte"
	line "per la LEGA"
	cont "#MON."

	para "Prima, dovrai"
	line "affrontare la"
	cont "sfida del drago."

	para "Dietro alla PALE-"
	line "STRA c'è un posto"
	cont "chiamato TANA DEL"
	cont "DRAGO."

	para "Al centro della"
	line "TANA DEL DRAGO c'è"

	para "un piccolo"
	line "santuario."

	para "Vai là e dimostra"
	line "di aver perso la"

	para "tua indolenza."
	line "Solo allora ti"

	para "potrò conferire la"
	line "MEDAGLIA della"
	cont "PALESTRA."
	done

ClairText_TooMuchToExpect:
	text "Che ti prende?"

	para "Non ti senti all'"
	line "altezza del tuo"
	cont "compito?"
	done

BlackthornGymClairText_YouKeptMeWaiting:
	text "Ma quanto ci hai"
	line "messo?!"

	para "Ecco a te!"
	done

BlackthornGymText_ReceivedTM24:
	text "<PLAYER> riceve"
	line "MT24 DRAGOSPIRO."
	done

BlackthornGymClairText_DescribeTM24:
	text "Contiene"
	line "DRAGOSPIRO."

	para "No, non ha nulla"
	line "a che fare col mio"
	cont "respiro."

	para "Se non lo vuoi"
	line "puoi anche non"
	cont "prenderlo."
	done

BlackthornGymClairText_BagFull:
	text "Non mi dire che"
	line "non hai spazio!?"
	done

BlackthornGymClairText_League:
	text "Che ti succede?"

	para "Perché non vai"
	line "alla LEGA"
	cont "#MON?"

	para "Sai come"
	line "arrivarci?"

	para "Da qui vai a BORGO"
	line "FOGLIANOVA."

	para "Poi usa SURF per"
	line "andare ad est."
	cont "Sarà dura!"

	para "Vedi di non"
	line "perdere alla "
	cont "LEGA #MON!"

	para "Altrimenti sarà"
	line "ancora più umi-"
	cont "liante aver perso"
	cont "contro di te!"
	done

CooltrainermPaulSeenText:
	text "È la tua prima"
	line "volta contro il"
	cont "tipo drago?"

	para "Ora ti mostrerò"
	line "la loro forza."
	done

CooltrainermPaulBeatenText:
	text "I miei #MON"
	line "drago hanno perso?"
	done

CooltrainermPaulAfterBattleText:
	text "LANCE ti ha detto"
	line "che vorrebbe"

	para "rivederti? Non"
	line "accadrà mai!"
	done

CooltrainermMikeSeenText:
	text "La probabilità che"
	line "io possa perdere?"
	cont "Meno dell'uno per"
	cont "cento."
	done

CooltrainermMikeBeatenText:
	text "Strano!"
	done

CooltrainermMikeAfterBattleText:
	text "Ora conosco i miei"
	line "limiti."

	para "Grazie per aver-"
	line "meli mostrati."
	done

CooltrainerfLolaSeenText:
	text "I #MON drago"
	line "sono sacri."

	para "Sono pieni di"
	line "energia vitale."

	para "Devi impegnarti"
	line "seriamente per"

	para "riuscire a"
	line "batterli!"
	done

CooltrainerfLolaBeatenText:
	text "Bella lotta!"
	done

CooltrainerfLolaAfterBattleText:
	text "Il tipo drago è"
	line "debole contro le"
	cont "mosse drago."
	done

BlackthornGymGuideText:
	text "Ehi, CAMPIONE in"
	line "erba!"

	para "Il viaggio è stato"
	line "lungo, ma ci siamo"

	para "quasi: conta su di"
	line "me!"

	para "SANDRA usa i miti-"
	line "ci e sacri "
	cont "#MON di tipo"
	cont "drago."

	para "Non è facile"
	line "colpirli."

	para "Ma si dice che"
	line "siano deboli"

	para "contro le mosse"
	line "di tipo ghiaccio."
	done

BlackthornGymGuideWinText:
	text "Hai affrontato"
	line "bene SANDRA!"

	para "Ora ti rimane da"
	line "affrontare la"
	cont "LEGA #MON."

	para "Sei sulla strada"
	line "giusta per diven-"
	cont "tare CAMPIONE di"
	cont "#MON."
	done

BlackthornGymGuideRematchText:
	text "SANDRA è ansiosa"
	line "di sfidare un"
	
	para "allenatore valido"
	line "come te."
	
	para "fagli vedere chi"
	line "sei!"
	done

BlackthornGym1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, BLACKTHORN_CITY, 1
	warp_event  5, 17, BLACKTHORN_CITY, 1
	warp_event  1,  7, BLACKTHORN_GYM_2F, 1
	warp_event  7,  9, BLACKTHORN_GYM_2F, 2
	warp_event  2,  6, BLACKTHORN_GYM_2F, 3
	warp_event  7,  7, BLACKTHORN_GYM_2F, 4
	warp_event  7,  6, BLACKTHORN_GYM_2F, 5
	warp_event  2,  4, BLACKTHORN_GYM_1F, 1

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, BlackthornGymStatue
	bg_event  6, 15, BGEVENT_READ, BlackthornGymStatue

	def_object_events
	object_event  5,  3, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornGymClairScript, -1
	object_event  6,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermMike, -1
	object_event  1, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermPaul, -1
	object_event  9,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfLola, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornGymGuideScript, -1
	object_event  3,  4, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGymBoulder, EVENT_BOULDER_IN_BLACKTHORN_GYM_4
