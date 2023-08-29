AnthonyAnswerPhoneText:
	text "Sono @"
	text_ram wStringBuffer3
	text ","
	line "l'AVVENTURIERO."

	para "Ah, <PLAYER>!"
	done

AnthonyAnswerPhoneDayText:
	text "Sono @"
	text_ram wStringBuffer3
	text ","
	line "l'AVVENTURIERO."

	para "Ah, sei <PLAYER>,"
	line "vero?"
	done

AnthonyAnswerPhoneNiteText:
	text "Sono @"
	text_ram wStringBuffer3
	text ","
	line "l'AVVENTURIERO."

	para "Ah, sei <PLAYER>,"
	line "se non sbaglio!"
	done

AnthonyGreetText:
	text "Ciao, <PLAYER>!"

	para "Sono @"
	text_ram wStringBuffer3
	text ","
	line "l'AVVENTURIERO!"
	done

AnthonyGreetDayText:
	text "Sei <PLAYER>?"

	para "Io sono @"
	text_ram wStringBuffer3
	text ","
	line "l'AVVENTURIERO!"
	done

AnthonyGreetNiteText:
	text "<PLAYER>, sei"
	line "ancora in piedi?"

	para "Sono @"
	text_ram wStringBuffer3
	text ","
	line "l'AVVENTURIERO!"
	done

AnthonyGenericText:
	text "I tuoi #MON"
	line "sono sempre ok?"

	para "Il mio @"
	text_ram wStringBuffer4
	text_start
	line "ha energia da"

	para "vendere, come me!"
	line "Andiamo tutti i"

	para "giorni sui monti"
	line "per sfogare tutta"
	cont "la nostra energia!"
	done
