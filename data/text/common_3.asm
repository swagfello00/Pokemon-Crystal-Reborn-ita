_OakText6::
	text "Come hai detto"
	line "che ti chiami?"
	prompt

_OakText7::
	text "<PLAYER>, vuoi"
	line "iniziare?"

	para "Stai per scrivere"
	line "la tua personalis-"
	cont "sima storia nel"
	cont "mondo dei"
	cont "#MON."

	para "Vivrai esperienze"
	line "divertenti e"
	cont "affronterai"
	cont "impegnative sfide."

	para "Con i #MON ti"
	line "attende un mondo"

	para "di sogno"
	line "e avventura."
	cont "Cosa aspetti?"

	para "Ci vediamo fra un"
	line "po'!"
	done

_ClockTimeMayBeWrongText::
	text "L'ora potrebbe"
	line "essere sbagliata."

	para "Regola di nuovo"
	line "l'orologio."
	prompt

_ClockSetWithControlPadText::
	text "Regola con la"
	line "pulsantiera di"
	cont "comando."

	para "Conferma: A"
	line "Annulla: B"
	done

_ClockIsThisOKText::
	text "Va bene?"
	done

_ClockHasResetText::
	text "Hai regolato"
	line "l'orologio."
	done

_LinkTimeoutText::
	text "È trascorso"
	line "troppo tempo."
	cont "Riprova."
	prompt

_LinkTradeCantBattleText::
	text "Se scambi quel"
	line "#MON non"
	cont "potrai lottare."
	prompt

_LinkAbnormalMonText::
	text_ram wStringBuffer1
	text_start
	line "del tuo amico"
	cont "sembra irregolare."
	prompt

_LinkAskTradeForText::
	text "Scambi @"
	text_ram wBufferTrademonNickname
	text_start
	line "per @"
	text_ram wStringBuffer1
	text "?"
	done

_MobileBattleMustPickThreeMonText::
	text "Per partecipare a"
	line "una lotta mobile,"

	para "devi scegliere"
	line "tre #MON."

	para "Va bene?"
	done

_MobileBattleMoreInfoText::
	text "Vuoi saperne di"
	line "più sulle lotte"
	cont "mobile?"
	done

_MobileBattleRulesText::
	text "Per una lotta"
	line "mobile, scegli"
	cont "tre #MON."

	para "La durata massima"
	line "è dieci minuti al"

	para "giorno per ogni"
	line "giocatore."

	para "Se la lotta non"
	line "finisce entro il"

	para "tempo limite,"
	line "vince chi ha meno"
	cont "#MON K.O. "

	para "In caso di"
	line "pareggio, vince"

	para "la squadra che ha"
	line "perso meno PS."
	done

_WouldYouLikeToMobileBattleText::
	text "Oggi hai solo"
	line "@"
	text_decimal wStringBuffer2, 1, 2
	text " min."

	para "Vuoi lottare?"
	line ""
	done

_WantAQuickMobileBattleText::
	text "Oggi hai solo @"
	text_decimal wStringBuffer2, 1, 2
	text_start
	line "min."

	para "Vuoi fare una"
	line "lotta veloce?"
	done

_WantToRushThroughAMobileBattleText::
	text "Oggi ti resta un"
	line "solo minuto!"

	para "Vuoi fare una"
	line "lotta veloce?"
	done

_PleaseTryAgainTomorrowText::
	text "Hai meno di 1 min."
	line "minuto oggi!"

	para "Riprova domani."
	line ""
	done

_TryAgainUsingSameSettingsText::
    text "Riprovare con le"
    line "stesse opzioni?"
    done

_MobileBattleLessThanOneMinuteLeftText::
	text "Oggi hai meno di"
	line "1 min. disponibile!"
	done

_MobileBattleNoTimeLeftForLinkingText::
	text "Non c'è più tempo"
	line "per collegarsi."
	done

