	object_const_def
	const GOLDENRODCITY_POKEFAN_M1
	const GOLDENRODCITY_YOUNGSTER1
	const GOLDENRODCITY_COOLTRAINER_F1
	const GOLDENRODCITY_COOLTRAINER_F2
	const GOLDENRODCITY_YOUNGSTER2
	const GOLDENRODCITY_LASS
	const GOLDENRODCITY_GRAMPS
	const GOLDENRODCITY_ROCKETSCOUT
	const GOLDENRODCITY_ROCKET1
	const GOLDENRODCITY_ROCKET2
	const GOLDENRODCITY_ROCKET3
	const GOLDENRODCITY_ROCKET4
	const GOLDENRODCITY_ROCKET5
	const GOLDENRODCITY_ROCKET6
	const GOLDENRODCITY_MOVETUTOR

GoldenrodCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, GoldenrodCityFlypointAndFloriaCallback
	callback MAPCALLBACK_OBJECTS, GoldenrodCityMoveTutorCallback

GoldenrodCityFlypointAndFloriaCallback:
	setflag ENGINE_FLYPOINT_GOLDENROD
	setflag ENGINE_REACHED_GOLDENROD
	checkevent EVENT_MET_FLORIA
	iftrue .FloriaDone
	clearevent EVENT_FLORIA_AT_SUDOWOODO
.FloriaDone:
	endcallback

GoldenrodCityMoveTutorCallback:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iffalse .MoveTutorDone
	checkitem BLUE_CARD
	iffalse .MoveTutorDisappear
	readvar VAR_WEEKDAY
	ifequal WEDNESDAY, .MoveTutorAppear
	ifequal SATURDAY, .MoveTutorAppear
.MoveTutorDisappear:
	disappear GOLDENRODCITY_MOVETUTOR
	endcallback

.MoveTutorAppear:
	checkflag ENGINE_DAILY_MOVE_TUTOR
	iftrue .MoveTutorDone
	appear GOLDENRODCITY_MOVETUTOR
.MoveTutorDone:
	endcallback

MoveTutorScript:
	faceplayer
	opentext
	writetext GoldenrodCityMoveTutorAskTeachAMoveText
	yesorno
	iffalse .Refused
	writetext GoldenrodCityMoveTutorAsk4000CoinsOkayText
	special PrintBlueCardBalance
	yesorno
	iffalse .Refused2
	writetext GoldenrodCityMoveTutorWhichMoveShouldITeachText
	waitbutton
	loadmem wBuffer1, 1
.ReturnTeach
	writetext GoldenrodCityMoveTutorWhichMoveShouldText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Moves1
	ifequal 2, .Moves2
	ifequal 3, .Moves3
	ifequal 4, .Moves4
	readmem wBuffer1
	ifequal 1, .Incompatible
	sjump .FarewellKid

.MovesTeach1
	scall .TeachScript
.Moves1
	writetext GoldenrodCityMoveTutorMoveText
	loadmenu .MoveMenu1Header
	verticalmenu
	closewindow
	ifequal 1, .MegaPunch
	ifequal 2, .SwordsDance
	ifequal 3, .Whirlwind
	ifequal 4, .MegaKick
	ifequal 5, .BodySlam
	ifequal 6, .DoubleEdge
	ifequal 7, .IceBeam
	sjump .ReturnTeach

.MovesTeach2
	scall .TeachScript
.Moves2
	writetext GoldenrodCityMoveTutorMoveText
	loadmenu .MoveMenu2Header
	verticalmenu
	closewindow
	ifequal 1, .Submission
	ifequal 2, .Counter
	ifequal 3, .SeismicToss
	ifequal 4, .Thunderbolt
	ifequal 5, .Mimic
	ifequal 6, .Reflect
	ifequal 7, .Metronome
	sjump .ReturnTeach

.MovesTeach3
	scall .TeachScript
