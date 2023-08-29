	object_const_def
	const BILLSFAMILYSHOUSE_BILL
	const BILLSFAMILYSHOUSE_POKEFAN_F
	const BILLSFAMILYSHOUSE_TWIN

BillsFamilysHouse_MapScripts:
	def_scene_scripts

	def_callbacks

BillScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EEVEE
	iftrue .GotEevee
	writetext BillTakeThisEeveeText
	yesorno
	iffalse .Refused
	writetext BillImCountingOnYouText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedEeveeText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke EEVEE, 20
	setevent EVENT_GOT_EEVEE
	writetext BillEeveeMayEvolveText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillPartyFullText
	waitbutton
	closetext
	end

.Refused:
	writetext BillNoEeveeText
	waitbutton
	closetext
	end

.GotEevee:
	writetext BillPopWontWorkText
	waitbutton
	closetext
	end

BillsMomScript:
	faceplayer
	opentext
	checkevent EVENT_MET_BILL
	iffalse .HaventMetBill
	writetext BillsMomText_BeforeEcruteak
	waitbutton
	closetext
	end

.HaventMetBill:
	writetext BillsMomText_AfterEcruteak
	waitbutton
	closetext
	end

BillsSisterScript:
	faceplayer
	opentext
	checkcellnum PHONE_BILL
	iftrue .GotBillsNumber
	writetext BillsSisterUsefulNumberText
	askforphonenumber PHONE_BILL
	ifequal PHONE_CONTACTS_FULL, .NoRoom
	ifequal PHONE_CONTACT_REFUSED, .Refused
	waitsfx
	addcellnum PHONE_BILL
	writetext RecordedBillsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
.GotBillsNumber:
	writetext BillsSisterStorageSystemText
	waitbutton
	closetext
	end

.Refused:
	writetext BillsSisterRefusedNumberText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillsSisterPhoneFullText
	promptbutton
	sjump .Refused

BillsHouseBookshelf1:
	jumpstd PictureBookshelfScript

BillsHouseBookshelf2:
	jumpstd MagazineBookshelfScript

BillsHouseRadio:
	jumpstd Radio2Script

BillTakeThisEeveeText:
	text "BILL: Ciao, "
	line "<PLAYER>! Prendere-"
	cont "sti questo EEVEE?"

	para "È spuntato mentre"
	line "stavo aggiustando"
	cont "la TEMPOCAPSULA."

	para "Qualcuno dovrebbe"
	line "occuparsene, ma io"

	para "non esco"
	line "volentieri."

	para "Lo porterai fuori"
	line "a giocare,"
	cont "<PLAYER>?"
	done

BillImCountingOnYouText:
	text "BILL: Sapevo che"
	line "non m'avresti"
	cont "deluso!"

	para "Benissimo! Sei in"
	line "gamba!"

	para "Ok, allora conto"
	line "su di te."

	para "Abbine cura, mi"
	line "raccomando!"
	done

ReceivedEeveeText:
	text "<PLAYER> riceve"
	line "EEVEE!"
	done

BillEeveeMayEvolveText:
	text "BILL: Il PROF.ELM"
	line "sostiene che EEVEE"

	para "s'evolve in un"
	line "modo particolare."
	done

BillPartyFullText:
	text "Ah, ma non hai"
	line "posto per altri"
	cont "#MON!"
	done

BillNoEeveeText:
	text "Oh… E ora come"
	line "faccio?"
	done

BillPopWontWorkText:
	text "BILL: Mio padre mi"
	line "dà dei problemi."

	para "Non fa che"
	line "andarsene in"
	cont "giro!"

	para "Penso che mi darà"
	line "parecchio daffare…"
	done

BillsMomText_BeforeEcruteak:
	text "Collezioni #-"
	line "MON? Mio figlio"
	cont "BILL è un esperto."

	para "Ora è dovuto"
	line "andare al CENTRO"

	para "#MON di"
	line "AMARANTOPOLI."

	para "Mio marito invece"
	line "è andato al"

	para "CASINÒ, ma non"
	line "l'ha chiamato"
	cont "nessuno…"
	done

BillsMomText_AfterEcruteak:
	text "Mio marito era"
	line "conosciuto come"

	para "#FANATICO, un"
	line "tempo. BILL deve"

	para "aver preso da suo"
	line "padre."
	done

BillsSisterUsefulNumberText:
	text "Alleni i #MON?"

	para "Ti do un numero"
	line "che ti sarà utile!"
	done

RecordedBillsNumberText:
	text "<PLAYER> registra"
	line "il numero di BILL."
	done

BillsSisterRefusedNumberText:
	text "Mio fratello ha"
	line "creato il Sistema"
	cont "Memoria #MON."

	para "Volevo darti il"
	line "numero di BILL…"
	done

BillsSisterPhoneFullText:
	text "Non puoi registra-"
	line "re altri numeri."
	done

BillsSisterStorageSystemText:
	text "Mio fratello"
	line "maggiore BILL ha"

	para "creato il Sistema"
	line "Memoria #MON."
	done

BillsFamilysHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 4
	warp_event  3,  7, GOLDENROD_CITY, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, BillsHouseBookshelf2
	bg_event  1,  1, BGEVENT_READ, BillsHouseBookshelf1
	bg_event  7,  1, BGEVENT_READ, BillsHouseRadio

	def_object_events
	object_event  2,  3, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillScript, EVENT_MET_BILL
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsMomScript, -1
	object_event  5,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BillsSisterScript, -1
