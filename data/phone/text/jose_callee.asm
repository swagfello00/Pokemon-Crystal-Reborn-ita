JoseAnswerPhoneText:
	text "Pronto, qui è"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Ah, <PLAY_G>!"
	line "Buongiorno!"
	done

JoseAnswerPhoneDayText:
	text "Pronto, qui è"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "<PLAY_G>! Ciao!"
	done

JoseAnswerPhoneNiteText:
	text "Pronto, qui è"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Ciao, <PLAY_G>!"
	line "Buonasera!"
	done

JoseGreetText:
	text "<PLAY_G>?"

	para "Sì, sono io,"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

JoseGreetDayText:
	text "<PLAY_G>?"

	para "Sì, sono io,"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

JoseGreetNiteText:
	text "<PLAY_G>?"

	para "Sì, sono io,"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

JoseGenericText:
	text "Vanno sempre forte"
	line "i tuoi #MON?"

	para "Il mio @"
	text_ram wStringBuffer4
	text_start
	line "ha molta energia."

	para "Quando parte ha"
	line "la potenza di una"
	cont "locomotiva!"
	done
