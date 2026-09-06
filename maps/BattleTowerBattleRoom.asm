	object_const_def
	const BATTLETOWERBATTLEROOM_YOUNGSTER
	const BATTLETOWERBATTLEROOM_RECEPTIONIST

BattleTowerBattleRoom_MapScripts:
	def_scene_scripts
	scene_script BattleTowerBattleRoomEnterScene, SCENE_BATTLETOWERBATTLEROOM_ENTER ; 67989 in jp rom
	scene_script BattleTowerBattleRoomNoopScene,  SCENE_BATTLETOWERBATTLEROOM_NOOP

	def_callbacks

BattleTowerBattleRoomEnterScene:
	disappear BATTLETOWERBATTLEROOM_YOUNGSTER
	sdefer Script_BattleRoom
	setscene SCENE_BATTLETOWERBATTLEROOM_NOOP
	; fallthrough
BattleTowerBattleRoomNoopScene:
	end

Script_BattleRoom: ; 799b
	applymovement PLAYER, MovementData_BattleTowerBattleRoomPlayerWalksIn
; beat all 7 opponents in a row
Script_BattleRoomLoop: ; 799f
	setval BATTLETOWERBATTLEROOM_YOUNGSTER
	special LoadOpponentTrainerAndPokemonWithOTSprite
	appear BATTLETOWERBATTLEROOM_YOUNGSTER
	warpsound
	waitsfx
	applymovement BATTLETOWERBATTLEROOM_YOUNGSTER, MovementData_BattleTowerBattleRoomOpponentWalksIn
	opentext
	battletowertext BATTLETOWERTEXT_INTRO
	promptbutton
	closetext
	special BattleTowerBattle ; predef StartBattle
	special FadeOutPalettes
	reloadmap
	ifnotequal $0, Script_FailedBattleTowerChallenge
	readmem wNrOfBeatenBattleTowerTrainers
	ifequal BATTLETOWER_STREAK_LENGTH, Script_BeatenAllTrainers
	applymovement BATTLETOWERBATTLEROOM_YOUNGSTER, MovementData_BattleTowerBattleRoomOpponentWalksOut
	warpsound
	disappear BATTLETOWERBATTLEROOM_YOUNGSTER
	applymovement BATTLETOWERBATTLEROOM_RECEPTIONIST, MovementData_BattleTowerBattleRoomReceptionistWalksToPlayer
	applymovement PLAYER, MovementData_BattleTowerBattleRoomPlayerTurnsToFaceReceptionist
	opentext
	writetext Text_YourMonWillBeHealedToFullHealth
	waitbutton
	closetext
	playmusic MUSIC_HEAL
	special FadeOutPalettes
	special LoadMapPalettes
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext Text_NextUpOpponentNo
	yesorno
	iffalse Script_DontBattleNextOpponent
Script_ContinueAndBattleNextOpponent:
	closetext
	applymovement PLAYER, MovementData_BattleTowerBattleRoomPlayerTurnsToFaceNextOpponent
	applymovement BATTLETOWERBATTLEROOM_RECEPTIONIST, MovementData_BattleTowerBattleRoomReceptionistWalksAway
	sjump Script_BattleRoomLoop

Script_DontBattleNextOpponent: ; 79fd
	writetext Text_SaveAndEndTheSession
	yesorno
	iffalse Script_DontSaveAndEndTheSession
;	setval BATTLETOWERACTION_SAVELEVELGROUP ; save level group
;	special BattleTowerAction
;	setval BATTLETOWERACTION_SAVEOPTIONS ; choose reward
;	special BattleTowerAction
	setval BATTLETOWERACTION_SAVE_AND_QUIT ; quicksave
	special BattleTowerAction
	playsound SFX_SAVE
	waitsfx
	special FadeOutPalettes
	special Reset
Script_DontSaveAndEndTheSession: ; 7a13
	writetext Text_CancelYourBattleRoomChallenge
	yesorno
	iffalse Script_ContinueAndBattleNextOpponent
	setval BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	setval BATTLETOWERACTION_06
	special BattleTowerAction
	closetext
	special FadeOutPalettes
	warpfacing UP, BATTLE_TOWER_1F, 7, 7
	loadmem wBattleTowerStreak, 0
	special SaveGameData
	opentext
	sjump Script_BattleTowerHopeToServeYouAgain

Script_FailedBattleTowerChallenge: ; 7a32
	pause 60
	special BattleTowerFade
	warpfacing UP, BATTLE_TOWER_1F, 7, 7

	loadmem wBattleTowerStreak, 0
	special SaveGameData
	setval BATTLETOWERACTION_13
	special BattleTowerAction
	ifequal 1, Script_ChallengeCanceled;$7a90
	setval BATTLETOWERACTION_05
	special BattleTowerAction
	ifequal 8, Script_TooMuchTimeElapsedNoRegister;$7a84

	setval BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	opentext
	writetext Text_ThanksForVisiting
	promptbutton
	sjump Idk3;$71b4