_PickThreeMonForMobileBattleText::
	text "Scegli tre #MON"
	line "per lottare."
	done

_MobileBattleRemainingTimeText::
	text "Oggi mancano"
	line "@"
	text_decimal wStringBuffer2, 1, 2
	text " min."
	done

_WouldYouLikeToSaveTheGameText::
	text "Vuoi salvare il"
	line "gioco?"
	done

_SavingDontTurnOffThePowerText::
	text "SALVATAGGIO…"
	line "NON SPEGNERE."
	done

_SavedTheGameText::
	text "<PLAYER> ha"
	line "salvato il gioco."
	done

_AlreadyASaveFileText::
	text "C'è già un gioco"
	line "salvato in"
	cont "memoria. Vuoi"
	cont "sostituirlo?"
	done

_AnotherSaveFileText::
	text "C'è già un file di"
	line "salvataggio. Vuoi"
	cont "sostituirlo?"
	done

_SaveFileCorruptedText::
	text "Il file di"
	line "salvataggio è"
	cont "danneggiato!"
	prompt

_ChangeBoxSaveText::
	text "Quando cambi "
	line "BOX #MON i"
	cont "dati vengono"
	cont "salvati. Va bene?"
	done

_MoveMonWOMailSaveText::
	text "Quando sposti un"
	line "#MON i dati"
	cont "vengono salvati."
	cont "Va bene?"
	done

_WindowAreaExceededErrorText:: ; unreferenced
	text "L'area della"
	line "finestra "
	done

_WindowPoppingErrorText::
	text "Usate troppe"
	line "finestra è stata"
	cont "oltrepassata."
	done

_CorruptedEventText:: ; unreferenced
	text "Evento corrotto!"
	prompt

_ObjectEventText::
	text "Oggetto evento."
	done

_BGEventText::
	text "Sfondo evento."
	done

_CoordinatesEventText::
	text "Coordinate evento."
	done

_ReceivedItemText::
	text "<PLAYER> riceve"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

_PutItemInPocketText::
	text "<PLAYER> mette"
	line "@"
	text_ram wStringBuffer1
	text " nella"
	cont "@"
	text_ram wStringBuffer3
	text "."
	prompt

_PocketIsFullText::
	text "La @"
	text_ram wStringBuffer3
	text_start
	line "è piena…@"
	text_linkwaitbutton
	text_end

_SeerSeeAllText::
	text "Vedo tutto."
	line "So tutto…"

	para "Soprattutto,"
	line "conosco i tuoi"
	cont "#MON!"
	done

_SeerCantTellAThingText::
	text "Ma come?! Non"
	line "vedo nulla!"

	para "Non ci posso"
	line "credere!"
	done

_SeerNameLocationText::
	text "Vedo… vedo…"
	line "Hai trovato"

	para "@"
	text_ram wSeerNickname
	text " qui:"
	line "@"
	text_ram wSeerCaughtLocation
	text "!"
	prompt

_SeerTimeLevelText::
	text "Era"
	line "@"
	text_ram wSeerTimeOfDay
	text "!"

	para "Il suo livello era"
	line "@"
	text_ram wSeerCaughtLevelString
	text "!"

	para "Sono brava, vero?"
	prompt

_SeerTradeText::
	text_ram wSeerOT
	text " ti ha"
	line "dato @"
	text_ram wSeerNickname
	text_start
	cont "in uno scambio?"

	para "@"
	text_ram wSeerOT
	text " aveva"
	line "trovato @"
	text_ram wSeerNickname
	text_start
	cont "qui:"
	cont "@"
	text_ram wSeerCaughtLocation
	text "!"
	prompt

_SeerNoLocationText::
	text "Incredibile!"

	para "Non so perché, ma"
	line "penso che tu sia"

	para "un tipo davvero"
	line "speciale."

	para "Non so dove l'hai"
	line "trovato, ma il suo"
	cont "livello era @"
	text_ram wSeerCaughtLevelString
	text "."

	para "Sono brava, vero?"
	prompt

