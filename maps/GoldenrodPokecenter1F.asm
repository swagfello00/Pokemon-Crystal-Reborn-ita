	object_const_def
	const GOLDENRODPOKECENTER1F_NURSE
	const GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	const GOLDENRODPOKECENTER1F_SUPER_NERD ; $04
	const GOLDENRODPOKECENTER1F_LASS2 ; $05
	const GOLDENRODPOKECENTER1F_YOUNGSTER
	const GOLDENRODPOKECENTER1F_TEACHER ; $07
	const GOLDENRODPOKECENTER1F_ROCKER ; $08
	const GOLDENRODPOKECENTER1F_GAMEBOY_KID
	const GOLDENRODPOKECENTER1F_GRAMPS ; $0A
	const GOLDENRODPOKECENTER1F_LASS
	const GOLDENRODPOKECENTER1F_POKEFAN_F

GoldenrodPokecenter1F_MapScripts:
	def_scene_scripts
	scene_script .Scene0, SCENE_GOLDENRODPOKECENTER1F_DEFAULT
	scene_script .Scene0, SCENE_GOLDENRODPOKECENTER1F_DEFAULT2

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .prepareMap

.Scene0: ; stuff to handle the player turning his gb off without saving after a trade
	setval BATTLETOWERACTION_10 ; 5671d checks if a trade was made
	special BattleTowerAction
	iffalse .noTrade ; $2967
	prioritysjump scenejmp01 ; $6F68 received pokemon from trade corner dialogue
	end

.noTrade
	setval BATTLETOWERACTION_EGGTICKET ; check if player received the odd egg or still has the egg ticket
	special BattleTowerAction ; 5672b
	iffalse .notReceivedOddEgg ; $3467 still has egg ticket
	prioritysjump scenejmp02 ; $B568 received odd egg dialogue
.notReceivedOddEgg
	end

.prepareMap
	special Mobile_DummyReturnFalse
	iftrue .mobile ; $5067
	moveobject GOLDENRODPOKECENTER1F_LASS2, 16, 9 ; this is 71 in jp crystal???
	moveobject GOLDENRODPOKECENTER1F_GRAMPS, 0, 7
	moveobject GOLDENRODPOKECENTER1F_SUPER_NERD, 8, 13
	moveobject GOLDENRODPOKECENTER1F_TEACHER, 27, 13
	moveobject GOLDENRODPOKECENTER1F_ROCKER, 21, 6
	return ; this is 8f in jp crystal
.mobile
	setevent EVENT_33F
	return

GoldenrodPokecenter1FNurseScript:
	setevent EVENT_WELCOMED_TO_POKECOM_CENTER
	jumpstd PokecenterNurseScript

GoldenrodPokecenter1FTradeCornerAttendantScript:
	special SetBitsForLinkTradeRequest
	opentext
	writetext GoldenrodPokecomCenterWelcomeToTradeCornerText ; $2d6a
	buttonsound ; 54 in jp crystal?
	checkitem EGG_TICKET ; 56762 in jp crystal
	iftrue PlayerHasEggTicket ; $7c68
	special Function11b879 ; check save file?
	ifequal $01, PokemonInTradeCorner ; $F667
	ifequal $02, LeftPokemonInTradeCornerRecently ; $6968
	readvar $01
	ifequal $01, .onlyHaveOnePokemon ; $CF67 ; 56772
	writetext GoldenrodPokecomCenterWeMustHoldYourMonText ; $726A
	yesorno
	iffalse PlayerCancelled ; $D567

	writetext GoldenrodPokecomCenterSaveBeforeTradeCornerText ; $756E
	yesorno
	iffalse PlayerCancelled ; $D567
	special TryQuickSave
	iffalse PlayerCancelled ; $D567
	writetext GoldenrodPokecomCenterWhichMonToTradeText ; $8F6E
	waitbutton ; 53 in jp crystal?
	special BillsGrandfather ; 56792
	ifequal $00, PlayerCancelled ; $D567
	ifequal $FD, CantAcceptEgg ; $EA67
	ifgreater $FB, PokemonAbnormal ; $F067
	special Function11ba38 ; check party pokemon fainted
	ifnotequal $00, CantTradeLastPokemon ; $E467
	writetext GoldenrodPokecomCenterWhatMonDoYouWantText ; $9E6A
	waitbutton
	special Function11ac3e
	ifequal $00, PlayerCancelled ; $D567
	ifequal $02, .tradePokemonNeverSeen ; $BB67
	writetext GoldenrodPokecomCenterWeWillTradeYourMonForMonText ; $B96A ; 567B5
	sjump  .tradePokemon ; $BE67
.tradePokemonNeverSeen
	writetext GoldenrodPokecomCenterWeWillTradeYourMonForNewText ; $1E6B
.tradePokemon
	special TradeCornerHoldMon ; create data to send?
	ifequal $0A, PlayerCancelled ; $D567
	ifnotequal $00, MobileError ; $DB67
	writetext GoldenrodPokecomCenterYourMonHasBeenReceivedText ; $A86B
	waitbutton
	closetext
	end

.onlyHaveOnePokemon
	writetext GoldenrodPokecomCenterYouHaveOnlyOneMonText ; $D76B
	waitbutton
	closetext
	end

PlayerCancelled:
	writetext GoldenrodPokecomCenterWeHopeToSeeYouAgainText ; $0F6C
	waitbutton
	closetext
	end

MobileError:
	special BattleTowerMobileError
	writetext GoldenrodPokecomCenterTradeCanceledText ; $AA6E
	waitbutton
	closetext
	end

CantTradeLastPokemon:
	writetext GoldenrodPokecomCenterCantAcceptLastMonText ; $2C6C
	waitbutton
	closetext
	end

CantAcceptEgg:
	writetext GoldenrodPokecomCenterCantAcceptEggText ; $516C
	waitbutton
	closetext
	end

PokemonAbnormal:
	writetext GoldenrodPokecomCenterCantAcceptAbnormalMonText ; $6F6C
	waitbutton
	closetext
	end

PokemonInTradeCorner:
	writetext GoldenrodPokecomCenterSaveBeforeTradeCornerText ; $756E
	yesorno
	iffalse PlayerCancelled ; $D567
	special TryQuickSave
	iffalse PlayerCancelled ; $D567 ; 56800
	writetext GoldenrodPokecomCenterAlreadyHoldingMonText ; $896C
	buttonsound
	readvar $01
	ifequal $06, PartyFull ; $3868
	writetext GoldenrodPokecomCenterCheckingTheRoomsText ; $A56C
	special Function11b5e8 ; connect
	ifequal $0A, PlayerCancelled ; $D567
	ifnotequal $00, MobileError ; $DB67
	setval $0F
	special BattleTowerAction
	ifequal $00, NoTradePartnerFound ; $3E68 ; 56820
	ifequal $01, .receivePokemon ; $2B68
	sjump PokemonInTradeCornerForALongTime ; $5668

.receivePokemon
	writetext GoldenrodPokecomCenterTradePartnerHasBeenFoundText ; $C46C
	buttonsound
	special Function11b7e5 ; receive a pokemon animation?
	writetext GoldenrodPokecomCenterItsYourNewPartnerText ; $E66C
	waitbutton
	closetext
	end

PartyFull:
	writetext GoldenrodPokecomCenterYourPartyIsFullText ; $216D ; 56838
	waitbutton
	closetext
	end

NoTradePartnerFound:
	writetext GoldenrodPokecomCenterNoTradePartnerFoundText ; $576D ; 5683E
	yesorno
	iffalse ContinueHoldingPokemon ; $6368
	special Function11b920 ; something with mobile
	ifequal $0A, PlayerCancelled ; $D567
	ifnotequal $00, MobileError ; $DB67
	writetext GoldenrodPokecomCenterReturnedYourMonText ; $8A6D
	waitbutton
	closetext
	end

PokemonInTradeCornerForALongTime:
	writetext GoldenrodPokecomCenterYourMonIsLonelyText ; $9A6D ; 56856
	buttonsound
	special Function11b93b ; something with mobile
	writetext GoldenrodPokecenter1FWeHopeToSeeYouAgainText_2 ; $016E
	waitbutton
	closetext
	end

ContinueHoldingPokemon:
	writetext GoldenrodPokecomCenterContinueToHoldYourMonText ; $176E ; 56863
	waitbutton
	closetext
	end

LeftPokemonInTradeCornerRecently:
	writetext GoldenrodPokecomCenterRecentlyLeftYourMonText ; $306E ; 56869
	waitbutton
	closetext
	end

scenejmp01: ; ???
	setscene $01 ; 5686F
	refreshscreen
	writetext GoldenrodPokecomCenterTradePartnerHasBeenFoundText ; $C46C
	buttonsound
	writetext GoldenrodPokecomCenterItsYourNewPartnerText ; $E66C
	waitbutton
	closetext
	end

