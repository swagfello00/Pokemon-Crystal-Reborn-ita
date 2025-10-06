DEF CELADONGAMECORNERPRIZEROOM_TM32_COINS     EQU 1500
DEF CELADONGAMECORNERPRIZEROOM_TM29_COINS     EQU 3500
DEF CELADONGAMECORNERPRIZEROOM_TM15_COINS     EQU 7500
DEF CELADONGAMECORNERPRIZEROOM_PIKACHU_COINS  EQU 2222
DEF CELADONGAMECORNERPRIZEROOM_PORYGON_COINS  EQU 5555
DEF CELADONGAMECORNERPRIZEROOM_LARVITAR_COINS EQU 8888

	object_const_def
	const CELADONGAMECORNERPRIZEROOM_GENTLEMAN
	const CELADONGAMECORNERPRIZEROOM_PHARMACIST

CeladonGameCornerPrizeRoom_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonGameCornerPrizeRoomGentlemanScript:
	jumptextfaceplayer CeladonGameCornerPrizeRoomGentlemanText

CeladonGameCornerPrizeRoomPharmacistScript:
	jumptextfaceplayer CeladonGameCornerPrizeRoomPharmacistText

CeladonGameCornerPrizeRoomTMVendor:
	faceplayer
	opentext
	writetext CeladonPrizeRoom_PrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse CeladonPrizeRoom_NoCoinCase
CeladonPrizeRoom_tmcounterloop:
	writetext CeladonPrizeRoom_AskWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu CeladonPrizeRoom_TMMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .DoubleTeam
	ifequal 2, .Psychic
	ifequal 3, .HyperBeam
	sjump CeladonPrizeRoom_CancelPurchaseScript

.DoubleTeam:
	checkitem TM_DOUBLE_TEAM
	iftrue CeladonPrizeRoom_alreadyhavetm
	checkcoins CELADONGAMECORNERPRIZEROOM_TM32_COINS
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	writetext CeladonPrizeRoom_DoubleTeamPurchaseText
	yesorno
	iffalse CeladonPrizeRoom_CancelPurchaseScript
	giveitem TM_DOUBLE_TEAM
	iffalse CeladonPrizeRoom_notenoughroom
	takecoins CELADONGAMECORNERPRIZEROOM_TM32_COINS
	sjump CeladonPrizeRoom_purchased

.Psychic:
	checkitem TM_PSYCHIC_M
	iftrue CeladonPrizeRoom_alreadyhavetm
	checkcoins CELADONGAMECORNERPRIZEROOM_TM29_COINS
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	writetext CeladonPrizeRoom_PsychicPurchaseText
	yesorno
	iffalse CeladonPrizeRoom_CancelPurchaseScript
	giveitem TM_PSYCHIC_M
	iffalse CeladonPrizeRoom_notenoughroom
	takecoins CELADONGAMECORNERPRIZEROOM_TM29_COINS
	sjump CeladonPrizeRoom_purchased

.HyperBeam:
	checkitem TM_HYPER_BEAM
	iftrue CeladonPrizeRoom_alreadyhavetm
	checkcoins CELADONGAMECORNERPRIZEROOM_TM15_COINS
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	writetext CeladonPrizeRoom_HyperBeamPurchaseText
	yesorno
	iffalse CeladonPrizeRoom_CancelPurchaseScript
	giveitem TM_HYPER_BEAM
	iffalse CeladonPrizeRoom_notenoughroom
	takecoins CELADONGAMECORNERPRIZEROOM_TM15_COINS
	sjump CeladonPrizeRoom_purchased

CeladonPrizeRoom_askbuy:
	writetext CeladonPrizeRoom_ConfirmPurchaseText
	yesorno
	end

CeladonPrizeRoom_purchased:
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonPrizeRoom_HereYouGoText
	waitbutton
	sjump CeladonPrizeRoom_tmcounterloop

CeladonPrizeRoom_alreadyhavetm:
	writetext CeladonPrizeRoom_AlreadyHaveTMText
	waitbutton
	sjump CeladonPrizeRoom_tmcounterloop

CeladonPrizeRoom_notenoughcoins:
	writetext CeladonPrizeRoom_NotEnoughCoinsText
	waitbutton
	closetext
	end

CeladonPrizeRoom_notenoughroom:
	writetext CeladonPrizeRoom_NotEnoughRoomText
	waitbutton
	closetext
	end

CeladonPrizeRoom_CancelPurchaseScript:
	writetext CeladonPrizeRoom_ComeAgainText
	waitbutton
	closetext
	end

CeladonPrizeRoom_NoCoinCase:
	writetext CeladonPrizeRoom_NoCoinCaseText
	waitbutton
	closetext
	end

CeladonPrizeRoom_TMMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "MT32    {d:CELADONGAMECORNERPRIZEROOM_TM32_COINS}@"
	db "MT29    {d:CELADONGAMECORNERPRIZEROOM_TM29_COINS}@"
	db "MT15    {d:CELADONGAMECORNERPRIZEROOM_TM15_COINS}@"
	db "ESCI@"

