	object_const_def
	const BATTLETOWER1F_RECEPTIONIST
	const BATTLETOWER1F_YOUNGSTER
	const BATTLETOWER1F_COOLTRAINER_F
	const BATTLETOWER1F_BUG_CATCHER
	const BATTLETOWER1F_GRANNY

BattleTower1F_MapScripts:
	def_scene_scripts
	scene_script BattleTower1FCheckStateScene, SCENE_BATTLETOWER1F_CHECKSTATE
	scene_script BattleTower1FNoopScene,       SCENE_BATTLETOWER1F_NOOP

	def_callbacks

BattleTower1FCheckStateScene:
	setval BATTLETOWERACTION_CHECKSAVEFILEISYOURS
	special BattleTowerAction
	iffalse .SkipEverything
	setval BATTLETOWERACTION_GET_CHALLENGE_STATE ; readmem sBattleTowerChallengeState
	special BattleTowerAction
	ifequal $0, .SkipEverything
	ifequal $2, .LeftWithoutSaving
;	ifequal $3, .SkipEverything
;	ifequal $4, .SkipEverything
	opentext
	writetext Text_WeveBeenWaitingForYou
	waitbutton
	closetext
	sdefer Script_ResumeBattleTowerChallenge
	end

.LeftWithoutSaving ; 70BF
	loadmem wBattleTowerStreak, 0
	special SaveGameData
	setval BATTLETOWERACTION_13
	special BattleTowerAction
	ifnotequal $00, .skip;$70CB
	sdefer BattleTower_LeftWithoutSaving
.skip
	setval BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	setval BATTLETOWERACTION_06
	special BattleTowerAction
.SkipEverything:
	setscene SCENE_BATTLETOWER1F_NOOP
	; fallthrough
BattleTower1FNoopScene:
	end

; checking the honor roll
BattleTower1FRulesSign: ; 70D8
	opentext
	writetext Text_CheckTheLeaderHonorRoll;Text_ReadBattleTowerRules
	yesorno
	iffalse .skip
	;writetext Text_BattleTowerRules
	;waitbutton
	db $0F, $78, $00

.skip:
	closetext
	end

BattleTower1FReceptionistScript: ;70E5
	;setval BATTLETOWERACTION_GET_CHALLENGE_STATE ; readmem sBattleTowerChallengeState
	;special BattleTowerAction
	;ifequal $3, Script_BeatenAllTrainers2 ; maps/BattleTowerBattleRoom.asm
	opentext
	special Mobile_DummyReturnFalse
	iffalse .NoMobile
	setval BATTLETOWERACTION_CHECKSAVEFILEISYOURS
	special BattleTowerAction
	iffalse .idk2;$711F
	setval BATTLETOWERACTION_13
	special BattleTowerAction
	ifnotequal $00, .idk2;$711F
	setval BATTLETOWERACTION_05
	special BattleTowerAction
	ifequal $00, .idk2;$711F
	ifequal $08, .idk1;$711B
	writetext Text_RegisterRecordOnFile_Mobile;$7709 ???
	yesorno
	iffalse .idk2;$711F
	writetext Text_SaveBeforeConnecting_Mobile; $76A1
	yesorno
	iffalse Script_BattleTowerHopeToServeYouAgain;$71E3
	special TryQuickSave
	iffalse Script_BattleTowerHopeToServeYouAgain;$71E3
	sjump Idk4;$71BB

.idk1
	writetext Text_BattleTowerWelcomesYou;???$77DC
	waitbutton

.idk2
	writetext Text_BattleTowerWelcomesYou;$72DE
	promptbutton
	setval BATTLETOWERACTION_CHECK_EXPLANATION_READ ; if new save file: bit 1, [sBattleTowerSaveFileFlags]
	special BattleTowerAction
	ifnotequal $0, Script_Menu_ChallengeExplanationCancel
	jump Script_BattleTowerIntroductionYesNo

.NoMobile
	writetext NoBattleTowerText
	waitbutton
	closetext
	end

NoCard:
	writetext NoCardBattleTowerText
	waitbutton
Script_Menu_ChallengeExplanationCancel: ; $712F
	writetext Text_WantToGoIntoABattleRoom
	setval TRUE
	special Menu_ChallengeExplanationCancel
	ifequal 1, Script_ChooseChallenge ; 714A
	ifequal 2, Script_ChooseChallenge2 ; 71F1
	ifequal 3, Script_BattleTowerExplanation ; 71D8
	ifequal 5, Script_StartChallenge ; $721D
	sjump Script_BattleTowerHopeToServeYouAgain ; 71E3

Script_ChooseChallenge:
	checkitem BLUE_CARD
	iffalse NoCard
	setval BATTLETOWERACTION_0D
	special BattleTowerAction
	iftrue Script_ReachedBattleLimit;$726E

