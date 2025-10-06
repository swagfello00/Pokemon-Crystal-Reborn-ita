	object_const_def
	const CHARCOALKILN_BLACK_BELT
	const CHARCOALKILN_YOUNGSTER
	const CHARCOALKILN_MOLTRES

CharcoalKiln_MapScripts:
	def_scene_scripts

	def_callbacks

CharcoalKilnBoss:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM01_CUT
	iftrue .GotCut
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue .SavedSlowpoke
	writetext CharcoalKilnBossText1
	waitbutton
	closetext
	end

.SavedSlowpoke:
	writetext CharcoalKilnBossText2
	waitbutton
	closetext
	end

.GotCut:
	writetext CharcoalKilnBossText3
	waitbutton
	closetext
	end

CharcoalKilnApprentice:
	faceplayer
	opentext
	checkevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
	iftrue .YoureTheCoolest
	checkevent EVENT_GOT_HM01_CUT
	iftrue .Thanks
	writetext CharcoalKilnApprenticeText1
	waitbutton
	closetext
	end

.Thanks:
	writetext CharcoalKilnApprenticeText2
	promptbutton
	verbosegiveitem CHARCOAL
	iffalse .Done
	setevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
	closetext
	end

.YoureTheCoolest:
	writetext CharcoalKilnApprenticeText3
	waitbutton
.Done:
	closetext
	end

CharcoalKilnFarfetchd:
	faceplayer
	opentext
	writetext FarfetchdText
	cry FARFETCH_D
	waitbutton
	closetext
	end

CharcoalKilnBookshelf:
	jumpstd MagazineBookshelfScript

CharcoalKilnRadio:
	jumpstd Radio2Script

CharcoalKilnBossText1:
	text "Tutti gli SLOWPOKE"
	line "sono scomparsi"
	cont "dalla città."

	para "E se il protettore"
	line "del bosco fosse"
	cont "adirato?"

	para "Sarà un cattivo"
	line "presagio? È meglio"
	cont "restare a casa."
	done

CharcoalKilnBossText2:
	text "Gli SLOWPOKE sono"
	line "tornati…"

	para "Ma il mio APPREN-"
	line "DISTA è ancora nel"
	cont "BOSCO DI LECCI."

	para "Che starà facendo"
	line "quello sfaticato?"
	done

CharcoalKilnBossText3:
	text "Hai cacciato TEAM"
	line "ROCKET e hai"

	para "avuto il coraggio"
	line "di entrare nel"
	cont "BOSCO DI LECCI?"

	para "Devi avere del"
	line "fegato! Mi piaci!"
	cont "Allenati con noi."
	done

CharcoalKilnApprenticeText1:
	text "Dove sono finiti"
	line "gli SLOWPOKE?"

	para "Saranno da qualche"
	line "parte a giocare?"
	done

CharcoalKilnApprenticeText2:
	text "Scusa! Ho scordato"
	line "di ringraziarti."

	para "Questa CARBONELLA"
	line "l'ho fatta io."

	para "Falla tenere ai"
	line "#MON di tipo"
	cont "fuoco!"
	done

CharcoalKilnApprenticeText3:
	text "Gli SLOWPOKE sono"
	line "tornati e hai pure"
	cont "trovato un"
	cont "FARFETCH'D."

	para "Sei grande, dico"
	line "davvero!"
	done

FarfetchdText:
	text "FARFETCH'D: Cuaaa!"
	done

CharcoalKiln_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, AZALEA_TOWN, 2
	warp_event  3,  7, AZALEA_TOWN, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, CharcoalKilnBookshelf
	bg_event  1,  1, BGEVENT_READ, CharcoalKilnBookshelf
	bg_event  7,  1, BGEVENT_READ, CharcoalKilnRadio

	def_object_events
	object_event  2,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnBoss, EVENT_CHARCOAL_KILN_BOSS
	object_event  5,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnApprentice, EVENT_CHARCOAL_KILN_APPRENTICE
	object_event  5,  6, SPRITE_FARFETCH_D, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CharcoalKilnFarfetchd, EVENT_CHARCOAL_KILN_FARFETCH_D