PlayerHasEggTicket:
	writetext GoldenrodPokecomCenterEggTicketText ; $CD6E ; 5687C
	waitbutton
	readvar $01
	ifequal $06, PartyFull ; $3868
	writetext GoldenrodPokecomCenterOddEggBriefingText ; $106F
	waitbutton
	writetext GoldenrodPokecomCenterSaveBeforeTradeCornerText ; $756E
	yesorno
	iffalse PlayerCancelled ; $D567
	special TryQuickSave
	iffalse PlayerCancelled ; $D567
	writetext GoldenrodPokecomCenterPleaseWaitAMomentText ; $CC6F
	special GiveOddEgg
	ifequal $0B, .eggTicketExchangeNotRunning ; $AF68
	ifequal $0A, PlayerCancelled ; $D567
	ifnotequal $00, MobileError ; $DB67
.receivedOddEgg
	writetext GoldenrodPokecomCenterHereIsYourOddEggText ; $E66F
	waitbutton
	closetext
	end

.eggTicketExchangeNotRunning
	writetext GoldenrodPokecomCenterNoEggTicketServiceText ; $2270 ; 568AF
	waitbutton
	closetext
	end

scenejmp02: ; 568B5
	opentext
	sjump PlayerHasEggTicket.receivedOddEgg ; $A968

GoldenrodPokecenter1F_NewsMachineScript:
	special Mobile_DummyReturnFalse ; 568B9
	iftrue .mobileEnabled ; $C268
	jumptext GoldenrodPokecomCenterNewsMachineNotYetText ; $1F76
.mobileEnabled
	opentext
	writetext GoldenrodPokecomCenterNewsMachineText ; $4D70
	buttonsound
	setval $14 ; (get battle tower save file flags if save is yours?)
	special BattleTowerAction
	ifnotequal $00, .skipExplanation ; $D968
	setval $15  ; (set battle tower save file flags?)
	special BattleTowerAction
	writetext GoldenrodPokecomCenterNewsMachineExplanationText ; $6370
	waitbutton
.skipExplanation
	writetext GoldenrodPokecomCenterSaveBeforeNewsMachineText ; $C371
	yesorno
	iffalse .cancel ; $FF68
	special TryQuickSave
	iffalse .cancel ; $FF68
	setval $15 ; (set battle tower save file flags?)
	special BattleTowerAction
.showMenu
	writetext GoldenrodPokecomCenterWhatToDoText ; $5970
	setval $00
	special Menu_ChallengeExplanationCancel ; show news machine menu
	ifequal $01, .getNews 		  ; $0869
	ifequal $02, .showNews 		  ; $1D69
	ifequal $03, .showExplanation ; $0169
.cancel
	closetext
	end

.showExplanation
	writetext GoldenrodPokecomCenterNewsMachineExplanationText ; $6370 ; 56901
	waitbutton
	sjump .showMenu; $EB68

.getNews
	writetext GoldenrodPokecomCenterWouldYouLikeTheNewsText ; $3E71 ; 56908
	yesorno
	iffalse .showMenu;$EB68
	writetext GoldenrodPokecomCenterReadingTheLatestNewsText ; $5471
	special Function17d2b6 ; download news?
	ifequal $0A, .showMenu ; $EB68
	ifnotequal $00, .mobileError ; $3569
.showNews
	special Function17d2ce ; show news?
	iffalse .quitViewingNews ; $3269
	ifequal $01, .noOldNews ; $2E69
	writetext GoldenrodPokecomCenterCorruptedNewsDataText ; $8971
	waitbutton
	sjump .showMenu ; $EB68

.noOldNews
	writetext GoldenrodPokecomCenterNoOldNewsText ; $7971 ; 5692E
	waitbutton
.quitViewingNews
	sjump .showMenu ; $EB68

.mobileError
	special BattleTowerMobileError ; 56935
	closetext
	end

Unreferenced:
	writetext GoldenrodPokecomCenterMakingPreparationsText ; ??? $AA71 ; 5693A no jump to here?
	waitbutton
	closetext
	end

GoldenrodPokecenter1F_GSBallSceneLeft:
	setval $0B ; 56940 (load mobile event index)
	special BattleTowerAction
	iffalse GoldenrodPokecenter1F_GSBallSceneRight.nogsball ; $9769
	checkevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER ; 340
	iftrue GoldenrodPokecenter1F_GSBallSceneRight.nogsball ; $9769
	moveobject GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, 12, 11
	sjump GoldenrodPokecenter1F_GSBallSceneRight.gsball ; 6769

GoldenrodPokecenter1F_GSBallSceneRight:
	setval $0B ; 56955 (load mobile event index)
	special BattleTowerAction
	iffalse .nogsball ; $9769
	checkevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER ; 340
	iftrue .nogsball ; $9769
	moveobject GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, 13, 11

