	object_const_def
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST1
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST2
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST3

PokecomCenterAdminOfficeMobile_MapScripts:
	def_scene_scripts

	def_callbacks

PokecomCenterAdminOfficeMobileScientist1Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist1Text

PokecomCenterAdminOfficeMobileScientist2Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist2Text

PokecomCenterAdminOfficeMobileScientist3Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist3Text

PokecomCenterAdminOfficeMobileComputer1:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text
	waitbutton
.loop:
	reloadmappart
	loadmenu .Computer1MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .PokeComClub
	ifequal 2, .MobileCenter
	sjump .Quit

.PokeComClub:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text_PokeComClub
	waitbutton
	sjump .loop

.MobileCenter:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text_MobileCenter
	waitbutton
	sjump .loop

.Quit:
	closetext
	end

.Computer1MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "CLUB #COM @" ; # COM CLUB
	db "CENTRO MOBILE@" ; MOBILE CENTER
	db "ESCI@" ; QUIT

PokecomCenterAdminOfficeMobileComputer2:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text
	waitbutton
.loop:
	reloadmappart
	loadmenu .Computer2MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .UsePhone
	ifequal 2, .DontUsePhone
	sjump .Quit

.UsePhone:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text_UsePhone
	waitbutton
	sjump .loop

.DontUsePhone:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text_DontUsePhone
	waitbutton
	sjump .loop

.Quit:
	closetext
	end

.Computer2MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 18, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "USO DEL TELEFONO@" ; Use phone
	db "NESSUN SERVIZIO@" ; Don't use phone
	db "ESCI@" ; QUIT

PokecomCenterAdminOfficeMobileComputer3:
	jumptext PokecomCenterAdminOfficeMobileComputer3Text

PokecomCenterAdminOfficeMobileScientist1Text:
	text "Il CENTRO #COM"
	line "e il CENTRO MOBILE"

	para "sono stati costru-"
	line "iti per soddisfare"

	para "le richieste di"
	line "scambi e lotte con"

	para "allenatori lontani"
	line "e con perfetti"
	cont "sconosciuti."
	done

PokecomCenterAdminOfficeMobileScientist2Text:
	text "Quando ti sei con-"
	line "nesso a qualcuno"

	para "a telefono per la"
	line "prima volta, non"
	cont "eri meravigliato?"

	para "Quando il mio"
	line "primo tentativo ha"

	para "funzionato, ero"
	line "così colpito da"
	cont "avere i brividi!"
	done

PokecomCenterAdminOfficeMobileScientist3Text:
	text "Sono stati in"
	line "grado di costruire"

	para "quest'enorme"
	line "struttura grazie"
	
	para "al progresso nella"
	line "tecnologia wire-"
	cont "less."
	done

PokecomCenterAdminOfficeMobileComputer1Text:
	text "È un avviso su"
	line "dove usare gli"
	para "ADATTATORI MOBILE…"
	done

PokecomCenterAdminOfficeMobileComputer1Text_PokeComClub:
	text "C'è un CLUB"
	line "#COM al piano"

	para "di sopra di ogni"
	line "CENTRO #MON."

	para "Da lì, puoi"
	line "scambiare o"

	para "lottare con un"
	line "amico lontano"
	para "usando l'ADAT-"
	line "TATORE MOBILE."

	para "Per collegarsi,"
	line "il tuo amico deve"

	para "avere il tuo"
	line "stesso tipo di"
	cont "ADATTATORE MOBILE."
	done

PokecomCenterAdminOfficeMobileComputer1Text_MobileCenter:
	text "Per usare l'ANGOLO"
	line "SCAMBI o leggere"

	para "le NOTIZIE"
	line "#MON, devi"
	cont "chiamare il "
	cont "CENTRO MOBILE."

	para "Devi registrarti"
	line "al CENTRO MOBILE"

	para "prima di poterti"
	line "connettere."
	done

PokecomCenterAdminOfficeMobileComputer2Text:
	text "È un avviso"
	line "sull'uso del"
	cont "telefono…"
	done

PokecomCenterAdminOfficeMobileComputer2Text_UsePhone:
	text "Si prega di assi-"
	line "curarsi che il"

	para "telefono e l'ADAT-"
	line "TATORE MOBILE"

	para "siano connessi"
	line "correttamente."

	para "Assicueati che il"
	line "segnale wireless"
	
	para "del telefono sia"
	line "forte."

	para "Non toccare o"
	line "riagganciare il"
	
	para "telefono durante"
	line "il collegamento."
	done

PokecomCenterAdminOfficeMobileComputer2Text_DontUsePhone:
	text "Se il server è"
	line "occupato, potrebbe"

	para "non essere possi-"
	line "bile collegarsi."

	para "In tal caso, si"
	line "prega di chiamare"
	cont "più tardi."

	para "Se non riesci a"
	line "collegarti o non"

	para "capisci o messaggi"
	line "di errore, chiama"

	para "il supporto"
	line "tecnico o leggi"
	cont "le istruzioni."
	done

PokecomCenterAdminOfficeMobileComputer3Text:
	text "L'UFFICIO"
	line "AMMINISTRATIVO"
	
	para "ha ricevuto un"
	line "e-mail. Dice…"

	para "<……> <……> <……>"

	para "Allo staff del"
	line "CENTRO #COM…"

	para "La comunicazione"
	line "wireless ha per-"

	para "messo a molti"
	line "allenatori di"

	para "#MON di intera-"
	line "gire lungo la"
	cont "nazione."

	para "Continuiamo a"
	line "lavorare fino"

	para "al giorno in"
	line "cui tutti gli"
	
	para "allenatori del"
	line "mondo potranno"
	
	para "collegarsi senza"
	line "barriere!"

	para "<……> <……> <……>"
	done

PokecomCenterAdminOfficeMobile_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0, 31, GOLDENROD_POKECENTER_1F, 3
	warp_event  1, 31, GOLDENROD_POKECENTER_1F, 3

	def_coord_events

	def_bg_events
	bg_event  6, 26, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer1
	bg_event  6, 28, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer2
	bg_event  3, 26, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer3

	def_object_events
	object_event  4, 28, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist1Script, -1
	object_event  7, 27, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist2Script, -1
	object_event  7, 29, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist3Script, -1
