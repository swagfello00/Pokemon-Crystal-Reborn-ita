DEF GOLDENRODDEPTSTORE6F_FRESH_WATER_PRICE EQU 200
DEF GOLDENRODDEPTSTORE6F_SODA_POP_PRICE    EQU 300
DEF GOLDENRODDEPTSTORE6F_LEMONADE_PRICE    EQU 350

	object_const_def
	const GOLDENRODDEPTSTORE6F_LASS
	const GOLDENRODDEPTSTORE6F_SUPER_NERD

GoldenrodDeptStore6F_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodVendingMachine:
	opentext
	writetext GoldenrodVendingText
.Start:
	writetext GoldenrodVending2Text
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .FreshWater
	ifequal 2, .SodaPop
	ifequal 3, .Lemonade
	closetext
	end

.FreshWater:
	checkmoney YOUR_MONEY, GOLDENRODDEPTSTORE6F_FRESH_WATER_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem FRESH_WATER
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, GOLDENRODDEPTSTORE6F_FRESH_WATER_PRICE
	getitemname STRING_BUFFER_3, FRESH_WATER
	sjump .VendItem

.SodaPop:
	checkmoney YOUR_MONEY, GOLDENRODDEPTSTORE6F_SODA_POP_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem SODA_POP
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, GOLDENRODDEPTSTORE6F_SODA_POP_PRICE
	getitemname STRING_BUFFER_3, SODA_POP
	sjump .VendItem

.Lemonade:
	checkmoney YOUR_MONEY, GOLDENRODDEPTSTORE6F_LEMONADE_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem LEMONADE
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, GOLDENRODDEPTSTORE6F_LEMONADE_PRICE
	getitemname STRING_BUFFER_3, LEMONADE
	sjump .VendItem

.VendItem:
	pause 10
	playsound SFX_ENTER_DOOR
	writetext GoldenrodClangText
	promptbutton
	itemnotify
	sjump .Start

.NotEnoughMoney:
	writetext GoldenrodVendingNoMoneyText
	waitbutton
	sjump .Start

.NotEnoughSpace:
	writetext GoldenrodVendingNoSpaceText
	waitbutton
	sjump .Start

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "ACQUA FRESCA ¥{d:GOLDENRODDEPTSTORE6F_FRESH_WATER_PRICE}@"
	db "GASSOSA      ¥{d:GOLDENRODDEPTSTORE6F_SODA_POP_PRICE}@"
	db "LEMONSUCCO   ¥{d:GOLDENRODDEPTSTORE6F_LEMONADE_PRICE}@"
	db "ESCI@"

GoldenrodDeptStore6FLassScript:
	jumptextfaceplayer GoldenrodDeptStore6FLassText

GoldenrodDeptStore6FSuperNerdScript:
	jumptextfaceplayer GoldenrodDeptStore6FSuperNerdText

GoldenrodDeptStore6FDirectory:
	jumptext GoldenrodDeptStore6FDirectoryText

GoldenrodDeptStore6FElevatorButton:
	jumpstd ElevatorButtonScript

GoldenrodVendingText:
	text "Un distributore"
	line "automatico:"
	prompt

GoldenrodVending2Text:
	text "Vediamo cosa c'è!"
	done

GoldenrodClangText:
	text "Clang! Esce"
	line "una lattina di"
	cont "@"
	text_ram wStringBuffer3
	text "!"
	done

GoldenrodVendingNoMoneyText:
	text "Caspita, non hai"
	line "abbastanza soldi."
	done

GoldenrodVendingNoSpaceText:
	text "Non c'è spazio"
	line "per nient'altro."
	done

GoldenrodDeptStore6FLassText:
	text "Ascolti RADIO"
	line "FORTUNA?"

	para "Per vincere,"
	line "scambia i tuoi "

	para "#MON il più"
	line "possibile, per"

	para "avere diversi"
	line "Numeri d'Identità."
	done

GoldenrodDeptStore6FSuperNerdText:
	text "Ti senti giù?"
	line "Prova le bevande"
	cont "dei distributori."

	para "Piaceranno anche"
	line "ai tuoi #MON!"
	done

GoldenrodDeptStore6FDirectoryText:
	text "Comprare stanca:"
	line "riposatevi qui!"

	para "5ºP PIAZZETTA"
	line "    ULTIMO PIANO"
	done

GoldenrodDeptStore6F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  0, GOLDENROD_DEPT_STORE_5F, 2
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1
	warp_event 13,  0, GOLDENROD_DEPT_STORE_ROOF, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_READ, GoldenrodDeptStore6FDirectory
	bg_event  3,  0, BGEVENT_READ, GoldenrodDeptStore6FElevatorButton
	bg_event  8,  1, BGEVENT_UP, GoldenrodVendingMachine
	bg_event  9,  1, BGEVENT_UP, GoldenrodVendingMachine
	bg_event 10,  1, BGEVENT_UP, GoldenrodVendingMachine
	bg_event 11,  1, BGEVENT_UP, GoldenrodVendingMachine

	def_object_events
	object_event 10,  2, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore6FLassScript, -1
	object_event  8,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore6FSuperNerdScript, -1