.gsball ; 56769
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistApproachPlayerMovement ; $0F6A
	turnobject PLAYER, UP
	opentext
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistWalkBackMovement ; $196A
	special RestartMapMusic
	moveobject GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, 16,  8
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST

.nogsball
	end

GoldenrodPokecenter1FSuperNerdScript:
	special Mobile_DummyReturnFalse ; 56998
	iftrue .mobile ; $A169
	jumptextfaceplayer GoldenrodPokecenter1FMobileOffSuperNerdText  ; $E071

.mobile
	jumptextfaceplayer GoldenrodPokecenter1FMobileOnSuperNerdText ; $1E72

GoldenrodPokecenter1FLass2Script:
	special Mobile_DummyReturnFalse ; 569A4
	iftrue .mobile
	jumptextfaceplayer GoldenrodPokecenter1FMobileOffLassText ; $AD72

.mobile
	checkevent EVENT_33F
	iftrue .alreadyMoved ; $D369
	faceplayer
	opentext
	writetext GoldenrodPokecenter1FMobileOnLassText1 ; $EB72
	waitbutton
	closetext
	readvar $09
	ifequal $02, .talkedToFromRight ; $C769
	applymovement GOLDENRODPOKECENTER1F_LASS2, GoldenrodPokeCenter1FLass2WalkRightMovement ; $236A
	sjump .skip ; $CB69
.talkedToFromRight
	applymovement GOLDENRODPOKECENTER1F_LASS2, GoldenrodPokeCenter1FLassWalkRightAroundPlayerMovement ; $276A
.skip
	setevent EVENT_33F
	moveobject GOLDENRODPOKECENTER1F_LASS2, $12, $09
	end

.alreadyMoved
	jumptextfaceplayer GoldenrodPokecenter1FMobileOnLassText2 ; $2373

GoldenrodPokecenter1FYoungsterScript:
	special Mobile_DummyReturnFalse ; 569D6
	iftrue .mobile ; $DF69
	jumptextfaceplayer GoldenrodPokecenter1FMobileOffYoungsterText ; $5473

.mobile
	jumptextfaceplayer GoldenrodPokecenter1FMobileOnYoungsterText ; $1074

GoldenrodPokecenter1FTeacherScript:
	special Mobile_DummyReturnFalse ; 569E2
	iftrue .mobile ; $EB69
	jumptextfaceplayer GoldenrodPokecenter1FMobileOffTeacherText ; $8273

.mobile
	jumptextfaceplayer GoldenrodPokecenter1FMobileOnTeacherText ; $3274

GoldenrodPokecenter1FRockerScript:
	special Mobile_DummyReturnFalse ; 569EE
	iftrue .mobile ; $F769
	jumptextfaceplayer GoldenrodPokecenter1FMobileOffRockerText ; $D073

.mobile
	jumptextfaceplayer GoldenrodPokecenter1FMobileOnRockerText ; $5474

GoldenrodPokecenter1FGrampsScript:
	special Mobile_DummyReturnFalse ; 569FD
	iftrue .mobile ; $066A
	jumptextfaceplayer GoldenrodPokecenter1FMobileOffGrampsText ; $D674

.mobile
	jumptextfaceplayer GoldenrodPokecenter1FMobileOnGrampsText ; $1875

PokeComCenterInfoSign:
	jumptext GoldenrodPokecomCenterSignText

GoldenrodPokecenter1FGameboyKidScript:
	jumptextfaceplayer GoldenrodPokecenter1FGameboyKidText

GoldenrodPokecenter1FLassScript:
	jumptextfaceplayer GoldenrodPokecenter1FLassText

;GoldenrodPokecenter1FPokefanF:
;	faceplayer
;	opentext
;	writetext GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText
;	waitbutton
;	writetext GoldenrodPokecenter1FAskGiveAwayAnEonMailText
;	yesorno
;	iffalse .NoEonMail
;	takeitem EON_MAIL
;	iffalse .NoEonMail
;	writetext GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText
;	waitbutton
;	writetext GoldenrodPokecenter1FPokefanFThisIsForYouText
;	waitbutton
;	verbosegiveitem REVIVE
;	iffalse .NoRoom
;	writetext GoldenrodPokecenter1FPokefanFDaughterWillBeDelightedText
;	waitbutton
;	closetext
;	end
;
;.NoEonMail:
;	writetext GoldenrodPokecenter1FPokefanFTooBadText
;	waitbutton
;	closetext
;	end
;
;.NoRoom:
;	giveitem EON_MAIL
;	writetext GoldenrodPokecenter1FPokefanFAnotherTimeThenText
;	waitbutton
;	closetext
;	end

