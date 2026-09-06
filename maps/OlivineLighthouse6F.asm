	object_const_def
	const OLIVINELIGHTHOUSE6F_JASMINE
	const OLIVINELIGHTHOUSE6F_MONSTER
	const OLIVINELIGHTHOUSE6F_POKE_BALL

OlivineLighthouse6F_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineLighthouseJasmine:
	faceplayer
	opentext
	checkitem SECRETPOTION
	iftrue .BroughtSecretpotion
	checkevent EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
	iftrue .ExplainedSickness
	writetext JasmineCianwoodPharmacyText
	promptbutton
	setevent EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
.ExplainedSickness:
	writetext JasmineGetSomeMedicineText
	waitbutton
	closetext
	end

.BroughtSecretpotion:
	writetext JasmineCureAmphyText
	yesorno
	iffalse .Refused
	writetext PlayerHandedSecretpotionText
	promptbutton
	takeitem SECRETPOTION
	writetext JasmineDontBeOffendedText
	waitbutton
	closetext
	turnobject OLIVINELIGHTHOUSE6F_JASMINE, RIGHT
	pause 15
	turnobject OLIVINELIGHTHOUSE6F_MONSTER, LEFT
	opentext
	playmusic MUSIC_HEAL
	writetext JasmineAmphyHowAreYouFeelingText
	pause 60
	promptbutton
	closetext
	special RestartMapMusic
	cry AMPHAROS
	special FadeOutPalettes
	pause 10
	special FadeInPalettes
	opentext
	writetext AmphyPaluPaluluText
	waitbutton
	closetext
	turnobject OLIVINELIGHTHOUSE6F_MONSTER, RIGHT
	pause 10
	turnobject OLIVINELIGHTHOUSE6F_MONSTER, LEFT
	pause 10
	turnobject OLIVINELIGHTHOUSE6F_MONSTER, RIGHT
	pause 10
	turnobject OLIVINELIGHTHOUSE6F_MONSTER, LEFT
	pause 10
	faceplayer
	opentext
	writetext JasmineThankYouText
	waitbutton
	closetext
	setevent EVENT_JASMINE_RETURNED_TO_GYM
	clearevent EVENT_OLIVINE_GYM_JASMINE
	readvar VAR_FACING
	ifequal DOWN, .FacingDown
	ifequal RIGHT, .FacingRight
	applymovement OLIVINELIGHTHOUSE6F_JASMINE, OlivineLighthouseJasmineLeavesUpMovement
	disappear OLIVINELIGHTHOUSE6F_JASMINE
	opentext
	writetext AmphyAskGiftText
	pause 30
	closetext
	end

.FacingDown:
	applymovement OLIVINELIGHTHOUSE6F_JASMINE, OlivineLighthouseJasmineLeavesDownMovement
	disappear OLIVINELIGHTHOUSE6F_JASMINE
	end

.FacingRight:
	applymovement OLIVINELIGHTHOUSE6F_JASMINE, OlivineLighthouseJasmineLeavesRightMovement
	disappear OLIVINELIGHTHOUSE6F_JASMINE
	end

.Refused:
	writetext JasmineISeeText
	waitbutton
	closetext
	turnobject OLIVINELIGHTHOUSE6F_JASMINE, RIGHT
	pause 15
	turnobject OLIVINELIGHTHOUSE6F_MONSTER, LEFT
	opentext
	writetext JasmineAmphyHangOnText
	waitbutton
	closetext
	end

.Unused: ; unreferenced
	end

OlivineLighthouseAmphy:
	faceplayer
	opentext
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue .HealthyNow
	writetext AmphyPalPalooText
	setval AMPHAROS
	special PlaySlowCry
	promptbutton
	writetext AmphyBreathingLaboredText
	waitbutton
	closetext
	end

