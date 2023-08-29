GavenAnswerPhoneText:
	text "Pronto, qui è"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Ciao, <PLAY_G>!"
	line "Buongiorno!"
	done

GavenAnswerPhoneDayText:
	text "Pronto, qui è"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Ciao, <PLAY_G>!"
	done

GavenAnswerPhoneNiteText:
	text "Pronto, qui è"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "<PLAY_G>,"
	line "Buonasera!"
	done

GavenGreetText:
	text "<PLAY_G>,"
	line "buongiorno!"

	para "Sono @"
	text_ram wStringBuffer3
	text "."
	line "Come te la passi?"
	done

GavenGreetDayText:
	text "Ciao <PLAY_G>!"

	para "Sono @"
	text_ram wStringBuffer3
	text "."
	line "Come va?"
	done

GavenGreetNiteText:
	text "<PLAY_G>,"
	line "buonasera!"

	para "Sono @"
	text_ram wStringBuffer3
	text "."
	line "Come te la passi?"
	done

GavenGenericText:
	text "Come stanno i tuoi"
	line "#MON?"

	para "Il mio @"
	text_ram wStringBuffer4
	text_start
	line "è più forte che"
	cont "mai."

	para "Dai che ce la"
	line "facciamo a"
	cont "diventare CAMPIONI"
	cont "di #MON!"
	done