GoldenrodPokeCenter1FLinkReceptionistApproachPlayerMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistWalkBackMovement:
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

GoldenrodPokeCenter1FLass2WalkRightMovement:
	slow_step RIGHT ; db $0B
	slow_step RIGHT ; db $0B
	turn_head UP    ; db $01
	step_end        ; db $47

GoldenrodPokeCenter1FLassWalkRightAroundPlayerMovement:
	slow_step DOWN  ; db $08
	slow_step RIGHT ; db $0B
	slow_step RIGHT ; db $0B
	slow_step UP    ; db $09
	turn_head UP    ; db $01
	step_end        ; db $47

GoldenrodPokecomCenterWelcomeToTradeCornerText:
	text "Ti do il benvenuto"
	line "all'ANGOLO SCAMBI"
	para "del CENTRO"
	line "#COM!"

	para "Qui puoi scambiare"
	line "i tuoi #MON con"
	para "quelli di persone"
	line "lontane."
	done

GoldenrodPokecomCenterWeMustHoldYourMonText:
	text "Per iniziare uno"
	line "scambio, dobbiamo"
	para "tenere il tuo"
	line "#MON."

	para "Vuoi scambiare?"
	done

GoldenrodPokecomCenterWhatMonDoYouWantText:
	text "Che #MON"
	line "vuoi in cambio?"
	done

GoldenrodPokecomCenterWeWillTradeYourMonForMonText:
	text "Va bene."
	line "Scambieremo il tuo"

	para "@"
	text_ram wStringBuffer3
	text " per"
	line "@"
	text_ram wStringBuffer4
	text "."

	para "Terremo il tuo"
	line "#MON durante"
	cont "lo scambio."

	para "Per favore attendi"
	line "mentre prepariamo"
	cont "la SALA."
	done

GoldenrodPokecomCenterWeWillTradeYourMonForNewText:
	text "Va bene."
	line "Scambieremo il tuo"

	para "@"
	text_ram wStringBuffer3
	text " per un"
	line "#MON che non"
	cont "hai mai visto."

	para "Terremo il tuo"
	line "#MON durante"
	cont "lo scambio."

	para "Per favore attendi"
	line "mentre prepariamo"
	cont "la SALA."
	done

GoldenrodPokecomCenterYourMonHasBeenReceivedText:
	text "Il #MON da"
	line "scambiare è stato"
	cont "ricevuto."

	para "Servirà tempo"
	line "per trovare un"
	
	para "compagno di"
	line "scambi. Ritorna"
	cont "più tardi."
	done

GoldenrodPokecomCenterYouHaveOnlyOneMonText:
	text "Oh? Hai un solo"
	line "#MON in"
	cont "squadra."

	para "Torna quando avrai"
	line "più #MON in"
	cont "squadra."
	done

GoldenrodPokecomCenterWeHopeToSeeYouAgainText:
	text "Arrivederci!"
	done

GoldenrodPokecomCenterCommunicationErrorText: ; unreferenced
	text "Errore di"
	line "comunicazione…"
	done

GoldenrodPokecomCenterCantAcceptLastMonText:
	text "Se accettiamo"
	line "quel #MON,"
	cont "con chi lotterai?"
	done

GoldenrodPokecomCenterCantAcceptEggText:
	text "Spiacente."
	line "Non possiamo"
	cont "accettare un UOVO."
	done

GoldenrodPokecomCenterCantAcceptAbnormalMonText:
	text "Spiacente, il tuo"
	line "#MON sembra"
	cont "anormale."

	para "Non possiamo"
	line "accettarlo."
	done

GoldenrodPokecomCenterAlreadyHoldingMonText:
	text "Oh? Non abbiamo"
	line "già un tuo"
	cont "#MON?"
	done

GoldenrodPokecomCenterCheckingTheRoomsText:
	text "Controlleremo"
	line "le SALE."

	para "Attendi per"
	line "favore."
	done

GoldenrodPokecomCenterTradePartnerHasBeenFoundText:
	text "Grazie di aver"
	line "aspettato."

	para "Abbiamo trovato"
	line "un compagno di"
	cont "scambi."
	done

GoldenrodPokecomCenterItsYourNewPartnerText:
	text "È il tuo nuovo"
	line "compagno."

	para "Trattalo con"
	line "cura."

	para "Speriamo di"
	line "rivederti presto!"
	done

GoldenrodPokecomCenterYourPartyIsFullText:
	text "Oh-Oh. La tua"
	line "squadra è già al"
	cont "completo."

	para "Torna quando hai"
	line "posto."
	done