CeladonGameCornerPrizeRoomPokemonVendor:
	faceplayer
	opentext
	writetext CeladonPrizeRoom_PrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse CeladonPrizeRoom_NoCoinCase
.loop
	writetext CeladonPrizeRoom_AskWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Pikachu
	ifequal 2, .Porygon
	ifequal 3, .Larvitar
	sjump CeladonPrizeRoom_CancelPurchaseScript

.Pikachu:
	checkcoins CELADONGAMECORNERPRIZEROOM_PIKACHU_COINS
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, CeladonPrizeRoom_notenoughroom
	getmonname STRING_BUFFER_3, PIKACHU
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonPrizeRoom_HereYouGoText
	waitbutton
	setval PIKACHU
	special GameCornerPrizeMonCheckDex
	givepoke PIKACHU, 25
	takecoins CELADONGAMECORNERPRIZEROOM_PIKACHU_COINS
	sjump .loop

.Porygon:
	checkcoins CELADONGAMECORNERPRIZEROOM_PORYGON_COINS
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, CeladonPrizeRoom_notenoughroom
	getmonname STRING_BUFFER_3, PORYGON
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonPrizeRoom_HereYouGoText
	waitbutton
	setval PORYGON
	special GameCornerPrizeMonCheckDex
	givepoke PORYGON, 15
	takecoins CELADONGAMECORNERPRIZEROOM_PORYGON_COINS
	sjump .loop

.Larvitar:
	checkcoins CELADONGAMECORNERPRIZEROOM_LARVITAR_COINS
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, CeladonPrizeRoom_notenoughroom
	getmonname STRING_BUFFER_3, LARVITAR
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonPrizeRoom_HereYouGoText
	waitbutton
	setval LARVITAR
	special GameCornerPrizeMonCheckDex
	givepoke LARVITAR, 40
	takecoins CELADONGAMECORNERPRIZEROOM_LARVITAR_COINS
	sjump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "PIKACHU    {d:CELADONGAMECORNERPRIZEROOM_PIKACHU_COINS}@"
	db "PORYGON    {d:CELADONGAMECORNERPRIZEROOM_PORYGON_COINS}@"
	db "LARVITAR   {d:CELADONGAMECORNERPRIZEROOM_LARVITAR_COINS}@"
	db "ESCI@"

CeladonGameCornerPrizeRoomGentlemanText:
	text "Volevo PORYGON,"
	line "ma mi mancavano"
	cont "100 gettoni…"
	done

CeladonGameCornerPrizeRoomPharmacistText:
	text "Calma…"

	para "Calma e sangue"
	line "freddo…"

	para "Devo mantenere"
	line "la concentrazione,"
	cont "o perderò tutto…"
	done

CeladonPrizeRoom_PrizeVendorIntroText:
	text "Ti do il"
	line "benvenuto!"

	para "Qui scambiamo i"
	line "tuoi gettoni con"
	cont "fantastici premi!"
	done

CeladonPrizeRoom_AskWhichPrizeText:
	text "Che premio"
	line "preferisci?"
	done

CeladonPrizeRoom_ConfirmPurchaseText:
	text "Allora vuoi"
	line "@"
	text_ram wStringBuffer3
	text "?"
	done

CeladonPrizeRoom_HereYouGoText:
	text "Ecco qui!"
	done

CeladonPrizeRoom_AlreadyHaveTMText:
	text "Hai già questa MT!"
	done

CeladonPrizeRoom_NotEnoughCoinsText:
	text "Non hai abbastanza"
	line "gettoni."
	done

CeladonPrizeRoom_NotEnoughRoomText:
	text "Non hai abbastanza"
	line "spazio."
	done

CeladonPrizeRoom_ComeAgainText:
	text "Beh, torna quando"
	line "avrai i gettoni!"
	done

CeladonPrizeRoom_NoCoinCaseText:
	text "Non hai un"
	line "SALVADANAIO!"
	done

CeladonPrizeRoom_DoubleTeamPurchaseText:
	text "Allora vuoi"
	line "MT32 DOPPIOTEAM?"
	done

CeladonPrizeRoom_PsychicPurchaseText:
	text "Allora vuoi"
	line "MT29 PSICHICO?"
	done

CeladonPrizeRoom_HyperBeamPurchaseText:
	text "Allora vuoi"
	line "MT15 IPER-RAGGIO?"
	done

CeladonGameCornerPrizeRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  5, CELADON_CITY, 7
	warp_event  3,  5, CELADON_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, CeladonGameCornerPrizeRoomTMVendor
	bg_event  4,  1, BGEVENT_READ, CeladonGameCornerPrizeRoomPokemonVendor

	def_object_events
	object_event  0,  2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerPrizeRoomGentlemanScript, -1
	object_event  4,  4, SPRITE_PHARMACIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerPrizeRoomPharmacistScript, -1
