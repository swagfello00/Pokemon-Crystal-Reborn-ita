WadeAnswerPhoneText:
	text "Pronto? Qui è"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Ciao, <PLAY_G>!"
	line "Buongiorno!"
	done

WadeAnswerPhoneDayText:
	text "Pronto? Qui è"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Ciao, <PLAY_G>!"
	done

WadeAnswerPhoneNiteText:
	text "Pronto? Qui è"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Ciao, <PLAY_G>!"
	line "Buonasera!"
	done

WadeGreetText:
	text "<PLAY_G>,"
	line "buongiorno!"

	para "Sono @"
	text_ram wStringBuffer3
	text "."
	line "È bello stare"
	cont "fuori, vero?"
	done

WadeGreetDayText:
	text "Ehilà, <PLAY_G>!"

	para "Sono @"
	text_ram wStringBuffer3
	text "."
	line "Come va lì?"
	done

WadeGreetNiteText:
	text "Buonasera,"
	line "<PLAY_G>!"

	para "Sono @"
	text_ram wStringBuffer3
	text "."
	line "Dormivi?"
	done

WadeGenericText:
	text "Come stanno i tuoi"
	line "#MON?"

	para "I miei hanno"
	line "troppa energia!"

	para "Non so proprio"
	line "come fare!"

	para "Soprattutto,"
	line "@"
	text_ram wStringBuffer4
	text " mi dà"
	cont "dei problemi."

	para "È faticoso farsi"
	line "obbedire!"
	done
