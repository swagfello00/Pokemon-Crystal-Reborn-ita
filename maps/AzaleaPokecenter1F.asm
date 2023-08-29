	object_const_def
	const AZALEAPOKECENTER1F_NURSE
	const AZALEAPOKECENTER1F_GENTLEMAN
	const AZALEAPOKECENTER1F_FISHING_GURU
	const AZALEAPOKECENTER1F_POKEFAN_F

AzaleaPokecenter1F_MapScripts:
	def_scene_scripts
	scene_script AzaleaPokecenter1FNoopScene ; unusable

	def_callbacks

AzaleaPokecenter1FNoopScene:
	end

AzaleaPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

AzaleaPokecenter1FGentlemanScript:
	jumptextfaceplayer AzaleaPokecenter1FGentlemanText

AzaleaPokecenter1FFishingGuruScript:
	jumptextfaceplayer AzaleaPokecenter1FUnusedText

AzaleaPokecenter1FPokefanFScript:
	jumptextfaceplayer AzaleaPokecenter1FPokefanFText

AzaleaPokecenter1FGentlemanText:
	text "I tuoi #MON"
	line "conoscono mosse di"
	cont "MN?"

	para "Queste mosse si"
	line "possono usare"

	para "anche se il #-"
	line "MON è KO."
	done

AzaleaPokecenter1FUnusedText: 
	text "Un certo BILL ha"
	line "creato un sistema"

	para "per depositare i"
	line "#MON nel PC."

	para "Il PC di BILL"
	line "tiene fino a 20"
	cont "#MON per BOX."
	done

AzaleaPokecenter1FFishingGuruText: ; Unused, English version replacement for above dialog.
	text "Il PC di BILL può"
	line "contenere fino a"
	cont "20 #MON per"
	cont "BOX."
	done

AzaleaPokecenter1FPokefanFText:
	text "Conosci le"
	line "GHICOCCHE?"

	para "Aprine una e"
	line "abbinala ad un"

	para "particolare"
	line "strumento."

	para "In questo modo"
	line "potrai catturare"
	cont "i #MON."

	para "Prima che fossero"
	line "inventate le #"

	para "BALL, tutti usava-"
	line "no le GHICOCCHE."
	done

AzaleaPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, AZALEA_TOWN, 1
	warp_event  4,  7, AZALEA_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FNurseScript, -1
	object_event  9,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FGentlemanScript, -1
	object_event  6,  1, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FFishingGuruScript, -1
	object_event  1,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FPokefanFScript, -1
