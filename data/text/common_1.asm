_FruitBearingTreeText::
	text "È una pianta da"
	line "frutta."
	done

_HeyItsFruitText::
	text "Ehi, ma è"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_ObtainedFruitText::
	text "Trovata "
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_FruitPackIsFullText::
	text "Ma il tuo ZAINO"
	line "è pieno…"
	done

_NothingHereText::
	text "Qui non c'è"
	line "nulla…"
	done

_WhichApricornText::
	text "Quale GHICOCCA"
	line "devo usare?"
	done

_HowManyShouldIMakeText::
	text "Quante ne vuoi?"
	done

_RecoveredSomeHPText::
	text_ram wStringBuffer1
	text_start
	line "recupera @"
	text_decimal wCurHPAnimDeltaHP, 2, 3
	text "PS!"
	done

_CuredOfPoisonText::
	text_ram wStringBuffer1
	text_start
	line "è disintossicato."
	done

_RidOfParalysisText::
	text "Finita paralisi di"
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_BurnWasHealedText::
	text "Finita scottatura"
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_WasDefrostedText::
	text_ram wStringBuffer1
	text_start
	line "è scongelato."
	done

_WokeUpText::
	text_ram wStringBuffer1
	text_start
	line "si è svegliato."
	done

_HealthReturnedText::
	text_ram wStringBuffer1
	text_start
	line "è in piena forma."
	done

_RevitalizedText::
	text_ram wStringBuffer1
	text_start
	line "è rivitalizzato."
	done

_GrewToLevelText::
	text_ram wStringBuffer1
	text_start
	line "sale al L. @"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79 ; plays SFX_DEX_FANFARE_50_79, identical to SFX_LEVEL_UP
	text_promptbutton
	text_end

	text_end ; unreferenced

_CameToItsSensesText::
	text_ram wStringBuffer1
	text_start
	line "è tornato in sé."
	done

_EnterNewPasscodeText::
	text "Inserisci un"
	line "numero di 4 cifre."
	done

_ConfirmPasscodeText::
	text "Inserisci di nuovo"
	line "lo stesso numero."
	done

_PasscodesNotSameText::
	text "Il numero è"
	line "diverso dal"
	cont "precedente."
	done

_PasscodeSetText::
	text "Your PASSCODE has"
	line "been set."

	para "Enter this number"
	line "next time to open"
	cont "the CARD FOLDER."

	para ""
	done

_FourZerosInvalidText::
	text "0000 is invalid!"

	para ""
	done

_EnterPasscodeText::
	text "Enter the CARD"
	next "FOLDER PASSCODE."
	done

_IncorrectPasscodeText::
	text "Incorrect"
	line "PASSCODE!"

	para ""
	done

_CardFolderOpenText::
	text "CARD FOLDER open.@"
	text_end

_OakTimeWokeUpText::
	text "<……><……><……><……><……><……>"
	line "<……><……><……><……><……><……>"

	para "Zzz…… Che c'è?"
	line "Mi hai svegliato!"

	para "Puoi controllare"
	line "l'orologio?"
	prompt

_OakTimeWhatTimeIsItText::
	text "Che ora è?"
	done

_OakTimeWhatHoursText::
	text "What?@"
	text_end

_OakTimeHoursQuestionMarkText::
	text "?"
	done

_OakTimeHowManyMinutesText::
	text "Quanti minuti?"
	done

_OakTimeWhoaMinutesText::
	text "Whoa!@"
	text_end

_OakTimeMinutesQuestionMarkText::
	text "?"
	done

_OakTimeOversleptText::
	text "! "
	line "Ho dormito troppo!"
	done

_OakTimeYikesText::
	text "!"
	line "Ma allora ho"
	cont "dormito troppo!"
	done

_OakTimeSoDarkText::
	text "…Ah!"
	line "Ecco perché"
	cont "è così buio!"
	done

_OakTimeWhatDayIsItText::
	text "Che giorno è?"
	done

_OakTimeIsItText::
	text ", vero?"
	done

; Mobile Adapter

_ThereIsNothingConnectedText:: ; unreferenced
	text "There is nothing"
	line "connected."
	done

_CheckCellPhoneAdapterText:: ; unreferenced
	text "Check cell phone"
	line "adapter."
	done

_CheckCDMAAdapterText:: ; unreferenced
	text "Check CDMA"
	line "adapter."
	done

