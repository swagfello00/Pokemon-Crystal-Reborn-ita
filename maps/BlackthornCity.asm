	object_const_def
	const BLACKTHORNCITY_SUPER_NERD1
	const BLACKTHORNCITY_SUPER_NERD2
	const BLACKTHORNCITY_GRAMPS1
	const BLACKTHORNCITY_GRAMPS2
	const BLACKTHORNCITY_BLACK_BELT
	const BLACKTHORNCITY_COOLTRAINER_F1
	const BLACKTHORNCITY_YOUNGSTER1
	const BLACKTHORNCITY_SANTOS
	const BLACKTHORNCITY_COOLTRAINER_F2
	const BLACKTHORNCITY_POKE_BALL1
	const BLACKTHORNCITY_POKE_BALL2

BlackthornCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, BlackthornCityFlypointCallback
	callback MAPCALLBACK_OBJECTS, BlackthornCitySantosCallback

BlackthornCityFlypointCallback:
	setflag ENGINE_FLYPOINT_BLACKTHORN
	endcallback

BlackthornCitySantosCallback:
	readvar VAR_WEEKDAY
	ifequal SATURDAY, .SantosAppears
	disappear BLACKTHORNCITY_SANTOS
	endcallback

.SantosAppears:
	appear BLACKTHORNCITY_SANTOS
	endcallback

BlackthornSuperNerdScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CLAIR
	iftrue .BeatClair
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext Text_ClairIsOut
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext Text_ClairIsIn
	waitbutton
	closetext
	end

.BeatClair:
	writetext Text_ClairIsBeaten
	waitbutton
	closetext
	end

BlackthornGramps1Script:
	jumptextfaceplayer BlackthornGrampsRefusesEntryText

BlackthornGramps2Script:
	jumptextfaceplayer BlackthornGrampsGrantsEntryText

BlackthornBlackBeltScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext BlackBeltText_WeirdRadio
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext BlackBeltText_VoicesInMyHead
	waitbutton
	closetext
	end

BlackthornCooltrainerF1Script:
	jumptextfaceplayer BlackthornCooltrainerF1Text

BlackthornYoungsterScript:
	jumptextfaceplayer BlackthornYoungsterText

BlackthornCooltrainerF2Script:
	jumptextfaceplayer BlackthornCooltrainerF2Text

SantosScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	iftrue .Saturday
	readvar VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checkevent EVENT_MET_SANTOS_OF_SATURDAY
	iftrue .MetSantos
	writetext MeetSantosText
	promptbutton
	setevent EVENT_MET_SANTOS_OF_SATURDAY
.MetSantos:
	writetext SantosGivesGiftText
	promptbutton
	verbosegiveitem SPELL_TAG
	iffalse .Done
	setevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	writetext SantosGaveGiftText
	waitbutton
	closetext
	end

.Saturday:
	writetext SantosSaturdayText
	waitbutton
.Done:
	closetext
	end

.NotSaturday:
	writetext SantosNotSaturdayText
	waitbutton
	closetext
	end

BlackthornCitySign:
	jumptext BlackthornCitySignText

BlackthornGymSign:
	jumptext BlackthornGymSignText

MoveDeletersHouseSign:
	jumptext MoveDeletersHouseSignText

DragonDensSign:
	jumptext DragonDensSignText

BlackthornCityTrainerTips:
	jumptext BlackthornCityTrainerTipsText

BlackthornCityPokecenterSign:
	jumpstd PokecenterSignScript

BlackthornCityMartSign:
	jumpstd MartSignScript

BlackthornCityTMPsychUp:
	itemball TM_PSYCH_UP

BlackthornCitySunStone:
	itemball SUN_STONE

Text_ClairIsOut:
	text "Mi dispiace."

	para "SANDRA, il nostro"
	line "CAPOPALESTRA, è"

	para "andata nella TANA"
	line "DEL DRAGO, dietro"
	cont "alla PALESTRA."

	para "Non ho idea di"
	line "quando tornerà."
	done

Text_ClairIsIn:
	text "SANDRA, il nostro"
	line "CAPOPALESTRA, ti"
	cont "aspetta."

	para "Ma non è certo"
	line "possibile vincere"

	para "per un allenatore"
	line "improvvisato."
	done

Text_ClairIsBeaten:
	text "Hai battuto"
	line "SANDRA?"

	para "È straordinario!"

	para "Non credo che"
	line "abbia mai perso,"

	para "se non contro"
	line "LANCE."
	done

BlackthornGrampsRefusesEntryText:
	text "Solo i migliori"
	line "allenatori possono"

	para "entrare qui."
	line "Mi spiace, ma devi"
	cont "andartene."
	done

