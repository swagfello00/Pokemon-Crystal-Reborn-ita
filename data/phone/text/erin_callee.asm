ErinAnswerPhoneText:
	text "Sì, sono"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Ciao <PLAY_G>!"
	line "Buongiorno!"
	done

ErinAnswerPhoneDayText:
	text "Sì, sono"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Ciao <PLAY_G>!"
	line "Come va?"
	done

ErinAnswerPhoneNiteText:
	text "Sì, sono"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Ciao <PLAY_G>!"
	done

ErinGreetText:
	text "<PLAY_G>!"

	para "Sono @"
	text_ram wStringBuffer3
	text "!"
	line "Buongiorno!"
	done

ErinGreetDayText:
	text "<PLAY_G>!"

	para "Sono @"
	text_ram wStringBuffer3
	text "!"
	line "Si lavora sodo?"
	done

ErinGreetNiteText:
	text "<PLAY_G>!"

	para "Sono @"
	text_ram wStringBuffer3
	text "!"
	line "Eri in piedi?"
	done

ErinGenericText:
	text "Stai allenando i"
	line "tuoi #MON?"

	para "Ehi, @"
	text_ram wStringBuffer4
	text_start
	line "di @"
	text_ram wStringBuffer3
	text_start
	cont "è in gran forma!"
	done