_CheckDOCOMOPHSAdapterText:: ; unreferenced
	text "Check DOCOMO PHS"
	line "adapter."
	done

_CheckDDIPHSAdapterText:: ; unreferenced
	text "Check DDI PHS"
	line "adapter."
	done

_CheckMobileAdapterText:: ; unreferenced
	text "Check unlimited"
	line "battle mobile"
	cont "adapter."
	done

; Mobile Adapter End

_ThePasswordIsText:: ; unreferenced
	text "La password è:"
	line ""
	done

_IsThisOKText:: ; unreferenced
	text "È ok?"
	done

_EnterTheIDNoText:: ; unreferenced
	text "Inserisci il"
	line "Num. d'Identità."
	done

_EnterTheAmountText:: ; unreferenced
	text "Inserisci la"
	line "somma."
	done

_NothingToChooseText::
	text "Non c'è nulla tra"
	line "cui scegliere."
	prompt

_WhichSidePutOnText::
	text "Da che lato?"
	done

_WhichSidePutAwayText::
	text "Quale lato vuoi"
	line "togliere?"
	done

_PutAwayTheDecoText::
	text "Hai tolto"
	line "@"
	text_ram wStringBuffer3
	text "."
	prompt

_NothingToPutAwayText::
	text "Non c'è nulla da"
	line "togliere."
	prompt

_SetUpTheDecoText::
	text "Hai sistemato"
	line "@"
	text_ram wStringBuffer3
	text "."
	prompt

_PutAwayAndSetUpText::
	text "Togli"
	line "@"
	text_ram wStringBuffer3
	text_start

	para "e sistemi"
	line "@"
	text_ram wStringBuffer4
	text "."
	prompt

_AlreadySetUpText::
	text "Questo articolo"
	line "è già sistemato."
	prompt

_LookTownMapText::
	text "È la MAPPA CITTÀ."
	done

_LookPikachuPosterText::
	text "È il poster di un"
	line "simpatico PIKACHU."
	done

_LookClefairyPosterText::
	text "È il poster di un"
	line "dolce CLEFAIRY."
	done

_LookJigglypuffPosterText::
	text "È il poster di un"
	line "dolce JIGGLYPUFF."
	done

_LookAdorableDecoText::
	text "Che bello! È"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_LookGiantDecoText::
	text "Una megabambola,"
	line "dolce e soffice."
	done

_MomHiHowAreYouText::
	text "Ciao, <PLAYER>!"
	line "Come va?"
	prompt

_MomFoundAnItemText::
	text "T'ho comprato un"
	line "utile strumento:"
	prompt

_MomBoughtWithYourMoneyText::
	text "ho usato i tuoi"
	line "soldi, ho fatto"
	cont "bene?"
	prompt

_MomItsInPCText::
	text "È nel tuo PC."
	line "Ti piacerà!"
	done

_MomFoundADollText::
	text "Facendo spese ho"
	line "trovato una"
	cont "bella bambola:"
	prompt

_MomItsInYourRoomText::
	text "È in camera tua,"
	line "ti piacerà!"
	done

_MonWasSentToText::
	text_ram wPlayerTrademonSpeciesName
	text_start
	line "inviato a @"
	text_ram wOTTrademonSenderName
	text "."
	done

_MonNameSentToText::
	text_start
	done

_BidsFarewellToMonText::
	text_ram wOTTrademonSenderName
	text " dice"
	line "addio a"
	done

_MonNameBidsFarewellText::
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TakeGoodCareOfMonText::
	text "Abbi cura di"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_ForYourMonSendsText::
	text "Per il @"
	text_ram wPlayerTrademonSpeciesName
	text_start
	line "di @"
	text_ram wPlayerTrademonSenderName
	text ","
	done

_OTSendsText::
	text_ram wOTTrademonSenderName
	text " invia"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_WillTradeText::
	text_ram wOTTrademonSenderName
	text " scambia"
	line "@"
	text_ram wOTTrademonSpeciesName
	text_end

	text_end ; unreferenced

_ForYourMonWillTradeText::
	text "per @"
	text_ram wPlayerTrademonSpeciesName
	text_start
	line "di @"
	text_ram wPlayerTrademonSenderName
	text "."
	done

_MobilePlayerWillTradeMonText::
	text_ram wPlayerTrademonSenderName
	text " scambia"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text_end

	text_end ; unreferenced

