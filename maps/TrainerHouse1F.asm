	object_const_def
	const TRAINERHOUSE1F_RECEPTIONIST
	const TRAINERHOUSE1F_COOLTRAINER_M
	const TRAINERHOUSE1F_COOLTRAINER_F
	const TRAINERHOUSE1F_YOUNGSTER
	const TRAINERHOUSE1F_GENTLEMAN

TrainerHouse1F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerHouse1FReceptionistScript:
	readvar VAR_WEEKDAY
	ifequal MONDAY, DecoShop
	jumptextfaceplayer TrainerHouse1FReceptionistText

DecoShop:
	faceplayer
	opentext
	writetext DecoShopOpenText
	checkitem BLUE_CARD
	iffalse .NoCard
	special PrintBlueCardBalance
	yesorno
	iffalse .Refused
	writetext ChooseDecoMenuText
	promptbutton
.Menu
	checktime DAY
	iftrue .Menu2
	checktime NITE
	iftrue .Menu3
.Menu1
	farwritetext _NoText
	loadmenu .MenuHeaderMorn
	verticalmenu
	closewindow
	ifequal 1, .Beds
	ifequal 2, .Carpets
	ifequal 3, .Plants
	ifequal 4, .Posters
	ifequal 5, .Consoles
	ifequal 6, .Dolls1
	ifequal 7, .BigDolls
	writetext DecoShopGoodByeText
	waitbutton
	closetext
	end

.Menu2
	farwritetext _NoText
	loadmenu .MenuHeaderDay
	verticalmenu
	closewindow
	ifequal 1, .Beds
	ifequal 2, .Carpets
	ifequal 3, .Plants
	ifequal 4, .Posters
	ifequal 5, .Consoles
	ifequal 6, .Dolls2
	ifequal 7, .BigDolls
	writetext DecoShopGoodByeText
	waitbutton
	closetext
	end

.Menu3
	farwritetext _NoText
	loadmenu .MenuHeaderNite
	verticalmenu
	closewindow
	ifequal 1, .Beds
	ifequal 2, .Carpets
	ifequal 3, .Plants
	ifequal 4, .Posters
	ifequal 5, .Consoles
	ifequal 6, .Dolls3
	ifequal 7, .BigDolls
	writetext DecoShopGoodByeText
	waitbutton
	closetext
	end

.GotBeds
	scall .DecoTransaction
	sjump .Beds
.AlreadyGotBeds
	writetext AlreadyGotDecoText
.Beds
	writetext ChooseDecoText
	loadmenu .MenuHeader1
	verticalmenu
	closewindow
	ifequal 1, .PinkBed
	ifequal 2, .PolkadotBed
	ifequal 3, .PikachuBed
	sjump .Menu

.GotCarpets
	scall .DecoTransaction
	sjump .Carpets
.AlreadyGotCarpets
	writetext AlreadyGotDecoText
.Carpets
	writetext ChooseDecoText
	loadmenu .MenuHeader2
	verticalmenu
	closewindow
	ifequal 1, .RedCarpet
	ifequal 2, .BlueCarpet
	ifequal 3, .YellowCarpet
	ifequal 4, .GreenCarpet
	sjump .Menu

.GotPlants
	scall .DecoTransaction
	sjump .Plants
.AlreadyGotPlants
	writetext AlreadyGotDecoText
.Plants
	writetext ChooseDecoText
	loadmenu .MenuHeader3
	verticalmenu
	closewindow
	ifequal 1, .MagnaPlant
	ifequal 2, .TropicPlant
	ifequal 3, .JumboPlant
	sjump .Menu

.GotPosters
	scall .DecoTransaction
	sjump .Posters
.AlreadyGotPosters
	writetext AlreadyGotDecoText
.Posters
	writetext ChooseDecoText
	loadmenu .MenuHeader4
	verticalmenu
	closewindow
	ifequal 1, .PikachuPoster
	ifequal 2, .ClefairyPoster
	ifequal 3, .JigglypuffPoster
	sjump .Menu

.GotConsoles
	scall .DecoTransaction
	sjump .Consoles
