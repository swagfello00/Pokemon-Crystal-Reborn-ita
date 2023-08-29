	object_const_def
	const ROUTE27SANDSTORMHOUSE_GRANNY

Route27SandstormHouse_MapScripts:
	def_scene_scripts

	def_callbacks

SandstormHouseWoman:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM37_SANDSTORM
	iftrue .AlreadyGotItem
	special GetFirstPokemonHappiness
	writetext SandstormHouseWomanText1
	promptbutton
	ifgreater 150 - 1, .Loyal
	sjump .Disloyal

.Loyal:
	writetext SandstormHouseWomanLoyalText
	promptbutton
	verbosegiveitem TM_SANDSTORM
	iffalse .Done
	setevent EVENT_GOT_TM37_SANDSTORM
.AlreadyGotItem:
	writetext SandstormHouseSandstormDescription
	waitbutton
.Done:
	closetext
	end

.Disloyal:
	writetext SandstormHouseWomanDisloyalText
	waitbutton
	closetext
	end

SandstormHouseBookshelf:
	jumpstd MagazineBookshelfScript

SandstormHouseWomanText1:
	text "Dove siete diretti"
	line "tu e i #MON?"

	para "Alla LEGA #MON?"

	para "I tuoi #MON"
	line "sono abbastanza"
	cont "leali da portarti"
	cont "alla vittoria?"

	para "Fammi vedere…"
	done

SandstormHouseWomanLoyalText:
	text "I tuoi #MON"
	line "si fidano molto"
	cont "di te."

	para "Vedo che li hai"
	line "allenati bene."

	para "Prendi questo dono"
	line "per il tuo"
	cont "viaggio."
	done

SandstormHouseSandstormDescription:
	text "MT37: si tratta di"
	line "TERREMPESTA."

	para "È una mossa che"
	line "danneggia entrambi"
	cont "gli sfidanti."

	para "È solo per esperti"
	line "allenatori."

	para "Usala se ne hai il"
	line "coraggio. Auguri!"
	done

SandstormHouseWomanDisloyalText:
	text "Se non c'è fiducia"
	line "può diventare"

	para "tutto più"
	line "difficile."

	para "La fiducia è ciò"
	line "che lega i #MON"
	cont "agli allenatori."
	done

Route27SandstormHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_27, 1
	warp_event  3,  7, ROUTE_27, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, SandstormHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, SandstormHouseBookshelf

	def_object_events
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SandstormHouseWoman, -1