.Moves3
	writetext GoldenrodCityMoveTutorMoveText
	loadmenu .MoveMenu3Header
	verticalmenu
	closewindow
	ifequal 1, .Softboiled
	ifequal 2, .SkyAttack
	ifequal 3, .ThunderWave
	ifequal 4, .Explosion
	ifequal 5, .RockSlide
	ifequal 6, .TriAttack
	ifequal 7, .Substitute
	sjump .ReturnTeach

.MovesTeach4
	scall .TeachScript
.Moves4
	writetext GoldenrodCityMoveTutorMoveText
	loadmenu .MoveMenu4Header
	verticalmenu
	closewindow
	ifequal 1, .Flamethrower
	ifequal 2, .LightScreen
	ifequal 3, .Outrage
	ifequal 4, .PainSplit
	ifequal 5, .HealBell
	ifequal 6, .MirrorCoat
	ifequal 7, .FalseSwipe
	sjump .ReturnTeach

.MegaPunch
	farscall RadioTowerBuenaPrizeReceptionist.Cost2
	iffalse .Moves1
	setval MEGA_PUNCH
	special MoveTutor
	ifnotequal FALSE, .Moves1
	farscall RadioTowerBuenaPrizeReceptionist.Pay2
	sjump .MovesTeach1

.SwordsDance
	farscall RadioTowerBuenaPrizeReceptionist.Cost20
	iffalse .Moves1
	setval SWORDS_DANCE
	special MoveTutor
	ifnotequal FALSE, .Moves1
	farscall RadioTowerBuenaPrizeReceptionist.Pay20
	sjump .MovesTeach1

.Whirlwind
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Moves1
	setval WHIRLWIND
	special MoveTutor
	ifnotequal FALSE, .Moves1
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	sjump .MovesTeach1

.MegaKick
	farscall RadioTowerBuenaPrizeReceptionist.Cost3
	iffalse .Moves1
	setval MEGA_KICK
	special MoveTutor
	ifnotequal FALSE, .Moves1
	farscall RadioTowerBuenaPrizeReceptionist.Pay3
	sjump .MovesTeach1

.BodySlam
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Moves1
	setval BODY_SLAM
	special MoveTutor
	ifnotequal FALSE, .Moves1
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	sjump .MovesTeach1

.DoubleEdge
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Moves1
	setval DOUBLE_EDGE
	special MoveTutor
	ifnotequal FALSE, .Moves1
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	sjump .MovesTeach1

.IceBeam
	farscall RadioTowerBuenaPrizeReceptionist.Cost20
	iffalse .Moves1
	setval ICE_BEAM
	special MoveTutor
	ifnotequal FALSE, .Moves1
	farscall RadioTowerBuenaPrizeReceptionist.Pay20
	sjump .MovesTeach1

.Submission
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Moves2
	setval SUBMISSION
	special MoveTutor
	ifnotequal FALSE, .Moves2
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	sjump .MovesTeach2

.Counter
	farscall RadioTowerBuenaPrizeReceptionist.Cost20
	iffalse .Moves2
	setval COUNTER
	special MoveTutor
	ifnotequal FALSE, .Moves2
	farscall RadioTowerBuenaPrizeReceptionist.Pay20
	sjump .MovesTeach2
	
.SeismicToss
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Moves2
	setval SEISMIC_TOSS
	special MoveTutor
	ifnotequal FALSE, .Moves2
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	sjump .MovesTeach2
	
.Thunderbolt
	farscall RadioTowerBuenaPrizeReceptionist.Cost20
	iffalse .Moves2
	setval THUNDERBOLT
	special MoveTutor
	ifnotequal FALSE, .Moves2
	farscall RadioTowerBuenaPrizeReceptionist.Pay20
	sjump .MovesTeach2

.Mimic
	farscall RadioTowerBuenaPrizeReceptionist.Cost3
	iffalse .Moves2
	setval MIMIC
	special MoveTutor
	ifnotequal FALSE, .Moves2
	farscall RadioTowerBuenaPrizeReceptionist.Pay3
	sjump .MovesTeach2

.Reflect
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Moves2
	setval REFLECT
	special MoveTutor
	ifnotequal FALSE, .Moves2
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	sjump .MovesTeach2