.AlreadyGotConsoles
	writetext AlreadyGotDecoText
.Consoles
	writetext ChooseDecoText
	loadmenu .MenuHeader5
	verticalmenu
	closewindow
	ifequal 1, .NES
	ifequal 2, .SNES
	ifequal 3, .N64
	ifequal 4, .VBOY
	sjump .Menu

.GotDolls1
	scall .DecoTransaction
	sjump .Dolls1
.AlreadyGotDolls1
	writetext AlreadyGotDecoText
.Dolls1
	farwritetext _NoText
	loadmenu .MenuHeader6
	verticalmenu
	closewindow
	ifequal 1, .PikachuSurf
	ifequal 2, .Jigglypuff
	ifequal 3, .Bulbasaur
	ifequal 4, .Squirtle
	ifequal 5, .Poliwag
	ifequal 6, .Diglett
	sjump .Menu

.GotDolls2
	scall .DecoTransaction
	sjump .Dolls2
.AlreadyGotDolls2
	writetext AlreadyGotDecoText
.Dolls2
	farwritetext _NoText
	loadmenu .MenuHeader7
	verticalmenu
	closewindow
	ifequal 1, .Staryu
	ifequal 2, .Magikarp
	ifequal 3, .Oddish
	ifequal 4, .Gengar
	ifequal 5, .Shellder
	ifequal 6, .Grimer
	sjump .Menu

.GotDolls3
	scall .DecoTransaction
	sjump .Dolls3
.AlreadyGotDolls3
	writetext AlreadyGotDecoText
.Dolls3
	farwritetext _NoText
	loadmenu .MenuHeader8
	verticalmenu
	closewindow
	ifequal 1, .Voltorb
	ifequal 2, .Weedle
	ifequal 3, .Unown
	ifequal 4, .Geodude
	ifequal 5, .Machop
	ifequal 6, .Tentacool
	sjump .Menu

.GotBigDolls
	scall .DecoTransaction
	sjump .BigDolls
.AlreadyGotBigDolls
	writetext AlreadyGotDecoText
.BigDolls
	writetext ChooseDecoText
	loadmenu .MenuHeader9
	verticalmenu
	closewindow
	ifequal 1, .BigOnix
	ifequal 2, .BigLapras
	sjump .Menu

.PinkBed
	checkevent EVENT_DECO_BED_2
	iftrue .AlreadyGotBeds
	farscall RadioTowerBuenaPrizeReceptionist.Cost30
	iffalse .Beds
	farscall RadioTowerBuenaPrizeReceptionist.Pay30
	setevent EVENT_DECO_BED_2
	sjump .GotBeds

.PolkadotBed
	checkevent EVENT_DECO_BED_3
	iftrue .AlreadyGotBeds
	farscall RadioTowerBuenaPrizeReceptionist.Cost30
	iffalse .Beds
	farscall RadioTowerBuenaPrizeReceptionist.Pay30
	setevent EVENT_DECO_BED_3
	sjump .GotBeds

.PikachuBed
	checkevent EVENT_DECO_BED_4
	iftrue .AlreadyGotBeds
	farscall RadioTowerBuenaPrizeReceptionist.Cost200
	iffalse .Beds
	farscall RadioTowerBuenaPrizeReceptionist.Pay200
	setevent EVENT_DECO_BED_4
	sjump .GotBeds

.RedCarpet
	checkevent EVENT_DECO_CARPET_1
	iftrue .AlreadyGotCarpets
	farscall RadioTowerBuenaPrizeReceptionist.Cost100
	iffalse .Carpets
	farscall RadioTowerBuenaPrizeReceptionist.Pay100
	setevent EVENT_DECO_CARPET_1
	sjump .GotCarpets

.BlueCarpet
	checkevent EVENT_DECO_CARPET_2
	iftrue .AlreadyGotCarpets
	farscall RadioTowerBuenaPrizeReceptionist.Cost100
	iffalse .Carpets
	farscall RadioTowerBuenaPrizeReceptionist.Pay100
	setevent EVENT_DECO_CARPET_2
	sjump .GotCarpets

