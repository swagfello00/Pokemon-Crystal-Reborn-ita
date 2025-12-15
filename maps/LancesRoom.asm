	object_const_def
	const LANCESROOM_LANCE
	const LANCESROOM_MARY
	const LANCESROOM_OAK

LancesRoom_MapScripts:
	def_scene_scripts
	scene_script LancesRoomLockDoorScene, SCENE_LANCESROOM_LOCK_DOOR
	scene_script LancesRoomNoopScene,     SCENE_LANCESROOM_APPROACH_LANCE

	def_callbacks
	callback MAPCALLBACK_TILES, LancesRoomDoorsCallback

LancesRoomLockDoorScene:
	sdefer LancesRoomDoorLocksBehindYouScript
	end

LancesRoomNoopScene:
	end

LancesRoomDoorsCallback:
	checkevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 22, $34 ; wall
.KeepEntranceOpen:
	checkevent EVENT_LANCES_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 0, $0b ; open door
.KeepExitClosed:
	endcallback

LancesRoomDoorLocksBehindYouScript:
	applymovement PLAYER, LancesRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 22, $34 ; wall
	reloadmappart
	closetext
	setscene SCENE_LANCESROOM_APPROACH_LANCE
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	end

Script_ApproachLanceFromLeft:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachLanceFromLeft
	sjump LancesRoomLanceScript

Script_ApproachLanceFromRight:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachLanceFromRight
LancesRoomLanceScript:
	turnobject LANCESROOM_LANCE, LEFT
	opentext
	writetext LanceBattleIntroText
	waitbutton
	closetext
	winlosstext LanceBattleWinText, 0
	setlasttalked LANCESROOM_LANCE
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .Rematch
	loadtrainer CHAMPION, LANCE
.continue
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_CHAMPION_LANCE
	opentext
	writetext LanceBattleAfterText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 0, $0b ; open door
	reloadmappart
	closetext
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	musicfadeout MUSIC_BEAUTY_ENCOUNTER, 16
	pause 30
	showemote EMOTE_SHOCK, LANCESROOM_LANCE, 15
	turnobject LANCESROOM_LANCE, DOWN
	pause 10
	turnobject PLAYER, DOWN
	appear LANCESROOM_MARY
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryRushesIn
	opentext
	writetext LancesRoomMaryOhNoOakText
	waitbutton
	closetext
	appear LANCESROOM_OAK
	applymovement LANCESROOM_OAK, LancesRoomMovementData_OakWalksIn
	follow LANCESROOM_MARY, LANCESROOM_OAK
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryYieldsToOak
	stopfollow
	turnobject LANCESROOM_OAK, UP
	turnobject LANCESROOM_LANCE, LEFT
	opentext
	writetext LancesRoomOakCongratulationsText
	waitbutton
	closetext
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryInterviewChampion
	turnobject PLAYER, LEFT
	opentext
	writetext LancesRoomMaryInterviewText
	waitbutton
	closetext
	applymovement LANCESROOM_LANCE, LancesRoomMovementData_LancePositionsSelfToGuidePlayerAway
	turnobject PLAYER, UP
	opentext
	writetext LancesRoomNoisyText
	waitbutton
	closetext
	follow LANCESROOM_LANCE, PLAYER
	turnobject LANCESROOM_MARY, UP
	turnobject LANCESROOM_OAK, UP
	applymovement LANCESROOM_LANCE, LancesRoomMovementData_LanceLeadsPlayerToHallOfFame
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear LANCESROOM_LANCE
	applymovement PLAYER, LancesRoomMovementData_PlayerExits
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryTriesToFollow
	showemote EMOTE_SHOCK, LANCESROOM_MARY, 15
	opentext
	writetext LancesRoomMaryNoInterviewText
	pause 30
	closetext
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryRunsBackAndForth
	special FadeOutPalettes
	pause 15
	warpfacing UP, HALL_OF_FAME, 4, 13
	checkevent EVENT_CAUGHT_RAIKOU
	iftrue .SkipRaikou
	readmem wRoamMon1MapGroup
	ifnotequal GROUP_N_A, .SkipRaikou
	special InitRoamRaikou
.SkipRaikou
	checkevent EVENT_CAUGHT_ENTEI
	iftrue .SkipEntei
	readmem wRoamMon2MapGroup
	ifnotequal GROUP_N_A, .SkipEntei
	special InitRoamEntei
.SkipEntei
	checkevent EVENT_CAUGHT_SUICUNE
	iftrue .SkipSuicune
	checkevent EVENT_FOUGHT_SUICUNE
	iffalse .SkipSuicune
	clearevent EVENT_KANTO_SUICUNE
.SkipSuicune
	checkevent EVENT_CAUGHT_MOLTRES
	iftrue .SkipMoltres
	clearevent EVENT_VICTORY_ROAD_MOLTRES
.SkipMoltres
	checkevent EVENT_CAUGHT_ARTICUNO
	iftrue .SkipArticuno
	clearevent EVENT_ROUTE_20_ARTICUNO
.SkipArticuno
	checkevent EVENT_CAUGHT_ZAPDOS
	iftrue .SkipZapdos
	clearevent EVENT_ROCK_TUNNEL_B1F_ZAPDOS
.SkipZapdos
	checkevent EVENT_CAUGHT_HO_OH
	iftrue .SkipHooh
	clearevent EVENT_TIN_TOWER_ROOF_HO_OH
	clearevent EVENT_FOUGHT_HO_OH
