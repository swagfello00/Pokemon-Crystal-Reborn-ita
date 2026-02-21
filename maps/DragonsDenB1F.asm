	object_const_def
	const DRAGONSDENB1F_POKE_BALL1
	const DRAGONSDENB1F_CLAIR
	const DRAGONSDENB1F_RIVAL
	const DRAGONSDENB1F_COOLTRAINER_M
	const DRAGONSDENB1F_COOLTRAINER_F
	const DRAGONSDENB1F_TWIN1
	const DRAGONSDENB1F_TWIN2
	const DRAGONSDENB1F_POKE_BALL2
	const DRAGONSDENB1F_POKE_BALL3

DragonsDenB1F_MapScripts:
	def_scene_scripts
	scene_script DragonsDenB1FNoop1Scene, SCENE_DRAGONSDENB1F_NOOP
	scene_script DragonsDenB1FNoop2Scene, SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM

	def_callbacks
	callback MAPCALLBACK_NEWMAP, DragonsDenB1FCheckRivalCallback

DragonsDenB1FNoop1Scene:
	end

DragonsDenB1FNoop2Scene:
	end

DragonsDenB1FCheckRivalCallback:
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iftrue .CheckDay
	disappear DRAGONSDENB1F_RIVAL
	endcallback

.CheckDay:
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .AppearRival
	ifequal THURSDAY, .AppearRival
	disappear DRAGONSDENB1F_RIVAL
	endcallback

.AppearRival:
	appear DRAGONSDENB1F_RIVAL
	endcallback

DragonsDenB1F_ClairScene:
; BUGfixed: Clair can give TM24 Dragonbreath twice (see docs/bugs_and_glitches.md)
	appear DRAGONSDENB1F_CLAIR
	opentext
	writetext ClairText_Wait
	pause 30
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, LEFT
	playmusic MUSIC_CLAIR
	applymovement DRAGONSDENB1F_CLAIR, MovementDragonsDen_ClairWalksToYou
	opentext
	writetext ClairText_GiveDragonbreathDragonDen
	promptbutton
	giveitem TM_DRAGONBREATH
	iffalse .BagFull
	getitemname STRING_BUFFER_3, TM_DRAGONBREATH
	writetext Text_ReceivedTM24
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext ClairText_DescribeDragonbreathDragonDen
	promptbutton
	writetext ClairText_WhatsTheMatterDragonDen
	waitbutton
	closetext
	sjump .FinishClair

.BagFull:
	writetext ClairText_NoRoom
	waitbutton
	closetext
.FinishClair:
	applymovement DRAGONSDENB1F_CLAIR, MovementDragonsDen_ClairWalksAway
	special FadeOutMusic
	pause 30
	special RestartMapMusic
	disappear DRAGONSDENB1F_CLAIR
	setscene SCENE_DRAGONSDENB1F_NOOP
	end

TrainerCooltrainermDarin:
	trainer COOLTRAINERM, DARIN, EVENT_BEAT_COOLTRAINERM_DARIN, CooltrainermDarinSeenText, CooltrainermDarinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermDarinAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfCara:
	trainer COOLTRAINERF, CARA, EVENT_BEAT_COOLTRAINERF_CARA, CooltrainerfCaraSeenText, CooltrainerfCaraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfCaraAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsLeaandpia1:
	trainer TWINS, LEAANDPIA1, EVENT_BEAT_TWINS_LEA_AND_PIA, TwinsLeaandpia1SeenText, TwinsLeaandpia1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsLeaandpia1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsLeaandpia2:
	trainer TWINS, LEAANDPIA1, EVENT_BEAT_TWINS_LEA_AND_PIA, TwinsLeaandpia2SeenText, TwinsLeaandpia2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsLeaandpia2AfterBattleText
	waitbutton
	closetext
	end

DragonsDenB1FDragonFangScript:
; This whole script is written out rather than as an itemball
; because it's left over from the GS event.
	giveitem DRAGON_FANG
	iffalse .BagFull
	disappear DRAGONSDENB1F_POKE_BALL1
	opentext
	getitemname STRING_BUFFER_3, DRAGON_FANG
	writetext Text_FoundDragonFang
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

.BagFull:
	opentext
	getitemname STRING_BUFFER_3, DRAGON_FANG
	writetext Text_FoundDragonFang
	promptbutton
	writetext Text_NoRoomForDragonFang
	waitbutton
	closetext
	end

DragonsDenB1FRivalScript:
	playmusic MUSIC_RIVAL_ENCOUNTER
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .RivalTalkAgain
	writetext RivalText_Training1
	waitbutton
	checkevent EVENT_GOT_RIVAL_STARTER
	iftrue .closetext
	writetext TakeThisRivalStarterText
	yesorno
	iffalse .Refused
	writetext RivalStarterImCountingOnYouText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .GiveChikorita
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .GiveCyndaquil
	checkevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	iftrue .GiveTotodile
	end

.GiveChikorita:
	checkevent EVENT_KANTO_STARTERS
	iftrue .GiveBulbasaur
	writetext ReceivedRivalChikoritaText
	playsound SFX_CAUGHT_MON
	waitsfx
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	givepoke CHIKORITA, 5, BERRY
	setevent EVENT_GOT_RIVAL_STARTER
	writetext RivalStarterMayEvolveText
	waitbutton
	sjump .closetext
	
.GiveCyndaquil:
	checkevent EVENT_KANTO_STARTERS
	iftrue .GiveCharmander
	writetext ReceivedRivalCyndaquilText
	playsound SFX_CAUGHT_MON
	waitsfx
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	givepoke CYNDAQUIL, 5, BERRY
	setevent EVENT_GOT_RIVAL_STARTER
	writetext RivalStarterMayEvolveText
	waitbutton
	sjump .closetext
	
.GiveTotodile:
	checkevent EVENT_KANTO_STARTERS
	iftrue .GiveSquirtle
	writetext ReceivedRivalTotodileText
	playsound SFX_CAUGHT_MON
	waitsfx
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	givepoke TOTODILE, 5, BERRY
	setevent EVENT_GOT_RIVAL_STARTER
	writetext RivalStarterMayEvolveText
	waitbutton
	sjump .closetext

.GiveBulbasaur:
	writetext ReceivedRivalBulbasaurText
	playsound SFX_CAUGHT_MON
	waitsfx
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	givepoke BULBASAUR, 5, BERRY
	setevent EVENT_GOT_RIVAL_STARTER
	writetext RivalStarterMayEvolveText
	waitbutton
	sjump .closetext
	
.GiveCharmander:
	writetext ReceivedRivalCharmanderText
	playsound SFX_CAUGHT_MON
	waitsfx
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	givepoke CHARMANDER, 5, BERRY
	setevent EVENT_GOT_RIVAL_STARTER
	writetext RivalStarterMayEvolveText
	waitbutton
	sjump .closetext
	
.GiveSquirtle:
	writetext ReceivedRivalSquirtleText
	playsound SFX_CAUGHT_MON
	waitsfx
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	givepoke SQUIRTLE, 5, BERRY
	setevent EVENT_GOT_RIVAL_STARTER
	writetext RivalStarterMayEvolveText
	waitbutton
	sjump .closetext

.NoRoom:
	writetext RivalStarterPartyFullText
	waitbutton
	sjump .closetext

.Refused:
	writetext NoRivalStarterText
	waitbutton
.closetext:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	special RestartMapMusic
	end

.RivalTalkAgain:
	writetext RivalText_Training2
	waitbutton
	closetext
	special RestartMapMusic
	end

DragonShrineSignpost:
	jumptext DragonShrineSignpostText

DragonsDenB1FCalcium:
	itemball CALCIUM

DragonsDenB1FMaxElixer:
	itemball MAX_ELIXER

DragonsDenB1FHiddenRevive:
	hiddenitem REVIVE, EVENT_DRAGONS_DEN_B1F_HIDDEN_REVIVE

DragonsDenB1FHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_POTION

DragonsDenB1FHiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_ELIXER

MovementDragonsDen_ClairWalksToYou:
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	step_end

MovementDragonsDen_ClairWalksAway:
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	step_end

ClairText_Wait:
	text "Aspetta!"
	done

ClairText_GiveDragonbreathDragonDen:
	text "SANDRA: Mi spiace,"
	line "davvero."

	para "Prendi: con questo"
	line "dono spero di"
	cont "farmi perdonare!"
	done

Text_ReceivedTM24:
	text "<PLAYER> riceve"
	line "MT24 DRAGOSPIRO."
	done

ClairText_DescribeDragonbreathDragonDen:
	text "Contiene"
	line "DRAGOSPIRO."

	para "No, non ha nulla"
	line "a che fare col mio"
	cont "respiro."

	para "Se non la vuoi"
	line "puoi anche non"
	cont "prenderla."
	done

ClairText_NoRoom:
	text "Ehi, ma non hai"
	line "posto!"

	para "Ci vediamo alla"
	line "PALESTRA, quando"

	para "avrai fatto posto"
	line "per il mio dono."
	done

ClairText_WhatsTheMatterDragonDen:
	text "SANDRA: Che ti"
	line "succede? Perché"

	para "non vai alla"
	line "LEGA #MON?"

	para "Sai come"
	line "arrivarci?"

	para "Da qui vai a"
	line "BORGO FOGLIANOVA."

	para "Poi usa SURF per"
	line "andare ad est."
	cont "Sarà dura!"

	para "Vedi di non"
	line "perdere alla"
	cont "LEGA #MON!"

	para "Altrimenti sarà"
	line "ancora più umi-"
	cont "liante aver perso"
	cont "contro di te!"

	para "Metticela tutta,"
	line "mi raccomando!"
	done

DragonShrineSignpostText:
	text "SANTUARIO DRAGO."

	para "Un santuario in"
	line "onore del #MON"

	para "drago che pare"
	line "abitasse nella"
	cont "TANA DEL DRAGO."
	done

RivalText_Training1:
	text "…"
	line "Come? <PLAYER>?"

	para "… No, non ti"
	line "sfiderò adesso…"

	para "I miei #MON non"
	line "sono pronti."

	para "Non posso forzarli"
	line "troppo."

	para "Serve disciplina"
	line "per diventare il"

	para "miglior Allenatore"
	line "di #MON…"
	done