.HealthyNow:
	writetext AmphyPaluPaluluText
	cry AMPHAROS
	waitbutton
	closetext
	special FadeOutPalettes
	special FadeInPalettes
	special FadeOutPalettes
	special FadeInPalettes
	checkevent EVENT_AMPHY_LUCKY_EGG
	iftrue .closetext
	opentext
	writetext AmphyGiftText
	yesorno
	iffalse .closetext
	verbosegiveitem LUCKY_EGG
	iffalse .closetext
	setevent EVENT_AMPHY_LUCKY_EGG
.closetext	
	closetext
	end

OlivineLighthouse6FSuperPotion:
	itemball SUPER_POTION

OlivineLighthouseJasmineLeavesUpMovement:
	slow_step UP
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_sleep 8
	step_sleep 8
	step_end

OlivineLighthouseJasmineLeavesDownMovement:
	slow_step DOWN
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	step_end

OlivineLighthouseJasmineLeavesRightMovement:
	slow_step UP
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step UP
	slow_step UP
	step_sleep 8
	step_end

JasmineCianwoodPharmacyText:
	text "JASMINE: … Questo"
	line "#MON illuminava"

	para "sempre il mare la"
	line "notte."

	para "… Poi si è"
	line "ammalato…"
	cont "Ora respira"
	cont "affannosamente…"

	para "… So che"
	line "c'è una FARMACIA"

	para "fornitissima a "
	line "FIORLISOPOLI…"

	para "Ma è dall'altra"
	line "parte del mare…"

	para "E non posso"
	line "lasciare AMPHY"
	cont "da solo…"
	done

JasmineGetSomeMedicineText:
	text "…Ti prego,"
	line "mi procureresti la"
	cont "medicina?"
	done

JasmineCureAmphyText:
	text "JASMINE: Questa"
	line "medicina farà"
	cont "guarire AMPHY?"
	done

PlayerHandedSecretpotionText:
	text "<PLAYER> dà la"
	line "POZIONE SEGRETA a"
	cont "JASMINE."
	done

JasmineDontBeOffendedText:
	text "JASMINE: Non"
	line "offenderti…"

	para "…Ma AMPHY non"
	line "accetta nulla"
	cont "dagli estranei…"
	done

JasmineAmphyHowAreYouFeelingText:
	text "JASMINE: …"

	para "AMPHY, come ti"
	line "senti?"
	done

JasmineThankYouText:
	text "JASMINE: Sono"
	line "così sollevata…"

	para "È semplicemente"
	line "meraviglioso…"

	para "Grazie, grazie"
	line "davvero."

	para "Ora torno alla"
	line "PALESTRA…"
	done

JasmineISeeText:
	text "JASMINE: …Ok…"
	done

JasmineAmphyHangOnText:
	text "…AMPHY,"
	line " tieni duro."
	done

AmphyPalPalooText:
	text "AMPHY: …"
	line "… Pa… palu…"
	done

AmphyBreathingLaboredText:
	text "Respira con grande"
	line "difficoltà…"
	done

AmphyPaluPaluluText:
	text "AMPHY: Palu!"
	line "Palulu!"
	done

AmphyAskGiftText:
	text "AMPHY gradirebbe"
	line "ringraziarti."
	done

AmphyGiftText:
	text "AMPHY vuole farti"
	line "un regalo."
	cont "Lo accetti?"
	done

OlivineLighthouse6F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 15, OLIVINE_LIGHTHOUSE_5F, 1
	warp_event 16,  5, OLIVINE_LIGHTHOUSE_5F, 6
	warp_event 17,  5, OLIVINE_LIGHTHOUSE_5F, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  8, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineLighthouseJasmine, EVENT_OLIVINE_LIGHTHOUSE_JASMINE
	object_event  9,  8, SPRITE_AMPHY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OlivineLighthouseAmphy, -1
	object_event  3,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse6FSuperPotion, EVENT_OLIVINE_LIGHTHOUSE_6F_SUPER_POTION