.SkipHooh
	checkevent EVENT_CAUGHT_LUGIA
	iftrue .SkipLugia
	clearevent EVENT_WHIRL_ISLAND_LUGIA_CHAMBER_LUGIA
	clearevent EVENT_FOUGHT_LUGIA
.SkipLugia
	checkevent EVENT_CAUGHT_MEWTWO
	iftrue .SkipMewtwo
	clearevent EVENT_SILVER_CAVE_OUTSIDE_MEWTWO
.SkipMewtwo
	checkevent EVENT_CAUGHT_MEW
	iftrue .SkipMew
	clearevent EVENT_SAFARI_ZONE_BETA_MEW
.SkipMew
	checkevent EVENT_CAUGHT_CELEBI
	iftrue .SkipCelebi
	setevent EVENT_REMATCH_CELEBI
	setevent EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	clearevent EVENT_ILEX_FOREST_LASS
.SkipCelebi
	end

.Rematch
	loadtrainer CHAMPION, LANCE2
	sjump .continue

LancesRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_ApproachLanceFromLeft:
	step UP
	step UP
	turn_head RIGHT
	step_end

MovementData_ApproachLanceFromRight:
	step UP
	step LEFT
	step UP
	turn_head RIGHT
	step_end

LancesRoomMovementData_MaryRushesIn:
	big_step UP
	big_step UP
	big_step UP
	turn_head DOWN
	step_end

LancesRoomMovementData_OakWalksIn:
	step UP
	step UP
	step_end

LancesRoomMovementData_MaryYieldsToOak:
	step LEFT
	turn_head RIGHT
	step_end

LancesRoomMovementData_MaryInterviewChampion:
	big_step UP
	turn_head RIGHT
	step_end

LancesRoomMovementData_LancePositionsSelfToGuidePlayerAway:
	step UP
	step LEFT
	turn_head DOWN
	step_end

LancesRoomMovementData_LanceLeadsPlayerToHallOfFame:
	step UP
	step_end

LancesRoomMovementData_PlayerExits:
	step UP
	step_end

LancesRoomMovementData_MaryTriesToFollow:
	step UP
	step RIGHT
	turn_head UP
	step_end

LancesRoomMovementData_MaryRunsBackAndForth:
	big_step RIGHT
	big_step RIGHT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step LEFT
	big_step LEFT
	turn_head UP
	step_end

LanceBattleIntroText:
	text "LANCE: Ti stavo"
	line "aspettando."

	para "<PLAY_G>!"

	para "Sapevo che non"
	line "avresti avuto"

	para "alcun problema a"
	line "giungere qui."

	para "Le parole non"
	line "servono."

	para "Lotteremo per"
	line "capire chi sarà"

	para "il più forte dei"
	line "due."

	para "Io LANCE, il più"
	line "forte allenatore e"

	para "il CAMPIONE della"
	line "LEGA #MON…"

	para "Io, come maestro"
	line "del tipo drago,"
	cont "accetto la sfida!"
	done

LanceBattleWinText:
	text "… È finita."

	para "Ma ho una strana"
	line "sensazione."

	para "La sconfitta non"
	line "mi brucia affatto."
	cont "Anzi, ne sono"
	cont "felice."

	para "Felice di aver"
	line "visto crescere un"

	para "grande nuovo"
	line "CAMPIONE!"
	done

LanceBattleAfterText:
	text "Ormai sei davvero"
	line "forte, <PLAY_G>."

	para "I tuoi #MON"
	line "sono cresciuti"

	para "grazie al tuo"
	line "spirito forte e"
	cont "leale."

	para "La tua abilità"
	line "nell'allenare i"

	para "#MON sarà"
	line "sempre maggiore!"
	done

LancesRoomMaryOhNoOakText:
	text "LORI: No! La lotta"
	line "è già finita! Sai,"

	para "il PROF.OAK è un"
	line "po' lento…"
	done

LancesRoomOakCongratulationsText:
	text "PROF.OAK: Ah,"
	line "<PLAY_G>!"

	para "Ne è passato del"
	line "tempo!"

	para "Ora sei senz'altro"
	line "più forte."

	para "Hai conquistato la"
	line "LEGA, è magnifico!"

	para "La dedizione, la"
	line "fiducia e l'amore"

	para "verso i tuoi"
	line "#MON ti hanno"
	cont "dato la forza di"
	cont "vincere."

	para "Anche i tuoi"
	line "#MON sono stati"
	cont "grandi."

	para "Hanno resistito"
	line "perché hanno"

	para "avuto fiducia in"
	line "te."

	para "Complimenti,"
	line "<PLAY_G>!"
	done

LancesRoomMaryInterviewText:
	text "LORI: Ora"
	line "intervisteremo il"
	cont "nuovo CAMPIONE!"
	done

LancesRoomNoisyText:
	text "LANCE: C'è un po'"
	line "troppo rumore qui…"

	para "<PLAY_G>, vieni"
	line "con me!"
	done

LancesRoomMaryNoInterviewText:
	text "LORI: Aspetta!"
	line "E l'intervista?"
	done

LancesRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 23, KARENS_ROOM, 3
	warp_event  5, 23, KARENS_ROOM, 4
	warp_event  4,  1, HALL_OF_FAME, 1
	warp_event  5,  1, HALL_OF_FAME, 2

	def_coord_events
	coord_event  4,  5, SCENE_LANCESROOM_APPROACH_LANCE, Script_ApproachLanceFromLeft
	coord_event  5,  5, SCENE_LANCESROOM_APPROACH_LANCE, Script_ApproachLanceFromRight

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LancesRoomLanceScript, -1
	object_event  4,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY
	object_event  4,  7, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY
