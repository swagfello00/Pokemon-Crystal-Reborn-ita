	object_const_def
	const OLIVINEGOODRODHOUSE_FISHING_GURU

OlivineGoodRodHouse_MapScripts:
	def_scene_scripts

	def_callbacks

GoodRodGuru:
	faceplayer
	opentext
	checkevent EVENT_GOT_GOOD_ROD
	iftrue .AlreadyGotItem
	writetext OfferGoodRodText
	yesorno
	iffalse .DontWantIt
	writetext GiveGoodRodText
	promptbutton
	verbosegiveitem GOOD_ROD
	writetext GaveGoodRodText
	waitbutton
	closetext
	setevent EVENT_GOT_GOOD_ROD
	end

.DontWantIt:
	writetext DontWantGoodRodText
	waitbutton
	closetext
	end

.AlreadyGotItem:
	writetext HaveGoodRodText
	waitbutton
	closetext
	end

GoodRodHouseBookshelf: ; unreferenced
	jumpstd PictureBookshelfScript

OfferGoodRodText:
	text "OLIVINOPOLI si"
	line "trova sul mare."

	para "E se è sul mare, è"
	line "logico che vi"
	cont "siano dei pesci!"

	para "Sono 30 anni che"
	line "pesco qui."

	para "Che ne dici di"
	line "sfidare il mare"
	cont "pescando?"
	done

GiveGoodRodText:
	text "Vedrai che ti"
	line "piacerà pescare!"
	done

GaveGoodRodText:
	text "I pesci non si"
	line "trovano solo in"

	para "mare: sono ovunque"
	line "ci sia dell'acqua."
	done

DontWantGoodRodText:
	text "Cosa! Non ti piace"
	line "pescare!?"
	cont "Inconcepibile!"
	done

HaveGoodRodText:
	text "Ehi, come va?"
	line "Abboccano?"
	done

OlivineGoodRodHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 6
	warp_event  3,  7, OLIVINE_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoodRodGuru, -1
