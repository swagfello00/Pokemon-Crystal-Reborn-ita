SafariZoneFuchsiaGateBeta_MapScripts:
	def_scene_scripts

	def_callbacks

SafariGateOfficerScript:
	jumptextfaceplayer SafariGateOfficerText
	end

SafariGateOfficerText:
	text "Quando abbiamo"
	line "riaperto la"
	cont "ZONA SAFARI,"
	
	para "abbiamo trovato un"
	line "telefono strano"
	
	para "che qualcuno"
	line "aveva perso."
	
	para "Appena lo abbiamo"
	line "afferrato,"
	
	para "ha iniziato a"
	line "muoversi e lo"
	
	para "abbiamo lasciato"
	line "dov'era."
	
	para "Fai attenzione."
	done
	
SafariZoneFuchsiaGateBeta_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, SAFARI_ZONE_BETA, 2
	warp_event  5,  0, SAFARI_ZONE_BETA, 3
	warp_event  4,  7, FUCHSIA_CITY, 7
	warp_event  5,  7, FUCHSIA_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SafariGateOfficerScript, -1
	