.Metronome
	farscall RadioTowerBuenaPrizeReceptionist.Cost30
	iffalse .Moves2
	setval METRONOME
	special MoveTutor
	ifnotequal FALSE, .Moves2
	farscall RadioTowerBuenaPrizeReceptionist.Pay30
	sjump .MovesTeach2

.Softboiled
	farscall RadioTowerBuenaPrizeReceptionist.Cost30
	iffalse .Moves3
	setval SOFTBOILED
	special MoveTutor
	ifnotequal FALSE, .Moves3
	farscall RadioTowerBuenaPrizeReceptionist.Pay30
	sjump .MovesTeach3

.SkyAttack
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Moves3
	setval SKY_ATTACK
	special MoveTutor
	ifnotequal FALSE, .Moves3
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	sjump .MovesTeach3

.ThunderWave
	farscall RadioTowerBuenaPrizeReceptionist.Cost20
	iffalse .Moves3
	setval THUNDER_WAVE
	special MoveTutor
	ifnotequal FALSE, .Moves3
	farscall RadioTowerBuenaPrizeReceptionist.Pay20
	sjump .MovesTeach3

.Explosion
	farscall RadioTowerBuenaPrizeReceptionist.Cost50
	iffalse .Moves3
	setval EXPLOSION
	special MoveTutor
	ifnotequal FALSE, .Moves3
	farscall RadioTowerBuenaPrizeReceptionist.Pay50
	sjump .MovesTeach3

.RockSlide
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Moves3
	setval ROCK_SLIDE
	special MoveTutor
	ifnotequal FALSE, .Moves3
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	sjump .MovesTeach3

.TriAttack
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Moves3
	setval TRI_ATTACK
	special MoveTutor
	ifnotequal FALSE, .Moves3
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	sjump .MovesTeach3

.Substitute
	farscall RadioTowerBuenaPrizeReceptionist.Cost20
	iffalse .Moves3
	setval SUBSTITUTE
	special MoveTutor
	ifnotequal FALSE, .Moves3
	farscall RadioTowerBuenaPrizeReceptionist.Pay20
	sjump .MovesTeach3

.Flamethrower
	farscall RadioTowerBuenaPrizeReceptionist.Cost20
	iffalse .Moves4
	setval FLAMETHROWER
	special MoveTutor
	ifnotequal FALSE, .Moves4
	farscall RadioTowerBuenaPrizeReceptionist.Pay20
	sjump .MovesTeach4

.LightScreen
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Moves4
	setval LIGHT_SCREEN
	special MoveTutor
	ifnotequal FALSE, .Moves4
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	sjump .MovesTeach4

.Outrage
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Moves4
	setval OUTRAGE
	special MoveTutor
	ifnotequal FALSE, .Moves4
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	sjump .MovesTeach4

.PainSplit
	farscall RadioTowerBuenaPrizeReceptionist.Cost20
	iffalse .Moves4
	setval PAIN_SPLIT
	special MoveTutor
	ifnotequal FALSE, .Moves4
	farscall RadioTowerBuenaPrizeReceptionist.Pay20
	sjump .MovesTeach4

.HealBell
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Moves4
	setval HEAL_BELL
	special MoveTutor
	ifnotequal FALSE, .Moves4
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	sjump .MovesTeach4

.MirrorCoat
	farscall RadioTowerBuenaPrizeReceptionist.Cost20
	iffalse .Moves4
	setval MIRROR_COAT
	special MoveTutor
	ifnotequal FALSE, .Moves4
	farscall RadioTowerBuenaPrizeReceptionist.Pay20
	sjump .MovesTeach4

.FalseSwipe
	farscall RadioTowerBuenaPrizeReceptionist.Cost2
	iffalse .Moves4
	setval FALSE_SWIPE
	special MoveTutor
	ifnotequal FALSE, .Moves4
	farscall RadioTowerBuenaPrizeReceptionist.Pay2
	sjump .MovesTeach4

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 9, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP ; flags
	db 5 ; items
	db "MENU 1@"
	db "MENU 2@"
	db "MENU 3@"
	db "MENU 4@"
	db "ESCI@"

.MoveMenu1Header:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, 17
	dw .MenuData1
	db 1 ; default option

.MenuData1:
	db STATICMENU_CURSOR | STATICMENU_WRAP ; flags
	db 7 ; items
	db "MEGAPUGNO       2@"
	db "DANZASPADA     20@"
	db "TURBINE        10@"
	db "MEGACALCIO      3@"
	db "BODY SLAM      10@"
	db "SDOPPIATORE    10@"
	db "GELORAGGIO     20@"

.MoveMenu2Header:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, 17
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db STATICMENU_CURSOR | STATICMENU_WRAP ; flags
	db 7 ; items
	db "SOTTOMISS.     10@"
	db "CONTATORE      20@"
	db "MOV. SISMICO   10@"
	db "FULMINE        20@"
	db "MIMICA          3@"
	db "RIFLESSO       10@"
	db "METRONOMO      30@"

.MoveMenu3Header:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, 17
	dw .MenuData3
	db 1 ; default option

.MenuData3:
	db STATICMENU_CURSOR | STATICMENU_WRAP ; flags
	db 7 ; items
	db "COVAUOVA       30@"
	db "AEROATTACCO    10@"
	db "TUONONDA       20@"
	db "ESPLOSIONE     50@"
	db "FRANA          10@"
	db "TRIPLETTA      10@"
	db "SOSTITUTO      20@"
	
.MoveMenu4Header:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, 17
	dw .MenuData4
	db 1 ; default option

.MenuData4:
	db STATICMENU_CURSOR | STATICMENU_WRAP ; flags
	db 7 ; items
	db "LANCIAFIAMME   20@"
	db "SCHERMO-LUCE   10@"
	db "OLTRAGGIO      10@"
	db "MALCOMUNE      20@"
	db "RINTOCCASANA   10@"
	db "SPECCHIOVELO   20@"
	db "FALSOFINALE     2@"

.TeachScript
	writetext GoldenrodCityMoveTutorWhichMoveShouldITeachText
	promptbutton
	waitsfx
	playsound SFX_TRANSACTION
	special PrintBlueCardBalance
	end

.Refused:
	writetext GoldenrodCityMoveTutorAwwButTheyreAmazingText
	waitbutton
	closetext
	end

.Refused2:
	writetext GoldenrodCityMoveTutorHmTooBadText
	waitbutton
	closetext
	end

.Incompatible:
	writetext GoldenrodCityMoveTutorBButText
	waitbutton
	closetext
	end

.FarewellKid:
	writetext GoldenrodCityMoveTutorFarewellKidText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal LEFT, .WalkAroundPlayer
	applymovement GOLDENRODCITY_MOVETUTOR, GoldenrodCityMoveTutorEnterGameCornerMovement
	sjump .GoInside

.WalkAroundPlayer:
	applymovement GOLDENRODCITY_MOVETUTOR, GoldenrodCityMoveTutorWalkAroundPlayerThenEnterGameCornerMovement
.GoInside:
	playsound SFX_ENTER_DOOR
	disappear GOLDENRODCITY_MOVETUTOR
	clearevent EVENT_GOLDENROD_GAME_CORNER_MOVE_TUTOR
	setflag ENGINE_DAILY_MOVE_TUTOR
	waitsfx
	end

.NotEnoughMoney: ; unreferenced now
	writetext GoldenrodCityMoveTutorYouDontHaveEnoughCoinsText
	waitbutton
	closetext
	end

GoldenrodCityPokefanMScript:
	jumptextfaceplayer GoldenrodCityPokefanMText

GoldenrodCityYoungster1Script:
	jumptextfaceplayer GoldenrodCityYoungster1Text

GoldenrodCityCooltrainerF1Script:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext GoldenrodCityCooltrainerF1Text
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext GoldenrodCityCooltrainerF1Text_ClearedRadioTower
	waitbutton
	closetext
	end

GoldenrodCityCooltrainerF2Script:
	faceplayer
	opentext
	checkflag ENGINE_RADIO_CARD
	iftrue .GotRadioCard
	writetext GoldenrodCityCooltrainerF2Text
	waitbutton
	closetext
	end

