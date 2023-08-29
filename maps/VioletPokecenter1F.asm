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
	db "EGG@"

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
	text "I've been thinking"
	line "it'd be great to"

	para "be able to link up"
	line "and battle with my"

	para "friends who live"
	line "far away."
	done
 
VioletPokecenterGameboyKidMobileText:
	text "I just battled a"
	line "friend in CIANWOOD"
	cont "over a link."

	para "If you connect a"
	line "MOBILE ADAPTER,"

	para "you can link with"
	line "a friend far away."
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