;	setval BATTLETOWERACTION_RESETDATA ; ResetBattleTowerTrainerSRAM
;	special BattleTowerAction
	special CheckForBattleTowerRules
	ifnotequal FALSE, Script_WaitButton
	writetext Text_SaveBeforeConnecting_Mobile
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_BATTLETOWER1F_CHECKSTATE
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_BATTLETOWER1F_NOOP
	setval BATTLETOWERACTION_SET_EXPLANATION_READ ; set 1, [sBattleTowerSaveFileFlags]
	special BattleTowerAction
	special BattleTowerRoomMenu
	ifequal $a, Script_Menu_ChallengeExplanationCancel
	ifnotequal $0, Script_MobileError ; 7283
	setval BATTLETOWERACTION_11
	special BattleTowerAction
	writetext Text_RightThisWayToYourBattleRoom
	waitbutton

	setval BATTLETOWERACTION_SAVELEVELGROUP
	special BattleTowerAction
	setval BATTLETOWERACTION_0C ; start timer?
	special BattleTowerAction

;	closetext
;	setval BATTLETOWERACTION_CHOOSEREWARD
;	special BattleTowerAction
;	sjump Script_WalkToBattleTowerElevator

Script_ResumeBattleTowerChallenge:
	closetext
;	setval BATTLETOWERACTION_LOADLEVELGROUP ; load choice of level group
;	special BattleTowerAction
Script_WalkToBattleTowerElevator:
	musicfadeout MUSIC_NONE, 8
	setmapscene BATTLE_TOWER_BATTLE_ROOM, SCENE_BATTLETOWERBATTLEROOM_ENTER
	setmapscene BATTLE_TOWER_ELEVATOR, SCENE_BATTLETOWERELEVATOR_ENTER
	setmapscene BATTLE_TOWER_HALLWAY, SCENE_BATTLETOWERHALLWAY_ENTER
	follow BATTLETOWER1F_RECEPTIONIST, PLAYER
	applymovement BATTLETOWER1F_RECEPTIONIST, MovementData_BattleTower1FWalkToElevator
	setval BATTLETOWERACTION_0A
	special BattleTowerAction
	warpsound
	disappear BATTLETOWER1F_RECEPTIONIST
	stopfollow
	applymovement PLAYER, MovementData_BattleTowerHallwayPlayerEntersBattleRoom
	warpcheck
	end

Idk3: ; 71B4
	writetext Text_AskRegisterRecord_Mobile;$7523
	yesorno
	iffalse Script_BattleTowerHopeToServeYouAgain;$71E3

Idk4:
	special Function170114 ; 76
	ifequal $0A, Script_BattleTowerHopeToServeYouAgain;$71E3
	ifnotequal $00, Script_MobileError;$7283
	setval BATTLETOWERACTION_06
	special BattleTowerAction
	writetext Text_YourRegistrationIsComplete;$753F
	waitbutton
	closetext
	end

;	setval BATTLETOWERACTION_1C
;	special BattleTowerAction
;	setval BATTLETOWERACTION_GIVEREWARD
;	special BattleTowerAction
;	ifequal POTION, Script_YourPackIsStuffedFull
;	getitemname STRING_BUFFER_4, USE_SCRIPT_VAR
;	giveitem ITEM_FROM_MEM, 5
;	writetext Text_PlayerGotFive
;	setval BATTLETOWERACTION_1D
;	special BattleTowerAction
;	closetext
;	end

;Script_YourPackIsStuffedFull:
;	writetext Text_YourPackIsStuffedFull
;	waitbutton
;	closetext
;	end

Script_BattleTowerIntroductionYesNo: ; 71D1
	writetext Text_WouldYouLikeToHearAboutTheBattleTower
	yesorno
	iffalse Script_BattleTowerSkipExplanation
Script_BattleTowerExplanation:
	writetext Text_BattleTowerIntroduction_1
Script_BattleTowerSkipExplanation:
	setval BATTLETOWERACTION_SET_EXPLANATION_READ
	special BattleTowerAction
	sjump Script_Menu_ChallengeExplanationCancel

Script_BattleTowerHopeToServeYouAgain: ; 71E3
	writetext Text_WeHopeToServeYouAgain
	waitbutton
	closetext
	end

Script_MobileError2: ; 71E9
	special BattleTowerMobileError
	closetext
	end

Script_WaitButton: ; 71EE
	waitbutton
	closetext
	end

; honor roll download
Script_ChooseChallenge2: ; 71F1
	writetext Text_SaveBeforeConnecting_Mobile; 76A1
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setval BATTLETOWERACTION_SET_EXPLANATION_READ
	special BattleTowerAction
	special Function1700ba
	ifequal $a, Script_Menu_ChallengeExplanationCancel
	ifnotequal $0, Script_MobileError
	writetext Text_ReceivedAListOfLeadersOnTheHonorRoll
	turnobject BATTLETOWER1F_RECEPTIONIST, LEFT
	writetext Text_PleaseConfirmOnThisMonitor
	waitbutton
	turnobject BATTLETOWER1F_RECEPTIONIST, DOWN
	closetext
	end

