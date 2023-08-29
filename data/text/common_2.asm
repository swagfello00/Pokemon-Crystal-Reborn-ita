_NoPhotoText::
	text "Non vuoi una foto?"
	line "Torna quando vuoi."
	done

_EggPhotoText::
	text "Un UOVO? Niente da"
	line "fare…"
	done

_NameRaterHelloText::
	text "Ehi, ciao! Sono il"
	line "GIUDICE ONOMASTICO"

	para "e valuto i nomi"
	line "dei #MON."

	para "Vuoi che valuti i"
	line "nomi dei tuoi?"
	done

_NameRaterWhichMonText::
	text "Di quale #MON"
	line "vuoi che valuti"
	cont "il soprannome?"
	prompt

_NameRaterBetterNameText::
	text "Dunque… @"
	text_ram wStringBuffer1
	text_start
	line "non è male."

	para "Ma che ne dici"
	line "di qualcosa di"
	cont "meglio?"

	para "Vuoi che gli trovi"
	line "un nome migliore?"
	done

_NameRaterWhatNameText::
	text "Va bene. Che nome"
	line "potremmo dargli?"
	prompt

_NameRaterFinishedText::
	text "È sicuramente"
	line "meglio di prima."

	para "Bel lavoro!"
	done

_NameRaterComeAgainText::
	text "Come vuoi. Torna"
	line "a trovarmi!"
	done

_NameRaterPerfectNameText::
	text "Ehm… @"
	text_ram wStringBuffer1
	text "?"
	line "Gran bel nome!"
	cont "È perfetto."

	para "Tratta @"
	text_ram wStringBuffer1
	text_start
	line "con amore!"
	done

_NameRaterEggText::
	text "Ehi… Ma è solo"
	line "un UOVO!"
	done

_NameRaterSameNameText::
	text "Può sembrare come"
	line "l'altro, ma in"

	para "realtà questo nome"
	line "è molto meglio!"

	para "Bel lavoro!"
	done

_NameRaterNamedText::
	text "Va bene. Questo"
	line "#MON ora si"
	cont "chiama @"
	text_ram wStringBuffer1
	text "."
	prompt

Text_Gained::
	text_ram wStringBuffer1
	text " riceve@"
	text_end

_BoostedExpPointsText::
; BUG: Five-digit experience gain is printed incorrectly (see docs/bugs_and_glitches.md)
	text_start
	line "la bellezza di"
	cont "@"
	text_decimal wStringBuffer2, 2, 4
	text " Punti ESP.!"
	prompt

_ExpPointsText::
; BUG: Five-digit experience gain is printed incorrectly (see docs/bugs_and_glitches.md)
	text_start
	line "@"
	text_decimal wStringBuffer2, 2, 4
	text " Punti ESP."
	prompt

_GoMonText::
	text "Los! @"
	text_end

_DoItMonText::
	text "Dai! @"
	text_end

_GoForItMonText::
	text "Vai,"
	line "@"
	text_end

_YourFoesWeakGetmMonText::
	text "Nemico debole!"
	line "Dai, @"
	text_end

_BattleMonNicknameText::
	text_ram wBattleMonNickname
	text "!"
	done

_BattleMonNickCommaText::
	text_ram wBattleMonNickname
	text ",@"
	text_end

_ThatsEnoughComeBackText::
	text " basta!"
	line "Rientra!@"
	text_end

_OKComeBackText::
	text " OK!"
	line "Rientra!@"
	text_end

_GoodComeBackText::
	text " bene!"
	line "Rientra!@"
	text_end

_ComeBackText::
	text " OK!"
	line "Rientra!"
	done

_BootedTMText::
	text "Estratta una MT."
	prompt

_BootedHMText::
	text "Estratta una MN."
	prompt

_ContainedMoveText::
	text "Contiene"
	line "@"
	text_ram wStringBuffer2
	text "."

	para "Vuoi insegnare"
	line "@"
	text_ram wStringBuffer2
	text_start
	cont "ad un #MON?"
	done

_TMHMNotCompatibleText::
	text_ram wStringBuffer2
	text " non"
	line "è compatibile con"
	cont "@"
	text_ram wStringBuffer1
	text "."

	para "Non può imparare"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_NoRoomTMHMText::
	text "Non hai posto per"
	line "un altro"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

