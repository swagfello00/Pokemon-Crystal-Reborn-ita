	object_const_def
	const REDSHOUSE1F_REDS_MOM

RedsHouse1F_MapScripts:
	def_scene_scripts
	scene_script RedHouse1FNoopScene ; unusable

	def_callbacks

RedHouse1FNoopScene:
	end

RedsMom:
	faceplayer
	opentext
	checkevent EVENT_MET_REDS_MOM
	iftrue .MetAlready
	writetext RedsMomText1
	waitbutton
	closetext
	setevent EVENT_MET_REDS_MOM
	end
.MetAlready:
	writetext RedsMomText2
	waitbutton
	closetext
	end

RedsHouse1FTV:
	jumptext RedsHouse1FTVText

RedsHouse1FBookshelf:
	jumpstd PictureBookshelfScript

RedsMomText1:
	text "Ciao!"

	para "ROSSO è fuori da"
	line "parecchio tempo."

	para "Non ha neppure"
	line "telefonato, perciò"

	para "non ho idea di"
	line "dove sia e cosa"
	cont "stia facendo."

	para "Dicono che se non"
	line "chiama, vuol dire"

	para "che sta bene, ma"
	line "sto un po' in"
	cont "pensiero."
	done

RedsMomText2:
	text "Non vorrei che"
	line "ROSSO si facesse"

	para "male o non stesse"
	line "bene. Ma mi"

	para "riempie d'orgoglio"
	line "sapere che fa"

	para "ciò che desidera."
	done

RedsHouse1FTVText:
	text "Ci sono programmi"
	line "che a JOHTO"
	cont "non esistono…"
	done

RedsHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, PALLET_TOWN, 1
	warp_event  3,  7, PALLET_TOWN, 1
	warp_event  7,  0, REDS_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  1,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  2,  1, BGEVENT_READ, RedsHouse1FTV

	def_object_events
	object_event  5,  3, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsMom, -1