_MobileForPartnersMonText::
	text "per @"
	text_ram wOTTrademonSpeciesName
	text_start
	line "di @"
	text_ram wOTTrademonSenderName
	text "."
	done

_MobilePlayersMonTradeText::
	text_ram wPlayerTrademonSenderName
	text " scambia"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text "…"
	done

_MobileTakeGoodCareOfMonText::
	text "Abbi cura di"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_MobilePlayersMonTrade2Text::
	text_ram wPlayerTrademonSenderName
	text " scambia"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text "…"
	done

_MobileTakeGoodCareOfText::
	text "Abbi cura di"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_MobileTradeCameBackText::
	text_ram wOTTrademonSpeciesName
	text " è"
	line "tornato!"
	done

; Oak's Pokémon Talk

_OPT_IntroText1::
	text_start
	line "LORI: Il #MON"
	done

_OPT_IntroText2::
	text_start
	line "TALK del PROF.OAK!"
	done

_OPT_IntroText3::
	text_start
	line "Con me, LORI!"
	done

_OPT_OakText1::
	text_start
	line "OAK: @"
	text_ram wMonOrItemNameBuffer
	text_end

	text_end ; unreferenced

_OPT_OakText2::
	text_start
	line "è nei pressi del"
	done

_OPT_OakText3::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_OPT_MaryText1::
	text_start
	line "LORI: @"
	text_ram wStringBuffer1
	text_end
	
	text_end ; unused	

_OPT_SweetAdorablyText::
	text_start
	line "è adorabilmente"
	done

_OPT_WigglySlicklyText::
	text_start
	line "è furbescamente"
	done

_OPT_AptlyNamedText::
	text_start
	line "è ben fatto e"
	done

_OPT_UndeniablyKindOfText::
	text_start
	line "è indubbiamente"
	done

_OPT_UnbearablyText::
	text_start
	line "è davvero"
	done

_OPT_WowImpressivelyText::
	text_start
	line "è esageratamente"
	done

_OPT_AlmostPoisonouslyText::
	text_start
	line "è assolutamente"
	done

_OPT_SensuallyText::
	text_start
	line "è terribilmente"
	done

_OPT_MischievouslyText::
	text_start
	line "è maliziosamente"
	done

_OPT_TopicallyText::
	text_start
	line "è precisamente"
	done

_OPT_AddictivelyText::
	text_start
	line "è proprio"
	done

_OPT_LooksInWaterText::
	text_start
	line "nell'acqua è"
	done

_OPT_EvolutionMustBeText::
	text_start
	line "ha un'evoluzione"
	done

_OPT_ProvocativelyText::
	text_start
	line "è così"
	done

_OPT_FlippedOutText::
	text_start
	line "è così agitato e"
	done

_OPT_HeartMeltinglyText::
	text_start
	line "è superdolcemente"
	done

_OPT_CuteText::
	text_start
	line "carino."
	done

_OPT_WeirdText::
	text_start
	line "strano."
	done

_OPT_PleasantText::
	text_start
	line "piacevole."
	done

_OPT_BoldSortOfText::
	text_start
	line "sfrontato."
	done

_OPT_FrighteningText::
	text_start
	line "spaventoso."
	done

_OPT_SuaveDebonairText::
	text_start
	line "spensierato!"
	done

_OPT_PowerfulText::
	text_start
	line "potente."
	done

_OPT_ExcitingText::
	text_start
	line "interessante."
	done

_OPT_GroovyText::
	text_start
	line "fantastico!"
	done

_OPT_InspiringText::
	text_start
	line "esaltante."
	done

_OPT_FriendlyText::
	text_start
	line "amichevole."
	done

_OPT_HotHotHotText::
	text_start
	line "travolgente!"
	done

_OPT_StimulatingText::
	text_start
	line "entusiasmante."
	done

_OPT_GuardedText::
	text_start
	line "prudente."
	done

_OPT_LovelyText::
	text_start
	line "amorevole."
	done

_OPT_SpeedyText::
	text_start
	line "veloce."
	done

_OPT_PokemonChannelText::
	text "#MON"
	done

_PokedexShowText::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unreferenced

; Pokémon Music Channel / Pokémusic

_BenIntroText1::
	text_start
	line "TIMMI: #MON"
	line ""
	done

_BenIntroText2::
	text_start
	line "MUSIC!"
	done

