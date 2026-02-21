	object_const_def
	const TINTOWER1F_SUICUNE
	const TINTOWER1F_RAIKOU
	const TINTOWER1F_ENTEI
	const TINTOWER1F_EUSINE
	const TINTOWER1F_SAGE1
	const TINTOWER1F_SAGE2
	const TINTOWER1F_SAGE3
	const TINTOWER1F_SAGE4
	const TINTOWER1F_SAGE5
	const TINTOWER1F_SAGE6

TinTower1F_MapScripts:
	def_scene_scripts
	scene_script TinTower1FSuicuneBattleScene, SCENE_TINTOWER1F_SUICUNE_BATTLE
	scene_script TinTower1FNoopScene,          SCENE_TINTOWER1F_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, TinTower1FNPCsCallback
	callback MAPCALLBACK_TILES, TinTower1FStairsCallback

TinTower1FSuicuneBattleScene:
	sdefer TinTower1FSuicuneBattleScript
	end

TinTower1FNoopScene:
	end

TinTower1FNPCsCallback:
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .GotRainbowWing
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .FaceBeasts
	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
.GotRainbowWing:
	checkevent EVENT_FOUGHT_HO_OH
	iffalse .Done
	appear TINTOWER1F_EUSINE
.Done:
	endcallback

.FaceBeasts:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .FoughtSuicune
	appear TINTOWER1F_SUICUNE
	setval RAIKOU
	special MonCheck
	iftrue .NoRaikou
	appear TINTOWER1F_RAIKOU
	sjump .CheckEntei

.NoRaikou:
	disappear TINTOWER1F_RAIKOU
.CheckEntei:
	setval ENTEI
	special MonCheck
	iftrue .NoEntei
	appear TINTOWER1F_ENTEI
	sjump .BeastsDone

.NoEntei:
	disappear TINTOWER1F_ENTEI
.BeastsDone:
	endcallback

.FoughtSuicune:
	disappear TINTOWER1F_SUICUNE
	disappear TINTOWER1F_RAIKOU
	disappear TINTOWER1F_ENTEI
	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	endcallback

TinTower1FStairsCallback:
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .DontHideStairs
	changeblock 10, 2, $09 ; floor
.DontHideStairs:
	endcallback

TinTower1FSuicuneBattleScript:
	loadmem wBuffer1, 0
	applymovement PLAYER, TinTower1FPlayerEntersMovement
	pause 15
	setval RAIKOU
	special MonCheck
	iftrue .Next1 ; if player caught Raikou, it doesn't appear in Tin Tower
	applymovement TINTOWER1F_RAIKOU, TinTower1FRaikouApproachesMovement
	turnobject PLAYER, LEFT
	cry RAIKOU
	pause 10
	playsound SFX_WARP_FROM
	applymovement TINTOWER1F_RAIKOU, TinTower1FRaikouLeavesMovement
	disappear TINTOWER1F_RAIKOU
	playsound SFX_EXIT_BUILDING
	waitsfx
.Next1:
	setval ENTEI
	special MonCheck
	iftrue .Next2 ; if player caught Entei, it doesn't appear in Tin Tower
	applymovement TINTOWER1F_ENTEI, TinTower1FEnteiApproachesMovement
	turnobject PLAYER, RIGHT
	cry ENTEI
	pause 10
	playsound SFX_WARP_FROM
	applymovement TINTOWER1F_ENTEI, TinTower1FEnteiLeavesMovement
	disappear TINTOWER1F_ENTEI
	playsound SFX_EXIT_BUILDING
	waitsfx
.Next2:
	turnobject PLAYER, UP
	pause 10
	applymovement PLAYER, TinTower1FPlayerBacksUpMovement
	applymovement TINTOWER1F_SUICUNE, TinTower1FSuicuneApproachesMovement
	cry SUICUNE
	pause 20
	loadwildmon SUICUNE, 40
	loadvar VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	startbattle
	dontrestartmapmusic
	disappear TINTOWER1F_SUICUNE
	setevent EVENT_FOUGHT_SUICUNE
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	setmapscene ROUTE_42, SCENE_ROUTE42_NOOP
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_36
	setmapscene ROUTE_36, SCENE_ROUTE36_NOOP
	setevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setmapscene CIANWOOD_CITY, SCENE_CIANWOODCITY_NOOP
	setscene SCENE_TINTOWER1F_NOOP
	clearevent EVENT_SET_WHEN_FOUGHT_HO_OH
	reloadmapafterbattle
	readmem wBuffer1
	ifnotequal SUICUNE, .continue
	setevent EVENT_CAUGHT_SUICUNE
.continue
	pause 20
	turnobject PLAYER, DOWN
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_EUSINE, 10, 15
	appear TINTOWER1F_EUSINE
	applymovement TINTOWER1F_EUSINE, TinTower1FEusineEntersMovement
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE1, 9, 15
	appear TINTOWER1F_SAGE1
	applymovement TINTOWER1F_SAGE1, TinTower1FSage1EntersMovement
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE2, 9, 15
	appear TINTOWER1F_SAGE2
	applymovement TINTOWER1F_SAGE2, TinTower1FSage2EntersMovement
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE3, 9, 15
	appear TINTOWER1F_SAGE3
	applymovement TINTOWER1F_SAGE3, TinTower1FSage3EntersMovement
	moveobject TINTOWER1F_SAGE1, 7, 13
	moveobject TINTOWER1F_SAGE2, 9, 13
	moveobject TINTOWER1F_SAGE3, 11, 13
	turnobject PLAYER, RIGHT
	opentext
	writetext TinTower1FEusineSuicuneText
	waitbutton
	closetext
	applymovement TINTOWER1F_EUSINE, TinTower1FEusineLeavesMovement
	playsound SFX_EXIT_BUILDING
	disappear TINTOWER1F_EUSINE
	waitsfx
	special FadeOutMusic
	pause 20
	playmapmusic
	end

TinTower1FSage1Script:
	jumptextfaceplayer TinTower1FSage1Text

TinTower1FSage2Script:
	jumptextfaceplayer TinTower1FSage2Text

TinTower1FSage3Script:
	jumptextfaceplayer TinTower1FSage3Text

TinTower1FSage4Script:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .FoughtHoOh
	jumptextfaceplayer TinTower1FSage4Text1

.FoughtHoOh:
	jumptextfaceplayer TinTower1FSage4Text2

TinTower1FSage5Script:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .FoughtHoOh
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .GotRainbowWing
	writetext TinTower1FSage5Text1
	promptbutton
	verbosegiveitem RAINBOW_WING
	closetext
	refreshscreen
	earthquake 72
	waitsfx
	playsound SFX_STRENGTH
	changeblock 10, 2, $20 ; stairs
	reloadmappart
	setevent EVENT_GOT_RAINBOW_WING
	closetext
	opentext
.GotRainbowWing:
	writetext TinTower1FSage5Text2
	waitbutton
	closetext
	end

.FoughtHoOh:
	writetext TinTower1FSage5Text3
	waitbutton
	closetext
	end

TinTower1FSage6Script:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .FoughtHoOh
	jumptextfaceplayer TinTower1FSage6Text1

.FoughtHoOh:
	jumptextfaceplayer TinTower1FSage6Text2

TinTower1FEusine:
	jumptextfaceplayer TinTower1FEusineHoOhText

TinTower1FPlayerEntersMovement:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

TinTower1FRaikouApproachesMovement:
	set_sliding
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTower1FRaikouLeavesMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step RIGHT
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTower1FEnteiApproachesMovement:
	set_sliding
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTower1FEnteiLeavesMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step LEFT
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTower1FSuicuneApproachesMovement:
	set_sliding
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTower1FPlayerBacksUpMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

TinTower1FEusineEntersMovement:
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

TinTower1FEusineLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step_end

TinTower1FSage1EntersMovement:
	step UP
	step UP
	step LEFT
	step LEFT
	turn_head UP
	step_end

TinTower1FSage2EntersMovement:
	step UP
	step UP
	step_end

TinTower1FSage3EntersMovement:
	step UP
	step RIGHT
	step RIGHT
	step UP
	step_end

TinTower1FEusineSuicuneText:
	text "EUGENIUS: Grande!"
	line "Incredibile!"

	para "Non ho mai visto"
	line "una lotta così"
	cont "emozionante!"

	para "È stato quasi"
	line "commovente."

	para "SUICUNE è stato"
	line "grande, ma tu sei"

	para "una vera sorpresa,"
	line "<PLAYER>."

	para "Pare che il potere"
	line "magico di SUICUNE"

	para "attiri un #MON"
	line "che ha i colori"
	cont "dell'arcobaleno."

	para "Chissà, forse ciò"
	line "che è appena"

	para "accaduto lo farà"
	line "apparire."

	para "Continuerò a"
	line "studiare le"
	cont "leggende."

	para "Grazie per avermi"
	line "mostrato una lotta"
	cont "così esaltante."

	para "A dopo, <PLAYER>!"
	done

