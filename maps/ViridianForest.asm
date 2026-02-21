	object_const_def
	const VIRIDIAN_FOREST_FRUIT_TREE
	const VIRIDIAN_FOREST_POKE_BALL1
	const VIRIDIAN_FOREST_POKE_BALL2
	const VIRIDIAN_FOREST_POKE_BALL3

ViridianForest_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianForestFruitTree:
	fruittree FRUITTREE_ROUTE_2

ViridianForestDireHit:
	itemball DIRE_HIT

ViridianForestLeafStone:
	itemball LEAF_STONE

ViridianForestMaxPotion:
	itemball MAX_POTION

ViridianForestHiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_2_HIDDEN_MAX_ETHER

ViridianForestHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_ROUTE_2_HIDDEN_FULL_HEAL
	
ViridianForestHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_ROUTE_2_HIDDEN_FULL_RESTORE

ViridianForestHiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_2_HIDDEN_REVIVE

ViridianForestSignText1:
	jumptext ViridianForestLeavingSignText

ViridianForestSignText2:
	jumptext ViridianForestTrainerTips3Text

ViridianForestSignText3:
	jumptext ViridianForestTrainerTips2Text

ViridianForestSignText4:
	jumptext ViridianForestUseAntidoteSignText

ViridianForestSignText5:
	jumptext ViridianForestTrainerTips4Text

ViridianForestSignText6:
	jumptext ViridianForestTrainerTips1Text

ViridianForestTrainerTips1Text::
	text "CONSIGLI UTILI"

	para "Per evitare le"
	line "lotte non entrare"
	cont "nell'erba alta!"
	done

ViridianForestUseAntidoteSignText::
	text "Usa l'ANTIDOTO"
	line "contro il veleno!"
	cont "Lo troverai ai"
	cont "#MON-MARKET!"
	done

ViridianForestTrainerTips2Text::
	text "CONSIGLI UTILI"

	para "Contatta PROF.OAK"
	line "via PC per avere"
	cont "la valutazione"
	cont "del tuo #DEX!"
	done

ViridianForestTrainerTips3Text::
	text "CONSIGLI UTILI"

	para "Non rubare i"
	line "#MON di"
	cont "altri allenatori."
	cont "Catturane solo"
	cont "di selvatici!"
	done

ViridianForestTrainerTips4Text::
	text "CONSIGLI UTILI"

	para "Indebolisci"
	line "i #MON prima"
	cont "di tentare di"
	cont "catturarli!"

	para "Se ancora forti,"
	line "scappano!"
	done

ViridianForestLeavingSignText::
	text "USCITA"
	line "BOSCO SMERALDO"
	cont "PLUMBEOPOLI PIÙ"
	cont "AVANTI"
	done

ViridianForest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 18, 47, ROUTE_2_SOUTH_GATE, 1
	warp_event 19, 47, ROUTE_2_SOUTH_GATE, 2
	warp_event  3,  5, ROUTE_2_NORTH_GATE, 3

	def_coord_events

	def_bg_events
	bg_event 32, 44, BGEVENT_ITEM, ViridianForestHiddenMaxEther
	bg_event 18, 43, BGEVENT_ITEM, ViridianForestHiddenFullHeal
	bg_event 30,  9, BGEVENT_ITEM, ViridianForestHiddenFullRestore
	bg_event  4, 43, BGEVENT_ITEM, ViridianForestHiddenRevive
	bg_event  4,  7, BGEVENT_READ, ViridianForestSignText1
	bg_event  6, 26, BGEVENT_READ, ViridianForestSignText2
	bg_event 28, 19, BGEVENT_READ, ViridianForestSignText3
	bg_event 18, 34, BGEVENT_READ, ViridianForestSignText4
	bg_event 26, 42, BGEVENT_READ, ViridianForestSignText5
	bg_event 20, 44, BGEVENT_READ, ViridianForestSignText6

	def_object_events
	object_event 31,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianForestFruitTree, -1
	object_event 14, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestDireHit, EVENT_ROUTE_2_DIRE_HIT
	object_event  3, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestMaxPotion, EVENT_ROUTE_2_MAX_POTION
	object_event  3, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestLeafStone, EVENT_VIRIDIAN_FOREST_LEAF_STONE