Script_StartChallenge: ; 721D
	checkitem BLUE_CARD
	iffalse NoCard
	setval BATTLETOWERACTION_LEVEL_CHECK
	special BattleTowerAction
	ifnotequal $0, Script_AMonLevelExceeds
	setval BATTLETOWERACTION_UBERS_CHECK
	special BattleTowerAction
	ifnotequal $0, Script_MayNotEnterABattleRoomUnderL70
	special CheckForBattleTowerRules
	ifnotequal FALSE, Script_WaitButton
	setval BATTLETOWERACTION_05
	special BattleTowerAction
	ifequal $0, .zero
	writetext Text_CantBeRegistered_PreviousRecordDeleted
	sjump .continue

.zero
	writetext Text_CantBeRegistered
.continue
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	writetext Text_SaveBeforeReentry
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_BATTLETOWER1F_CHECKSTATE
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_BATTLETOWER1F_NOOP
	setval BATTLETOWERACTION_06
	special BattleTowerAction
	setval BATTLETOWERACTION_12
	special BattleTowerAction
	writetext Text_RightThisWayToYourBattleRoom
	waitbutton
	sjump Script_ResumeBattleTowerChallenge

Script_ReachedBattleLimit: ; 726E
	writetext Text_FiveDayBattleLimit_Mobile
	waitbutton
	sjump Script_BattleTowerHopeToServeYouAgain

Script_AMonLevelExceeds:
	writetext Text_AMonLevelExceeds
	waitbutton
	sjump Script_Menu_ChallengeExplanationCancel

Script_MayNotEnterABattleRoomUnderL70:
	writetext Text_MayNotEnterABattleRoomUnderL70
	waitbutton
	sjump Script_Menu_ChallengeExplanationCancel

Script_MobileError: ; 7283
	special BattleTowerMobileError
	closetext
	end

BattleTower_LeftWithoutSaving:
	opentext
	writetext Text_BattleTower_LeftWithoutSaving
	waitbutton
	sjump Script_BattleTowerHopeToServeYouAgain

BattleTower1FYoungsterScript:
	faceplayer
	opentext
	writetext Text_BattleTowerYoungster
	waitbutton
	closetext
	turnobject BATTLETOWER1F_YOUNGSTER, RIGHT
	end

RadioTowerBuenaPrizeReceptionist:
	faceplayer
	opentext
	checkitem BLUE_CARD
	iffalse .NoCard
	writetext RadioTower2FBuenaReceptionistPointsForPrizesText
	promptbutton
.Menu
	farwritetext _BuenaAskWhichPrizeText
	special PrintBlueCardBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Bought1
	ifequal 2, .Bought2
	ifequal 3, .Bought3
	ifequal 4, .Bought4
	farwritetext _BuenaComeAgainText
	waitbutton
.continue
	closetext
	end

.NoCard:
	writetext RadioTower2FBuenaReceptionistNoCardText
	waitbutton
	closetext
	end

.BagFullBought1
	pocketisfull
.Bought1
	farwritetext _NoText
	loadmenu .MenuHeader1
	verticalmenu
	closewindow
	ifequal 1, .UltraBall
	ifequal 2, .FullRestore
	ifequal 3, .Nugget
	ifequal 4, .SlowpokeTail
	ifequal 5, .MaxEther
	ifequal 6, .MaxElixer
	ifequal 7, .MaxRevive
	sjump .Menu

.BagFullBought2
	pocketisfull
.Bought2
	farwritetext _NoText
	loadmenu .MenuHeader2
	verticalmenu
	closewindow
	ifequal 1, .HpUp
	ifequal 2, .Protein
	ifequal 3, .Iron
	ifequal 4, .Calcium
	ifequal 5, .Carbos
	ifequal 6, .PpUp
	ifequal 7, .RareCandy
	sjump .Menu

.BagFullBought3
	pocketisfull
.Bought3
	farwritetext _NoText
	loadmenu .MenuHeader3
	verticalmenu
	closewindow
	ifequal 1, .KingsRock
	ifequal 2, .MetalCoat
	ifequal 3, .DragonScale
	ifequal 4, .Upgrade
	ifequal 5, .BerserkGene
	ifequal 6, .ScopeLens
	ifequal 7, .Leftovers
	sjump .Menu

.BagFullBought4
	pocketisfull
.Bought4
	farwritetext _NoText
	loadmenu .MenuHeader4
	verticalmenu
	closewindow
	ifequal 1, .SacredAsh
	ifequal 2, .ExpShare
	ifequal 3, .NormalBox
	ifequal 4, .GorgeousBox
	ifequal 5, .LuckyEgg
	ifequal 6, .MasterBall
	ifequal 7, .EggTicket
	sjump .Menu

.Cost2
	readvar VAR_BLUECARDBALANCE
	ifless 2, .NotEnough
	setval TRUE
	end
.Pay2
	readvar VAR_BLUECARDBALANCE
	addval -2
	writevar VAR_BLUECARDBALANCE
	end

.Cost3
	readvar VAR_BLUECARDBALANCE
	ifless 3, .NotEnough
	setval TRUE
	end