_ReceivedTMHMText::
	text "Ricevi"
	line "@"
	text_ram wStringBuffer1
	text "!"
	prompt

_MysteryGiftCanceledText::
	text "Collegamento"
	line "annullato."
	prompt

_MysteryGiftCommErrorText::
	text "Errore di"
	line "comunicazione."
	prompt

_RetrieveMysteryGiftText::
	text "Devi ritirare DONO"
	line "al CENTRO #MON."
	prompt

_YourFriendIsNotReadyText::
	text "Il tuo amico non"
	line "è pronto."
	prompt

_MysteryGiftFiveADayText::
	text "Mi spiace, solo"
	line "5 DONI al giorno."
	prompt

_MysteryGiftOneADayText::
	text "Mi spiace, un solo"
	line "DONO a testa"
	cont "al giorno."
	prompt

_MysteryGiftSentText::
	text_ram wMysteryGiftPartnerName
	text " manda"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_MysteryGiftSentHomeText::
	text_ram wMysteryGiftPartnerName
	text " invia"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "a casa di @"
	text_ram wMysteryGiftPlayerName
	text "."
	prompt

_NameCardReceivedCardText::
	text "Ricevuta CARTA di"
	line "@"
	text_ram wMysteryGiftCardHolderName
	text "."
	prompt

_NameCardListedCardText::
	text_ram wMysteryGiftCardHolderName
	text "'s CARD was"
	line "listed as no.@"
	text_decimal wTextDecimalByte, 1, 2
	text "."
	prompt

_NameCardNotRegisteredCardText::
	text "The CARD was not"
	line "registered."
	prompt

_NameCardLinkCancelledText::
	text "Collegamento"
	line "annullato."
	prompt

_NameCardLinkCommErrorText::
	text "Errore di"
	line "comunicazione."
	prompt

_BadgeRequiredText::
	text "Mi spiace, serve"
	line "un'altra MEDAGLIA."
	prompt

_CantUseItemText::
	text "Non si può usare"
	line "qui."
	prompt

_UseCutText::
	text_ram wStringBuffer2
	text " usa"
	line "TAGLIO!"
	prompt

_CutNothingText::
	text "Non c'è nulla su"
	line "cui usare TAGLIO."
	prompt

_BlindingFlashText::
	text "Un forte FLASH"
	line "illumina l'area!@"
	text_promptbutton
	text_end

	text_end ; unreferenced

_UsedSurfText::
	text_ram wStringBuffer2
	text " usa"
	line "SURF!"
	done

_CantSurfText::
	text "Non puoi usare"
	line "SURF qui."
	prompt

_AlreadySurfingText::
	text "Stai già usando"
	line "SURF."
	prompt

_AskSurfText::
	text "L'acqua è calma."
	line "Vuoi usare SURF?"
	done

_UseWaterfallText::
	text_ram wStringBuffer2
	text " usa"
	line "CASCATA!"
	done

_HugeWaterfallText::
	text "Ma è una"
	line "cascata enorme!"
	done

_AskWaterfallText::
	text "Vuoi usare"
	line "CASCATA?"
	done

_UseDigText::
	text_ram wStringBuffer2
	text " usa"
	line "FOSSA!"
	done

_UseEscapeRopeText::
	text "<PLAYER> usa"
	line "FUNE DI FUGA."
	done

_CantUseDigText::
	text "Non si può usare"
	line "qui."
	done

_TeleportReturnText::
	text "Torna all'ultimo"
	line "CENTRO #MON."
	done

_CantUseTeleportText::
	text "Non si può usare"
	line "qui."
	done

_AlreadyUsingStrengthText::
	text "Un #MON sta già"
	line "usando FORZA."
	prompt

_UseStrengthText::
	text_ram wStringBuffer2
	text " usa"
	line "FORZA!"
	done

_MoveBoulderText::
	text_ram wStringBuffer1
	text " può"
	line "spostare i massi."
	prompt

_AskStrengthText::
	text "Forse un #MON"
	line "può spostarlo."

	para "Vuoi usare"
	line "FORZA?"
	done

_BouldersMoveText::
	text "Ora è possibile"
	line "spostare i massi!"
	done

_BouldersMayMoveText::
	text "Forse un #MON"
	line "è in grado di"
	cont "spostarlo."
	done

_UseWhirlpoolText::
	text_ram wStringBuffer2
	text " usa"
	line "MULINELLO!"
	prompt