GoldenrodPokecomCenterNoTradePartnerFoundText:
	text "Spiacenti, nessuno"
	line "si è fatto avanti"

	para "come compagno di"
	line "scambi."

	para "Rivuoi il tuo"
	line "#MON?"
	done

GoldenrodPokecomCenterReturnedYourMonText:
	text "Il #MON ti è"
	line "stato restituito."
	done

GoldenrodPokecomCenterYourMonIsLonelyText:
	text "Spiacenti, nessuno"
	line "si è fatto avanti"

	para "come compagno di"
	line "scambi."

	para "Abbiamo tenuto a"
	line "lungo il tuo"
	cont "#MON."

	para "Di conseguenza,"
	line "si sente solo."

	para "Dobbiamo"
	line "restituirtelo."
	done

GoldenrodPokecenter1FWeHopeToSeeYouAgainText_2:
	text "Arrivederci!"
	done

GoldenrodPokecomCenterContinueToHoldYourMonText:
	text "Va bene."
	line "Continueremo a"
	para "tenere il tuo"
	line "#MON."
	done

GoldenrodPokecomCenterRecentlyLeftYourMonText:
	text "Oh? Ci hai"
	line "lasciato il tuo"
	cont "#MON da poco."

	para "Torna più tardi."
	done

GoldenrodPokecomCenterSaveBeforeTradeCornerText:
	text "Il gioco sarà"
	line "salvato prima di"
	para "connetterti al"
	line "CENTRO."
	done

GoldenrodPokecomCenterWhichMonToTradeText:
	text "Che #MON vuoi"
	line "scambiare?"
	done

GoldenrodPokecomCenterTradeCanceledText:
	text "Spiacente, bisogna"
	line "annullare lo"
	cont "scambio."
	done

GoldenrodPokecomCenterEggTicketText:
	text "Oh!"

	para "Vedo che hai un"
	line "BIGLIETTO UOVO!"

	para "È un coupon che"
	line "persone speciali"

	para "possono riscattare"
	line "per avere un"
	cont "#MON speciale!"
	done

GoldenrodPokecomCenterOddEggBriefingText:
	text "Lascia che ti"
	line "spieghi in breve."

	para "Gli scambi tenuti"
	line "all'ANGOLO SCAMBI"

	para "avvengono tra"
	line "persone che non"
	cont "si conoscono."


	para "Per questo, ci"
	line "mettono tempo."

	para "Comunque, c'è un"
	line "UOVO STRANO"
	cont "per te."

	para "Ti verrà inviato"
	line "subito."

	para "Scegli una sala"
	line "ti verrà mandato"

	para "Un UOVO STRANO"
	line "da lì."
	done

GoldenrodPokecomCenterPleaseWaitAMomentText:
	text "Attendere prego."
	done

GoldenrodPokecomCenterHereIsYourOddEggText:
	text "Grazie per"
	line "l'attesa."

	para "Abbiamo ricevuto"
	line "il tuo UOVO"
	cont "STRANO."

	para "Eccolo!"

	para "Allevalo con"
	line "cura."
	done

GoldenrodPokecomCenterNoEggTicketServiceText:
	text "Spiacente."

	para "Il servizio di"
	line "scambio del"
	para "BIGLIETTO UOVO."
	line "non è in"
	cont "esecuzione."
	done

GoldenrodPokecomCenterNewsMachineText:
	text "È la MACCHINA"
	line "delle NOTIZIE"
	cont "#MON."
	done

GoldenrodPokecomCenterWhatToDoText:
	text "Cosa vuoi fare?"
	done

GoldenrodPokecomCenterNewsMachineExplanationText:
	text "Le NOTIZIE #MON"
	line "sono assemblate"

	para "dai salvataggi"
	line "degli allenatori."

	para "Leggendo le"
	line "NOTIZIE il tuo"

	para "salvataggio"
	line "potrebbe essere"
	cont "inviato."

	para "I dati di salva-"
	line "taggio contengono"

	para "la lista delle tue"
	line "avventure e il tuo"
	cont "profilo mobile."

	para "Il tuo numero di"
	line "telefono non verrà"
	cont "inviato."

	para "Il contenuto delle"
	line "NOTIZIE dipende"

	para "dai salvataggi"
	line "spediti da te e"
	cont "altri allenatori."

	para "Potresti persino"
	line "finire nelle"
	cont "NOTIZIE!"
	done

GoldenrodPokecomCenterWouldYouLikeTheNewsText:
	text "Vuoi vedere le"
	line "NOTIZIE?"
	done

GoldenrodPokecomCenterReadingTheLatestNewsText:
	text "Lettura NOTIZIE"
	line "recenti… Attendi."
	done

