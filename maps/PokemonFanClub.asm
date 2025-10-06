	object_const_def
	const POKEMONFANCLUB_CHAIRMAN
	const POKEMONFANCLUB_RECEPTIONIST
	const POKEMONFANCLUB_CLEFAIRY_GUY
	const POKEMONFANCLUB_TEACHER
	const POKEMONFANCLUB_FAIRY
	const POKEMONFANCLUB_ODDISH

PokemonFanClub_MapScripts:
	def_scene_scripts

	def_callbacks

PokemonFanClubChairmanScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	iftrue .HeardSpeech
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT_BUT_BAG_WAS_FULL
	iftrue .HeardSpeechButBagFull
	writetext PokemonFanClubChairmanDidYouVisitToHearAboutMyMonText
	yesorno
	iffalse .NotListening
	writetext PokemonFanClubChairmanRapidashText
	promptbutton
.HeardSpeechButBagFull:
	writetext PokemonFanClubChairmanIWantYouToHaveThisText
	promptbutton
	verbosegiveitem RARE_CANDY
	iffalse .BagFull
	setevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	writetext PokemonFanClubChairmanItsARareCandyText
	waitbutton
	closetext
	end

.HeardSpeech:
	writetext PokemonFanClubChairmanMoreTalesToTellText
	waitbutton
	closetext
	end

.NotListening:
	writetext PokemonFanClubChairmanHowDisappointingText
	waitbutton
.BagFull:
	closetext
	end

PokemonFanClubReceptionistScript:
	jumptextfaceplayer PokemonFanClubReceptionistText

PokemonFanClubClefairyGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	iftrue .GotLostItem
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .FoundClefairyDoll
	writetext PokemonFanClubClefairyGuyClefairyIsSoAdorableText
	waitbutton
	closetext
	end

.FoundClefairyDoll:
	writetext PokemonFanClubClefairyGuyMakingDoWithADollIFoundText
	checkevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	iftrue .MetCopycat
	waitbutton
	closetext
	end

.MetCopycat:
	promptbutton
	writetext PokemonFanClubClefairyGuyTakeThisDollBackToGirlText
	promptbutton
	waitsfx
	giveitem LOST_ITEM
	iffalse .NoRoom
	disappear POKEMONFANCLUB_FAIRY
	writetext PokemonFanClubPlayerReceivedDollText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	closetext
	end

.GotLostItem:
	writetext PokemonFanClubClefairyGuyGoingToGetARealClefairyText
	waitbutton
	closetext
	end

.NoRoom:
	writetext PokemonFanClubClefairyGuyPackIsJammedFullText
	waitbutton
	closetext
	end

PokemonFanClubTeacherScript:
	jumptextfaceplayer PokemonFanClubTeacherText

PokemonFanClubClefairyDollScript:
	jumptext PokemonFanClubClefairyDollText

PokemonFanClubBayleefScript:
	opentext
	writetext PokemonFanClubBayleefText
	cry BAYLEEF
	waitbutton
	closetext
	end

PokemonFanClubListenSign:
	jumptext PokemonFanClubListenSignText

PokemonFanClubBraggingSign:
	jumptext PokemonFanClubBraggingSignText

PokemonFanClubChairmanDidYouVisitToHearAboutMyMonText:
	text "Sono PRESIDENTE"
	line "del #MON FAN"
	cont "CLUB."

	para "Ho più di"
	line "150 #MON."

	para "I #MON sono"
	line "una cosa seria per"
	cont "me."

	para "Vuoi che ti"
	line "racconti qualcosa"
	cont "sui #MON?"
	done

PokemonFanClubChairmanRapidashText:
	text "Bene!"
	line "Allora ascolta!"

	para "Il mio favorito è"
	line "RAPIDASH…"

	para "È così… carino…"
	line "dolce… sveglio…"
	cont "irresistibilmente…"
	cont "straordinario…"
	cont "Vedi… è troppo…"
	cont "forte… e… bello…"
	cont "insomma…"
	cont "Lo adoro!"

	para "Se lo abbracci…"
	line "mentre dorme… è"
	cont "caldo e tenero… e"
	cont "spettacolare…"
	cont "esaltante… insomma"
	cont "divino…"
	cont "Oh, guarda l'ora:"
	cont "t'ho fatto fare"
	cont "tardi!"
	done