_MayPassWhirlpoolText::
	text "È un insidioso"
	line "mulinello."

	para "Forse un #MON"
	line "può attraversarlo."
	done

_AskWhirlpoolText::
	text "C'è un mulinello"
	line "davanti a te."

	para "Vuoi usare"
	line "MULINELLO?"
	done

_UseHeadbuttText::
	text_ram wStringBuffer2
	text " usa"
	line "BOTTINTESTA!"
	prompt

_HeadbuttNothingText::
	text "Niente…"
	done

_AskHeadbuttText::
	text "Potrebbe esserci"
	line "un #MON "
	cont "nell'albero."

	para "Vuoi usare"
	line "BOTTINTESTA?"
	done

_UseRockSmashText::
	text_ram wStringBuffer2
	text " usa"
	line "SPACCAROCCIA!"
	prompt

_MaySmashText::
	text "Forse un #MON"
	line "è in grado di"
	cont "frantumarla."
	done

_AskRockSmashText::
	text "Questa roccia si"
	line "può frantumare."

	para "Vuoi usare"
	line "SPACCAROCCIA?"
	done

_RodBiteText::
	text "Ehi!"
	line "Ha abboccato!"
	prompt

_RodNothingText::
	text "Neanche una"
	line "vecchia ciabatta!"
	prompt

_UnusedNothingHereText::
	text "Sembra che non ci"
	line "sia niente qua."
	prompt

_CantGetOffBikeText::
	text "Non puoi scendere"
	line "qui!"
	done

_GotOnBikeText::
	text "<PLAYER> sale su"
	line "@"
	text_ram wStringBuffer2
	text "."
	done

_GotOffBikeText::
	text "<PLAYER> scende "
	line "da @"
	text_ram wStringBuffer2
	text "."
	done

_AskCutText::
	text "L'albero si può"
	line "tagliare (TAGLIO)."

	para "Vuoi usare TAGLIO?"
	done

_CanCutText::
	text "L'albero si può"
	line "tagliare (TAGLIO)."
	done

_FoundItemText::
	text "<PLAYER> trova"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_CantCarryItemText::
	text "Ma <PLAYER> non"
	line "può trasportare"
	cont "altri strumenti."
	done

_WhitedOutText::
	text "<PLAYER> non ha più"
	line "#MON utili!"

	para "<PLAYER> è fuori"
	line "combattimento!"
	done

_ItemfinderItemNearbyText::
	text "Bene! Il DETECTOR"
	line "ha rilevato uno"
	cont "strumento vicino."
	prompt

_ItemfinderNopeText::
	text "No! Il DETECTOR"
	line "non risponde."
	prompt

_PoisonFaintText::
	text_ram wStringBuffer3
	text_start
	line "è esausto!"
	prompt

_PoisonWhiteoutText::
	text "<PLAYER> non ha più"
	line "#MON utili!"

	para "<PLAYER> è fuori"
	line "combattimento!"
	prompt

_UseSweetScentText::
	text_ram wStringBuffer3
	text_start
	line "usa PROFUMINO!"
	done

_SweetScentNothingText::
	text "Pare che non ci"
	line "sia nulla qui…"
	done

_SquirtbottleNothingText::
	text "<PLAYER> spruzza"
	line "dell'acqua."

	para "Ma non accade"
	line "nulla…"
	done

_UseSacredAshText::
	text "I #MON di"
	line "<PLAYER> sono"
	cont "guariti!"
	done

_AnEggCantHoldAnItemText::
	text "Un UOVO non può"
	line "tenere strumenti."
	prompt

_PackNoItemText::
	text "Nessuno strumento."
	done

_AskThrowAwayText::
	text "Quantità da"
	line "buttare?"
	done

_AskQuantityThrowAwayText::
	text "Buttare @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

_ThrewAwayText::
	text "Hai buttato"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_OakThisIsntTheTimeText::
	text "OAK: <PLAYER>!"
	line "Questo non è il"
	cont "momento adatto!"
	prompt

_YouDontHaveAMonText::
	text "Non hai #MON!"
	prompt

_RegisteredItemText::
	text "Assegnato:"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_CantRegisterText::
	text "Strumento non"
	line "assegnabile."
	prompt

_AskItemMoveText::
	text "Dove vuoi"
	line "spostarlo?"
	done

_PackEmptyText::
	text_start
	done

_YouCantUseItInABattleText::
	text "Non si può usare"
	line "durante la lotta."
	prompt

_AreYouABoyOrAreYouAGirlText::
	text "Sei un bambino o"
	line "una bambina?"
	done

Text_BattleEffectActivate::
	text_ram wStringBuffer2
	text " di"
	line "<USER>"
	done

	text_end ; unreferenced

_BattleStatWentWayUpText::
	text_pause
	text "<SCROLL>sale di molto!"
	prompt

_BattleStatWentUpText::

	cont "sale!"
	prompt

Text_BattleFoeEffectActivate::
	text_ram wStringBuffer2
	text " di"
	line "<TARGET>"
	done

	text_end ; unreferenced

_BattleStatSharplyFellText::
	text_pause
	text "<SCROLL>cala di molto!"
	prompt

_BattleStatFellText::

	cont "cala!"
	prompt

Text_BattleUser::
	text "<USER>@"
	text_end

_BattleMadeWhirlwindText::
	text_start
	line "genera un turbine!"
	prompt

_BattleTookSunlightText::
	text_start
	line "assorbe la luce!"
	prompt

_BattleLoweredHeadText::
	text_start
	line "abbassa la testa!"
	prompt

_BattleGlowingText::
	text_start
	line "sta brillando!"
	prompt

_BattleFlewText::
	text_start
	line "è volato in alto!"
	prompt

_BattleDugText::
	text_start
	line "scava una fossa!"
	prompt

_ActorNameText::
	text "<USER>@"
	text_end

_UsedMove1Text::
	text_start
	line "usa @"
	text_end

_UsedMove2Text::
	text_start
	line "usa @"
	text_end

_UsedInsteadText::
	text "invece,"
	cont "@"
	text_end

_MoveNameText::
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_EndUsedMove1Text::
	text "!"
	done

_EndUsedMove2Text::
	text "!"
	done

_EndUsedMove3Text::
	text "!"
	done

_EndUsedMove4Text::
	text "!"
	done

_EndUsedMove5Text::
	text "!"
	done

Text_BreedHuh::
	text "Eh?"

	para "@"
	text_end

_BreedClearboxText::
	text_start
	done

_BreedEggHatchText::
	text_ram wStringBuffer1
	text " esce"
	line "dall'UOVO!@"
	sound_caught_mon
	text_promptbutton
	text_end

	text_end ; unreferenced

_BreedAskNicknameText::
	text "Vuoi dare un"
	line "soprannome a"
	cont "@"
	text_ram wStringBuffer1
	text "?"
	done

_LeftWithDayCareLadyText::
	text "È @"
	text_ram wBreedMon2Nickname
	text ","
	line "che hai lasciato"
	cont "con la PADRONA"
	cont "DELLA PENSIONE."
	done

_LeftWithDayCareManText::
	text "È @"
	text_ram wBreedMon1Nickname
	text ","
	line "che hai lasciato"
	cont "con il PADRONE"
	cont "DELLA PENSIONE."
	done

_BreedBrimmingWithEnergyText::
	text "È pieno di"
	line "energia."
	prompt

_BreedNoInterestText::
	text "Nessun interesse"
	line "per @"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedAppearsToCareForText::
	text "Sembra interessato"
	line "a @"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedFriendlyText::
	text "È amichevole con"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedShowsInterestText::
	text "Mostra interesse"
	line "per @"
	text_ram wStringBuffer1
	text "."
	prompt

_EmptyMailboxText::
	text "Qui non c'è alcun"
	line "MESSAGGIO."
	prompt

_MailClearedPutAwayText::
	text "Il MESSAGGIO "
	line "cancellato è stato"
	cont "messo via."
	prompt

_MailPackFullText::
	text "Lo ZAINO è pieno."
	prompt

_MailMessageLostText::
	text "Il contenuto del"
	line "MESSAGGIO andrà"
	cont "perso. Continui?"
	done

_MailAlreadyHoldingItemText::
	text "Tiene già uno"
	line "strumento."
	prompt

_MailEggText::
	text "Un UOVO non può"
	line "tenere un"
	cont "MESSAGGIO."
	prompt

_MailMovedFromBoxText::
	text "Tolto il MESSAGGIO"
	line "dal BOX MESSAGGI."
	prompt

_YesPromptText:: ; unreferenced
	text "Sì"
	prompt

_NoPromptText:: ; unreferenced
	text "No"
	prompt

_AnimationTypeText:: ; unreferenced
	text_decimal wcf64, 1, 3
	text " @"
	text_ram wStringBuffer1
	text_start
	line "Animation type @"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_MonNumberText:: ; unreferenced
	text "#MON number?"
	done

_WasSentToBillsPCText::
	text_ram wStringBuffer1
	text " inviato"
	line "al PC di BILL."
	prompt

_PCGottaHavePokemonText::
	text "Devi avere dei"
	line "#MON per"
	cont "chiamare!"
	prompt

_PCWhatText::
	text "Come?"
	done

_PCMonHoldingMailText::
	text "Un #MON ha"
	line "un MESSAGGIO."

	para "Rimuovi il"
	line "MESSAGGIO."
	prompt

_PCNoSingleMonText::
	text "Non hai neanche"
	line "un #MON!"
	prompt

_PCCantDepositLastMonText::
	text "Non puoi: è il tuo"
	line "ultimo #MON."
	prompt

_PCCantTakeText::
	text "Non puoi portare"
	line "altri #MON."
	prompt

_ContestCaughtMonText::
	text "Preso @"
	text_ram wStringBuffer1
	text "!"
	prompt

_ContestAskSwitchText::
	text "Spostare #MON?"
	done

_ContestAlreadyCaughtText::
	text "Hai già un"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_ContestJudging_FirstPlaceText::
	text "Vince la Gara"
	line "Pigliamosche@"
	text_pause
	text "…"

	para "@"
	text_ram wBugContestWinnerName
	text ","
	line "che ha catturato"
	cont "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_FirstPlaceScoreText::
	text_start

	para "Il vincitore ha"
	line "@"
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text " punti!"
	prompt

_ContestJudging_SecondPlaceText::
	text "Al secondo posto è"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "che ha preso"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_SecondPlaceScoreText::
	text_start

	para "Ha totalizzato"
	line "@"
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text " punti!"
	prompt

_ContestJudging_ThirdPlaceText::
	text "Al terzo posto c'è"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "che ha preso"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_ThirdPlaceScoreText::
	text_start

	para "Ha totalizzato"
	line "@"
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text " punti!"
	prompt

_MagikarpGuruMeasureText::
	text "Fammi misurare"
	line "quel MAGIKARP."

	para "… Misura"
	line "@"
	text_ram wStringBuffer1
	text " cm."
	prompt

_KarpGuruRecordText::
	text "RECORD ATTUALE:"
	
	para "@"
	text_ram wStringBuffer1
	text " cm preso da"
	line "@"
	text_ram wMagikarpRecordHoldersName
	text "."
	text_promptbutton
	text_end

	text_end ; unreferenced

_LuckyNumberMatchPartyText::
	text "Complimenti!"

	para "C'è corrispondenza"
	line "con il num. d'id."

	para "di @"
	text_ram wStringBuffer1
	text ","
	line "della tua squadra."
	prompt

_LuckyNumberMatchPCText::
	text "Complimenti!"

	para "C'è corrispondenza"
	line "con il num. d'id."

	para "di @"
	text_ram wStringBuffer1
	text_start
	line "nel tuo BOX PC."
	prompt

_CaughtAskNicknameText::
	text "Dai un soprannome"
	line "a @"
	text_ram wStringBuffer1
	text_start
	cont "che hai ricevuto?"
	done

_PokecenterPCCantUseText::
	text "Ehi! Devi avere un"
	line "#MON per"
	cont "usare questo!"
	prompt

_PlayersPCTurnOnText::
	text "<PLAYER> accende"
	line "il PC."
	prompt

_PlayersPCAskWhatDoText::
	text "Che cosa vuoi"
	line "fare?"
	done

_PlayersPCHowManyWithdrawText::
	text "Quantità da"
	line "ritirare?"
	done

_PlayersPCWithdrewItemsText::
	text "Operazione"
	line "completata."
	prompt

_PlayersPCNoRoomWithdrawText::
	text "Non hai spazio per"
	line "altri strumenti."
	prompt

_PlayersPCNoItemsText::
	text "Non hai strumenti"
	line "da depositare."
	prompt

_PlayersPCHowManyDepositText::
	text "Quantità da"
	line "depositare?"
	done

_PlayersPCDepositItemsText::
	text "Operazione"
	line "completata."
	prompt

_PlayersPCNoRoomDepositText::
	text "Non c'è spazio per"
	line "altri strumenti."
	prompt

_PokecenterPCTurnOnText::
	text "<PLAYER> accende"
	line "il PC."
	prompt

_PokecenterPCWhoseText::
	text "A quale PC"
	line "vuoi accedere?"
	done

_PokecenterBillsPCText::
	text "Accesso al"
	line "PC di BILL."

	para "Aperto il Sistema"
	line "Memoria #MON."
	prompt

_PokecenterPlayersPCText::
	text "Accesso al tuo PC."

	para "Aperto il Sistema"
	line "Memoria Strumenti."
	prompt

_PokecenterOaksPCText::
	text "Accesso al PC del"
	line "PROF.OAK."

	para "Aperto il Sistema"
	line "Valutaz. #DEX."
	prompt

_PokecenterPCOaksClosedText::
	text "…"
	line "Fine collegamento…"
	done

_OakPCText1::
	text "Vuoi far valutare"
	line "il tuo #DEX?"
	done

_OakPCText2::
	text "Attuale livello di"
	line "completamento del"
	cont "#DEX:"
	prompt

_OakPCText3::
	text "#MON visti: @"
	text_ram wStringBuffer3
	text_start
	line "#MON presi: @"
	text_ram wStringBuffer4
	text_start

	para "Valutazione del"
	line "PROF.OAK:"
	done

_OakRating01::
	text "Cerca i #MON"
	line "nelle aree erbose!"
	done

_OakRating02::
	text "Bene, vedo che hai"
	line "capito come usare"
	cont "le # BALL."
	done

_OakRating03::
	text "Stai facendo"
	line "progressi. Ma devi"

	para "fare ancora molta"
	line "strada."
	done

_OakRating04::
	text "Devi riempire il"
	line "#DEX."

	para "Cattura #MON"
	line "di diverso tipo!"
	done

_OakRating05::
	text "Ti impegni, si"
	line "vede."

	para "Il tuo #DEX sta"
	line "prendendo forma."
	done

_OakRating06::
	text "Certi #MON si"
	line "evolvono crescendo"

	para "di livello, altri"
	line "usando le PIETRE."
	done

_OakRating07::
	text "Hai un AMO?"
	line "Pescando puoi"

	para "catturare dei"
	line "#MON."
	done

_OakRating08::
	text "Eccellente! Ti"
	line "piacciono le"
	cont "collezioni, vero?"
	done

_OakRating09::
	text "Certi #MON si"
	line "fanno vedere solo"

	para "in determinate ore"
	line "del giorno."
	done

_OakRating10::
	text "Il tuo #DEX sta"
	line "facendo progressi:"
	cont "continua così!"
	done

_OakRating11::
	text "Bene, vedo che fai"
	line "evolvere i #MON"

	para "senza limitarti a"
	line "cacciarli."
	done

_OakRating12::
	text "Hai già incontrato"
	line "FRANZ? Le sue #"
	cont "BALL potrebbero"
	cont "servirti."
	done

_OakRating13::
	text "Ehi! Hai catturato"
	line "più #MON tu"

	para "che nell'ultima"
	line "ricerca #DEX!"
	done

_OakRating14::
	text "Scambi i tuoi"
	line "#MON?"

	para "È dura farcela"
	line "da soli!"
	done

_OakRating15::
	text "Hai raggiunto i"
	line "200! Il tuo"
	cont "#DEX è super!"
	done

_OakRating16::
	text "Hai catturato"
	line "tanti #MON!"
	cont "Stai dando un"

	para "grande aiuto"
	line "ai miei studi!"
	done

_OakRating17::
	text "Magnifico!"
	line "Vedo che conosci i"
	cont "#MON alla"
	cont "perfezione!"
	done

_OakRating18::
	text "Il tuo #DEX è"
	line "impressionante!"

	para "Potresti davvero"
	line "diventare"
	cont "professionista."
	done

_OakRating19::
	text "Ma questo è un"
	line "#DEX perfetto!"

	para "È sempre stato il"
	line "mio sogno."
	cont "Complimenti!"
	done

_OakPCText4::
	text "Collegamento con"
	line "il PC del PROF."
	cont "OAK terminato."
	done

_TrainerRankingExplanationText:: ; unreferenced
	text "Triple-theme"
	line "trainer ranking!"

	para "The SAVE file you"
	line "just sent might"
	cont "make the rankings!"

	para ""
	done

_TrainerRankingNoDataText:: ; unreferenced
	text "There is no"
	line "ranking data."

	para "Link to obtain"
	line "ranking data."

	para ""
	done

_MemoryGameYeahText::
	text ", sì!"
	done

_MemoryGameDarnText::
	text "Acc…"
	done

_StartMenuContestEndText::
	text "Vuoi terminare la"
	line "gara?"
	done

_ItemsTossOutHowManyText::
	text "Quantità da"
	line "buttare?"
	done

_ItemsThrowAwayText::
	text "Buttare @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

_ItemsDiscardedText::
	text "Operazione"
	line "completata."
	prompt

_ItemsTooImportantText::
	text "Troppo importante"
	line "per disfarsene!"
	prompt

_ItemsOakWarningText::
	text "OAK: <PLAYER>!"
	line "Questo non è il"
	cont "momento adatto!"
	done

_PokemonSwapItemText::
	text "Preso(a)"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "da @"
	text_ram wMonOrItemNameBuffer
	text " e"

	para "sostituito(a) con"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PokemonHoldItemText::
	text_ram wMonOrItemNameBuffer
	text " tiene"
	line "@"
	text_ram wStringBuffer2
	text " ora."
	prompt

_PokemonRemoveMailText::
	text "Prima devi"
	line "togliere il"
	cont "MESSAGGIO!"
	prompt

_PokemonNotHoldingText::
	text_ram wMonOrItemNameBuffer
	text " non"
	line "sta tenendo nulla."
	prompt

_ItemStorageFullText::
	text "Non hai più spazio"
	line "per gli strumenti."
	prompt

_PokemonTookItemText::
	text "Togli @"
	text_ram wStringBuffer1
	text_start
	line "a @"
	text_ram wMonOrItemNameBuffer
	text "."
	prompt

_PokemonAskSwapItemText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "tiene già"

	para "@"
	text_ram wStringBuffer1
	text "."
	line "Sostituire?"
	done

_ItemCantHeldText::
	text "Questo strumento"
	line "non si può tenere."
	prompt

_MailLoseMessageText::
	text "Il MESSAGGIO per-"
	line "derà il contenuto."
	cont "Proseguire?"
	done

_MailDetachedText::
	text "Preso MESSAGGIO da"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_MailNoSpaceText::
	text "Non c'è spazio per"
	line "spostare il"
	cont "MESSAGGIO."
	prompt

_MailAskSendToPCText::
	text "Vuoi spedire il"
	line "MESSAGGIO"
	cont "al tuo PC?"
	done

_MailboxFullText::
	text "Il BOX MESSAGGI"
	line "del PC è pieno."
	prompt

_MailSentToPCText::
	text "MESSAGGIO spedito"
	line "al tuo PC."
	prompt

_PokemonNotEnoughHPText::
	text "PS insufficienti!"
	prompt

_MayRegisterItemText::
	text "Puoi assegnare uno"
	line "strumento dello"
	cont "ZAINO a SELECT."
	done

_OakText1::
	text "Ciao! Scusa se"
	line "ti ho fatto"
	cont "attendere."

	para "Questo è il mondo"
	line "dei #MON!"

	para "Mi chiamo OAK."

	para "Ma per tutti sono"
	line "PROF.#MON."
	prompt

_OakText2::
	text "Questo mondo è"
	line "abitato da"
	cont "creature che"
	cont "chiamiamo #MON.@"
	text_end

_OakText3::
	text_promptbutton
	text_end

	text_end ; unreferenced

_OakText4::
	text "I #MON e gli"
	line "umani convivono"

	para "aiutandosi a"
	line "vicenda."

	para "Alcuni giocano con"
	line "i #MON, altri"
	cont "li fanno lottare."
	prompt

_OakText5::
	text "Ma sappiamo ancora"
	line "troppo poco sui"
	cont "#MON."

	para "Molti misteri"
	line "devono ancora"
	cont "essere svelati."

	para "Per questo studio"
	line "i #MON tutti"
	cont "i giorni."
	prompt
