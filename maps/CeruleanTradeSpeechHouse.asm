	object_const_def
	const CERULEANTRADESPEECHHOUSE_GRANNY
	const CERULEANTRADESPEECHHOUSE_GRAMPS
	const CERULEANTRADESPEECHHOUSE_RHYDON
	const CERULEANTRADESPEECHHOUSE_ZUBAT

CeruleanTradeSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanTradeSpeechHouseGrannyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BULBASAUR
	iftrue .GotBulbasaur
	checkevent EVENT_KANTO_STARTERS
	iftrue .Chikorita
	writetext TakeThisBulbasaurText
	yesorno
	iffalse .Refused
	writetext BulbasaurImCountingOnYouText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedBulbasaurText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke BULBASAUR, 5, BERRY
	setevent EVENT_GOT_BULBASAUR
	writetext BulbasaurMayEvolveText
	waitbutton
	closetext
	end

.Chikorita
	writetext TakeThisChikoritaText
	yesorno
	iffalse .Refused
	writetext BulbasaurImCountingOnYouText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedChikoritaText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke CHIKORITA, 5, BERRY
	setevent EVENT_GOT_BULBASAUR
	writetext BulbasaurMayEvolveText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BulbasaurPartyFullText
	waitbutton
	closetext
	end

.Refused:
	writetext NoBulbasaurText
	waitbutton
	closetext
	end

.GotBulbasaur:
	writetext BulbasaurPopWontWorkText
	waitbutton
	closetext
	end

CeruleanTradeSpeechHouseGrampsScript:
	jumptextfaceplayer CeruleanTradeSpeechHouseGrampsText

CeruleanTradeSpeechHouseRhydonScript:
	opentext
	writetext CeruleanTradeSpeechHouseRhydonText
	cry KANGASKHAN
	waitbutton
	closetext
	end

CeruleanTradeSpeechHouseZubatScript:
	opentext
	writetext CeruleanTradeSpeechHouseZubatText
	cry ZUBAT
	waitbutton
	closetext
	end

CeruleanTradeSpeechHouseGrampsText:
	text "Ah… Che gioia…"
	done

CeruleanTradeSpeechHouseRhydonText:
	text "KANGASKHAN: Karu"
	line "karuu."
	done

CeruleanTradeSpeechHouseZubatText:
	text "ZUBAT: Zuba zuba."
	done

TakeThisBulbasaurText:
	text "Mi prendo cura dei"
	line "#MON scambiati."
	
	para "Questo BULBASAUR"
	line "ha bisogno di un"
	cont "allenatore che se"
	cont "ne occupi."

	para "Prenderesti questo"
	line "BULBASAUR?"
	done

TakeThisChikoritaText:
	text "Mi prendo cura dei"
	line "#MON scambiati."
	
	para "Questo CHIKORITA"
	line "ha bisogno di un"
	cont "allenatore che se"
	cont "ne occupi."

	para "Prenderesti questo"
	line "CHIKORITA?"
	done

BulbasaurImCountingOnYouText:
	text "Allora conto"
	line "su di te."
	done

ReceivedBulbasaurText:
	text "<PLAYER> riceve"
	line "BULBASAUR!"
	done

ReceivedChikoritaText:
	text "<PLAYER> riceve"
	line "CHIKORITA!"
	done

BulbasaurMayEvolveText:
	text "Mi raccomando,"
	line "trattalo con cura."
	done

BulbasaurPartyFullText:
	text "Ah, ma non hai"
	line "posto per altri"
	cont "#MON!"
	done

NoBulbasaurText:
	text "Oh… E ora come"
	line "faccio?"
	done

BulbasaurPopWontWorkText:
	text "Mio marito è"
	line "felice con i #-"
	cont "MON che ha ottenu-"
	cont "to con gli scambi."
	done

CeruleanTradeSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CERULEAN_CITY, 3
	warp_event  3,  7, CERULEAN_CITY, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanTradeSpeechHouseGrannyScript, -1
	object_event  1,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanTradeSpeechHouseGrampsScript, -1
	object_event  5,  2, SPRITE_KANGASKHAN, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeruleanTradeSpeechHouseRhydonScript, -1
	object_event  5,  6, SPRITE_ZUBAT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanTradeSpeechHouseZubatScript, -1
