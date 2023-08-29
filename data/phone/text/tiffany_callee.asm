TiffanyAnswerPhoneText:
	text "Pronto, sono"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Ah, <PLAY_G>."
	line "Buongiorno."
	done

TiffanyAnswerPhoneDayText:
	text "Pronto, sono"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Ah, <PLAY_G>."
	line "Ciao!"
	done

TiffanyAnswerPhoneNiteText:
	text "Pronto, sono"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Ah, <PLAY_G>."
	line "Buonasera."
	done

TiffanyGreetText:
	text "Pronto, <PLAY_G>?"

	para "Buongiorno! Sono"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

TiffanyGreetDayText:
	text "Sei <PLAY_G>?"

	para "Sono @"
	text_ram wStringBuffer3
	text "."
	done

TiffanyGreetNiteText:
	text "Sei <PLAY_G>?"

	para "Buonasera! Qui è"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

TiffanyGenericText:
	text "Come stanno i tuoi"
	line "#MON, bene?"

	para "Portali tutti i"
	line "giorni ai CENTRI"
	cont "#MON!"

	para "E non farli"
	line "stancare troppo."

	para "Il mio @"
	text_ram wStringBuffer4
	text_start
	line "è così bello e in"

	para "forma proprio"
	line "perché lo porto"

	para "ogni giorno in un"
	line "CENTRO #MON!"
	done