GoldenrodPokecomCenterNoOldNewsText:
	text "Non ci sono"
	line "vecchie NOTIZIE…"
	done

GoldenrodPokecomCenterCorruptedNewsDataText:
	text "I dati delle "
	line "NOTIZIE sono"
	cont "corrotti."

	para "Si prega di"
	line "riscaricarle."
	done

GoldenrodPokecomCenterMakingPreparationsText:
	text "Stiamo finendo i"
	line "preparativi."

	para "Ritorna più tardi."
	done

GoldenrodPokecomCenterSaveBeforeNewsMachineText:
	text "I tuoi progressi"
	line "saranno salvati"

	para "prima di avviare"
	line "la MACCHINA"
	cont "NOTIZIE."
	done

GoldenrodPokecenter1FMobileOffSuperNerdText:
	text "Wow, questo CENTRO"
	line "#MON è enorme."

	para "Lo hanno appena"
	line "costruito. Hanno"

	para "installato anche"
	line "tanti nuovi"
	cont "macchinari."
	done

GoldenrodPokecenter1FMobileOnSuperNerdText:
	text "Ho pensato ad una"
	line "cosa molto"
	cont "divertente per il"
	cont "CENTRO SCAMBI…"

	para "Faccio tenere un"
	line "MESSAGGIO a"

	para "PIDGEY, poi lo"
	line "scambio con un"
	cont "altro #MON."

	para "Se usassero questo"
	line "sistema, potremmo"

	para "scambiarci così"
	line "tanti MESSAGGI!"

	para "L'ho chiamato"
	line "PIDGEY-MESSAGGIO."

	para "Se funziona, potrò"
	line "fare un mucchio di"
	cont "nuove amicizie!"
	done

GoldenrodPokecenter1FMobileOffLassText:
	text "Hanno detto che"
	line "qui si possono"
	
	para "scambiare #MON"
	line "sconosciuti."

	para "Però ci stanno"
	line "ancora lavorando"
	cont "su."
	done

GoldenrodPokecenter1FMobileOnLassText1:
    text "Una ragazza che"
    line "non conosco mi ha"

    para "ha scambiato il suo"
    line "HOPPIP."

    para "Dovresti scambiare"
    line "per ottenere i"
	para "#MON che"
	line "vorresti."
    done

GoldenrodPokecenter1FMobileOnLassText2:
	text "Ho ricevuto un"
	line "HOPPIP femmina che"
	cont "si chiama STANLEY!"

	para "È anche il nome di"
	line "mio padre!"
	done

GoldenrodPokecenter1FMobileOffYoungsterText:
	text "Cos'è la MACCHINA"
	line "NOTIZIE?"

	para "Le riceve da una"
	line "zona più ampia"
	cont "di una radio?"
	done

GoldenrodPokecenter1FMobileOffTeacherText:
	text "Il CENTRO #COM"
	line "si connetterà a"
	
	para "tutti i CENTRI"
	line "#COM attraverso"
	cont "la rete wireless."

	para "Significa che"
	line "metterà in"

	para "contatto ogni"
	line "genere di persona."
	done

GoldenrodPokecenter1FMobileOffRockerText:
	text "Le macchine qui"
	line "non si possono"
	cont "ancora usare."

	para "Però è bello"
	line "venire in un posto"

	para "famoso prima degli"
	line "altri."
	done

GoldenrodPokecenter1FMobileOnYoungsterText:
	text "Il mio amico era"
	line "nelle NOTIZIE di"

	para "un po' di tempo"
	line "fa. Mi ha proprio"
	cont "sorpreso!"
	done

GoldenrodPokecenter1FMobileOnTeacherText:
	text "Ho l'ansia se non"
	line "controllo le"
	cont "ultime NOTIZIE!"
	done

GoldenrodPokecenter1FMobileOnRockerText:

	text "Se finisco nelle"
	line "NOTIZIE e divento"

	para "famoso, verrò"
	line "sicuramente"
	cont "ammirato."

	para "Come ci finisco"
	line "nelle NOTIZIE?"
	done

GoldenrodPokecenter1FGameboyKidText:
	text "Il COLOSSEO, al"
	line "piano superiore, è"
	cont "per giocare via"
	cont "cavo."

	para "I risultati sono"
	line "appesi al muro:"

	para "non posso permet-"
	line "termi di perdere!"
	done

GoldenrodPokecenter1FMobileOffGrampsText:
	text "Sono arrivato qui"
	line "quando ho saputo"

	para "che il CENTRO"
	line "#MON di"

	para "FIORDOROPOLI ha"
	line "macchine che"
	
	para "nessuno ha mai"
	line "visto prima."

	para "Ma sembra siano"
	line "ancora impegnati"
	cont "coi preparativi…"
	done