BlackthornGrampsGrantsEntryText:
	text "Se va bene per"
	line "SANDRA, anche suo"
	cont "nonno, il MAESTRO,"
	cont "ti farà entrare."
	cont "Accomodati."
	done

BlackBeltText_WeirdRadio:
	text "La mia radio sarà"
	line "guasta? Da un po'"
	cont "ricevo solo questo"
	cont "strano segnale."
	done

BlackBeltText_VoicesInMyHead:
	text "Come? Sento delle"
	line "voci! Ah, sto"

	para "ascoltando la mia"
	line "radio!"
	done

BlackthornCooltrainerF1Text:
	text "Vuoi far scordare"
	line "delle mosse ai"
	cont "tuoi #MON?"
	done

BlackthornYoungsterText:
	text "Tutti i campioni"
	line "del tipo drago"
	cont "provengono da"
	cont "EBANOPOLI."
	done

MeetSantosText:
	text "SABATINO: …"

	para "Oggi è sabato…"

	para "E io sono SABATINO"
	line "del sabato…"
	done

SantosGivesGiftText:
	text "Prendi questo…"
	done

SantosGaveGiftText:
	text "SABATINO: …"

	para "SPETTROTARGA…"

	para "Potenzia le mosse"
	line "di tipo spettro…"

	para "Ti terrorizzerà,"
	line "vedrai…"
	done

SantosSaturdayText:
	text "SABATINO: …"

	para "Ci vediamo qualche"
	line "altro sabato…"

	para "Anche se non potrò"
	line "regalarti altro…"
	done

SantosNotSaturdayText:
	text "SABATINO: Oggi non"
	line "è mica sabato…"
	done

BlackthornCooltrainerF2Text:
	text "Uauh, vieni dalla"
	line "VIA GELATA?"

	para "Devi essere grande"
	line "con i #MON!"
	done

BlackthornCitySignText:
	text "EBANOPOLI"

	para "Placida località"
	line "di montagna"
	done

BlackthornGymSignText:
	text "EBANOPOLI"
	line "CAPOPALESTRA:"
	cont "SANDRA"

	para "Con i #MON"
	line "drago è divina"
	done

MoveDeletersHouseSignText:
	text "CASA DELL'"
	line "ELIMINAMOSSE"
	
	para "E DEL"
	line "RICORDAMOSSE"
	done

DragonDensSignText:
	text "Per la TANA DEL"
	line "DRAGO"
	done

BlackthornCityTrainerTipsText:
	text "CONSIGLI UTILI"

	para "Un #MON che"
	line "tiene una BACCA"

	para "MIRACOLO potrà"
	line "risolvere ogni"
	cont "problema di stato."
	done

BlackthornCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 18, 13, BLACKTHORN_GYM_1F, 1
	warp_event 13, 23, BLACKTHORN_DRAGON_SPEECH_HOUSE, 1
	warp_event 29, 25, BLACKTHORN_EMYS_HOUSE, 1
	warp_event 15, 31, BLACKTHORN_MART, 2
	warp_event 21, 31, BLACKTHORN_POKECENTER_1F, 1
	warp_event  9, 33, MOVE_DELETERS_HOUSE, 1
	warp_event 36, 11, ICE_PATH_1F, 2
	warp_event 20,  3, DRAGONS_DEN_1F, 1

	def_coord_events

	def_bg_events
	bg_event 34, 26, BGEVENT_READ, BlackthornCitySign
	bg_event 17, 15, BGEVENT_READ, BlackthornGymSign
	bg_event  7, 33, BGEVENT_READ, MoveDeletersHouseSign
	bg_event 21,  5, BGEVENT_READ, DragonDensSign
	bg_event  5, 27, BGEVENT_READ, BlackthornCityTrainerTips
	bg_event 16, 31, BGEVENT_READ, BlackthornCityMartSign
	bg_event 22, 31, BGEVENT_READ, BlackthornCityPokecenterSign

	def_object_events
	object_event 18, 14, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornSuperNerdScript, EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	object_event 19, 14, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornSuperNerdScript, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 20,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGramps1Script, EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	object_event 21,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGramps2Script, EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	object_event 24, 33, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornBlackBeltScript, -1
	object_event  9, 27, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornCooltrainerF1Script, -1
	object_event 13, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornYoungsterScript, -1
	object_event 22, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SantosScript, EVENT_BLACKTHORN_CITY_SANTOS_OF_SATURDAY
	object_event 35, 21, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlackthornCooltrainerF2Script, -1
	object_event 22, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BlackthornCityTMPsychUp, EVENT_BLACKTHORN_CITY_TM_PSYCH_UP
	object_event 38, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BlackthornCitySunStone, EVENT_BLACKTHORN_CITY_SUN_STONE