.GotRadioCard:
	writetext GoldenrodCityCooltrainerF2Text_GotRadioCard
	waitbutton
	closetext
	end

GoldenrodCityYoungster2Script:
	jumptextfaceplayer GoldenrodCityYoungster2Text

GoldenrodCityLassScript:
	jumptextfaceplayer GoldenrodCityLassText

GoldenrodCityGrampsScript:
	jumptextfaceplayer GoldenrodCityGrampsText

GoldenrodCityRocketScoutScript:
	opentext
	writetext GoldenrodCityRocketScoutText1
	promptbutton
	faceplayer
	writetext GoldenrodCityRocketScoutText2
	waitbutton
	closetext
	turnobject GOLDENRODCITY_ROCKETSCOUT, UP
	end

GoldenrodCityRocket1Script:
	jumptextfaceplayer GoldenrodCityRocket1Text

GoldenrodCityRocket2Script:
	jumptextfaceplayer GoldenrodCityRocket2Text

GoldenrodCityRocket3Script:
	jumptextfaceplayer GoldenrodCityRocket3Text

GoldenrodCityRocket4Script:
	jumptextfaceplayer GoldenrodCityRocket4Text

GoldenrodCityRocket5Script:
	jumptextfaceplayer GoldenrodCityRocket5Text

GoldenrodCityRocket6Script:
	jumptextfaceplayer GoldenrodCityRocket6Text

GoldenrodCityStationSign:
	jumptext GoldenrodCityStationSignText

GoldenrodCityRadioTowerSign:
	jumptext GoldenrodCityRadioTowerSignText

GoldenrodDeptStoreSign:
	jumptext GoldenrodDeptStoreSignText

GoldenrodGymSign:
	jumptext GoldenrodGymSignText

GoldenrodCitySign:
	jumptext GoldenrodCitySignText

GoldenrodCityBikeShopSign:
	jumptext GoldenrodCityBikeShopSignText

GoldenrodCityGameCornerSign:
	jumptext GoldenrodCityGameCornerSignText

GoldenrodCityNameRaterSign:
	jumptext GoldenrodCityNameRaterSignText

GoldenrodCityUndergroundSignNorth:
	jumptext GoldenrodCityUndergroundSignNorthText

GoldenrodCityUndergroundSignSouth:
	jumptext GoldenrodCityUndergroundSignSouthText

GoldenrodCityPokecenterSign:
	jumptext GoldenrodCityPokeComCenterSignText

GoldenrodCityFlowerShopSign:
	jumptext GoldenrodCityFlowerShopSignText

GoldenrodCityMoveTutorEnterGameCornerMovement:
	step RIGHT
	step RIGHT
	step UP
	step_end

GoldenrodCityMoveTutorWalkAroundPlayerThenEnterGameCornerMovement:
	step DOWN
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

GoldenrodCityMoveTutorBButText:
	text "M-m-ma…"
	done

GoldenrodCityPokefanMText:
	text "La nuova TORRE"
	line "RADIO ha sostitui-"
	cont "to la vecchia, che"
	cont "cadeva a pezzi."
	done

GoldenrodCityYoungster1Text:
	text "So che c'è un"
	line "nuovo NEGOZIO"

	para "BICI, ma non lo"
	line "trovo."
	done

GoldenrodCityCooltrainerF1Text:
	text "Quel tipo si veste"
	line "in nero, come uno"

	para "di TEAM ROCKET!"
	line "Che sciocco!"
	done

GoldenrodCityCooltrainerF1Text_ClearedRadioTower:
	text "Davvero quell'uomo"
	line "in nero era uno di"

	para "TEAM ROCKET? Ma"
	line "è incredibile!"
	done

GoldenrodCityCooltrainerF2Text:
	text "La TORRE RADIO a"
	line "FIORDOROPOLI è"
	cont "un punto di rife-"
	cont "rimento."

	para "Ora stanno facendo"
	line "una campagna"
	cont "promozionale."

	para "Ti modificano il"
	line "#GEAR perché"

	para "si possa usare"
	line "anche come radio."
	done