_BenIntroText3::
	text_start
	line "Sono il DJ TIMMI!"
	done

_FernIntroText1::
	text_start
	line "MITRI: #MUSIC!"
	done

_FernIntroText2::
	text_start
	line "Con il DJ MITRI!"
	done

_BenFernText1::
	text_start
	line "Oggi è @"
	text_today
	text ","
	done

_BenFernText2A::
	text_start
	line "ascoltiamoci una"
	done

_BenFernText2B::
	text_start
	line "ci vuole una bella"
	done

_BenFernText3A::
	text_start
	line "Marcia #MON!"
	done

_BenFernText3B::
	text_start
	line "# Ninnananna!"
	done

; Lucky Channel

_LC_Text1::
	text_start
	line "RINO: Ciaaao! Come"
	done

_LC_Text2::
	text_start
	line "ve la passate?"
	done

_LC_Text3::
	text_start
	line "Chi è pimpante o"
	done

_LC_Text4::
	text_start
	line "abbacchiato, non"
	done

_LC_Text5::
	text_start
	line "perde lo SHOW del"
	done

_LC_Text6::
	text_start
	line "NUMERO FORTUNATO!"
	done

_LC_Text7::
	text_start
	line "Il Num. di questa"
	done

_LC_Text8::
	text_start
	line "settimana è @"
	text_pause
	text_ram wStringBuffer1
	text "!"
	done

_LC_Text9::
	text_start
	line "Ripeto!"
	done

_LC_Text10::
	text_start
	line "Corrisponde? Corri"
	done

_LC_Text11::
	text_start
	line "alla TORRE RADIO!"
	done

_LC_DragText1::
	text_start
	line "…Sono stanco"
	done

_LC_DragText2::
	text_start
	line "di ripeterlo…"
	done

; Places and People

_PnP_Text1::
	text_start
	line "POSTI E PERSONE!"
	done

_PnP_Text2::
	text_start
	line "Presentato da"
	done

_PnP_Text3::
	text_start
	line "me, DJ SILVIA!"
	done

_PnP_Text4::
	text_start
	line "@"
	text_ram wStringBuffer2
	text " @"
	text_ram wStringBuffer1
	text_end

	text_end ; unreferenced

_PnP_CuteText::
	text_start
	line "è elegante."
	done

_PnP_LazyText::
	text_start
	line "m'annoia un po'!"
	done

_PnP_HappyText::
	text_start
	line "mette allegria."
	done

_PnP_NoisyText::
	text_start
	line "è assordante."
	done

_PnP_PrecociousText::
	text_start
	line "è esaltante."
	done

_PnP_BoldText::
	text_start
	line "è divertente."
	done

_PnP_PickyText::
	text_start
	line "è particolare."
	done

_PnP_SortOfOKText::
	text_start
	line "è ok."
	done

_PnP_SoSoText::
	text_start
	line "è così così."
	done

_PnP_GreatText::
	text_start
	line "è grande!"
	done

_PnP_MyTypeText::
	text_start
	line "fa proprio per me!"
	done

_PnP_CoolText::
	text_start
	line "è forte, vero?"
	done

_PnP_InspiringText::
	text_start
	line "è esaltante!"
	done

_PnP_WeirdText::
	text_start
	line "è interessante."
	done

_PnP_RightForMeText::
	text_start
	line "fa proprio per me."
	done

_PnP_OddText::
	text_start
	line "è originale!"
	done

_PnP_Text5::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unreferenced

_RocketRadioText1::
	text_start
	line "… … Qui è"
	done

_RocketRadioText2::
	text_start
	line "TEAM ROCKET!"
	done

_RocketRadioText3::
	text_start
	line "Dopo tre anni"
	done

_RocketRadioText4::
	text_start
	line "di preparazione,"
	done

_RocketRadioText5::
	text_start
	line "siamo risorti"
	done

_RocketRadioText6::
	text_start
	line "dalla cenere!"
	done

_RocketRadioText7::
	text_start
	line "GIOVANNI! @"
	text_pause
	text "Ci"
	done

_RocketRadioText8::
	text_start
	line "senti?@"
	text_pause
	text " Ci siamo!"
	done

_RocketRadioText9::
	text_start
	line "@"
	text_pause
	text "Dov'è il capo?"
	done

_RocketRadioText10::
	text_start
	line "@"
	text_pause
	text "Ci ascolterà?"
	done

