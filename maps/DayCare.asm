	object_const_def
	const DAYCARE_GRAMPS
	const DAYCARE_GRANNY

DayCare_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, DayCareEggCheckCallback

DayCareEggCheckCallback:
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .PutDayCareManOutside
	clearevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	setevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	endcallback

.PutDayCareManOutside:
	setevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	clearevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	endcallback

DayCareManScript_Inside:
	faceplayer
	opentext
	special Mobile_DummyReturnFalse
	iffalse .AlreadyHaveOddEgg
	checkevent EVENT_GOT_ODD_EGG
	iftrue .AlreadyHaveOddEgg
	setval EGG_TICKET
	special UnusedFindItemInPCOrBag
	iftrue .AlreadyHaveOddEgg
	writetext Text_DayCareManTalksAboutEggTicket ; 7E2A
	promptbutton
	verbosegiveitem EGG_TICKET
	writetext DayCareText_ComeAgain ; 7EA3
	waitbutton
	closetext
	setevent EVENT_GOT_ODD_EGG
	end

.PartyFull:
	opentext
	writetext DayCareText_PartyFull
	waitbutton
	closetext
	end

.AlreadyHaveOddEgg:
	special DayCareMan
	waitbutton
	closetext
	end

DayCareLadyScript:
	faceplayer
	opentext
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .HusbandWasLookingForYou
	special DayCareLady
	waitbutton
	closetext
	end

.HusbandWasLookingForYou:
	writetext Text_GrampsLookingForYou
	waitbutton
	closetext
	end

DayCareBookshelf:
	jumpstd DifficultBookshelfScript

Text_GrampsLookingForYou:
	text "Mio marito ti"
	line "sta cercando."
	done

Text_DayCareManTalksAboutEggTicket: ; unreferenced
	text "Sono il padrone"
	line "della PENSIONE."

	para "C'è una cosa nuova"
	line "a FIORDOROPOLI,"

	para "chiamata l'ANGOLO"
	line "SCAMBI."

	para "Mi hanno dato un"
	line "BIGLIETTO UOVO che"

	para "essere scambiato"
	line "per un UOVO"
	cont "STRANO."

	para "Ma poichè gestiamo"
	line "una PENSIONE,"

	para "a noi non serve."
	line "Puoi prenderlo."
	done

DayCareManText_GiveOddEgg:
	text "Sono il PADRONE"
	line "della PENSIONE."
	cont "Conosci la storia"
	cont "delle UOVA?"

	para "Stavo accudendo i"
	line "#MON con"
	cont "mia moglie."

	para "E cosa troviamo?"
	line "Un UOVO!"

	para "È incredibile,"
	line "vero?"

	para "Beh, vuoi un"
	line "UOVO? Ok, allora"

	para "te lo regalo."
	line "Tieni!"
	done

DayCareText_ComeAgain: ; unreferenced
	text "Torna a trovarci."
	done

DayCareText_GotOddEgg:
	text "<PLAYER> riceve"
	line "l'UOVO STRANO!"
	done

DayCareText_DescribeOddEgg:
	text "L'ho trovato"
	line "mentre stavo"

	para "tenendo i #MON"
	line "di un allenatore."

	para "Ma lui non l'ha"
	line "voluto, così l'ho"

	para "tenuto io fino ad"
	line "ora."
	done

DayCareText_PartyFull:
	text "Non hai posto."
	done

DayCare_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  5, ROUTE_34, 3
	warp_event  0,  6, ROUTE_34, 4
	warp_event  2,  7, ROUTE_34, 5
	warp_event  3,  7, ROUTE_34, 5

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, DayCareBookshelf
	bg_event  1,  1, BGEVENT_READ, DayCareBookshelf

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Inside, EVENT_DAY_CARE_MAN_IN_DAY_CARE
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DayCareLadyScript, -1