.YellowCarpet
	checkevent EVENT_DECO_CARPET_3
	iftrue .AlreadyGotCarpets
	farscall RadioTowerBuenaPrizeReceptionist.Cost100
	iffalse .Carpets
	farscall RadioTowerBuenaPrizeReceptionist.Pay100
	setevent EVENT_DECO_CARPET_3
	sjump .GotCarpets

.GreenCarpet
	checkevent EVENT_DECO_CARPET_4
	iftrue .AlreadyGotCarpets
	farscall RadioTowerBuenaPrizeReceptionist.Cost100
	iffalse .Carpets
	farscall RadioTowerBuenaPrizeReceptionist.Pay100
	setevent EVENT_DECO_CARPET_4
	sjump .GotCarpets

.MagnaPlant
	checkevent EVENT_DECO_PLANT_1
	iftrue .AlreadyGotPlants
	farscall RadioTowerBuenaPrizeReceptionist.Cost30
	iffalse .Plants
	farscall RadioTowerBuenaPrizeReceptionist.Pay30
	setevent EVENT_DECO_PLANT_1
	sjump .GotPlants

.TropicPlant
	checkevent EVENT_DECO_PLANT_2
	iftrue .AlreadyGotPlants
	farscall RadioTowerBuenaPrizeReceptionist.Cost30
	iffalse .Plants
	farscall RadioTowerBuenaPrizeReceptionist.Pay30
	setevent EVENT_DECO_PLANT_2
	sjump .GotPlants

.JumboPlant
	checkevent EVENT_DECO_PLANT_3
	iftrue .AlreadyGotPlants
	farscall RadioTowerBuenaPrizeReceptionist.Cost100
	iffalse .Plants
	farscall RadioTowerBuenaPrizeReceptionist.Pay100
	setevent EVENT_DECO_PLANT_3
	sjump .GotPlants

.PikachuPoster
	checkevent EVENT_DECO_POSTER_2
	iftrue .AlreadyGotPosters
	farscall RadioTowerBuenaPrizeReceptionist.Cost100
	iffalse .Posters
	farscall RadioTowerBuenaPrizeReceptionist.Pay100
	setevent EVENT_DECO_POSTER_2
	sjump .GotPosters

.ClefairyPoster
	checkevent EVENT_DECO_POSTER_3
	iftrue .AlreadyGotPosters
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Posters
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	setevent EVENT_DECO_POSTER_3
	sjump .GotPosters

.JigglypuffPoster
	checkevent EVENT_DECO_POSTER_4
	iftrue .AlreadyGotPosters
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Posters
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	setevent EVENT_DECO_POSTER_4
	sjump .GotPosters

.NES
	checkevent EVENT_DECO_FAMICOM
	iftrue .AlreadyGotConsoles
	farscall RadioTowerBuenaPrizeReceptionist.Cost30
	iffalse .Consoles
	farscall RadioTowerBuenaPrizeReceptionist.Pay30
	setevent EVENT_DECO_FAMICOM
	sjump .GotConsoles

.SNES
	checkevent EVENT_DECO_SNES
	iftrue .AlreadyGotConsoles
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Consoles
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	setevent EVENT_DECO_SNES
	sjump .GotConsoles

.N64
	checkevent EVENT_DECO_N64
	iftrue .AlreadyGotConsoles
	farscall RadioTowerBuenaPrizeReceptionist.Cost30
	iffalse .Consoles
	farscall RadioTowerBuenaPrizeReceptionist.Pay30
	setevent EVENT_DECO_N64
	sjump .GotConsoles

.VBOY
	checkevent EVENT_DECO_VIRTUAL_BOY
	iftrue .AlreadyGotConsoles
	farscall RadioTowerBuenaPrizeReceptionist.Cost100
	iffalse .Consoles
	farscall RadioTowerBuenaPrizeReceptionist.Pay100
	setevent EVENT_DECO_VIRTUAL_BOY
	sjump .GotConsoles

