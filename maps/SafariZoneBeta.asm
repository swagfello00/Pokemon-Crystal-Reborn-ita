	object_const_def
	const SAFARIZONEBETA_MEW

SafariZoneBeta_MapScripts:
	def_scene_scripts

	def_callbacks

MewDialScript:
	checkevent EVENT_SAFARI_ZONE_BETA_PHONE
	iftrue .MewFight
	opentext
	special Mobile_DummyReturnFalse
	iffalse .NoDial
	writetext MovingPhoneText
	yesorno
	iffalse .Closetext
	musicfadeout MUSIC_MOBILE_ADAPTER_MENU, 2
	special Function1719c8
	ifnotequal $00, .End
	reloadmap
	variablesprite SPRITE_DIALVAR, SPRITE_MEW
	special LoadUsedSpritesGFX
	setevent EVENT_SAFARI_ZONE_BETA_PHONE
	opentext
	writetext MewRevealText
	waitbutton
.Closetext
	closetext
	end
	
.End:
	reloadmap
	closetext
	end

.NoDial:
	writetext NoDialText
	waitbutton
	closetext
	end

.MewFight:
	loadmem wBuffer1, 0
	faceplayer
	opentext
	writetext SafariZoneBetaMewText
	pause 15
	cry MEW
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	loadwildmon MEW, 30
	startbattle
	disappear SAFARIZONEBETA_MEW
	reloadmapafterbattle
	readmem wBuffer1
	ifnotequal MEW, .end
	setevent EVENT_CAUGHT_MEW
.end
	end

NoDialText:
	text "È un cellulare"
	line "smarrito ma…"
	cont "Sembra muoversi!"
	
	para "Meglio non"
	line "toccarlo."
	done

MovingPhoneText:
	text "Questo cellulare"
	line "sembra muoversi!"
	
	para "Vuoi collegare"
	line "l'adattatore?"
	done
	
MewRevealText:
	text "Ehi! MEW ha usato"
	line "TRASFORMAZIONE!"
	done
	
SafariZoneBetaMewText:
	text "Mew!"
	done

SafariZoneBeta_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 27, SAFARI_ZONE_FUCHSIA_GATE_BETA, 1
	warp_event  9, 27, SAFARI_ZONE_FUCHSIA_GATE_BETA, 1
	warp_event  10, 27, SAFARI_ZONE_FUCHSIA_GATE_BETA, 2
	warp_event  11, 27, SAFARI_ZONE_FUCHSIA_GATE_BETA, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2, 4, SPRITE_DIALVAR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, MewDialScript, EVENT_SAFARI_ZONE_BETA_MEW