_SeerEggText::
	text "Ehi!"

	para "Ma è un UOVO!"

	para "Come faccio a"
	line "dirti dove l'hai"
	cont "trovato?"
	done

_SeerDoNothingText::
	text "Fufufu! Vedo che"
	line "non farai nulla!"
	done

_SeerMoreCareText::
	text "A proposito…"

	para "Dovresti avere"
	line "un po' più di"

	para "attenzione per i"
	line "tuoi #MON."
	done

_SeerMoreConfidentText::
	text "A proposito…"

	para "Vedo che è"
	line "cresciuto un po'."

	para "@"
	text_ram wSeerNickname
	text " sembra"
	line "un po' più sicuro"
	cont "di sé."
	done

_SeerMuchStrengthText::
	text "A proposito…"

	para "@"
	text_ram wSeerNickname
	text " è"
	line "cresciuto. Ora è"
	cont "molto più forte."
	done

_SeerMightyText::
	text "A proposito…"

	para "È cresciuto"
	line "parecchio!"

	para "Questo @"
	text_ram wSeerNickname
	text_start
	line "deve aver vinto"

	para "parecchie lotte di"
	line "#MON!"

	para "Sembra davvero"
	line "sicuro di sé."
	done

_SeerImpressedText::
	text "A proposito…"

	para "Hai fatto un"
	line "ottimo lavoro!"

	para "Era da tanto che"
	line "non vedevo"

	para "un #MON così"
	line "forte come il tuo"
	cont "@"
	text_ram wSeerNickname
	text "."

	para "Veder lottare"
	line "@"
	text_ram wSeerNickname
	text_start

	para "dev'essere una"
	line "grande esperienza!"
	done

_CongratulationsYourPokemonText::
	text "Complimenti! Il"
	line "tuo @"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_EvolvedIntoText::
	text_start

	para "si è evoluto in"
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

_StoppedEvolvingText::
	text "Bloccata evoluzio-"
	line "ne di @"
	text_ram wStringBuffer2
	text "."
	prompt

_EvolvingText::
	text "Cosa?! @"
	text_ram wStringBuffer2
	text_start
	line "si sta evolvendo!"
	done

_MartHowManyText::
	text "Quanti/e?"
	done

_MartFinalPriceText::
	text_ram wStringBuffer2
	text ":"
	line "in tutto fa"
	cont "¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_HerbShopLadyIntroText::
	text "Ciao!"

	para "Vendo erbe"
	line "medicinali a"
	cont "basso prezzo."

	para "Fanno bene, ma"
	line "sono un po' amare."

	para "Forse ai #MON"
	line "non piaceranno."

	para "Eheheh…"
	done

_HerbalLadyHowManyText::
	text "Quanti/e?"
	done

_HerbalLadyFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " @"
	text_ram wStringBuffer2
	text ":"
	line "spendi ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_HerbalLadyThanksText::
	text "Grazie!"
	line "Eheheh…"
	done

_HerbalLadyPackFullText::
	text "Oh, il tuo ZAINO"
	line "è pieno."
	done

_HerbalLadyNoMoneyText::
	text "Eheheh… Non hai"
	line "abbastanza soldi."
	done

_HerbalLadyComeAgainText::
	text "Torna a trovarmi."
	line "Eheheh…"
	done

_BargainShopIntroText::
	text "Ehi, vuoi fare un"
	line "affare?"

	para "Vendo strumenti"
	line "che ho solo io, ma"

	para "solo un esemplare"
	line "per ognuno."
	done

_BargainShopFinalPriceText::
	text_ram wStringBuffer2
	text " costa"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text ". Va bene?"
	done

_BargainShopThanksText::
	text "Grazie."
	done

_BargainShopPackFullText::
	text "Ops, il tuo ZAINO"
	line "è pieno zeppo."
	done