.Pay3
	readvar VAR_BLUECARDBALANCE
	addval -3
	writevar VAR_BLUECARDBALANCE
	end

.Cost4
	readvar VAR_BLUECARDBALANCE
	ifless 4, .NotEnough
	setval TRUE
	end
.Pay4
	readvar VAR_BLUECARDBALANCE
	addval -4
	writevar VAR_BLUECARDBALANCE
	end

.Cost10
	readvar VAR_BLUECARDBALANCE
	ifless 10, .NotEnough
	setval TRUE
	end
.Pay10
	readvar VAR_BLUECARDBALANCE
	addval -10
	writevar VAR_BLUECARDBALANCE
	end

.Cost20
	readvar VAR_BLUECARDBALANCE
	ifless 20, .NotEnough
	setval TRUE
	end
.Pay20
	readvar VAR_BLUECARDBALANCE
	addval -20
	writevar VAR_BLUECARDBALANCE
	end

.Cost30
	readvar VAR_BLUECARDBALANCE
	ifless 30, .NotEnough
	setval TRUE
	end
.Pay30
	readvar VAR_BLUECARDBALANCE
	addval -30
	writevar VAR_BLUECARDBALANCE
	end

.Cost50
	readvar VAR_BLUECARDBALANCE
	ifless 50, .NotEnough
	setval TRUE
	end
.Pay50
	readvar VAR_BLUECARDBALANCE
	addval -50
	writevar VAR_BLUECARDBALANCE
	end

.Cost100
	readvar VAR_BLUECARDBALANCE
	ifless 100, .NotEnough
	setval TRUE
	end
.Pay100
	readvar VAR_BLUECARDBALANCE
	addval -100
	writevar VAR_BLUECARDBALANCE
	end

.Cost200
	readvar VAR_BLUECARDBALANCE
	ifless 200, .NotEnough
	setval TRUE
	end
.Pay200
	readvar VAR_BLUECARDBALANCE
	addval -200
	writevar VAR_BLUECARDBALANCE
	end

.Cost255
	readvar VAR_BLUECARDBALANCE
	ifless 255, .NotEnough
	setval TRUE
	end
.Pay255
	readvar VAR_BLUECARDBALANCE
	addval -255
	writevar VAR_BLUECARDBALANCE
	end

.NotEnough
	farwritetext _BuenaNotEnoughPointsText
	setval FALSE
	end

.GiveItemScript
	farwritetext _BuenaHereYouGoText
	waitsfx
	playsound SFX_TRANSACTION
	waitbutton
	special PrintBlueCardBalance
	end

.UltraBall
	scall .Cost2
	iffalse .Bought1
	giveitem ULTRA_BALL
	iffalse .BagFullBought1
	scall .Pay2
	scall .GiveItemScript
	sjump .Bought1

.FullRestore
	scall .Cost2
	iffalse .Bought1
	giveitem FULL_RESTORE
	iffalse .BagFullBought1
	scall .Pay2
	scall .GiveItemScript
	sjump .Bought1

.Nugget
	scall .Cost3
	iffalse .Bought1
	giveitem NUGGET
	iffalse .BagFullBought1
	scall .Pay3
	scall .GiveItemScript
	sjump .Bought1

.SlowpokeTail
	scall .Cost3
	iffalse .Bought1
	giveitem SLOWPOKETAIL
	iffalse .BagFullBought1
	scall .Pay3
	scall .GiveItemScript
	sjump .Bought1

.MaxEther
	scall .Cost3
	iffalse .Bought1
	giveitem MAX_ETHER
	iffalse .BagFullBought1
	scall .Pay3
	scall .GiveItemScript
	sjump .Bought1

.MaxElixer
	scall .Cost10
	iffalse .Bought1
	giveitem MAX_ELIXER
	iffalse .BagFullBought1
	scall .Pay10
	scall .GiveItemScript
	sjump .Bought1

.MaxRevive
	scall .Cost10
	iffalse .Bought1
	giveitem MAX_REVIVE
	iffalse .BagFullBought1
	scall .Pay10
	scall .GiveItemScript
	sjump .Bought1

.Protein
	scall .Cost4
	iffalse .Bought2
	giveitem PROTEIN
	iffalse .BagFullBought2
	scall .Pay4
	scall .GiveItemScript
	sjump .Bought2
	
.Iron
	scall .Cost4
	iffalse .Bought2
	giveitem IRON
	iffalse .BagFullBought2
	scall .Pay4
	scall .GiveItemScript
	sjump .Bought2

.Carbos
	scall .Cost4
	iffalse .Bought2
	giveitem CARBOS
	iffalse .BagFullBought2
	scall .Pay4
	scall .GiveItemScript
	sjump .Bought2

.Calcium
	scall .Cost4
	iffalse .Bought2
	giveitem CALCIUM
	iffalse .BagFullBought2
	scall .Pay4
	scall .GiveItemScript
	sjump .Bought2

.HpUp
	scall .Cost4
	iffalse .Bought2
	giveitem HP_UP
	iffalse .BagFullBought2
	scall .Pay4
	scall .GiveItemScript
	sjump .Bought2

.PpUp
	scall .Cost4
	iffalse .Bought2
	giveitem PP_UP
	iffalse .BagFullBought2
	scall .Pay4
	scall .GiveItemScript
	sjump .Bought2

.RareCandy
	scall .Cost10
	iffalse .Bought2
	giveitem RARE_CANDY
	iffalse .BagFullBought2
	scall .Pay10
	scall .GiveItemScript
	sjump .Bought2

.KingsRock
	scall .Cost30
	iffalse .Bought3
	giveitem KINGS_ROCK
	iffalse .BagFullBought3
	scall .Pay30
	scall .GiveItemScript
	sjump .Bought3

.MetalCoat
	scall .Cost30
	iffalse .Bought3
	giveitem METAL_COAT
	iffalse .BagFullBought3
	scall .Pay30
	scall .GiveItemScript
	sjump .Bought3

.DragonScale
	scall .Cost30
	iffalse .Bought3
	giveitem DRAGON_SCALE
	iffalse .BagFullBought3
	scall .Pay30
	scall .GiveItemScript
	sjump .Bought3

.Upgrade
	scall .Cost50
	iffalse .Bought3
	giveitem UP_GRADE
	iffalse .BagFullBought3
	scall .Pay50
	scall .GiveItemScript
	sjump .Bought3

.BerserkGene
	scall .Cost100
	iffalse .Bought3
	giveitem BERSERK_GENE
	iffalse .BagFullBought3
	scall .Pay100
	scall .GiveItemScript
	sjump .Bought3

.ScopeLens
	scall .Cost100
	iffalse .Bought3
	giveitem SCOPE_LENS
	iffalse .BagFullBought3
	scall .Pay100
	scall .GiveItemScript
	sjump .Bought3

.Leftovers
	scall .Cost100
	iffalse .Bought3
	giveitem LEFTOVERS
	iffalse .BagFullBought3
	scall .Pay100
	scall .GiveItemScript
	sjump .Bought3

.SacredAsh
	scall .Cost100
	iffalse .Bought4
	giveitem SACRED_ASH
	iffalse .BagFullBought4
	scall .Pay100
	scall .GiveItemScript
	sjump .Bought4

.ExpShare
	scall .Cost100
	iffalse .Bought4
	giveitem EXP_SHARE
	iffalse .BagFullBought4
	scall .Pay100
	scall .GiveItemScript
	sjump .Bought4

.NormalBox
	scall .Cost100
	iffalse .Bought4
	giveitem NORMAL_BOX
	iffalse .BagFullBought4
	scall .Pay100
	scall .GiveItemScript
	sjump .Bought4

.GorgeousBox
	scall .Cost200
	iffalse .Bought4
	giveitem GORGEOUS_BOX
	iffalse .BagFullBought4
	scall .Pay200
	scall .GiveItemScript
	sjump .Bought4

.LuckyEgg
	scall .Cost200
	iffalse .Bought4
	giveitem LUCKY_EGG
	iffalse .BagFullBought4
	scall .Pay200
	scall .GiveItemScript
	sjump .Bought4

.MasterBall
	scall .Cost200
	iffalse .Bought4
	giveitem MASTER_BALL
	iffalse .BagFullBought4
	scall .Pay200
	scall .GiveItemScript
	sjump .Bought4

.EggTicket
	setval EGG_TICKET
	special UnusedFindItemInPCOrBag
	iftrue .GotEggTicket
	scall .Cost255
	iffalse .Bought4
	giveitem EGG_TICKET
	iffalse .BagFullBought4
	scall .Pay255
	scall .GiveItemScript
	sjump .Bought4

.GotEggTicket
	writetext GotEggTicketText
	waitbutton
	sjump .Bought4

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 19, 11
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP; flags
	db 5 ; items
	db "STRUMEMTI COMUNI@"
	db "STRUMENTI POTENZ.@"
	db "STRUMENTI TENUTI@"
	db "STRUMENTI RARI@"
	db "ESCI@"

.MenuHeader1:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, 17
	dw .MenuData1
	db 1 ; default option

.MenuData1:
	db STATICMENU_CURSOR | STATICMENU_WRAP; flags
	db 7 ; items
	db "ULTRA BALL      2@"
	db "RICARICA TOT    2@"
	db "PEPITA          3@"
	db "CODASLOWPOKE    3@"
	db "ETERE MAX       3@"
	db "ELISIR MAX     10@"
	db "REVITAL.MAX    10@"

.MenuHeader2:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, 17
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db STATICMENU_CURSOR | STATICMENU_WRAP; flags
	db 7 ; items
	db "PS-SU           4@"
	db "PROTEINA        4@"
	db "FERRO           4@"
	db "CALCIO          4@"
	db "CARBURANTE      4@"
	db "PP-SU           4@"
	db "CARAM. RARA    10@"