TinTower1FSage1Text:
	text "Racconta la"
	line "leggenda…"

	para "…che quando un"
	line "#MON e un umano"

	para "uniscono le loro"
	line "anime, dal cielo"

	para "discenda un"
	line "#MON dai colori"
	cont "dell'arcobaleno…"

	para "Forse i #MON"
	line "leggendari ci"

	para "stanno mettendo"
	line "alla prova!"
	done

TinTower1FSage2Text:
	text "Nell'incendio"
	line "della TORRE D'"

	para "OTTONE, sembrava"
	line "che i tre #MON"

	para "leggendari fossero"
	line "morti."

	para "Tuttavia…"

	para "Un #MON dai"
	line "colori dell'"
	cont "arcobaleno…"

	para "In altre parole…"

	para "HO-OH discese dal"
	line "cielo per soffiare"

	para "nuova vita nei tre"
	line "#MON."

	para "Si tratta di…"

	para "SUICUNE, ENTEI e"
	line "RAIKOU."

	para "Così narra la"
	line "leggenda."
	done

TinTower1FSage3Text:
	text "Pare che le due"
	line "TORRI siano state"

	para "costruite per"
	line "rafforzare"

	para "l'amicizia tra i"
	line "#MON e gli"
	cont "umani."

	para "È accaduto 700"
	line "anni fa, ma quel"

	para "simbolo è ancora"
	line "importante."
	done

TinTower1FSage4Text1:
	text "Pare che HO-OH sia"
	line "disceso proprio"

	para "qui, sulla TORRE"
	line "DI LATTA."
	done

TinTower1FSage5Text1:
	text "Prendi questo, ti"
	line "proteggerà."
	done

TinTower1FSage5Text2:
	text "Ora vai!"
	done

TinTower1FSage6Text1:
	text "Credo che ti"
	line "stiano mettendo"
	cont "alla prova."

	para "Ma prima devi"
	line "liberare la mente"
	cont "dall'incertezza."
	done

TinTower1FEusineHoOhText:
	text "Lo sapevo,"
	line "<PLAYER>."

	para "Sapevo che avresti"
	line "visto quel #MON"

	para "con i colori dell'"
	line "arcobaleno."

	para "Tutto è andato"
	line "come previsto."

	para "I miei studi hanno"
	line "dato buoni frutti."

	para "Continuerò a"
	line "studiare i #MON"

	para "per diventare un"
	line "famosissimo"
	cont "#FANATICO!"
	done

TinTower1FSage4Text2:
	text "Pare che i #MON"
	line "leggendari"

	para "incarnino tre"
	line "forze…"

	para "Il lampo che"
	line "colpì la TORRE."

	para "Il fuoco che la"
	line "bruciò."

	para "E la pioggia che"
	line "spense l'incendio…"
	done

TinTower1FSage5Text3:
	text "Quando apparivano"
	line "i #MON"
	cont "leggendari…"

	para "…tutti ne"
	line "erano"
	cont "terrorizzati!"

	para "Qualcuno provava"
	line "addirittura ad"
	cont "attaccarli."

	para "Ma i #MON"
	line "leggendari, consci"

	para "della propria"
	line "forza, s'allonta-"
	cont "navano, ignorando"
	cont "la gente."
	done

TinTower1FSage6Text2:
	text "Pare che tra i"
	line "#MON leggendari"

	para "SUICUNE sia il più"
	line "vicino a HO-OH."

	para "Credo che ci sia"
	line "un collegamento"

	para "con un #MON"
	line "chiamato UNOWN."

	para "Pare che gli UNOWN"
	line "abbiano un ottimo"

	para "rapporto con"
	line "SUICUNE."
	done

TinTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 15, ECRUTEAK_CITY, 12
	warp_event 10, 15, ECRUTEAK_CITY, 12
	warp_event 10,  2, TIN_TOWER_2F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  9, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_SUICUNE
	object_event  7,  9, SPRITE_RAIKOU, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_RAIKOU
	object_event 12,  9, SPRITE_ENTEI, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_ENTEI
	object_event  8,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TinTower1FEusine, EVENT_TIN_TOWER_1F_EUSINE
	object_event  5,  9, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage1Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event 11, 11, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage2Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event 14,  6, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage3Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event  4,  2, SPRITE_SAGE, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage4Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	object_event  9,  1, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage5Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	object_event 14,  2, SPRITE_SAGE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage6Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