Script_BeatenAllTrainers: ; 7a5b
	pause 60
	special BattleTowerFade
	warpfacing UP, BATTLE_TOWER_1F, 7, 7
;Script_BeatenAllTrainers2: ; no longer referenced from BattleTower1F.asm
;	opentext
;	writetext Text_CongratulationsYouveBeatenAllTheTrainers
;	sjump Script_GivePlayerHisPrize
	setval BATTLETOWERACTION_13
	special BattleTowerAction
	ifequal 1, Script_ChallengeCanceledWin;$7a90
	readmem wBattleTowerStreak
	ifgreater 10, .skipstreak
	addval 1
	writemem wBattleTowerStreak
.skipstreak
	readvar VAR_BLUECARDBALANCE
	ifgreater 244, .CardFull
	addval 10
	writevar VAR_BLUECARDBALANCE
	readmem wBattleTowerStreak
.loop
	writemem wBuffer1
	ifless 2, .continue
	readvar VAR_BLUECARDBALANCE
	ifequal 255, .continue
	addval 1
	writevar VAR_BLUECARDBALANCE
	readmem wBuffer1
	addval -1
	sjump .loop
.continue
	readmem wBattleTowerStreak
	ifnotequal 0, .continuestring
	addval 1
.continuestring
	addval 9
	getnum STRING_BUFFER_4
	special SaveGameData
	setval BATTLETOWERACTION_05
	special BattleTowerAction
	ifequal 8, Script_TooMuchTimeElapsedNoRegisterWin;$7a84
	setval BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	opentext
	writetext Text_BeatenAllTheTrainers_Mobile;$74ca
	waitbutton
	readvar VAR_BLUECARDBALANCE
	ifnotequal 255, Idk3
	writetext Text_CardFull
	waitbutton
	sjump Idk3;$71b4

.CardFull
	loadvar VAR_BLUECARDBALANCE, 255
	sjump .continue

Script_TooMuchTimeElapsedNoRegister: ; 7a84
	setval BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	opentext
	writetext Text_TooMuchTimeElapsedNoRegister
	waitbutton
	sjump Script_BattleTowerHopeToServeYouAgain

Script_TooMuchTimeElapsedNoRegisterWin: ; 7a84
	setval BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	opentext
	writetext Text_BeatenAllTheTrainers_Mobile;$74ca
	waitbutton
	readvar VAR_BLUECARDBALANCE
	ifnotequal 255, .skip
	writetext Text_CardFull
	waitbutton
.skip
	writetext Text_TooMuchTimeElapsedNoRegister
	waitbutton
	sjump Script_BattleTowerHopeToServeYouAgain

Script_ChallengeCanceled: ; 7a90
	setval BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	setval BATTLETOWERACTION_06
	special BattleTowerAction
	opentext
	writetext Text_ThanksForVisiting
	promptbutton
	writetext Text_WeHopeToServeYouAgain
	waitbutton
	closetext
	end

Script_ChallengeCanceledWin: ; 7a90
	readvar VAR_BLUECARDBALANCE
	ifgreater 244, .CardFull
	addval 10
	writevar VAR_BLUECARDBALANCE
	readmem wBattleTowerStreak
.loop
	writemem wBuffer1
	ifless 2, .continue
	readvar VAR_BLUECARDBALANCE
	ifequal 255, .continue
	addval 1
	writevar VAR_BLUECARDBALANCE
	readmem wBuffer1
	addval -1
	sjump .loop
.continue
	readmem wBattleTowerStreak
	ifnotequal 0, .continuestring
	addval 1
.continuestring
	addval 9
	getnum STRING_BUFFER_4
	special SaveGameData
	setval BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	setval BATTLETOWERACTION_06
	special BattleTowerAction
	opentext
	writetext Text_BeatenAllTheTrainers_Mobile;$74ca
	waitbutton
	readvar VAR_BLUECARDBALANCE
	ifnotequal 255, .skip
	writetext Text_CardFull
	waitbutton
.skip
	writetext Text_WeHopeToServeYouAgain
	waitbutton
	closetext
	end

.CardFull
	loadvar VAR_BLUECARDBALANCE, 255
	sjump .continue

Text_ReturnedAfterSave_Mobile: ; unreferenced
	text "Potrai tornare"
	line "dopo aver salvato."
	done

BattleTowerBattleRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, BATTLE_TOWER_HALLWAY, 4
	warp_event  4,  7, BATTLE_TOWER_HALLWAY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  0, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BATTLE_TOWER_BATTLE_ROOM_YOUNGSTER
	object_event  1,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
