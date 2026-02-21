	object_const_def
	const ROUTE10SOUTH_POKEFAN_M1
	const ROUTE10SOUTH_POKEFAN_M2
	const ROUTE10SOUTH_POKE_BALL1

Route10South_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerHikerJim:
	trainer HIKER, JIM, EVENT_BEAT_HIKER_JIM, HikerJimSeenText, HikerJimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerJimAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmRobert:
	trainer POKEFANM, ROBERT, EVENT_BEAT_POKEFANM_ROBERT, PokefanmRobertSeenText, PokefanmRobertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmRobertAfterBattleText
	waitbutton
	closetext
	end

Route10Sign:
	jumptext Route10SignText

Route10BrickPiece:
	itemball BRICK_PIECE

HikerJimSeenText:
	text "Eheheh!"
	done

HikerJimBeatenText:
	text "Eheh-etciù!"
	done

HikerJimAfterBattleText:
	text "L'allergia mi"
	line "fa starnutire."
	cont "Eheheh-ecciù!"
	done

PokefanmRobertSeenText:
	text "Ti piacciono i"
	line "#MON, vero?"

	para "Anche a me!"
	done

PokefanmRobertBeatenText:
	text "È una"
	line "catastrofe."
	done

PokefanmRobertAfterBattleText:
	text "Guarda cosa hai"
	line "fatto al mio"
	cont "#MON…"

	para "Non lo"
	line "dimenticherò…"
	done

Route10SignText:
	text "PERCORSO 10"

	para "CELESTOPOLI -"
	line "LAVANDONIA"
	done

Route10South_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10,  1, ROCK_TUNNEL_1F, 2

	def_coord_events

	def_bg_events
	bg_event  9,  3, BGEVENT_READ, Route10Sign

	def_object_events
	object_event 21,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerJim, -1
	object_event 12, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmRobert, -1
	object_event 16,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route10BrickPiece, EVENT_ROUTE_10_BRICK_PIECE
	object_event 22, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LavenderTownPolkadotBow, EVENT_LAVENDER_TOWN_POLKADOT_BOW
