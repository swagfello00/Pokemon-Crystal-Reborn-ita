DerekAnswerPhoneText:
	text "Ciao, <PLAY_G>!"

	para "Buon pika giorno!"
	line "Cosa mi pika"
	cont "racconti?"
	done

DerekAnswerPhoneDayText:
	text "Ciao, <PLAY_G>!"

	para "Cosa mi pika"
	line "racconti?"
	done

DerekAnswerPhoneNiteText:
	text "Ciao, <PLAY_G>!"

	para "Buona pika sera!"
	line "Cosa mi pika"
	cont "racconti?"
	done

DerekGreetText:
	text "<PLAY_G>, buon pika"
	line "giorno!"

	para "Sono @"
	text_ram wStringBuffer3
	text "!"
	line "Pika come stai?"
	done

DerekGreetDayText:
	text "<PLAY_G>, pika"
	line "ciao!"

	para "Sono @"
	text_ram wStringBuffer3
	text "!"
	line "Pika come stai?"
	done

DerekGreetNiteText:
	text "<PLAY_G>, buona"
	line "pika sera!"

	para "Sono @"
	text_ram wStringBuffer3
	text "."
	line "Dormivi pika?"
	done

DerekGenericText:
	text "Senti qui! Il mio"
	line "@"
	text_ram wStringBuffer4
	text_start

	para "mi ha fatto un"
	line "bel sorriso!"

	para "Siamo davvero"
	line "affiatati!"
	done
