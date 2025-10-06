	object_const_def
	const VERMILIONCITY_TEACHER
	const VERMILIONCITY_GRAMPS
	const VERMILIONCITY_MACHOP
	const VERMILIONCITY_SUPER_NERD
	const VERMILIONCITY_BIG_SNORLAX
	const VERMILIONCITY_POKEFAN_M

VermilionCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, VermilionCityFlypointCallback

VermilionCityFlypointCallback:
	setflag ENGINE_FLYPOINT_VERMILION
	endcallback

VermilionCityTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SQUIRTLE
	iftrue .GotSquirtle
	checkevent EVENT_KANTO_STARTERS
	iftrue .Totodile
	writetext TakeThisSquirtleText
	yesorno
	iffalse .Refused
	writetext SquirtleImCountingOnYouText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedSquirtleText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke SQUIRTLE, 5, BERRY
	setevent EVENT_GOT_SQUIRTLE
	writetext SquirtleMayEvolveText
	waitbutton
	closetext
	end

.Totodile
	writetext TakeThisTotodileText
	yesorno
	iffalse .Refused
	writetext SquirtleImCountingOnYouText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedTotodileText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke TOTODILE, 5, BERRY
	setevent EVENT_GOT_SQUIRTLE
	writetext SquirtleMayEvolveText
	waitbutton
	closetext
	end

.NoRoom:
	writetext SquirtlePartyFullText
	waitbutton
	closetext
	end

.Refused:
	writetext NoSquirtleText
	waitbutton
	closetext
	end

.GotSquirtle:
	writetext SquirtlePopWontWorkText
	waitbutton
	closetext
	end

VermilionMachopOwner:
	jumptextfaceplayer VermilionMachopOwnerText

VermilionMachop:
	opentext
	writetext VermilionMachopText1
	cry MACHOP
	waitbutton
	closetext
	earthquake 30
	opentext
	writetext VermilionMachopText2
	waitbutton
	closetext
	end

VermilionCitySuperNerdScript:
	jumptextfaceplayer VermilionCitySuperNerdText

VermilionSnorlax:
	opentext
	special SnorlaxAwake
	iftrue .Awake
	writetext VermilionCitySnorlaxSleepingText
	waitbutton
	closetext
	end

.Awake:
	writetext VermilionCityRadioNearSnorlaxText
	pause 15
	cry SNORLAX
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM2
	loadwildmon SNORLAX, 50
	startbattle
	disappear VERMILIONCITY_BIG_SNORLAX
	setevent EVENT_FOUGHT_SNORLAX
	reloadmapafterbattle
	end

VermilionGymBadgeGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
	iftrue .AlreadyGotItem
	readvar VAR_BADGES
	ifequal NUM_BADGES, .AllBadges
	ifgreater 13, .MostBadges
	ifgreater 9, .SomeBadges
	writetext VermilionCityBadgeGuyTrainerText
	waitbutton
	closetext
	end

.SomeBadges:
	writetext VermilionCityBadgeGuySomeBadgesText
	waitbutton
	closetext
	end

.MostBadges:
	writetext VermilionCityBadgeGuyMostBadgesText
	waitbutton
	closetext
	end

.AllBadges:
	writetext VermilionCityBadgeGuyAllBadgesText
	promptbutton
	verbosegiveitem HP_UP
	iffalse .Done
	setevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
.AlreadyGotItem:
	writetext VermilionCityBadgeGuyBattleEdgeText
	waitbutton
.Done:
	closetext
	end

VermilionCitySign:
	jumptext VermilionCitySignText

VermilionGymSign:
	jumptext VermilionGymSignText

PokemonFanClubSign:
	jumptext PokemonFanClubSignText

VermilionCityDiglettsCaveSign:
	jumptext VermilionCityDiglettsCaveSignText

VermilionCityPortSign:
	jumptext VermilionCityPortSignText

VermilionCityPokecenterSign:
	jumpstd PokecenterSignScript

VermilionCityMartSign:
	jumpstd MartSignScript

VermilionCityHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_VERMILION_CITY_HIDDEN_FULL_HEAL

VermilionMachopOwnerText:
	text "Il mio #MON"
	line "sta preparando il"
	cont "terreno per la"
	cont "costruzione."

	para "Ma non ho soldi"
	line "per far partire"
	cont "il progetto…"
	done

VermilionMachopText1:
	text "MACHOP: Guoo"
	line "gogogo!"
	done

VermilionMachopText2:
	text "C'è un MACHOP che"
	line "pesta il terreno,"
	cont "borbottando."
	done

VermilionCitySuperNerdText:
	text "A KANTO ci sono"
	line "otto PALESTRE."

	para "Il grande edificio"
	line "ad ARANCIOPOLI è"
	cont "la PALESTRA di"
	cont "qui."
	done

VermilionCitySnorlaxSleepingText:
	text "SNORLAX sonnecchia"
	line "in pace…"
	done

VermilionCityRadioNearSnorlaxText:
	text "Avvicina il #-"
	line "GEAR allo SNORLAX"
	cont "addormentato…"

	para "…"

	para "Si sta svegliando!"
	done

VermilionCityBadgeGuyTrainerText:
	text "A KANTO ci sono"
	line "ottimi allenatori."

	para "I CAPOPALESTRA"
	line "sono fortissimi."

	para "Non è davvero"
	line "facile batterli."
	done