_BargainShopSoldOutText::
	text "Hai già acquistato"
	line "questo strumento."
	cont "Non ne ho più."
	done

_BargainShopNoFundsText::
	text "Ops, sei a corto"
	line "di denaro."
	done

_BargainShopComeAgainText::
	text "Torna a trovarmi"
	line "quando vuoi."
	done

_PharmacyIntroText::
	text "Che c'è? Vuoi"
	line "qualche medicina?"
	done

_PharmacyHowManyText::
	text "Quanti/e?"
	done

_PharmacyFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " @"
	text_ram wStringBuffer2
	text ":"
	line "spendi ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_PharmacyThanksText::
	text "Grazie mille!"
	done

_PharmacyPackFullText::
	text "Non hai abbastanza"
	line "spazio."
	done

_PharmacyNoMoneyText::
	text "Come? Non hai"
	line "abbastanza soldi."
	done

_PharmacyComeAgainText::
	text "Ok."
	line "Ci si vede."
	done

_NothingToSellText::
	text "Non hai nulla da"
	line "vendere."
	prompt

_MartSellHowManyText::
	text "Quanti/e?"
	done

_MartSellPriceText::
	text "Posso darti"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."

	para "Che ne dici?"
	done

_MartWelcomeText::
	text "Salve, cosa posso"
	line "fare per te?"
	done

_MartThanksText::
	text "Ecco qui."
	line "Grazie."
	done

_MartNoMoneyText::
	text "Non hai abbastanza"
	line "denaro."
	done

_MartPackFullText::
	text "Non puoi portare"
	line "altri strumenti."
	done

_MartCantBuyText::
	text "Non posso comprare"
	line "questo strumento."
	prompt

_MartComeAgainText::
	text "Torna a trovarmi!"
	done

_MartAskMoreText::
	text "Cos'altro posso"
	line "fare per te?"
	done

_MartBoughtText::
	text "Ricevuti ¥@"
	text_decimal hMoneyTemp, 3, 6
	text_start
	line "per @"
	text_ram wStringBuffer2
	text "."
	done

_SlotsBetHowManyCoinsText::
	text "Quanto vuoi"
	line "puntare?"
	done

_SlotsStartText::
	text "Via!"
	done

_SlotsNotEnoughCoinsText::
	text "Non hai abbastanza"
	line "gettoni."
	prompt

_SlotsRanOutOfCoinsText::
	text "Acc… Non"
	line "hai più gettoni…"
	done

_SlotsPlayAgainText::
	text "Rigiochi?"
	done

_SlotsLinedUpText::
	text "allineati!"
	line "@"
	text_ram wStringBuffer2
	text " gettoni!"
	done

_SlotsDarnText::
	text "Che sfortuna!"
	done

_MobileStadiumEntryText::
	text "Qui trovi"
	line "i dati dello"

	para "STADIO MOBILE di"
	line "POKéMON STADIUM 2"
	cont "per N64."

	para "Caricare i dati?"
	done

_MobileStadiumSuccessText::
	text "Trasferimento dati"
	line "completato."

	para "Goditi le lotte"
	line "dello STADIO"
	
	para "MOBILE su #MON"
	line "STADIUM 2 per N64."

	para ""
	done

_MainMenuTimeUnknownText::
	text "Ora sconosciuta"
	done

_DeleteSavedLoginPasswordText::
     	text "Rimuovere PASSWORD"
     	line "D'ACCESSO salvata?"
	done

_DeletedTheLoginPasswordText::
	text "PASSWORD D'ACCESSO"
	line "rimossa."
	done

_MobilePickThreeMonForBattleText::
	text "Scegli tre #MON"
	line "per lottare."
	prompt

_MobileUseTheseThreeMonText::
	text_ram wMobileParticipant1Nickname
	text ","
	line "@"
	text_ram wMobileParticipant2Nickname
	text " e"
	cont "@"
	text_ram wMobileParticipant3Nickname
	text "."

	para "Usi questi tre?"
	done

