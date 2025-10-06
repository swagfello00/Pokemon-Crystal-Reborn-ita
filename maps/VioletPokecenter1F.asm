	object_const_def
	const VIOLETPOKECENTER1F_NURSE
	const VIOLETPOKECENTER1F_GAMEBOY_KID
	const VIOLETPOKECENTER1F_GENTLEMAN
	const VIOLETPOKECENTER1F_YOUNGSTER
	const VIOLETPOKECENTER1F_ELMS_AIDE

VioletPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

VioletPokecenterNurse:
	jumpstd PokecenterNurseScript

VioletPokecenter1F_ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	iftrue .SecondTimeAsking
	writetext VioletPokecenterElmsAideFavorText
.AskTakeEgg:
	yesorno
	iffalse .RefusedEgg
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	giveegg TOGEPI, EGG_LEVEL
	getstring STRING_BUFFER_4, .eggname
	scall .AideGivesEgg
	setevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	clearevent EVENT_ELMS_AIDE_IN_LAB
	clearevent EVENT_TOGEPI_HATCHED
	setmapscene ROUTE_32, SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	writetext VioletPokecenterElmsAideGiveEggText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal UP, .AideWalksAroundPlayer
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideWalksStraightOutOfPokecenter
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_ELMS_AIDE
	waitsfx
	end

.AideWalksAroundPlayer:
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideWalksLeftToExitPokecenter
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideFinishesLeavingPokecenter
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_ELMS_AIDE
	waitsfx
	end

.eggname
	db "UOVO@"

.AideGivesEgg:
	jumpstd ReceiveTogepiEggScript
	end

.PartyFull:
	writetext VioletCityElmsAideFullPartyText
	waitbutton
	closetext
	end

.RefusedEgg:
	writetext VioletPokecenterElmsAideRefuseText
	waitbutton
	closetext
	setevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	end

.SecondTimeAsking:
	writetext VioletPokecenterElmsAideAskEggText
	sjump .AskTakeEgg

VioletPokecenter1FGameboyKidScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer VioletPokecenterGameboyKidPreMobileText 
	
.mobile
	checkevent EVENT_VIOLET_MOBILE_EGG
	iftrue .MobileNormal
	faceplayer
	opentext
	writetext VioletPokecenterGameboyKidMobileText
	waitbutton
	writetext VioletPokecenterGameboyKidEggMobileText
	yesorno
	iffalse .EndText
	musicfadeout MUSIC_MOBILE_ADAPTER_MENU, 2
	special Function1719c8
	ifnotequal $00, .End
	reloadmap
	opentext
	writetext VioletMobileWorkingText
	waitbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	readmem wZipCode
	ifnotequal 246 + 1, .SkipDiglett
	readmem wZipCode + 1
	ifnotequal 246 + 0, .SkipDiglett
	readmem wZipCode + 2
	ifnotequal 246 + 1, .SkipDiglett
	giveegg DIGLETT, EGG_LEVEL
	sjump .continue
.SkipDiglett
	readmem wZipCode
	ifnotequal 246 + 6, .SkipDoduo
	readmem wZipCode + 1
	ifnotequal 246 + 0, .SkipDoduo
	readmem wZipCode + 2
	ifnotequal 246 + 6, .SkipDoduo
	giveegg DODUO, EGG_LEVEL
	sjump .continue
.SkipDoduo
	readmem wZipCode
	ifnotequal 246 + 8, .SkipGrimer
	readmem wZipCode + 1
	ifnotequal 246 + 7, .SkipGrimer
	readmem wZipCode + 2
	ifnotequal 246 + 2, .SkipGrimer
	giveegg GRIMER, EGG_LEVEL
	sjump .continue
.SkipGrimer
	readmem wZipCode
	ifnotequal 246 + 3, .SkipChinchou
	readmem wZipCode + 1
	ifnotequal 246 + 8, .SkipChinchou
	readmem wZipCode + 2
	ifnotequal 246 + 6, .SkipChinchou
	giveegg CHINCHOU, EGG_LEVEL
	sjump .continue
.SkipChinchou
	readmem wZipCode
	ifnotequal 246 + 1, .SkipNatu
	readmem wZipCode + 1
	ifnotequal 246 + 9, .SkipNatu
	readmem wZipCode + 2
	ifnotequal 246 + 7, .SkipNatu
	giveegg NATU, EGG_LEVEL
	sjump .continue
.SkipNatu
	readmem wZipCode
	ifnotequal 246 + 5, .SkipSwinub
	readmem wZipCode + 1
	ifnotequal 246 + 3, .SkipSwinub
	readmem wZipCode + 2
	ifnotequal 246 + 8, .SkipSwinub
	giveegg SWINUB, EGG_LEVEL
	sjump .continue
.SkipSwinub
	readmem wZipCode
	ifnotequal 246 + 4, .SkipVoltorb
	readmem wZipCode + 1
	ifnotequal 246 + 8, .SkipVoltorb
	readmem wZipCode + 2
	ifnotequal 246 + 1, .SkipVoltorb
	giveegg VOLTORB, EGG_LEVEL
	sjump .continue
.SkipVoltorb
	readmem wZipCode
	ifnotequal 246 + 4, .SkipShuckle
	readmem wZipCode + 1
	ifnotequal 246 + 4, .SkipShuckle
	readmem wZipCode + 2
	ifnotequal 246 + 4, .SkipShuckle
	giveegg SHUCKLE, EGG_LEVEL
	sjump .continue
.SkipShuckle
	readmem wZipCode
	ifnotequal 246 + 4, .SkipRemoraid
	readmem wZipCode + 1
	ifnotequal 246 + 0, .SkipRemoraid
	readmem wZipCode + 2
	ifnotequal 246 + 4, .SkipRemoraid
	giveegg REMORAID, EGG_LEVEL
	sjump .continue
.SkipRemoraid
	giveegg SLUGMA, EGG_LEVEL
.continue
	readmem wcd81
	writemem wc74e
	loadmem wOTTrademonSpecies, EGG
	special MobileTradeAnimation_RetrieveGivemonFromGTS
	setevent EVENT_VIOLET_MOBILE_EGG
	reloadmap
	opentext
	writetext TakeCareEggMobileText
	waitbutton
.EndText
	closetext
	end

.End
	reloadmap
	sjump .EndText

.PartyFull
	writetext VioletCityFullPartyText
	waitbutton
	closetext
	end

.MobileNormal
	jumptextfaceplayer VioletPokecenterGameboyKidMobileText

VioletPokecenter1FGentlemanScript:
	jumptextfaceplayer VioletPokecenter1FGentlemanText

VioletPokecenter1FYoungsterScript:
	jumptextfaceplayer VioletPokecenter1FYoungsterText

MovementData_AideWalksStraightOutOfPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_AideWalksLeftToExitPokecenter:
	step LEFT
	step DOWN
	step_end

MovementData_AideFinishesLeavingPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step_end

VioletPokecenterElmsAideFavorText:
	text "<PLAY_G>, ne è"
	line "passato del tempo."

	para "Il PROF.ELM mi ha"
	line "detto di cercarti."

	para "Deve chiederti"
	line "un altro favore."

	para "Puoi portare con"
	line "te l'UOVO #MON?"
	done

VioletPokecenterElmsAideGiveEggText:
	text "Abbiamo scoperto"
	line "che un UOVO di"

	para "#MON non si"
	line "schiude finché il"
	cont "#MON non è"
	cont "abbastanza"
	cont "cresciuto"
	cont "nell'UOVO."

	para "Inoltre, l'UOVO si"
	line "schiude solo se si"
	cont "trova con #MON"
	cont "attivi."

	para "<PLAY_G>, l'unica"
	line "persona su cui"
	cont "possiamo contare"
	cont "sei tu!"

	para "Chiama il PROF."
	line "ELM quando l'UOVO"
	cont "si schiude!"
	done

VioletCityElmsAideFullPartyText:
	text "No, non puoi"
	line "portare con te"
	cont "altri #MON."

	para "Aspetterò che tu"
	line "faccia spazio per"
	cont "l'UOVO."
	done

VioletCityFullPartyText:
	text "La tua squadra"
	line "è piena."
	done

VioletPokecenterElmsAideRefuseText:
	text "Ma… Il PROF.ELM"
	line "ha chiesto di te…"
	done

VioletPokecenterElmsAideAskEggText:
	text "<PLAY_G>, vuoi"
	line "portare l'UOVO con"
	cont "te?"
	done

VioletPokecenterGameboyKidPreMobileText:
	text "Stavo pensando che"
	line "sarebbe bello"

	para "connettermi e"
	line "lottare con"

	para "i miei amici che"
	line "vivono lontano."
	done
 
VioletPokecenterGameboyKidMobileText:
	text "Ho appena sfidato"
	line "un amico di"
	cont "FIORLISOPOLI via"
	cont "cavo."

	para "Se colleghi"
	line "l'ADATTATORE"
	para "MOBILE, puoi" 
	line "collegarti con un"
	cont "amico lontano."
	done

VioletPokecenterGameboyKidEggMobileText:
	text "Ehi, vedo che"
	line "ne hai uno!"

	para "Vuoi vedere come"
	line "funziona?"
	done

VioletMobileWorkingText:
	text "Perfetto, funziona"
	line "alla grande!"
	
	para "Tieni, ho un"
	line "regalo per te!"
	
	para "Spero ti piaccia."
	done

TakeCareEggMobileText:
	text "Trattalo con cura,"
	line "mi raccomando."
	done

VioletPokecenter1FGameboyKidText: ; unreferenced
	text "Un tipo di nome"
	line "BILL ha creato il"
	cont "Sistema Memoria"
	cont "#MON."
	done

VioletPokecenter1FGentlemanText:
	text "Tre anni fa, ce la"
	line "siamo vista"
	cont "brutta."

	para "TEAM ROCKET stava"
	line "per fare del male"
	cont "ai #MON."

	para "Poi però, grazie a"
	line "un ragazzino, la"
	cont "giustizia ha"
	cont "trionfato."
	done

VioletPokecenter1FYoungsterText:
	text "I #MON sono"
	line "intelligenti. Non"

	para "obbediscono ad un"
	line "allenatore che non"
	cont "rispettano."

	para "Senza le MEDAGLIE"
	line "giuste faranno"

	para "solo ciò che"
	line "vogliono."
	done

VioletPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, VIOLET_CITY, 5
	warp_event  4,  7, VIOLET_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenterNurse, -1
	object_event  7,  6, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FGentlemanScript, -1
	object_event  8,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FYoungsterScript, -1
	object_event  4,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1F_ElmsAideScript, EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