GoldenrodCityCooltrainerF2Text_GotRadioCard:
	text "Vedo che il tuo "
	line "#GEAR funziona"
	cont "anche da radio!"
	done

GoldenrodCityYoungster2Text:
	text "E-eh-eh-eh…"

	para "Si sono lamentati"
	line "perché ho giocato"

	para "nei sotterranei"
	line "del CENTRO"
	cont "COMMERCIALE."
	done

GoldenrodCityLassText:
	text "Un uomo in quella"
	line "casa valuta i nomi"
	cont "dei tuoi #MON."

	para "Può anche cambiare"
	line "nome ai #MON."
	done

GoldenrodCityGrampsText:
	text "Ehi, ma questa"
	line "città non è"

	para "affatto piccola."
	line "Non mi ci ritrovo."
	done

GoldenrodCityRocketScoutText1:
	text "Dunque questa è la"
	line "TORRE RADIO…"
	done

GoldenrodCityRocketScoutText2:
	text "Che vuoi,"
	line "mosca? Smamma!"
	done

GoldenrodCityRocket1Text:
	text "Stammi alla larga!"
	line "Via!"
	done

GoldenrodCityRocket2Text:
	text "Impadronirsi della"
	line "TORRE RADIO…"

	para "Ehi, tu! Fatti gli"
	line "affari tuoi!"
	done

GoldenrodCityRocket3Text:
	text "I #MON? Sono"
	line "soltanto uno"

	para "strumento per fare"
	line "soldi!"
	done

GoldenrodCityRocket4Text:
	text "Presto il nostro"
	line "sogno si avvererà…"

	para "Abbiamo lavorato"
	line "molto…"
	done

GoldenrodCityRocket5Text:
	text "Ehi, microbo!"
	line "Fuori dai piedi,"
	cont "sparisci!"
	done

GoldenrodCityRocket6Text:
	text "Vieni a provare il"
	line "vero terrore di"
	cont "TEAM ROCKET!"
	done

GoldenrodCityStationSignText:
	text "STAZIONE"
	line "di FIORDOROPOLI"
	done

GoldenrodCityRadioTowerSignText:
	text "TORRE RADIO"
	line "di FIORDOROPOLI"
	done

GoldenrodDeptStoreSignText:
	text "Una completa sele-"
	line "zione di articoli"
	cont "sui #MON!"

	para "CENTRO COMMERCIALE"
	line "di FIORDOROPOLI"
	done

GoldenrodGymSignText:
	text "FIORDOROPOLI"
	line "CAPOPALESTRA:"
	cont "CHIARA"

	para "Carina, troppo"
	line "carina!"
	done

GoldenrodCitySignText:
	text "FIORDOROPOLI"

	para "Il festoso fascino"
	line "dell'opulenza"
	done

GoldenrodCityBikeShopSignText:
	text "Il mondo è una"
	line "pista ciclabile!"
	cont "NEGOZIO BICI"
	done

GoldenrodCityGameCornerSignText:
	text "Il Paese dei"
	line "Balocchi!"

	para "CASINÒ di"
	line "FIORDOROPOLI"
	done

GoldenrodCityNameRaterSignText:
	text "GIUDICE ONOMASTICO"

	para "Fate valutare i"
	line "nomi dei vostri"
	cont "#MON!"
	done

GoldenrodCityUndergroundSignNorthText:
	text "INGRESSO"
	line "SOTTERRANEI"
	done

GoldenrodCityUndergroundSignSouthText:
	text "INGRESSO"
	line "SOTTERRANEI"
	done

GoldenrodCityPokeComCenterSignText: ; unreferenced
	text "CENTRO #COM"
	line "Per consigli"
	cont "Mobile!"
	done

GoldenrodCityFlowerShopSignText:
	text "Un mondo di fiori"
	line "NEGOZIO FIORISTA"
	done

GoldenrodCityMoveTutorAskTeachAMoveText:
	text "Se vuoi, posso"
	line "insegnare ai tuoi"

	para "#MON mosse"
	line "eccezionali!"

	para "Vuoi una mossa?"
	done