_BuenaRadioText1::
	text_start
	line "BUENA: Ciao!"
	done

_BuenaRadioText2::
	text_start
	line "La password di"
	done

_BuenaRadioText3::
	text_start
	line "oggi è…"
	done

_BuenaRadioText4::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

_BuenaRadioText5::
	text_start
	line "Venite alla TORRE"
	done

_BuenaRadioText6::
	text_start
	line "RADIO di"
	done

_BuenaRadioText7::
	text_start
	line "FIORDOROPOLI!"
	done

_BuenaRadioMidnightText1::
	text_start
	line "BUENA: Ehi…"
	done

_BuenaRadioMidnightText2::
	text_start
	line "È mezzanotte!"
	done

_BuenaRadioMidnightText3::
	text_start
	line "Devo chiudere!"
	done

_BuenaRadioMidnightText4::
	text_start
	line "Grazie per essere"
	done

_BuenaRadioMidnightText5::
	text_start
	line "rimasti fino alla"
	done

_BuenaRadioMidnightText6::
	text_start
	line "fine! Ora andate a"
	done

_BuenaRadioMidnightText7::
	text_start
	line "nanna però! Ciao"
	done

_BuenaRadioMidnightText8::
	text_start
	line "dalla DJ BUENA!"
	done

_BuenaRadioMidnightText9::
	text_start
	text "Ora devo andare!"
	done

_BuenaRadioMidnightText10::
	text_start
	text "…"
	done

_BuenaOffTheAirText::
	text_start
	line ""
	done

_EnemyWithdrewText::
	text "<ENEMY>"
	line "ritira"
	cont "@"
	text_ram wEnemyMonNickname
	text "!"
	prompt

_EnemyUsedOnText::
	text "<ENEMY>"
	line "usa @"
	text_ram wMonOrItemNameBuffer
	text_start
	cont "su @"
	text_ram wEnemyMonNickname
	text "!"
	prompt

_ThatCantBeUsedRightNowText:: ; unreferenced
	text "Non si può usare"
	line "adesso."
	prompt

_ThatItemCantBePutInThePackText:: ; unreferenced
	text "Non puoi mettere"
	line "questo strumento"
	cont "nello ZAINO."
	done

_TheItemWasPutInThePackText:: ; unreferenced
	text "Strumento"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "messo nello ZAINO."
	done

_RemainingTimeText:: ; unreferenced
	text "Tempo restante"
	done

_YourMonsHPWasHealedText:: ; unreferenced
	text "Il #MON ha"
	line "recuperato i PS."
	prompt

_WarpingText:: ; unreferenced
	text "Teletrasferimento…"
	done

_ChangeWhichNumberText:: ; unreferenced
	text "Che numero"
	line "vuoi cambiare?"
	done

_WillYouPlayWithMonText:: ; unreferenced
	text "Vuoi giocare con"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

_YouNeedTwoMonForBreedingText:: ; unreferenced
	text "Servono due #-"
	line "MON per procreare."
	prompt

_BreedingIsNotPossibleText:: ; unreferenced
	text "Procreazione"
	line "impossibile."
	prompt

_CompatibilityShouldTheyBreedText:: ; unreferenced
	text "La compatibilità è"
	line "@"
	text_decimal wBreedingCompatibility, 1, 3
	text "."
	cont "Vuoi farli"
	cont "procreare?"
	done

_ThereIsNoEggText:: ; unreferenced
	text "Nessun UOVO."
	line ""
	prompt

_ItsGoingToHatchText:: ; unreferenced
	text "Sta per"
	line "schiudersi!"
	prompt

_TestEventText:: ; unreferenced
	text "Test"
	line "@"
	text_decimal wStringBuffer2, 1, 2
	text "?"
	done

_StartText:: ; unreferenced
	text "Partenza!"
	done

_EndText:: ; unreferenced
	text "Fine!"
	done

_ForABoyText:: ; unreferenced
	text "Per un maschio!"
	done

_ForAGirlText:: ; unreferenced
	text "Per una bambina!"
	done

_DoesntConcernABoyText:: ; unreferenced
	text "Questo non"
	line "riguarda i maschi!"
	done

_TheBoxIsFullText:: ; unreferenced
	text "Il BOX è pieno."
	done

; Mobile Adapter

