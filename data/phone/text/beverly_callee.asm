BeverlyAnswerPhoneText:
	text "Pronto, qui è"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Ah, buongiorno"
	line "<PLAYER>!"
	done

BeverlyAnswerPhoneDayText:
	text "Pronto, qui è"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Ah, ciao"
	line "<PLAYER>!"
	done

BeverlyAnswerPhoneNiteText:
	text "Pronto, qui è"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Ah, buonasera"
	line "<PLAYER>."
	done

BeverlyGreetText:
	text "Ciao, <PLAYER>."
	line "Buongiorno."

	para "Sono @"
	text_ram wStringBuffer3
	text "."
	line "Dormivi?"
	done

BeverlyGreetDayText:
	text "Ciao, <PLAYER>."
	line "Sono @"
	text_ram wStringBuffer3
	text "."

	para "Come va?"
	done

BeverlyGreetNiteText:
	text "Ciao, <PLAYER>."
	line "Sono @"
	text_ram wStringBuffer3
	text "."

	para "Stavi dormendo?"
	done

BeverlyGenericText:
	text "Sono felici i tuoi"
	line "#MON?"

	para "Il mio @"
	text_ram wStringBuffer4
	text_start
	line "sta proprio bene."
	cont "Vedessi quanto"
	cont "mangia!"
	done