.PikachuSurf
	checkevent EVENT_DECO_SURFING_PIKACHU_DOLL
	iftrue .AlreadyGotDolls1
	farscall RadioTowerBuenaPrizeReceptionist.Cost100
	iffalse .Dolls1
	farscall RadioTowerBuenaPrizeReceptionist.Pay100
	setevent EVENT_DECO_SURFING_PIKACHU_DOLL
	sjump .GotDolls1

.Jigglypuff
	checkevent EVENT_DECO_JIGGLYPUFF_DOLL
	iftrue .AlreadyGotDolls1
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Dolls1
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	setevent EVENT_DECO_JIGGLYPUFF_DOLL
	sjump .GotDolls1

.Bulbasaur
	checkevent EVENT_DECO_BULBASAUR_DOLL
	iftrue .AlreadyGotDolls1
	farscall RadioTowerBuenaPrizeReceptionist.Cost30
	iffalse .Dolls1
	farscall RadioTowerBuenaPrizeReceptionist.Pay30
	setevent EVENT_DECO_BULBASAUR_DOLL
	sjump .GotDolls1

.Squirtle
	checkevent EVENT_DECO_SQUIRTLE_DOLL
	iftrue .AlreadyGotDolls1
	farscall RadioTowerBuenaPrizeReceptionist.Cost30
	iffalse .Dolls1
	farscall RadioTowerBuenaPrizeReceptionist.Pay30
	setevent EVENT_DECO_SQUIRTLE_DOLL
	sjump .GotDolls1

.Poliwag
	checkevent EVENT_DECO_POLIWAG_DOLL
	iftrue .AlreadyGotDolls1
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Dolls1
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	setevent EVENT_DECO_POLIWAG_DOLL
	sjump .GotDolls1

.Diglett
	checkevent EVENT_DECO_DIGLETT_DOLL
	iftrue .AlreadyGotDolls1
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Dolls1
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	setevent EVENT_DECO_DIGLETT_DOLL
	sjump .GotDolls1

.Staryu
	checkevent EVENT_DECO_STARMIE_DOLL
	iftrue .AlreadyGotDolls2
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Dolls2
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	setevent EVENT_DECO_STARMIE_DOLL
	sjump .GotDolls2

.Magikarp
	checkevent EVENT_DECO_MAGIKARP_DOLL
	iftrue .AlreadyGotDolls2
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Dolls2
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	setevent EVENT_DECO_MAGIKARP_DOLL
	sjump .GotDolls2

.Oddish
	checkevent EVENT_DECO_ODDISH_DOLL
	iftrue .AlreadyGotDolls2
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Dolls2
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	setevent EVENT_DECO_ODDISH_DOLL
	sjump .GotDolls2

.Gengar
	checkevent EVENT_DECO_GENGAR_DOLL
	iftrue .AlreadyGotDolls2
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Dolls2
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	setevent EVENT_DECO_GENGAR_DOLL
	sjump .GotDolls2

.Shellder
	checkevent EVENT_DECO_SHELLDER_DOLL
	iftrue .AlreadyGotDolls2
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Dolls2
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	setevent EVENT_DECO_SHELLDER_DOLL
	sjump .GotDolls2

.Grimer
	checkevent EVENT_DECO_GRIMER_DOLL
	iftrue .AlreadyGotDolls2
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Dolls2
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	setevent EVENT_DECO_GRIMER_DOLL
	sjump .GotDolls2

.Voltorb
	checkevent EVENT_DECO_VOLTORB_DOLL
	iftrue .AlreadyGotDolls3
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Dolls3
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	setevent EVENT_DECO_VOLTORB_DOLL
	sjump .GotDolls3

.Weedle
	checkevent EVENT_DECO_WEEDLE_DOLL
	iftrue .AlreadyGotDolls3
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Dolls3
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	setevent EVENT_DECO_WEEDLE_DOLL
	sjump .GotDolls3

.Unown
	checkevent EVENT_DECO_UNOWN_DOLL
	iftrue .AlreadyGotDolls3
	farscall RadioTowerBuenaPrizeReceptionist.Cost255
	iffalse .Dolls3
	farscall RadioTowerBuenaPrizeReceptionist.Pay255
	setevent EVENT_DECO_UNOWN_DOLL
	sjump .GotDolls3