_NewCardArrivedText::
	text "A new CARD arrived"
	line "from @"
	text_ram wStringBuffer2
	text "."
	done

_PutCardInCardFolderText::
	text "Put this CARD in"
	line "the CARD FOLDER?"
	done

_CardWasListedText::
	text_ram wStringBuffer2
	text "'s CARD was"
	line "listed as no.@"
	text_decimal wStringBuffer1, 1, 2
	text "."
	prompt

_StartingLinkText::
	text "Starting link."
	done

_LinkTerminatedText::
	text "Link terminated."
	done

_ClosingLinkText::
	text "Closing link."
	done

_ClearTimeLimitText:: ; unreferenced
	text "Clear the time"
	line "limit?"
	done

_TimeLimitWasClearedText:: ; unreferenced
	text "The time limit was"
	line "cleared."
	done

_PickErrorPacketText:: ; unreferenced
	text "Pick which packet"
	line "as an error?"
	done

_TradingMonForOTMonText::
	text "Scambi @"
	text_ram wStringBuffer2
	text_start
	line "per @"
	text_ram wStringBuffer1
	text "…"
	done

; Mobile Adapter End

_ObtainedTheVoltorbBadgeText:: ; unreferenced
	text "Ottenuta"
	line "MEDAGLIA VOLTORB."
	done

_AskFloorElevatorText::
	text "A che piano?"
	done

_BugCatchingContestTimeUpText::
	text "ANNUNCIATORE: BIP!"

	para "Tempo scaduto!"
	done

_BugCatchingContestIsOverText::
	text "ANNUNCIATORE: La"
	line "Gara è finita."
	done

_RepelWoreOffText::
	text "Finito l'effetto"
	line "del REPELLENTE."
	done

_PlayerFoundItemText::
	text "<PLAYER> trova"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

_ButNoSpaceText::
	text "Ma <PLAYER> non"
	line "ha più spazio…"
	done

_JustSawSomeRareMonText::
	text "Ho visto un raro"
	line "@"
	text_ram wStringBuffer1
	text " a"
	cont "@"
	text_ram wStringBuffer2
	text "."

	para "Se vedo un altro"
	line "#MON raro ti"
	cont "chiamo, ok?"
	prompt

_SavingRecordText::
	text "SALVAT. RECORD…"
	line "NON SPEGNERE!"
	done

_ReceiveItemText::
	text_ram wPlayerName
	text " riceve"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	sound_item
	text_promptbutton
	text_end

	text_end ; unreferenced

_NoCoinsText::
	text "Non hai gettoni."
	prompt

_NoCoinCaseText::
	text "Ti manca il"
	line "SALVADANAIO."
	prompt

_NPCTradeCableText::
	text "Ok, connetti il"
	line "Cavo Game Link."
	prompt

Text_NPCTraded::
	text "<PLAYER> scambia"
	line "@"
	text_ram wStringBuffer2
	text " con"
	cont "@"
	text_ram wMonOrItemNameBuffer
	text ".@"
	text_end

_NPCTradeFanfareText::
	sound_dex_fanfare_80_109
	text_pause
	text_end

	text_end ; unreferenced

_NPCTradeIntroText1::
	text "Cerco dei #MON."
	line "Hai @"
	text_ram wStringBuffer1
	text "?"

	para "Vuoi scambiarlo"
	line "con @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText1::
	text "Non vuoi fare lo"
	line "scambio? Peccato…"
	done

_NPCTradeWrongText1::
	text "Ehi, ma quello non"
	line "è @"
	text_ram wStringBuffer1
	text "."
	cont "Che delusione…"
	done

_NPCTradeCompleteText1::
	text "Grande! Ora ho un"
	line "@"
	text_ram wStringBuffer1
	text "!"
	cont "Grazie!"
	done

_NPCTradeAfterText1::
	text "Ciao, come sta il"
	line "mio @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeIntroText2::
	text "Ciao, sto cercando"
	line "un #MON."

	para "Se per caso hai"
	line "@"
	text_ram wStringBuffer1
	text ", lo"

	para "scambieresti con"
	line "il mio @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText2::
	text "Non ce l'hai"
	line "neanche tu?"

	para "Che peccato…"
	done

_NPCTradeWrongText2::
	text "Non hai"
	line "@"
	text_ram wStringBuffer1
	text "? È"
	cont "un peccato."
	done