.MenuHeader3:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, 17
	dw .MenuData3
	db 1 ; default option

.MenuData3:
	db STATICMENU_CURSOR | STATICMENU_WRAP; flags
	db 7 ; items
	db "ROCCIA DI RE   30@"
	db "METALCOPERTA   30@"
	db "SQUAMA DRAGO   30@"
	db "UPGRADE        50@"
	db "GENEFURIOSO   100@"
	db "MIRINO        100@"
	db "AVANZI        100@"
	
.MenuHeader4:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, 17
	dw .MenuData4
	db 1 ; default option

.MenuData4:
	db STATICMENU_CURSOR | STATICMENU_WRAP; flags
	db 7 ; items
	db "CENEREMAGICA  100@"
	db "CONDIV.ESP.   100@"
	db "SCAT.NORMALE  100@"
	db "SCAT.LUSSO    200@"
	db "FORTUNUOVO    200@"
	db "MASTER BALL   200@"
	db "BIGL.UOVO     255@"

BattleTower1FCooltrainerFScript:
	jumptextfaceplayer Text_BattleTowerCooltrainerF

BattleTower1FBugCatcherScript:
	jumptextfaceplayer Text_BattleTowerBugCatcher

BattleTower1FGrannyScript:
	jumptextfaceplayer Text_BattleTowerGranny

MovementData_BattleTower1FWalkToElevator:
	step UP
	step UP
	step UP
	step UP
	step UP
MovementData_BattleTowerHallwayPlayerEntersBattleRoom:
	step UP
	step_end

MovementData_BattleTowerElevatorExitElevator:
	step DOWN
	step_end

MovementData_BattleTowerHallwayWalkTo1020Room:
	step RIGHT
	step RIGHT
MovementData_BattleTowerHallwayWalkTo3040Room:
	step RIGHT
	step RIGHT
	step UP
	step RIGHT
	turn_head LEFT
	step_end

MovementData_BattleTowerHallwayWalkTo90100Room:
	step LEFT
	step LEFT
MovementData_BattleTowerHallwayWalkTo7080Room:
	step LEFT
	step LEFT
MovementData_BattleTowerHallwayWalkTo5060Room:
	step LEFT
	step LEFT
	step UP
	step LEFT
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomPlayerWalksIn:
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksIn:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	turn_head LEFT
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksOut:
	turn_head UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksToPlayer:
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksAway:
	slow_step DOWN
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomPlayerTurnsToFaceReceptionist:
	turn_head DOWN
	step_end

MovementData_BattleTowerBattleRoomPlayerTurnsToFaceNextOpponent:
	turn_head RIGHT
	step_end

NoBattleTowerText:
	text "Spiacente, la"
	line "TORRE LOTTA non è"
	cont "ancora operativa."
	done

NoCardBattleTowerText:
	text "Spiacente, non è"
	line "possibile accedere"
	
	para "alla TORRE LOTTA"
	line "senza lo strumento"
	cont "CARTA BLU."
	
	para "Puoi procurartelo"
	line "alla TORRE RADIO"
	cont "di FIORDOROPOLI."
	done

Text_BattleTowerWelcomesYou:
	text "La TORRE LOTTA ti"
	line "dà il benvenuto!"

	para "Se vuoi, posso"
	line "farti entrare in"
	cont "una SALA LOTTA!"
	done

Text_WantToGoIntoABattleRoom:
	text "Vuoi entrare in"
	line "una SALA LOTTA?"
	done

Text_RightThisWayToYourBattleRoom:
	text "Per la SALA LOTTA,"
	line "da questa parte."
	done

Text_BattleTowerIntroduction_1: ; unreferenced
	text "La TORRE LOTTA è"
	line "stata costruita"
	cont "per le lotte di"
	cont "#MON."

	para "Le SALE LOTTA sono"
	line "state studiate per"

	para "ospitare le lotte"
	line "di allenatori"

	para "provenienti da"
	line "tutto il mondo."

	para "Nella TORRE LOTTA"
	line "ci sono molte"
	cont "SALE LOTTA."

	para "In ogni SALA si"
	line "trovano sette"
	cont "allenatori."

	para "Se sconfiggi tutti"
	line "i sette allenatori"

	para "di una SALA"
	line "ottenendo un buon"

	para "record, sarai il"
	line "PRIMO ALLENATORE"
	cont "di quella SALA."

	para "Tutti i MIGLIORI"
	line "ALLENATORI"

	para "entreranno per"
	line "sempre nell'ALBO"
	cont "D'ORO."

	para "Puoi sfidare tutte"
	line "le SALE LOTTA ogni"
	cont "giorno."

	para "Però puoi lottare"
	line "solo una volta"

	para "al giorno in ogni"
	line "SALA."

	para "Per interrompere"
	line "una sessione, devi"
	cont "SALVARE."

	para "Altrimenti non"
	line "sarai in grado"

	para "di continuare le"
	line "sfide nella SALA."

	para ""
	done