.Geodude
	checkevent EVENT_DECO_GEODUDE_DOLL
	iftrue .AlreadyGotDolls3
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Dolls3
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	setevent EVENT_DECO_GEODUDE_DOLL
	sjump .GotDolls3

.Machop
	checkevent EVENT_DECO_MACHOP_DOLL
	iftrue .AlreadyGotDolls3
	farscall RadioTowerBuenaPrizeReceptionist.Cost10
	iffalse .Dolls3
	farscall RadioTowerBuenaPrizeReceptionist.Pay10
	setevent EVENT_DECO_MACHOP_DOLL
	sjump .GotDolls3

.Tentacool
	checkevent EVENT_DECO_TENTACOOL_DOLL
	iftrue .AlreadyGotDolls3
	farscall RadioTowerBuenaPrizeReceptionist.Cost200
	iffalse .Dolls3
	farscall RadioTowerBuenaPrizeReceptionist.Pay200
	setevent EVENT_DECO_TENTACOOL_DOLL
	sjump .GotDolls3

.BigOnix
	checkevent EVENT_DECO_BIG_ONIX_DOLL
	iftrue .AlreadyGotBigDolls
	farscall RadioTowerBuenaPrizeReceptionist.Cost100
	iffalse .BigDolls
	farscall RadioTowerBuenaPrizeReceptionist.Pay100
	setevent EVENT_DECO_BIG_ONIX_DOLL
	sjump .GotBigDolls

.BigLapras
	checkevent EVENT_DECO_BIG_LAPRAS_DOLL
	iftrue .AlreadyGotBigDolls
	farscall RadioTowerBuenaPrizeReceptionist.Cost100
	iffalse .BigDolls
	farscall RadioTowerBuenaPrizeReceptionist.Pay100
	setevent EVENT_DECO_BIG_LAPRAS_DOLL
	sjump .GotBigDolls

.NoCard
	promptbutton
	writetext DecoNoCardText
	waitbutton
	closetext
	end

.Refused
	writetext DecoRefusedText
	waitbutton
	closetext
	end

.DecoTransaction
	writetext GotDecoText
	waitsfx
	playsound SFX_TRANSACTION
	waitbutton
	special PrintBlueCardBalance
	end

.MenuHeaderMorn:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 14, 17
	dw .MenuDataMorn
	db 1 ; default option

.MenuDataMorn:
	db STATICMENU_CURSOR | STATICMENU_WRAP; flags
	db 8 ; items
	db "LETTI@"
	db "TAPPETI@"
	db "PIANTE@"
	db "POSTER@"
	db "CONSOLE@"
	db "BAMBOLE 1@"
	db "MAXIBAMBOLE@"
	db "ESCI@"

.MenuHeaderDay:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 14, 17
	dw .MenuDataDay
	db 1 ; default option

.MenuDataDay:
	db STATICMENU_CURSOR | STATICMENU_WRAP; flags
	db 8 ; items
	db "LETTI@"
	db "TAPPETI@"
	db "PIANTE@"
	db "POSTER@"
	db "CONSOLE@"
	db "BAMBOLE 2@"
	db "MAXIBAMBOLE@"
	db "ESCI@"

.MenuHeaderNite:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 14, 17
	dw .MenuDataNite
	db 1 ; default option

.MenuDataNite:
	db STATICMENU_CURSOR | STATICMENU_WRAP; flags
	db 8 ; items
	db "LETTI@"
	db "TAPPETI@"
	db "PIANTE@"
	db "POSTER@"
	db "CONSOLE@"
	db "BAMBOLE 3@"
	db "MAXIBAMBOLE@"
	db "ESCI@"

.MenuHeader1:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, 11
	dw .MenuData1
	db 1 ; default option

.MenuData1:
	db STATICMENU_CURSOR | STATICMENU_WRAP; flags
	db 4 ; items
	db "LETTO ROSA     30@"
	db "LETTO A POIS   30@"
	db "LETTO PIKACHU 200@"
	db "ESCI@"
	