_NPCTradeCompleteText2::
	text "Grande! Grazie!"

	para "Finalmente ho"
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_NPCTradeAfterText2::
	text "Ehi, @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "che mi hai dato è"
	cont "davvero grande!"
	done

_NPCTradeIntroText3::
	text_ram wMonOrItemNameBuffer
	text " è"
	line "carino ma non ce"

	para "l'ho. Tu hai"
	line "@"
	text_ram wStringBuffer1
	text "?"

	para "Lo scambi con il"
	line "mio @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText3::
	text "Non lo scambi? Che"
	line "disdetta…"
	done

_NPCTradeWrongText3::
	text "Quello non è"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "Quando lo catturi"
	line "lo scambiamo, ok?"
	done

_NPCTradeCompleteText3::
	text "Ti ringrazio! Ho"
	line "sempre sognato un"
	cont "@"
	text_ram wMonOrItemNameBuffer
	text "!"
	done

_NPCTradeAfterText3::
	text "Come sta il"
	line "@"
	text_ram wStringBuffer2
	text " che"
	cont "ti ho dato?"

	para "Il tuo @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "è così carino!"
	done

_NPCTradeCompleteText4::
	text "Che è successo?"
	done

_NPCTradeAfterText4::
	text "Gli scambi sono"
	line "complicati…"

	para "Ho ancora molto da"
	line "imparare."
	done

_MomLeavingText1::
	text "Che carino questo"
	line "#MON!"

	para "Dove l'hai"
	line "trovato?"

	para "…"

	para "Stai partendo"
	line "all'avventura…"

	para "E va bene! Voglio"
	line "aiutarti."

	para "Ma come posso"
	line "esserti d'aiuto?"

	para "Potrei risparmiare"
	line "dei soldi per te."

	para "Per i lunghi"
	line "viaggi il denaro"
	cont "è importante."

	para "Vuoi che ne"
	line "risparmi un po'"
	cont "per te?"
	done

_MomLeavingText2::
	text "Va bene, penserò"
	line "io ai tuoi soldi."

	para "<……><……><……>"
	prompt

_MomLeavingText3::
	text "Sii prudente."

	para "I #MON sono"
	line "tuoi amici. Dovete"
	cont "lavorare in"
	cont "squadra."

	para "Ora vai!"
	done

_MomIsThisAboutYourMoneyText::
	text "Ciao, eccoti a"
	line "casa! Vedo che ti"
	cont "stai impegnando."

	para "Ho tenuto pulita"
	line "la tua stanza."

	para "Sei qui per i"
	line "tuoi soldi?"
	done

_MomBankWhatDoYouWantToDoText::
	text "Che cosa vuoi"
	line "fare?"
	done

_MomStoreMoneyText::
	text "Quanto vuoi"
	line "mettere da parte?"
	done

_MomTakeMoneyText::
	text "Quanto vuoi"
	line "prendere?"
	done

_MomSaveMoneyText::
	text "Vuoi risparmiare"
	line "dei soldi?"
	done

_MomHaventSavedThatMuchText::
	text "Non hai così tanti"
	line "risparmi."
	prompt

_MomNotEnoughRoomInWalletText::
	text "Non puoi prendere"
	line "così tanto."
	prompt

_MomInsufficientFundsInWalletText::
	text "Non hai tutti"
	line "quei soldi."
	prompt

_MomNotEnoughRoomInBankText::
	text "Non puoi lasciare"
	line "tutti quei soldi."
	prompt

_MomStartSavingMoneyText::
	text "Ok, risparmierò"
	line "i tuoi soldi!"

	para "<PLAYER>, non"
	line "mollare!"
	done

_MomStoredMoneyText::
	text "I tuoi soldi sono"
	line "al sicuro. Vai!"
	done

_MomTakenMoneyText::
	text "<PLAYER>, non"
	line "ti arrendere!"
	done

_MomJustDoWhatYouCanText::
	text "Fai del tuo"
	line "meglio!"
	done

_DaycareDummyText::
	text_start
	done

_DayCareManIntroText::
	text "Sono il PADRONE"
	line "della PENSIONE."
	cont "Vuoi che mi prenda"
	cont "cura di uno dei"
	cont "tuoi #MON?"
	done