GoldenrodCityMoveTutorAsk4000CoinsOkayText:
	text "Userai i punti"
	line "della CARTA BLU."
	cont "Va bene?"
	done

GoldenrodCityMoveTutorAwwButTheyreAmazingText:
	text "Ma… Guarda che"
	line "sono eccezionali…"
	done

GoldenrodCityMoveTutorWhichMoveShouldITeachText:
	text "Benone! Non te ne"
	line "pentirai!"
	done

GoldenrodCityMoveTutorWhichMoveShouldText:
	text "Quale mossa"
	line "preferisci?"
	done

GoldenrodCityMoveTutorHmTooBadText:
	text "Male… Penso"
	line "che dovrò andare a"
	cont "prendere dei soldi"
	cont "a casa…"
	done

GoldenrodCityMoveTutorFarewellKidText:
	text "Ahahah!"
	line "Addio!"
	done

GoldenrodCityMoveTutorYouDontHaveEnoughCoinsText:
	text "…Non hai"
	line "abbastanza"
	cont "gettoni…"
	done

GoldenrodCityMoveTutorMoveText:
	text_start
	done

GoldenrodCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 24,  7, GOLDENROD_GYM, 1
	warp_event 29, 29, GOLDENROD_BIKE_SHOP, 1
	warp_event 31, 21, GOLDENROD_HAPPINESS_RATER, 1
	warp_event  5, 25, BILLS_FAMILYS_HOUSE, 1
	warp_event  9, 13, GOLDENROD_MAGNET_TRAIN_STATION, 2
	warp_event 29,  5, GOLDENROD_FLOWER_SHOP, 1
	warp_event 33,  9, GOLDENROD_PP_SPEECH_HOUSE, 1
	warp_event 15,  7, GOLDENROD_NAME_RATER, 1
	warp_event 24, 27, GOLDENROD_DEPT_STORE_1F, 1
	warp_event 14, 21, GOLDENROD_GAME_CORNER, 1
	warp_event  5, 15, RADIO_TOWER_1F, 1
	warp_event 19,  1, ROUTE_35_GOLDENROD_GATE, 3
	warp_event  9,  5, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 8
	warp_event  9, 29, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 5
	warp_event 14, 27, GOLDENROD_POKECENTER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 10, 14, BGEVENT_READ, GoldenrodCityStationSign
	bg_event  4, 17, BGEVENT_READ, GoldenrodCityRadioTowerSign
	bg_event 26, 27, BGEVENT_READ, GoldenrodDeptStoreSign
	bg_event 26,  9, BGEVENT_READ, GoldenrodGymSign
	bg_event 22, 18, BGEVENT_READ, GoldenrodCitySign
	bg_event 28, 30, BGEVENT_READ, GoldenrodCityBikeShopSign
	bg_event 16, 22, BGEVENT_READ, GoldenrodCityGameCornerSign
	bg_event 12,  7, BGEVENT_READ, GoldenrodCityNameRaterSign
	bg_event  8,  6, BGEVENT_READ, GoldenrodCityUndergroundSignNorth
	bg_event 10, 30, BGEVENT_READ, GoldenrodCityUndergroundSignSouth
	bg_event 17, 27, BGEVENT_UP, GoldenrodCityPokecenterSign
	bg_event 30,  6, BGEVENT_READ, GoldenrodCityFlowerShopSign

	def_object_events
	object_event  7, 18, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityPokefanMScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 30, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityYoungster1Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 12, 16, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodCityCooltrainerF1Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 20, 26, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityCooltrainerF2Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 19, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodCityYoungster2Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 17, 10, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodCityLassScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event  9, 27, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityGrampsScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event  4, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocketScoutScript, EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	object_event 28, 20, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket1Script, EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	object_event  8, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket2Script, EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	object_event 16, 23, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket3Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 29, 20, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket4Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 29,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket5Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 31, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket6Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoveTutorScript, EVENT_GOLDENROD_CITY_MOVE_TUTOR