_MobileOnlyThreeMonMayEnterText::
	text "Devi avere"
	line "esattamente tre"
	cont "#MON."
	prompt

_MobileCardFolderIntro1Text::
	text "L'ALBUM SCHEDE"
	line "contiene le SCHEDE"

	para "tue e dei tuoi"
	line "amici."

	para "Una SCHEDA con-"
	line "tiene informazioni"

	para "come il nome"
	line "di una persona,"
	para "il numero e il"
	line "profilo."

	para ""
	done

_MobileCardFolderIntro2Text::
	text "Questa è la tua"
	line "SCHEDA."

	para "Dopo aver inserito"
	line "il tuo numero di"

	para "telefono, sarai in"
	line "grado di scambiare"
	para "le SCHEDE con i"
	line "tuoi amici."

	para ""
	done

_MobileCardFolderIntro3Text::
	text "Se hai la SCHEDA"
	line "di un tuo amico,"

	para "puoi usarla per"
	line "fare una chiamata"

	para "dal secondo piano"
	line "del CENTRO"
	cont "#MON."

	para ""
	done

_MobileCardFolderIntro4Text::
	text "Per tenere al"
	line "sicuro una"

	para "collezione di"
	line "SCHEDE, devi"

	para "impostare una"
	line "PASSWORD D'ACCESSO"

	para "per L'ALBUM"
	line "SCHEDE."

	para ""
	done

_MobileCardFolderAskDeleteText::
	text "Se elimini l'ALBUM"
	line "SCHEDE, verranno"

	para "eliminati anche il"
	line "CODICE di accesso"
	cont "e le SCHEDE."

	para "Attenzione: una"
	line "SCHEDA eliminata"
	para "non può essere"
	line "ripristinata."

	para "Vuoi eliminare"
	line "l'ALBUM SCHEDE?"
	done

_MobileCardFolderDeleteAreYouSureText::
	text "Vuoi davvero"
	line "cancellarlo?"
	done

_MobileCardFolderDeletedText::
	text "L'ALBUM SCHEDE"
	line "è stato eliminato."

	para ""
	done

_MobileCardFolderAskOpenOldText::
	text "C'è un ALBUM"
	line "SCHEDE da un"
	cont "salvataggio"
	line "precedente."

	para "Vuoi aprirlo?"
	line ""
	done

_MobileCardFolderAskDeleteOldText::
	text "Eliminare ALBUM"
	line "SCHEDE precedente?"
	done

_MobileCardFolderFinishRegisteringCardsText::
	text "Terminare regi-"
	line "strazione SCHEDE?"
	done

_PhoneWrongNumberText::
	text "Eh? Mi spiace,"
	line "numero errato."
	done

_PhoneClickText::
	text "Clic!"
	done

_PhoneEllipseText::
	text "<……>"
	done

_PhoneOutOfAreaText::
	text "Il numero è fuori"
	line "dall'area coperta."
	done

_PhoneJustTalkToThemText::
	text "Potete parlarvi"
	line "di persona!"
	done

_PhoneThankYouText::
	text "Grazie!"
	done

_SpaceSpaceColonText:: ; unreferenced
	text "  :"
	done

_PasswordAskResetText::
	text "Password corretta."
	line "Seleziona CONTINUA"
	cont "per modificare le"
	cont "impostazioni."
	prompt

_PasswordWrongText::
	text "Password errata!"
	prompt

_PasswordAskResetClockText::
	text "Regolare l'ora?"
	done

_PasswordAskEnterText::
	text "Inserisci la"
	line "password."
	done

_ClearAllSaveDataText::
	text "Cancellare tutti"
	line "i dati salvati?"
	done