_DayCareManIntroEggText::
	text "Sono il PADRONE"
	line "della PENSIONE."
	cont "Conosci la storia"
	cont "delle UOVA?"

	para "Stavo accudendo i"
	line "#MON con"
	cont "mia moglie."

	para "E cosa troviamo?"
	line "Un UOVO!"

	para "È incredibile,"
	line "vero?"

	para "Vuoi che accudisca"
	line "un tuo #MON?"
	done

_DayCareLadyIntroText::
	text "Sono la PADRONA"
	line "della PENSIONE."

	para "Vuoi che accudisca"
	line "un tuo #MON?"
	done

_DayCareLadyIntroEggText::
	text "Sono la PADRONA"
	line "della PENSIONE."
	cont "Conosci la storia"
	cont "delle UOVA?"

	para "Stavo accudendo i"
	line "#MON con"
	cont "mio marito."

	para "E cosa troviamo?"
	line "Un UOVO!"

	para "È incredibile,"
	line "vero?"

	para "Vuoi che accudisca"
	line "un tuo #MON?"
	done

_WhatShouldIRaiseText::
	text "Quale vuoi che"
	line "accudisca?"
	prompt

_OnlyOneMonText::
	text "Ma hai un solo"
	line "#MON!"
	prompt

_CantAcceptEggText::
	text "Scusa ma non posso"
	line "accettare un UOVO."
	prompt

_RemoveMailText::
	text "Torna dopo aver"
	line "tolto il"
	cont "MESSAGGIO."
	prompt

_LastHealthyMonText::
	text "Se mi dai questo,"
	line "poi come fai a"
	cont "lottare?"
	prompt

_IllRaiseYourMonText::
	text "Ok. Accudirò il"
	line "tuo @"
	text_ram wStringBuffer1
	text "."
	prompt

_ComeBackLaterText::
	text "Ritorna più tardi."
	done

_AreWeGeniusesText::
	text "Siamo dei geni!"
	line "Vuoi vedere il tuo"
	cont "@"
	text_ram wStringBuffer1
	text "?"
	done

_YourMonHasGrownText::
	text "Il tuo @"
	text_ram wStringBuffer1
	text_start
	line "è cresciuto bene!"

	para "Il suo livello è"
	line "salito di @"
	text_decimal wStringBuffer2 + 1, 1, 3
	text "."

	para "Se vuoi il tuo"
	line "#MON indietro"
	cont "ti costerà ¥@"
	text_decimal wStringBuffer2 + 2, 3, 4
	text "."
	done

_PerfectHeresYourMonText::
	text "Perfetto! Ecco il"
	line "tuo #MON."
	prompt

_GotBackMonText::
	text "<PLAYER> recupera"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BackAlreadyText::
	text "Già di ritorno?"
	line "Il tuo @"
	text_ram wStringBuffer1
	text_start
	para "ha ancora bisogno"
	line "delle nostre cure."

	para "Se vuoi indietro"
	line "il tuo #MON ti"
	cont "costerà ¥100."
	done

_HaveNoRoomText::
	text "Non hai posto."
	prompt

_NotEnoughMoneyText::
	text "Non hai abbastanza"
	line "soldi."
	prompt

_OhFineThenText::
	text "Ah, benissimo."
	prompt

_ComeAgainText::
	text "Torna a trovarci."
	done

_NotYetText::
	text "Non ancora…"
	done

_FoundAnEggText::
	text "Ah, eccoti!"

	para "Mentre accudivamo"
	line "i tuoi #MON,"

	para "non immagini cosa"
	line "è accaduto!"

	para "I #MON hanno"
	line "avuto un UOVO."

	para "Non sappiamo come"
	line "sia successo, ma"

	para "l'hanno avuto. Lo"
	line "vuoi?"
	done

_ReceivedEggText::
	text "<PLAYER> riceve"
	line "l'UOVO."
	done

_TakeGoodCareOfEggText::
	text "Abbine cura!"
	done

_IllKeepItThanksText::
	text "Va bene, lo terrò"
	line "io. Grazie!"
	done

_NoRoomForEggText::
	text "Non c'è più posto"
	line "nella tua squadra."
	cont "Torna più tardi."
	done

_WhichMonPhotoText::
	text "Quale #MON"
	line "devo fotografare?"
	prompt

_HoldStillText::
	text "Ok. Tienilo fermo"
	line "un attimo."
	prompt

_PrestoAllDoneText::
	text "Ecco fatto. Torna"
	line "a trovarmi, ok?"
	done
