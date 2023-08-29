BethAnswerPhoneText:
	text "Pronto, sono"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Ah, <PLAY_G>."
	line "Buongiorno."
	done

BethAnswerPhoneDayText:
	text "Pronto, qui è"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Ciao, <PLAY_G>."
	done

BethAnswerPhoneNiteText:
	text "Pronto, qui è"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "<PLAY_G>,"
	line "buonasera."
	done

BethGreetText:
	text "Buongiorno,"
	line "<PLAY_G>!"

	para "Qui è @"
	text_ram wStringBuffer3
	text "."
	line "Dormivi?"
	done

BethGreetDayText:
	text "<PLAY_G>, ciao!"
	line "Sono @"
	text_ram wStringBuffer3
	text "."

	para "Hai un minuto?"
	done

BethGreetNiteText:
	text "Ciao, <PLAY_G>."
	line "Buonasera."

	para "Sono @"
	text_ram wStringBuffer3
	text "."

	para "Spero che non"
	line "stessi dormendo."
	done

BethGenericText:
	text "Anche tu vai"
	line "spesso nei CENTRI"
	cont "#MON?"

	para "Io ci vado ogni"
	line "giorno. La salute"

	para "dei #MON è"
	line "importantissima"

	para "per un Allenatore"
	line "di #MON."
	done