RivalText_Training2:
	text "…"

	para "Ehi…"

	para "Impara a starmi"
	line "alla larga…"
	done

CooltrainermDarinSeenText:
	text "Come osi entrare"
	line "senza invito!"
	done

CooltrainermDarinBeatenText:
	text "Che forte!"
	done

CooltrainermDarinAfterBattleText:
	text "Nel SANTUARIO qui"
	line "vicino abita il"

	para "MAESTRO del nostro"
	line "gruppo: noi siamo"

	para "tutti appassionati"
	line "del tipo drago."
	cont "Non è così facile"
	cont "entrare."
	done

CooltrainerfCaraSeenText:
	text "Tu non puoi"
	line "entrare!"
	done

CooltrainerfCaraBeatenText:
	text "Aaah, ho perso!"
	done

CooltrainerfCaraAfterBattleText:
	text "Presto il MAESTRO"
	line "mi permetterà di"

	para "usare il tipo"
	line "drago."

	para "Così diventerò un"
	line "grande esperto del"

	para "tipo drago e il"
	line "MAESTRO potrà"

	para "essere fiero di"
	line "me!"
	done

TwinsLeaandpia1SeenText:
	text "È una persona che"
	line "non conosciamo."
	done

TwinsLeaandpia1BeatenText:
	text "Ahi ahi ahi!"
	done

TwinsLeaandpia1AfterBattleText:
	text "Credevo di"
	line "lottare con LANCE!"
	done

TwinsLeaandpia2SeenText:
	text "Chi sei?!"
	done

TwinsLeaandpia2BeatenText:
	text "Che rabbia!!!"
	done

TwinsLeaandpia2AfterBattleText:
	text "Lo diremo al"
	line "MAESTRO!"

	para "Sarà furioso con"
	line "te, vedrai!"
	done

Text_FoundDragonFang:
	text "<PLAYER> trova"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

Text_NoRoomForDragonFang:
	text "Ma <PLAYER> non"
	line "può trasportare"
	cont "altri strumenti."
	done
	
TakeThisRivalStarterText:
	text "Senti, alla"
	line "pensione mi hanno"
	cont "dato un UOVO."
	
	para "Si è schiuso da"
	line "poco, ma questo"
	cont "#MON è debole"
	cont "e non mi serve."
	
	para "lo vuoi tu?"
	done

RivalStarterImCountingOnYouText:
	text "Grazie mille,"
	line "prenditene cura!"
	done

ReceivedRivalCyndaquilText:
	text "<PLAYER> riceve"
	line "CYNDAQUIL!"
	done
	
ReceivedRivalTotodileText:
	text "<PLAYER> riceve"
	line "TOTODILE!"
	done

ReceivedRivalChikoritaText:
	text "<PLAYER> riceve"
	line "CHIKORITA!"
	done

ReceivedRivalCharmanderText:
	text "<PLAYER> riceve"
	line "CHARMANDER!"
	done
	
ReceivedRivalSquirtleText:
	text "<PLAYER> riceve"
	line "SQUIRTLE!"
	done

ReceivedRivalBulbasaurText:
	text "<PLAYER> riceve"
	line "BULBASAUR!"
	done

RivalStarterMayEvolveText:
	text "Mi raccomando,"
	line "allevalo bene."
	done

RivalStarterPartyFullText:
	text "Ah, ma non hai"
	line "posto per altri"
	cont "#MON!"
	done

NoRivalStarterText:
	text "Ok, lo terrò io"
	line "per il momento."
	done

DragonsDenB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 20,  3, DRAGONS_DEN_1F, 3
	warp_event 19, 29, DRAGON_SHRINE, 1

	def_coord_events
	coord_event 19, 30, SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM, DragonsDenB1F_ClairScene

	def_bg_events
	bg_event 18, 24, BGEVENT_READ, DragonShrineSignpost
	bg_event 33, 29, BGEVENT_ITEM, DragonsDenB1FHiddenRevive
	bg_event 21, 17, BGEVENT_ITEM, DragonsDenB1FHiddenMaxPotion
	bg_event 31, 15, BGEVENT_ITEM, DragonsDenB1FHiddenMaxElixer

	def_object_events
	object_event 35, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonsDenB1FDragonFangScript, EVENT_DRAGONS_DEN_B1F_DRAGON_FANG
	object_event 14, 30, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DRAGONS_DEN_CLAIR
	object_event 20, 23, SPRITE_RIVAL, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonsDenB1FRivalScript, EVENT_RIVAL_DRAGONS_DEN
	object_event 20,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermDarin, -1
	object_event  8,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfCara, -1
	object_event  4, 17, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsLeaandpia1, -1
	object_event  4, 18, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsLeaandpia2, -1
	object_event 30,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DragonsDenB1FCalcium, EVENT_DRAGONS_DEN_B1F_CALCIUM
	object_event  5, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DragonsDenB1FMaxElixer, EVENT_DRAGONS_DEN_B1F_MAX_ELIXER