.MenuHeader2:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, 13
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db STATICMENU_CURSOR | STATICMENU_WRAP; flags
	db 5 ; items
	db "TAPP. ROSSO   100@"
	db "TAPP. BLU     100@"
	db "TAPP. GIALLO  100@"
	db "TAPP. VERDE   100@"
	db "ESCI@"

.MenuHeader3:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, 11
	dw .MenuData3
	db 1 ; default option

.MenuData3:
	db STATICMENU_CURSOR | STATICMENU_WRAP; flags
	db 4 ; items
	db "MAXIPIANTA     30@"
	db "TROPICANTA     30@"
	db "JUMBOPIANTA   100@"
	db "ESCI@"

.MenuHeader4:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, 11
	dw .MenuData4
	db 1 ; default option

.MenuData4:
	db STATICMENU_CURSOR | STATICMENU_WRAP; flags
	db 4 ; items
	db "POS.PIKACHU   100@"
	db "POS.CLEFAIRY   10@"
	db "POS.JIGGLYPUFF 10@"
	db "ESCI@"

.MenuHeader5:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, 13
	dw .MenuData5
	db 1 ; default option

.MenuData5:
	db STATICMENU_CURSOR | STATICMENU_WRAP; flags
	db 5 ; items
	db "NES            30@"
	db "SUPER NES      10@"
	db "NINTENDO 64    30@"
	db "VIRTAL BOY    100@"
	db "ESCI@"

.MenuHeader6:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, 17
	dw .MenuData6
	db 1 ; default option

.MenuData6:
	db STATICMENU_CURSOR | STATICMENU_WRAP; flags
	db 7 ; items
	db "PIKACHU SURF  100@"
	db "JIGGLYPUFF     10@"
	db "BULBASAUR      30@"
	db "SQUIRTLE       30@"
	db "POLIWAG        10@"
	db "DIGLETT        10@"
	db "ESCI@"

.MenuHeader7:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, 17
	dw .MenuData7
	db 1 ; default option

.MenuData7:
	db STATICMENU_CURSOR | STATICMENU_WRAP; flags
	db 7 ; items
	db "STARYU         10@"
	db "MAGIKARP       10@"
	db "ODDISH         10@"
	db "GENGAR         10@"
	db "SHELLDER       10@"
	db "GRIMER         10@"
	db "ESCI@"
	
.MenuHeader8:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, 17
	dw .MenuData8
	db 1 ; default option

.MenuData8:
	db STATICMENU_CURSOR | STATICMENU_WRAP; flags
	db 7 ; items
	db "VOLTORB        10@"
	db "WEEDLE         10@"
	db "UNOWN         255@"
	db "GEODUDE        10@"
	db "MACHOP         10@"
	db "TENTACOOL     200@"
	db "ESCI@"

.MenuHeader9:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 4, 19, 11
	dw .MenuData9
	db 1 ; default option

.MenuData9:
	db STATICMENU_CURSOR | STATICMENU_WRAP; flags
	db 3 ; items
	db "ONIX GRANDE   100@"
	db "LAPRAS GRANDE 100@"
	db "ESCI@"

TrainerHouse1FCooltrainerMScript:
	jumptextfaceplayer TrainerHouse1FCooltrainerMText

TrainerHouse1FCooltrainerFScript:
	jumptextfaceplayer TrainerHouse1FCooltrainerFText

TrainerHouse1FYoungsterScript:
	jumptextfaceplayer TrainerHouse1FYoungsterText

TrainerHouse1FGentlemanScript:
	jumptextfaceplayer TrainerHouse1FGentlemanText

TrainerHouseSign1:
	jumptext TrainerHouseSign1Text

TrainerHouseSign2:
	jumptext TrainerHouseSign2Text

TrainerHouseIllegibleBook:
	jumptext TrainerHouseIllegibleText

DecoShopOpenText:
	text "Ciao, oggi siamo"
	line "aperti."

	para "Vendiamo"
	line "decorazioni,"
	
	para "dovrai usare la"
	line "CARTA BLU."
	done

