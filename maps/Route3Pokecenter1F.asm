Route3Pokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .Flypoint

.Flypoint:
	setflag ENGINE_FLYPOINT_ROUTE3
	return

Route3Pokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

Route3Pokecenter1FFatMagikarp:
	opentext
	checkevent EVENT_ROUTE_3_FAT_MAGIKARP
	iftrue .CheckFatPika
	writetext FatMagikarpIntroText
	special PlaceMoneyTopRight
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, 500
	ifequal HAVE_LESS, .OutOfMoney
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	takemoney YOUR_MONEY, 500
	waitsfx
	playsound SFX_TRANSACTION
	writetext FatMonThereYouGoText
	special PlaceMoneyTopRight
	waitsfx
	promptbutton
	writetext FatMagikarpReceivedText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke MAGIKARP, 5
	special GiveMagikarpSpecialMove
	setevent EVENT_ROUTE_3_FAT_MAGIKARP
.AlreadyHave
	writetext FatMagikarpAlreadyHaveText
	waitbutton
	closetext
	end

.Refused
	writetext FatMagikarpRefusedText
	waitbutton
	closetext
	end

.PartyFull
	writetext FatMagikarpPartyFullText
	waitbutton
	closetext
	end

.OutOfMoney
	writetext FatMagikarpOutOfMoneyText
	waitbutton
	closetext
	end

.CheckFatPika
	checkevent EVENT_ROUTE_3_FAT_PIKACHU
	iftrue .AlreadyHave
	special CheckDexCaughtVar
	ifnotequal 251, .AlreadyHave
	writetext FatPikachuIntroText
	special PlaceMoneyTopRight
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, .OutOfMoney
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	takemoney YOUR_MONEY, 5000
	waitsfx
	playsound SFX_TRANSACTION
	writetext FatMonThereYouGoText
	special PlaceMoneyTopRight
	waitsfx
	promptbutton
	writetext FatPikachuReceivedText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke PIKACHU, 5
	special GivePikachuSpecialMoves
	setevent EVENT_ROUTE_3_FAT_PIKACHU
	sjump .AlreadyHave

FatMagikarpIntroText:
	text "Ehilà, ciao!"
	line "Avrei un'offerta"
	cont "esclusiva per te!"
	
	para "Ti do un MAGIKARP"
	line "bello grasso per"
	cont "soli ¥500!"
	cont "Che ne dici?"
	done

FatMagikarpRefusedText:
	text "No? Stavo solo"
	line "cercando di farti"
	cont "un favore!"
	done

FatMagikarpReceivedText:
	text "<PLAYER> riceve"
	line "MAGIKARP!"
	done

FatMagikarpPartyFullText:
	text "Non c'è spazio per"
	line "altri #MON."
	done

FatMagikarpAlreadyHaveText:
	text "La merce non si"
	line "cambia!"
	done

FatMagikarpOutOfMoneyText:
	text "Ti ci vogliono"
	line "più soldi!"
	done

FatMonThereYouGoText:
	text "Grazie, ecco a te!"
	done

FatPikachuIntroText:
	text "Ehi!" 
	
	para "Ma questo è un"
	line "#DEX completo"
	cont "al 100ぁ!"

	para "Avrei un'offerta"
	line "esclusiva per te!"
	
	para "Ti do un PIKACHU"
	line "bello grasso per"
	cont "soli ¥5000!"
	cont "Che ne dici?"
	done

FatPikachuReceivedText:
	text "<PLAYER> riceve"
	line "PIKACHU!"
	done

Route3Pokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ROUTE_3, 2
	warp_event  4,  7, ROUTE_3, 2
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route3Pokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route3Pokecenter1FFatMagikarp, -1