_LearnedMoveText::
	text_ram wMonOrItemNameBuffer
	text " impara"
	line "@"
	text_ram wStringBuffer2
	text "!@"
	sound_dex_fanfare_50_79
	text_waitbutton
	text_end

	text_end ; unreferenced

_MoveAskForgetText::
	text "Quale mossa vuoi"
	next "che dimentichi?"
	done

_StopLearningMoveText::
	text "Bloccare"
	line "l'apprendimento di"
	cont "@"
	text_ram wStringBuffer2
	text "?"
	done

_DidNotLearnMoveText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "non ha imparato"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

_AskForgetMoveText::
	text_ram wMonOrItemNameBuffer
	text " sta"
	line "provando ad"
	cont "apprendere"
	cont "@"
	text_ram wStringBuffer2
	text "."

	para "Ma @"
	text_ram wMonOrItemNameBuffer
	text " non"
	line "può conoscere più"
	cont "di quattro mosse."

	para "Vuoi cancellare"
	line "una mossa per"
	cont "far posto a"
	cont "@"
	text_ram wStringBuffer2
	text "?"
	done

Text_MoveForgetCount::
	text "1, 2 e…@"
	text_pause
	text_end

	text_end ; unreferenced

_MoveForgotText::
	text " puf!@"
	text_pause
	text_start

	para "@"
	text_ram wMonOrItemNameBuffer
	text " scorda"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "E…"
	prompt

_MoveCantForgetHMText::
	text "Ora è impossibile"
	line "scordare mosse MN."
	prompt

_CardFlipPlayWithThreeCoinsText::
	text "Punti tre gettoni?"
	done

_CardFlipNotEnoughCoinsText::
	text "Pochi gettoni…"
	prompt

_CardFlipChooseACardText::
	text "Scegli una carta."
	done

_CardFlipPlaceYourBetText::
	text "Fai una puntata."
	done

_CardFlipPlayAgainText::
	text "Vuoi giocare"
	line "ancora?"
	done

_CardFlipShuffledText::
	text "Le carte sono"
	line "state mischiate."
	prompt

_CardFlipYeahText::
	text "Sì!"
	done

_CardFlipDarnText::
	text "Acc…"
	done

_GearTodayText::
	text_today
	text_end

	text_end ; unreferenced

_GearEllipseText::
	text "<……>"
	done

_GearOutOfServiceText::
	text "Sei fuori dall'"
	line "area coperta."
	prompt

_PokegearAskWhoCallText::
	text "Chi desideri"
	line "chiamare?"
	done

_PokegearPressButtonText::
	text "Premi un pulsante"
	line "per uscire."
	done

_PokegearAskDeleteText::
	text "Vuoi cancellare"
	line "questo numero?"
	done

_BuenaAskWhichPrizeText::
	text "Che premio"
	line "preferisci?"
	done

_BuenaIsThatRightText::
	text_ram wStringBuffer1
	text "?"
	line "È esatto?"
	done

_BuenaHereYouGoText::
	text "Ecco qui!"
	prompt

_BuenaNotEnoughPointsText::
	text "Non hai abbastanza"
	line "punti."
	prompt

_BuenaNoRoomText::
	text "Non hai spazio."
	done

_BuenaComeAgainText::
	text "Torna a trovarmi,"
	line "mi raccomando!"
	done

_BTExcuseMeText::
	text "Scusami!"
	prompt

_ExcuseMeYoureNotReadyText::
	text "Qualcosa non va:"
	line "non puoi ancora"
	cont "partecipare."

	para ""
	done

_BattleTowerReturnWhenReadyText::
	text "Torna dopo aver"
	line "messo apposto ciò"
	cont "che non va."
	done

_NeedAtLeastThreeMonText::
	text "Devi avere almeno"
	line "tre #MON."
	prompt

_EggDoesNotQualifyText::
	text "Un UOVO non può"
	line "partecipare."
	prompt