PokemonFanClubChairmanIWantYouToHaveThisText:
	text "Grazie per la tua"
	line "pazienza: prendi"
	cont "questo!"
	done

PokemonFanClubChairmanItsARareCandyText:
	text "È una CARAMELLA"
	line "RARA: rafforza i"
	cont "#MON!"

	para "Io preferisco"
	line "rafforzare i"

	para "#MON lottando:"
	line "puoi prenderla tu."
	done

PokemonFanClubChairmanMoreTalesToTellText:
	text "Salve, <PLAY_G>!"

	para "Sei qui per"
	line "salutare i miei"
	cont "#MON?"

	para "No? Peccato…"
	line "Potrei raccontarti"
	cont "tante storie…"
	done

PokemonFanClubChairmanHowDisappointingText:
	text "Che delusione…"

	para "Torna pure quando"
	line "vorrai ascoltarmi!"
	done

PokemonFanClubReceptionistText:
	text "Il PRESIDENTE è un"
	line "po' logorroico"
	cont "sui #MON…"
	done

PokemonFanClubClefairyGuyClefairyIsSoAdorableText:
	text "Mi piace come"
	line "CLEFAIRY muove il"

	para "dito quando prova"
	line "ad usare"

	para "METRONOMO."
	line "È adorabile!"
	done

PokemonFanClubClefairyGuyMakingDoWithADollIFoundText:
	text "Adoro CLEFAIRY, ma"
	line "non sono in grado"

	para "di catturarne uno."
	line "Così mi consolo"

	para "con una #"
	line "BAMBOLA che ho"
	cont "trovato."
	done

PokemonFanClubClefairyGuyTakeThisDollBackToGirlText:
	text "Ma la bambina che"
	line "ha perso la #"
	cont "BAMBOLA è triste…"

	para "Potresti portare"
	line "la # BAMBOLA"

	para "a quella povera"
	line "bambina?"

	para "Un giorno o"
	line "l'altro troverò un"

	para "CLEFAIRY vero,"
	line "puoi contarci!"
	done

PokemonFanClubPlayerReceivedDollText:
	text "<PLAYER> riceve la"
	line "# BAMBOLA."
	done

PokemonFanClubClefairyGuyGoingToGetARealClefairyText:
	text "Vedrai: farò"
	line "amicizia con un"

	para "CLEFAIRY in carne"
	line "ed ossa!"
	done

PokemonFanClubClefairyGuyPackIsJammedFullText:
	text "Il tuo ZAINO è"
	line "pienissimo."
	done

PokemonFanClubTeacherText:
	text "Guarda che"
	line "stupendo BAYLEEF!"

	para "Ti piace la foglia"
	line "che ha sul capo?"
	done

PokemonFanClubClefairyDollText:
	text "È un CLEFAIRY!"
	line "Come no?"

	para "E va bene: è solo"
	line "una # BAMBOLA"
	cont "CLEFAIRY."
	done

PokemonFanClubBayleefText:
	text "BAYLEEF: Li liif!"
	done

PokemonFanClubListenSignText:
	text "Ascolta sempre con"
	line "educazione gli"
	cont "allenatori."
	done

PokemonFanClubBraggingSignText:
	text "E se qualcuno si"
	line "vanta, fallo anche"
	cont "tu!"
	done

PokemonFanClub_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 3
	warp_event  3,  7, VERMILION_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  7,  0, BGEVENT_READ, PokemonFanClubListenSign
	bg_event  9,  0, BGEVENT_READ, PokemonFanClubBraggingSign

	def_object_events
	object_event  3,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubChairmanScript, -1
	object_event  4,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonFanClubReceptionistScript, -1
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubClefairyGuyScript, -1
	object_event  7,  2, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubTeacherScript, -1
	object_event  2,  4, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubClefairyDollScript, EVENT_VERMILION_FAN_CLUB_DOLL
	object_event  7,  3, SPRITE_BAYLEEF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonFanClubBayleefScript, -1
