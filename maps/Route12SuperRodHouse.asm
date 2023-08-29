	object_const_def
	const ROUTE12SUPERRODHOUSE_FISHING_GURU

Route12SuperRodHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route12SuperRodHouseFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SUPER_ROD
	iftrue .GotSuperRod
	writetext OfferSuperRodText
	yesorno
	iffalse .Refused
	writetext GiveSuperRodText
	promptbutton
	verbosegiveitem SUPER_ROD
	iffalse .NoRoom
	setevent EVENT_GOT_SUPER_ROD
.GotSuperRod:
	writetext GaveSuperRodText
	waitbutton
	closetext
	end

.Refused:
	writetext DontWantSuperRodText
	waitbutton
.NoRoom:
	closetext
	end

SuperRodHouseBookshelf: ; unreferenced
	jumpstd PictureBookshelfScript

OfferSuperRodText:
	text "Sono il fratello"
	line "minore del GURU"
	cont "PESCATORE."

	para "Vedo che ti piace"
	line "pescare."

	para "Non c'è dubbio,"
	line "ti piace proprio!"

	para "È così, vero? So"
	line "che ho ragione."
	done

GiveSuperRodText:
	text "Sì sì. Proprio"
	line "come pensavo!"

	para "Per il tuo amore"
	line "per la pesca ti"
	cont "darò un SUPER AMO."
	done

GaveSuperRodText:
	text "Allenati pescando"
	line "ovunque ci sia"
	cont "dell'acqua."

	para "E ricorda: AMI"
	line "diversi permettono"

	para "di pescare "
	line "#MON diversi."
	done

DontWantSuperRodText:
	text "Ma come? Allora ho"
	line "visto male."
	done

Route12SuperRodHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_12, 1
	warp_event  3,  7, ROUTE_12, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route12SuperRodHouseFishingGuruScript, -1