_OnlyThreeMonMayBeEnteredText::
	text "Devi avere"
	line "esattamente tre"
	cont "#MON."
	prompt

_TheMonMustAllBeDifferentKindsText::
	text "I @"
	text_ram wStringBuffer2
	text " #MON"
	line "devono essere"
	cont "tutti diversi."

	para ""
	done

_TheMonMustNotHoldTheSameItemsText::
	text "I @"
	text_ram wStringBuffer2
	text " #MON non"
	line "possono tenere gli"
	cont "stessi strumenti."

	para ""
	done

_YouCantTakeAnEggText::
	text "Non puoi portare"
	line "un UOVO!"
	prompt

_BallDodgedText::
	text "Ha schivato la"
	line "BALL!"

	para "Questo #MON"
	line "non può essere"
	cont "catturato."
	prompt

_BallMissedText::
	text "Ti è sfuggito"
	line "il #MON!"
	prompt

_BallBrokeFreeText::
	text "Oh no! Il #MON"
	line "si è liberato!"
	prompt

_BallAppearedCaughtText::
	text "Ah! Sembrava preso"
	line "eh? E invece no!"
	prompt

_BallAlmostHadItText::
	text "Argh!"
	line "Per un pelo!"
	prompt

_BallSoCloseText::
	text "Nooo! Era così"
	line "vicino!"
	prompt

Text_BallCaught::
	text "Preso! @"
	text_ram wEnemyMonNickname
	text_start
	line "è catturato!@"
	sound_caught_mon
	text_end

	text_end ; unreferenced

_WaitButtonText::
	text_promptbutton
	text_end

	text_end ; unreferenced

_BallSentToPCText::
	text_ram wMonOrItemNameBuffer
	text " inviato"
	line "al PC di BILL."
	prompt

_NewDexDataText::
	text "Inseriti dati di"
	line "@"
	text_ram wEnemyMonNickname
	text_start
	cont "nel #DEX.@"
	sound_slot_machine_start
	text_promptbutton
	text_end

	text_end ; unreferenced

_AskGiveNicknameText::
	text "Dai un soprannome"
	line "a @"
	text_ram wStringBuffer1
	text "?"
	done

_ItemStatRoseText::
	text "Sale @"
	text_ram wStringBuffer2
	text " di"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_ItemCantUseOnMonText::
	text "Non si può usare"
	line "su questo #MON."
	prompt

_RepelUsedEarlierIsStillInEffectText::
	text "Il REPELLENTE"
	line "usato prima è"
	cont "ancora attivo."
	prompt

_PlayedFluteText::
	text "Hai suonato il"
	line "# FLAUTO."

	para "Ah, che melodia"
	line "orecchiabile!"
	prompt

_FluteWakeUpText::
	text "Tutti i #MON"
	line "addormentati si"
	cont "sono svegliati."
	prompt

Text_PlayedPokeFlute::
	text "<PLAYER> suona"
	line "il # FLAUTO.@"
	text_waitbutton
	text_end

	text_end ; unreferenced

_BlueCardBalanceText::
	text "Ora hai"
	line "@"
	text_decimal wBlueCardBalance, 1, 2
	text " punto/i."
	done

_CoinCaseCountText::
	text "Gettoni:"
	line "@"
	text_decimal wCoins, 2, 4
	text_end

	text_end ; unreferenced

_RaiseThePPOfWhichMoveText::
	text "Aumenta i PP di"
	line "quale mossa?"
	done

_RestoreThePPOfWhichMoveText::
	text "Ricarica i PP di"
	line "quale mossa?"
	done

_PPIsMaxedOutText::
	text "PP di @"
	text_ram wStringBuffer2
	text_start
	line "al massimo."
	prompt

_PPsIncreasedText::
	text "Aumentati i PP"
	line "di @"
	text_ram wStringBuffer2
	text "."
	prompt

_PPRestoredText::
	text "PP ricaricati."
	prompt