ChooseDecoMenuText:
	text "Scegli l'articolo"
	line "che preferisci."
	done

DecoShopGoodByeText:
	text "Torna a farci"
	line "visita."
	done

AlreadyGotDecoText:
	text "Hai già questa"
	line "decorazione."
	prompt

GotDecoText:
	text "Ecco a te! Grazie."
	done

ChooseDecoText:
	text "Quale decorazione"
	line "preferisci?"
	done

DecoNoCardText:
	text "Non puoi comprare"
	line "decorazioni senza"
	cont "la CARTA BLU."
	
	para "Puoi riceverla"
	line "alla TORRE RADIO"
	cont "di FIORDOROPOLI."
	done

DecoRefusedText:
	text "Arrivederci!"
	done

TrainerHouse1FReceptionistText:
	text "La CASA ALLENATORE"
	line "è il luogo più"

	para "alla moda di"
	line "SMERALDOPOLI."

	para "Siamo aperti solo"
	line "agli allenatori."

	para "Qui sotto potrai"
	line "sfidare semplice-"
	cont "mente il meglio"
	cont "del meglio."
	done

TrainerHouse1FCooltrainerMText:
	text "SMERALDOPOLI è la"
	line "città più vicina"
	cont "all'ALTOPIANO BLU."

	para "Di qui passano"
	line "molti allenatori"

	para "diretti all'"
	line "ALTOPIANO BLU. Per"

	para "questo hanno aper-"
	line "to questo posto!"
	done

TrainerHouse1FCooltrainerFText:
	text "Qui sotto ci sono"
	line "sempre molte"
	cont "battaglie."

	para "Mi piacerebbe"
	line "vedere cosa sa"

	para "fare un Allenatore"
	line "di #MON di"
	cont "JOHTO come te!"
	done

TrainerHouse1FYoungsterText:
	text "Non puoi diventare"
	line "CAMPIONE se non"

	para "vai in giro"
	line "sfidando tutti"

	para "gli allenatori che"
	line "trovi."

	para "Il CAMPIONE di"
	line "BIANCAVILLA è"

	para "stato ovunque a"
	line "KANTO."
	done

TrainerHouse1FGentlemanText:
	text "Ohi ohi… Per un"
	line "po', basta con le"
	cont "lotte di #MON!"
	
	para "Menomale che il"
	line "lunedì vendono"
	cont "decorazioni."
	
	para "Attento che alcuni"
	line "articoli variano"
	
	para "in base all'ora"
	line "del giorno."
	done

TrainerHouseSign1Text:
	text "Gli allenamenti si"
	line "svolgono nella"

	para "SALA ALLENAMENTI,"
	line "qui sotto."

	para "Solo gli"
	line "allenatori esperti"
	cont "vi partecipano."
	done

TrainerHouseSign2Text:
	text "Non ci sono regole"
	line "particolari per le"

	para "lotte"
	line "d'allenamento: è"

	para "come in qualsiasi"
	line "altra lotta."
	done

TrainerHouseIllegibleText:
	text "… Cos'è, un"
	line "piano strategico?"

	para "La scrittura"
	line "somiglia alle orme"

	para "di un ONIX… È"
	line "illeggibile…"
	done

TrainerHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 13, VIRIDIAN_CITY, 3
	warp_event  3, 13, VIRIDIAN_CITY, 3
	warp_event  8,  2, TRAINER_HOUSE_B1F, 1

	def_coord_events

	def_bg_events
	bg_event  5,  0, BGEVENT_READ, TrainerHouseSign1
	bg_event  7,  0, BGEVENT_READ, TrainerHouseSign2
	bg_event  7, 10, BGEVENT_READ, TrainerHouseIllegibleBook

	def_object_events
	object_event  0, 11, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FReceptionistScript, -1
	object_event  7, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FCooltrainerMScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FCooltrainerFScript, -1
	object_event  4,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FYoungsterScript, -1
	object_event  2,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FGentlemanScript, -1
