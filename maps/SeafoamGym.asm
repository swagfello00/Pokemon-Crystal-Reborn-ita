	object_const_def
	const SEAFOAMGYM_BLAINE
	const SEAFOAMGYM_GYM_GUIDE

SeafoamGym_MapScripts:
	def_scene_scripts
	scene_script SeafoamGymNoopScene ; unusable

	def_callbacks

SeafoamGymNoopScene:
	end

SeafoamGymBlaineScript:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .Rematch
	checkflag ENGINE_VOLCANOBADGE
	iftrue .FightDone
	writetext BlaineIntroText
	waitbutton
	closetext
	winlosstext BlaineWinLossText, 0
	loadtrainer BLAINE, BLAINE1
	startbattle
	iftrue .ReturnAfterBattle
	appear SEAFOAMGYM_GYM_GUIDE
.ReturnAfterBattle:
	reloadmapafterbattle
	setevent EVENT_BEAT_BLAINE
	opentext
	writetext ReceivedVolcanoBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_VOLCANOBADGE
	writetext BlaineAfterBattleText
	waitbutton
	closetext
	end

.FightDone:
	writetext BlaineFightDoneText
	waitbutton
	closetext
	end

.Rematch
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, .FightDone
	checkflag ENGINE_BLAINE_REMATCH_DONE
	iftrue .FightDone
	writetext BlaineIntroRematchText
	waitbutton
	closetext
	winlosstext BlaineRematchText, 0
	loadtrainer BLAINE, BLAINE1
	startbattle
	reloadmapafterbattle
	setflag ENGINE_BLAINE_REMATCH_DONE
	end

SeafoamGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .SeafoamGymGuideRematchScript
	checkevent EVENT_TALKED_TO_SEAFOAM_GYM_GUIDE_ONCE
	iftrue .TalkedToSeafoamGymGuideScript
	writetext SeafoamGymGuideWinText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_SEAFOAM_GYM_GUIDE_ONCE
	end

.TalkedToSeafoamGymGuideScript:
	writetext SeafoamGymGuideWinText2
	waitbutton
	closetext
	end

.SeafoamGymGuideRematchScript:
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, .TalkedToSeafoamGymGuideScript
	checkflag ENGINE_BLAINE_REMATCH_DONE
	iftrue .TalkedToSeafoamGymGuideScript
	writetext SeafoamGymGuideRematchText
	waitbutton
	closetext
	end

BlaineIntroText:
	text "BLAINE: Tremendo!"

	para "La mia PALESTRA è"
	line "andata a fuoco."

	para "Io e i miei #-"
	line "MON fuoco siamo"

	para "in mezzo alla"
	line "strada a causa"
	cont "del vulcano!"

	para "È terribile!"

	para "Così mi tocca fare"
	line "il CAPOPALESTRA"

	para "qui in questa"
	line "grotta."

	para "Se mi batti"
	line "riceverai una"
	cont "MEDAGLIA."

	para "Ma è meglio che ti"
	line "procuri"
	cont "ANTISCOTTATURA."
	done

BlaineIntroRematchText:
	text "BLAINE: Tremendo!"

	para "La mia PALESTRA è"
	line "andata a fuoco."

	para "Io e i miei #-"
	line "MON fuoco siamo"

	para "in mezzo alla"
	line "strada a causa"
	cont "del vulcano!"

	para "È terribile!"

	para "Così mi tocca fare"
	line "il CAPOPALESTRA"

	para "qui in questa"
	line "grotta."

	para "Ma è meglio che ti"
	line "procuri"
	cont "ANTISCOTTATURA."
	done

BlaineWinLossText:
	text "BLAINE: Tremendo."
	line "Mi hai ridotto in"
	cont "cenere…"

	para "Eccoti la"
	line "MEDAGLIA VULCANO!"
	done

BlaineRematchText:
	text "BLAINE: Tremendo."
	line "Mi hai ridotto in"
	cont "cenere…"
	done

ReceivedVolcanoBadgeText:
	text "<PLAYER> riceve la"
	line "MEDAGLIA VULCANO."
	done

BlaineAfterBattleText:
	text "BLAINE: Stavolta"
	line "ho perso, ma"

	para "vincerò la"
	line "prossima."

	para "Quando la PALESTRA"
	line "sull'ISOLA"

	para "CANNELLA sarà"
	line "ricostruita mi da-"
	cont "rai la rivincita!"
	done

BlaineFightDoneText:
	text "BLAINE: I miei"
	line "#MON fuoco"

	para "saranno ancora"
	line "più forti, vedrai!"
	done

SeafoamGymGuideWinText:
	text "Ehi!"

	para "… Oh no! È"
	line "già finita?"

	para "Scusami tanto!"

	para "La PALESTRA dell'"
	line "ISOLA CANNELLA è"

	para "distrutta, così"
	line "non sapevo dove"
	cont "cercarti."

	para "Ma vedo che te la"
	line "sai cavare anche"

	para "senza di me."
	line "Sapevo che avresti"
	cont "vinto."
	done

SeafoamGymGuideWinText2:
	text "Una PALESTRA"
	line "#MON è ovunque"

	para "ci sia un"
	line "CAPOPALESTRA."

	para "Non c'è bisogno"
	line "di un edificio."
	done

SeafoamGymGuideRematchText:
	text "BLAINE nonostante"
	line "tutto è in cerca"
	cont "di nuove sfide."
	
	para "Affrontalo di"
	line "nuovo, coraggio!"
	done

SeafoamGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, ROUTE_20, 1
	warp_event  7,  5, SEAFOAM_ISLANDS_B1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SeafoamGymBlaineScript, -1
	object_event  6,  5, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamGymGuideScript, EVENT_SEAFOAM_GYM_GYM_GUIDE