Text_BattleTowerIntroduction_2:
	text "La TORRE LOTTA è"
	line "una struttura che"
	cont "ospita le lotte di"

	para "#MON."
	line "Allenatori da"

	para "tutto il mondo si"
	line "sfidano nelle SALE"

	para "LOTTA. Nella TORRE"
	line "LOTTA si trovano"

	para "moltissime SALE"
	line "LOTTA. In ogni"
	cont "SALA lottano sette"

	para "allenatori. Chi li"
	line "batte tutti vince"

	para "un premio. Per"
	line "interrompere le"

	para "lotte in una SALA"
	line "e riprenderle più"

	para "tardi, occorre"
	line "salvare il gioco"

	para "(SALVA)."
	line "Altrimenti si"

	para "dovrà ricominciare"
	line "daccapo."

	para ""
	done

Text_ReceivedAListOfLeadersOnTheHonorRoll:
	text "Ricevuta una lista"
	line "dei CAPI nell'ALBO"
	cont "D'ORO."

	para ""
	done

Text_PleaseConfirmOnThisMonitor:
	text "Conferma su"
	line "questo schermo."
	done

Text_ThankYou: ; unreferenced
	text "Grazie!"
	prompt

Text_ThanksForVisiting:
	text "Grazie per la"
	line "visita!"
	done

Text_BeatenAllTheTrainers_Mobile: ; unreferenced
	text "Congratulazioni!"
	
	para "Hai battuto tutti"
	line "gli allenatori!"
	
	para "Varrebbe la pena"
	line "di registrare la"
	cont "tua impresa."
	
	para "<PLAYER>. Con i"
	line "tuoi risultati,"
	
	para "potresti essere"
	line "scelto come"
	cont "CAPOSALA."
	
	para "Tieni, ti meriti"
	line "un premio!"
	
	para "Hai vinto @"
	text_ram wStringBuffer4 
	text " punti"
	line "sulla CARTA BLU."
	done

Text_CardFull:
	text "Hai raggiunto il"
	line "punteggio massimo."
	done

Text_CongratulationsYouveBeatenAllTheTrainers:
	text "Congratulazioni!"

	para "Hai battuto tutti"
	line "gli allenatori!"

	para "Ecco a te un"
	line "fantastico premio!"
	done

Text_AskRegisterRecord_Mobile: ; unreferenced
	text "Vuoi registrare"
	line "il tuo record"
	cont "al CENTRO?"
	done

Text_PlayerGotFive:
	text "<PLAYER> vince"
	line "@"
	text_ram wStringBuffer4
	text " (X5)!@"
	sound_item
	text_promptbutton
	text_end

Text_YourPackIsStuffedFull:
	text "Ehi, il tuo ZAINO"
	line "è pieno zeppo."

	para "Torna dopo aver"
	line "fatto spazio."
	done

Text_YourRegistrationIsComplete: ; unreferenced
	text "La registrazione è"
	line "stata completata."
	para "Torna a trovarci!"
	done

Text_WeHopeToServeYouAgain:
	text "Speriamo di"
	line "rivederti presto."
	done

Text_PleaseStepThisWay:
	text "Prego, per di qui."
	done

Text_WouldYouLikeToHearAboutTheBattleTower:
	text "Vuoi qualche"
	line "informazione sulla"
	cont "TORRE LOTTA?"
	done

Text_CantBeRegistered:
	text "Il tuo risultato"
	line "nella SALA LOTTA"

	para "precedente non si"
	line "potrà registrare."
	cont "Va bene?"
	done

Text_CantBeRegistered_PreviousRecordDeleted:
	text "Il tuo risultato"
	line "nella SALA LOTTA"

	para "precedente non si"
	line "potrà registrare."

	para "Anche il risultato"
	line "attuale andrà"
	cont "perso."
	done

Text_CheckTheLeaderHonorRoll: ; unreferenced
	text "Controllare il"
	line "CAPO dell'ALBO"
	cont "D'ORO?"
	done

Text_ReadBattleTowerRules:
	text "Qui sono scritte"
	line "le regole della"
	cont "TORRE LOTTA. Vuoi"
	cont "leggerle?"
	done

Text_BattleTowerRules:
	text "I #MON in"
	line "squadra devono"

	para "essere tre, tutti"
	line "diversi uno"
	cont "dall'altro."

	para "Non possono tenere"
	line "gli stessi"
	cont "strumenti. Inoltre"

	para "alcuni #MON non"
	line "sono ammessi anche"

	para "se non superano il"
	line "limite di livello."
	done

Text_BattleTower_LeftWithoutSaving:
	text "Scusa, ma non hai"
	line "salvato prima di"

	para "uscire dalla SALA"
	line "LOTTA. Mi dispiace"

	para "molto, ma la sfida"
	line "non è valida."
	done

Text_YourMonWillBeHealedToFullHealth:
	text "I tuoi #MON"
	line "torneranno in"
	cont "piena forma."
	done