GoldenrodPokecenter1FMobileOnGrampsText:
	text "Vedere tutte"
	line "queste cose mi fa"

	para "sentire più"
	line "giovane!"
	done

GoldenrodPokecenter1FLassText:
	text "Non è detto che un"
	line "#MON di livello"
	cont "più alto vinca."

	para "Potrebbe essere"
	line "svantaggiato come"
	cont "tipo."

	para "Non esiste un"
	line "#MON che sia"

	para "il più forte in"
	line "assoluto."
	done

GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText:
	text "Sei <PLAYER>?"

	para "Congratulazioni!"

	para "È appena arrivata"
	line "una GS BALL per"
	cont "te!"

	para "Eccola qui!"
	done

GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText:
	text "Torna a trovarci!"
	done

GoldenrodPokecomCenterSignText:
	text "CENTRO #COM"
	line "1ºP INFORMAZIONI"

	para "Sinistra:"
	line "AMMINISTRAZIONE"

	para "Centro:"
	line "ANGOLO SCAMBI"

	para "Destra:"
	line "NOTIZIE #MON"
	done

GoldenrodPokecomCenterNewsMachineNotYetText:
	text "È la MACCHINA"
	line "NOTIZIE #MON!"

	para "Non è ancora"
	line "operativa…"
	done

GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText:
	text "Ehi, il tuo ZAINO"
	line "sembra bello"

	para "pieno! Hai per"
	line "caso un MESSAGGIO"
	cont "EON? Mia figlia ne"

	para "sta cercando uno."
	line "Non glielo"

	para "potresti regalare,"
	line "per favore?"
	done

GoldenrodPokecenter1FAskGiveAwayAnEonMailText:
	text "Regali un"
	line "MESSAGGIO EON?"
	done

GoldenrodPokecenter1FPokefanFThisIsForYouText:
	text "Ehi, è grandioso!"
	line "Grazie mille!"

	para "Prendi questo in"
	line "cambio!"
	done

GoldenrodPokecenter1FPokefanFDaughterWillBeDelightedText:
	text "Mia figlia sarà"
	line "così felice?"
	done

GoldenrodPokecenter1FPokefanFTooBadText:
	text "Non ne hai?"
	line "Peccato!"
	done

GoldenrodPokecenter1FPokefanFAnotherTimeThenText:
	text "Beh… sarà per"
	line "un'altra volta."
	done

GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText:
	text "<PLAYER> regala il"
	line "MESSAGGIO EON."
	done

GoldenrodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6, 15, GOLDENROD_CITY, 15
	warp_event  7, 15, GOLDENROD_CITY, 15
	warp_event  0,  6, POKECOM_CENTER_ADMIN_OFFICE_MOBILE, 1
	warp_event  0, 15, POKECENTER_2F, 1

	def_coord_events
	coord_event  6, 15, SCENE_DEFAULT, GoldenrodPokecenter1F_GSBallSceneLeft
	coord_event  7, 15, SCENE_DEFAULT, GoldenrodPokecenter1F_GSBallSceneRight

	def_bg_events
	bg_event 24,  5, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript ; 57666
	bg_event 24,  6, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 24,  7, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 24,  9, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 24, 10, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 25, 11, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 26, 11, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 27, 11, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 28, 11, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 29,  5, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 29,  6, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 29,  7, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 29,  8, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 29,  9, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 29, 10, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event  2,  9, BGEVENT_READ, PokeComCenterInfoSign

	def_object_events
	object_event  7,  7, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FNurseScript, -1
	 ; 576C4
	object_event 16,  8, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FTradeCornerAttendantScript, -1
	 ; boy left of trade corner 576D1
	object_event 13,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_UP_DOWN, 16, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FSuperNerdScript, -1
	 ; girl in front of trade corner 576DE
	object_event 18,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FLass2Script, -1
	 ; boy left of news machine 576EB
	object_event 23, 08, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FYoungsterScript, -1
	 ; girl right of news machine 576F8
	object_event 30, 09, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FTeacherScript, -1
	 ; boy right of news machine 57705
	object_event 30, 05, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FRockerScript, -1
	 ; 57712
	object_event 11, 12, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FGameboyKidScript, -1
	 ; old man 5771F
	object_event 19, 14, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FGrampsScript, -1
	 ; 5772C
	object_event  4, 11, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FLassScript, -1
	;object_event 15, 12, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FPokefanF, -1
