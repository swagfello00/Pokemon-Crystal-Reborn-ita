GinaAnswerPhoneText:
	text "Pronto? Qui è"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Ah, <PLAY_G>!"
	line "Buongiorno!"
	done

GinaAnswerPhoneDayText:
	text "Pronto? Qui è"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Ah, <PLAY_G>!"
	line "Come va?"
	done

GinaAnswerPhoneNiteText:
	text "Pronto? Qui è"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Ah, <PLAY_G>!"
	line "Buonasera!"
	done

GinaGreetText:
	text "<PLAY_G>?"

	para "Qui è @"
	text_ram wStringBuffer3
	text "."
	line "Buongiorno!"
	done

GinaGreetDayText:
	text "<PLAY_G>?"

	para "Sono @"
	text_ram wStringBuffer3
	text "."
	line "Ti disturbo?"
	done

GinaGreetNiteText:
	text "<PLAY_G>?"

	para "Sono @"
	text_ram wStringBuffer3
	text "."
	line "Hai tempo?"
	done

GinaGenericText:
	text "I tuoi #MON"
	line "sono sempre"
	cont "grintosi?"

	para "Io mi alleno ogni"
	line "giorno con"
	cont "@"
	text_ram wStringBuffer4
	text "."
	done