_SentTrophyHomeText::
	text "Dentro c'era un"
	line "trofeo!@"
	sound_dex_fanfare_50_79
	text_start

	para "@"
	text_ram wPlayerName
	text " manda"
	line "il trofeo a casa."
	prompt

_ItemLooksBitterText::
	text "Sembra amara…"
	prompt

_ItemCantUseOnEggText::
	text "Non si può usare"
	line "con un UOVO."
	prompt

_ItemOakWarningText::
	text "OAK: <PLAYER>!"
	line "Questo non è il"
	cont "momento opportuno!"
	prompt

_ItemBelongsToSomeoneElseText::
	text "Appartiene a"
	line "qualcun altro!"
	prompt

_ItemWontHaveEffectText::
	text "Non avrebbe alcun"
	line "effetto."
	prompt

_BallBlockedText::
	text "La BALL è stata"
	line "bloccata!"
	prompt

_BallDontBeAThiefText::
	text "Non si ruba!"
	prompt

_NoCyclingText::
	text "Non si può andare"
	line "in bici qui."
	prompt

_ItemCantGetOnText::
	text "Non puoi salire su"
	line "@"
	text_ram wStringBuffer1
	text " ora."
	prompt

_BallBoxFullText::
	text "Il BOX #MON è"
	line "pieno! Non puoi"
	cont "usare questo"
	cont "strumento ora."
	prompt

_ItemUsedText::
	text "<PLAYER> usa"
	line "@"
	text_ram wStringBuffer2
	text "."
	done

_ItemGotOnText::
	text "<PLAYER> sale su@"
	text_low
	text_ram wStringBuffer2
	text "."
	prompt

_ItemGotOffText::
	text "<PLAYER> scende@"
	text_low
	text "da @"
	text_ram wStringBuffer2
	text "."
	prompt

_KnowsMoveText::
	text_ram wStringBuffer1
	text " sa"
	line "già @"
	text_ram wStringBuffer2
	text "."
	prompt

_MoveKnowsOneText::
	text "Quel #MON sa"
	line "solo una mossa."
	done

_AskDeleteMoveText::
	text "Vuoi che scordi"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

_DeleterForgotMoveText::
	text "Il #MON ha"
	line "scordato la mossa."
	done

_DeleterEggText::
	text "Un UOVO non"
	line "conosce mosse!"
	done

_DeleterNoComeAgainText::
	text "No? Torna quando"
	line "vuoi."
	done

_DeleterAskWhichMoveText::
	text "Quale mossa vuoi"
	line "che dimentichi?"
	prompt

_DeleterIntroText::
	text "Ecco… Sono"
	line "l'ELIMINAMOSSE."

	para "Posso far scordare"
	line "delle mosse ai"
	cont "tuoi #MON."

	para "Vuoi che faccia"
	line "scordare una mossa"
	cont "ad un tuo #MON?"
	done

_DeleterAskWhichMonText::
	text "A quale #MON?"
	prompt

_DSTIsThatOKText::
	text " OL, vero?"
	done

_TimeAskOkayText::
	text ","
	line "è giusto?"
	done

_TimesetAskDSTText::
	text "Vuoi passare"
	line "all'ora legale?"
	done

_TimesetDSTText::
	text "Ho spostato"
	line "l'orologio avanti"
	cont "di un'ora."
	prompt

_TimesetAskNotDSTText::
	text "Vuoi tornare"
	line "all'ora solare?"
	done

_TimesetNotDSTText::
	text "Ho spostato l'"
	line "orologio indietro"
	cont "di un'ora."
	prompt

_TimesetAskAdjustDSTText::
	text "Vuoi passare all'"
	line "ora legale, o a"
	cont "quella solare?"
	done

_MomLostGearBookletText::
	text "Ho perso il manua-"
	line "le d'istruzioni"
	cont "del #GEAR."

	para "Puoi tornare fra"
	line "un po'?"
	prompt
