JackAnswerPhoneText:
	text "Pronto, sono"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Buongiorno,"
	line "<PLAY_G>!"
	done

JackAnswerPhoneDayText:
	text "Pronto, sono"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Come te la passi,"
	line "<PLAY_G>?"
	done

JackAnswerPhoneNiteText:
	text "Pronto, sono"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Buonasera,"
	line "<PLAY_G>!"
	done

JackGreetText:
	text "<PLAY_G>,"
	line "buongiorno!"

	para "Sono @"
	text_ram wStringBuffer3
	text "."
	line "Come te la passi?"
	done

JackGreetDayText:
	text "Ehilà, <PLAY_G>!"

	para "Sono @"
	text_ram wStringBuffer3
	text "."
	line "Come va lì?"
	done

JackGreetNiteText:
	text "<PLAY_G>,"
	line "buonasera!"

	para "Sono @"
	text_ram wStringBuffer3
	text "."
	line "Hai un minuto?"
	done

JackGenericText:
	text "Come stanno i"
	line "tuoi #MON?"

	para "Il mio @"
	text_ram wStringBuffer4
	text_start
	line "è così curioso…"

	para "Credo che somigli"
	line "a me…"
	done