VermilionCityBadgeGuySomeBadgesText:
	text "Hai già qualche"
	line "MEDAGLIA di"
	cont "KANTO?"

	para "Hai visto come"
	line "sono forti i"
	cont "CAPOPALESTRA?"
	done

VermilionCityBadgeGuyMostBadgesText:
	text "Presto avrai con-"
	line "quistato tutte le"

	para "MEDAGLIE delle"
	line "PALESTRE di KANTO."

	para "Fammi sapere"
	line "quando le avrai"
	cont "tutte!"
	done

VermilionCityBadgeGuyAllBadgesText:
	text "Complimenti!"

	para "Hai tutte le"
	line "MEDAGLIE di KANTO!"

	para "Meriti un premio"
	line "per questo!"
	done

VermilionCityBadgeGuyBattleEdgeText:
	text "Possedere diversi"
	line "tipi di #MON"

	para "può avvantaggiarti"
	line "nelle lotte."

	para "Certamente anche"
	line "nelle PALESTRE di"
	cont "KANTO ti"
	cont "saranno utili."
	done

VermilionCitySignText:
	text "ARANCIOPOLI"

	para "Porto dagli"
	line "squisiti tramonti"
	done

VermilionGymSignText:
	text "ARANCIOPOLI"
	line "CAPOPALESTRA:"
	cont "LT.SURGE"

	para "L'Americano"
	line "Illuminato"
	done

PokemonFanClubSignText:
	text "#MON FAN CLUB"

	para "Benvenuti tutti i"
	line "fan dei #MON!"
	done

VermilionCityDiglettsCaveSignText:
	text "GROTTA DIGLETT"
	done

VermilionCityPortSignText:
	text "ARANCIOPOLI, PORTO"
	line "INGRESSO"
	done

TakeThisSquirtleText:
	text "Hai battuto Lance?"
	
	para "Allora sei il"
	line "nuovo campione!"

	para "Prenderesti questo"
	line "SQUIRTLE?"
	
	para "Non fa altro che"
	line "dispetti."
	
	para "Un allenatore come"
	line "te non avrebbe"
	cont "problemi ad"
	cont "occuparsene."
	
	para "Lo vuoi tu?"
	done

TakeThisTotodileText:
	text "Hai battuto Lance?"
	
	para "Allora sei il"
	line "nuovo campione!"

	para "Prenderesti questo"
	line "TOTODILE?"
	
	para "Non fa altro che"
	line "dispetti."
	
	para "Un allenatore come"
	line "te non avrebbe"
	cont "problemi ad"
	cont "occuparsene."
	
	para "Lo vuoi tu?"
	done

SquirtleImCountingOnYouText:
	text "Sapevo che non mi"
	line "avresti deluso!"

	para "Allora conto"
	line "su di te."
	done

ReceivedSquirtleText:
	text "<PLAYER> riceve"
	line "SQUIRTLE!"
	done

ReceivedTotodileText:
	text "<PLAYER> riceve"
	line "TOTODILE!"
	done

SquirtleMayEvolveText:
	text "Mi raccomando,"
	line "trattalo bene."
	done

SquirtlePartyFullText:
	text "Ah, ma non hai"
	line "posto per altri"
	cont "#MON!"
	done

NoSquirtleText:
	text "Oh… E ora come"
	line "faccio?"
	done

SquirtlePopWontWorkText:
	text "Il PORTO di"
	line "ARANCIOPOLI è la"
	cont "finestra sul mare"
	cont "di KANTO."

	para "Di qui partono"
	line "navi di lusso per"
	cont "tutto il mondo."
	done

VermilionCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, VERMILION_FISHING_SPEECH_HOUSE, 1
	warp_event  9,  5, VERMILION_POKECENTER_1F, 1
	warp_event  7, 13, POKEMON_FAN_CLUB, 1
	warp_event 13, 13, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, 1
	warp_event 21, 13, VERMILION_MART, 2
	warp_event 21, 17, VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE, 1
	warp_event 10, 19, VERMILION_GYM, 1
	warp_event 19, 31, VERMILION_PORT_PASSAGE, 1
	warp_event 20, 31, VERMILION_PORT_PASSAGE, 2
	warp_event 34,  7, DIGLETTS_CAVE, 1

	def_coord_events

	def_bg_events
	bg_event 25,  3, BGEVENT_READ, VermilionCitySign
	bg_event  5, 19, BGEVENT_READ, VermilionGymSign
	bg_event  5, 13, BGEVENT_READ, PokemonFanClubSign
	bg_event 33,  9, BGEVENT_READ, VermilionCityDiglettsCaveSign
	bg_event 27, 15, BGEVENT_READ, VermilionCityPortSign
	bg_event 10,  5, BGEVENT_READ, VermilionCityPokecenterSign
	bg_event 22, 13, BGEVENT_READ, VermilionCityMartSign
	bg_event 12, 19, BGEVENT_ITEM, VermilionCityHiddenFullHeal

	def_object_events
	object_event 18,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityTeacherScript, -1
	object_event 23,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMachopOwner, -1
	object_event 26,  7, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, VermilionMachop, -1
	object_event 14, 16, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionCitySuperNerdScript, -1
	object_event 34,  8, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionSnorlax, EVENT_VERMILION_CITY_SNORLAX
	object_event 31, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionGymBadgeGuy, -1