Text_NextUpOpponentNo:
	text "Il prossimo"
	line "avversario è il"
	cont "Nº@"
	text_ram wStringBuffer3
	text ". Dai!"
	done

Text_SaveBeforeConnecting_Mobile: ; unreferenced
	text "Prima del"
	line "collegamento con"

	para "il CENTRO, la"
	line "sessione sarà"
	cont "salvata."
	done

Text_SaveBeforeEnteringBattleRoom:
	text "Prima di accedere"
	line "alla SALA LOTTA,"

	para "il gioco verrà"
	line "salvato."
	done

Text_SaveAndEndTheSession:
	text "Vuoi salvare e"
	line "concludere per"
	cont "il momento?"
	done

Text_SaveBeforeReentry:
	text "Il gioco verrà"
	line "SALVATO."

	para "Ritornerai alla"
	line "SALA precedente."
	done

Text_CancelYourBattleRoomChallenge:
	text "Vuoi annullare la"
	line "sfida nella SALA"
	cont "LOTTA?"
	done

Text_RegisterRecordOnFile_Mobile: ; unreferenced
	text "Abbiamo il tuo"
	line "record precedente-"

	para "mente salvato."
	line "Vuoi registrarlo"
	cont "al CENTRO?"
	done

Text_WeveBeenWaitingForYou:
	text "Ti stavamo"
	line "aspettando. Per la"

	para "SALA LOTTA, per di"
	line "qui."
	done

Text_FiveDayBattleLimit_Mobile:
	text "Puoi entrare solo"
	line "in venti SALE"
	cont "LOTTA al giorno."

	para "Torna domani, va"
	line "bene?"
	done

Text_TooMuchTimeElapsedNoRegister:
	text "Scusa, ma non puoi"
	line "registrare il tuo"

	para "record attuale al"
	line "CENTRO, perché è"

	para "trascorso troppo"
	line "tempo da quando"

	para "hai iniziato la"
	line "sfida o il record"
	cont "è stato eliminato."
	done

Text_RegisterRecordTimedOut_Mobile: ; unreferenced
; duplicate of Text_TooMuchTimeElapsedNoRegister
	text "Siamo spiacenti"
	line "ma non è possibile"

	para "registrare il tuo"
	line "record più recente"

	para "al CENTRO perchè è"
	line "passato troppo"
	
	para "tempo dall'inizio"
	line "della tua lotta."
	done

Text_AMonLevelExceeds:
	text "Il livello di uno"
	line "o più dei tuoi"
	cont "#MON eccede @"
	text_decimal wScriptVar, 1, 3
	text "."
	done

Text_MayNotEnterABattleRoomUnderL70:
	text_ram wcd49
	text " non può"
	line "entrare nelle"
	cont "SALE LOTTA."
	done

Text_BattleTowerYoungster:
	text "M'ha distrutto il"
	line "primo avversario,"
	cont "in un secondo!!!"
	done

Text_BattleTowerCooltrainerF:
	text "Le SALE LOTTA sono"
	line "molte, ma so che"

	para "posso vincere in"
	line "tutte!"
	done

Text_BattleTowerGranny:
	text "Non è facile"
	line "vincere senza"

	para "usare STRUMENTI"
	line "durante la lotta."

	para "Ma se fai tenere"
	line "strumenti ai tuoi"

	para "#MON, potrai"
	line "farcela!"
	done

Text_BattleTowerBugCatcher:
	text "Voglio vedere dove"
	line "riesco ad arrivare"

	para "usando solo #-"
	line "MON coleottero."

	para "Spero di non"
	line "lottare contro un"
	cont "#MON fuoco…"
	done

RadioTower2FBuenaReceptionistPointsForPrizesText:
	text "Puoi scambiare i"
	line "punti raccolti con"

	para "il premio che"
	line "preferisci!"
	done

RadioTower2FBuenaReceptionistNoCardText:
	text "Spiacente, non è"
	line "possibile comprare"
	
	para "strumenti senza la"
	line "CARTA BLU."
	
	para "Puoi procurartela"
	line "alla TORRE RADIO"
	cont "di FIORDOROPOLI."
	done

GotEggTicketText:
	text "Hai già questo"
	line "STRUMENTO BASE."
	done

OneTimeBuyText:
	text "Questo strumento"
	line "si può comprare"
	cont "solo una volta."
	done

BattleTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  9, BATTLE_TOWER_OUTSIDE, 3
	warp_event  8,  9, BATTLE_TOWER_OUTSIDE, 4
	warp_event  7,  0, BATTLE_TOWER_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event  6,  6, BGEVENT_READ, BattleTower1FRulesSign

	def_object_events
	object_event  7,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower1FReceptionistScript, -1
	object_event 14,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BattleTower1FYoungsterScript, -1
	object_event  4,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTower1FCooltrainerFScript, -1
	object_event  1,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleTower1FBugCatcherScript, -1
	object_event 14,  3, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower1FGrannyScript, -1
	object_event 10,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTowerBuenaPrizeReceptionist, -1
	