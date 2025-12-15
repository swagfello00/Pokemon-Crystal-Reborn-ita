	object_const_def
	const TEAMROCKETBASEB2F_ROCKET1
	const TEAMROCKETBASEB2F_ROCKET_GIRL
	const TEAMROCKETBASEB2F_LANCE
	const TEAMROCKETBASEB2F_DRAGON
	const TEAMROCKETBASEB2F_ELECTRODE1
	const TEAMROCKETBASEB2F_ELECTRODE2
	const TEAMROCKETBASEB2F_ELECTRODE3
	const TEAMROCKETBASEB2F_ELECTRODE4
	const TEAMROCKETBASEB2F_ELECTRODE5
	const TEAMROCKETBASEB2F_ELECTRODE6
	const TEAMROCKETBASEB2F_ROCKET2
	const TEAMROCKETBASEB2F_ROCKET3
	const TEAMROCKETBASEB2F_ROCKET4
	const TEAMROCKETBASEB2F_POKE_BALL
	const TEAMROCKETBASEB2F_SCIENTIST
	const TEAMROCKETBASEB2F_POKE_BALL2

TeamRocketBaseB2F_MapScripts:
	def_scene_scripts
	scene_script TeamRocketBaseB2FNoop1Scene, SCENE_TEAMROCKETBASEB2F_LANCE_HEALS
	scene_script TeamRocketBaseB2FNoop2Scene, SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS
	scene_script TeamRocketBaseB2FNoop3Scene, SCENE_TEAMROCKETBASEB2F_ELECTRODES
	scene_script TeamRocketBaseB2FNoop4Scene, SCENE_TEAMROCKETBASEB2F_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, TeamRocketBaseB2FTransmitterDoorCallback

TeamRocketBaseB2FNoop1Scene:
	end

TeamRocketBaseB2FNoop2Scene:
	end

TeamRocketBaseB2FNoop3Scene:
	end

TeamRocketBaseB2FNoop4Scene:
	end

TeamRocketBaseB2FTransmitterDoorCallback:
	checkevent EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	iftrue .OpenDoor
	endcallback

.OpenDoor:
	changeblock 14, 12, $07 ; floor
	endcallback

FossilScientist:
	faceplayer
	opentext
	checkevent EVENT_GAVE_SCIENTIST_MACHINERY
	iffalse .NeedMachinery
	checkevent EVENT_GAVE_SCIENTIST_OLD_AMBER
	iftrue .GiveAerodactyl
	checkevent EVENT_GAVE_SCIENTIST_DOME_FOSSIL
	iftrue .GiveKabuto
	checkevent EVENT_GAVE_SCIENTIST_HELIX_FOSSIL
	iftrue .GiveOmanyte
.GotMachinery
	writetext FossilScientistIntroText
	yesorno
	iffalse .No
	checkitem OLD_AMBER
	iftrue .OldAmber
	checkitem DOME_FOSSIL
	iftrue .DomeFossil
	checkitem HELIX_FOSSIL
	iftrue .HelixFossil
	sjump .NoFossil

.OldAmber
	getitemname STRING_BUFFER_3, OLD_AMBER
	writetext FossilScientistMon2Text
	yesorno
	iffalse .NoAmber
	takeitem OLD_AMBER
	setevent EVENT_GAVE_SCIENTIST_OLD_AMBER
	writetext FossilScientistGiveText
	waitbutton
	sjump .GaveScientistFossil

.DomeFossil:
	getitemname STRING_BUFFER_3, DOME_FOSSIL
	writetext FossilScientistMon2Text
	yesorno
	iffalse .NoDome
	takeitem DOME_FOSSIL
	setevent EVENT_GAVE_SCIENTIST_DOME_FOSSIL
	opentext
	writetext FossilScientistGiveText
	waitbutton
	sjump .GaveScientistFossil

.HelixFossil:
	getitemname STRING_BUFFER_3, HELIX_FOSSIL
	writetext FossilScientistMon2Text
	yesorno
	iffalse .NoHelix
	takeitem HELIX_FOSSIL
	setevent EVENT_GAVE_SCIENTIST_HELIX_FOSSIL
	writetext FossilScientistGiveText
	waitbutton
	sjump .GaveScientistFossil
	
.NoFossil
	writetext NoFossilText
	waitbutton
	closetext
	end

.NoAmber
	writetext AnotherFossilText
	yesorno
	iffalse .No
	checkitem DOME_FOSSIL
	iftrue .DomeFossil
	checkitem HELIX_FOSSIL
	iftrue .HelixFossil
	sjump .NoOtherFossil
.NoDome
	writetext AnotherFossilText
	yesorno
	iffalse .No
	checkitem HELIX_FOSSIL
	iftrue .HelixFossil
	checkitem OLD_AMBER
	iftrue .OldAmber
	sjump .NoOtherFossil
.NoHelix
	writetext AnotherFossilText
	yesorno
	iffalse .No
	checkitem OLD_AMBER
	iftrue .OldAmber
	checkitem DOME_FOSSIL
	iftrue .DomeFossil
.NoOtherFossil
	writetext NoOtherFossilText
	waitbutton
	closetext
	end

.No
	writetext FossilScientistNoText
	waitbutton
	closetext
	end

.GaveScientistFossil:
	writetext FossilScientistTimeText
	waitbutton
	turnobject TEAMROCKETBASEB2F_SCIENTIST, UP
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_WARP_TO
	waitsfx
	pause 35
	special FadeInQuickly
	sjump FossilScientist

.GiveAerodactyl:
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	clearevent EVENT_GAVE_SCIENTIST_OLD_AMBER
	writetext FossilScientistDoneText
	promptbutton
	getmonname STRING_BUFFER_3, AERODACTYL
	writetext FossilScientistReceiveText
	playsound SFX_CAUGHT_MON
	waitsfx
	waitbutton
	writetext FossilScientistMonText
	givepoke AERODACTYL, 30
	closetext
	end

.GiveKabuto:
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	clearevent EVENT_GAVE_SCIENTIST_DOME_FOSSIL
	writetext FossilScientistDoneText
	promptbutton
	getmonname STRING_BUFFER_3, KABUTO
	writetext FossilScientistReceiveText
	playsound SFX_CAUGHT_MON
	waitsfx
	waitbutton
	writetext FossilScientistMonText
	givepoke KABUTO, 30
	closetext
	end

.GiveOmanyte:
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	clearevent EVENT_GAVE_SCIENTIST_HELIX_FOSSIL
	writetext FossilScientistDoneText
	promptbutton
	getmonname STRING_BUFFER_3, OMANYTE
	writetext FossilScientistReceiveText
	playsound SFX_CAUGHT_MON
	waitsfx
	waitbutton
	writetext FossilScientistMonText
	givepoke OMANYTE, 30
	closetext
	end

.NoRoom:
	writetext FossilScientistDoneText
	promptbutton
	writetext FossilScientistPartyFullText
	waitbutton
	closetext
	end

.NeedMachinery:
  checkitem MACHINERY
  iftrue .HaveMachinery
  writetext AskMachineryText
  waitbutton
  closetext
  end

.HaveMachinery
  writetext AskTakeMachineryText
  yesorno
  iffalse .DontTakeMachinery
  takeitem MACHINERY
  setevent EVENT_GAVE_SCIENTIST_MACHINERY
  writetext ThankYouMachineryText
  promptbutton
  sjump .GotMachinery

.DontTakeMachinery
  writetext DontTakeMachineryText
  waitbutton
  closetext
  end

RocketBaseBossFLeft:
	moveobject TEAMROCKETBASEB2F_LANCE, 9, 13
	sjump RocketBaseBossFScript

RocketBaseBossFRight:
	moveobject TEAMROCKETBASEB2F_ROCKET_GIRL, 21, 16
	moveobject TEAMROCKETBASEB2F_ROCKET1, 21, 16
	moveobject TEAMROCKETBASEB2F_DRAGON, 10, 13
	moveobject TEAMROCKETBASEB2F_LANCE, 10, 13
RocketBaseBossFScript:
	appear TEAMROCKETBASEB2F_ROCKET_GIRL
	appear TEAMROCKETBASEB2F_ROCKET1
	opentext
	writetext RocketBaseExecutiveFHoldItText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, RocketBasePlayerApproachesBossFMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, RocketBaseBossFApproachesPlayerMovement
	turnobject PLAYER, UP
	applymovement TEAMROCKETBASEB2F_ROCKET1, RocketBaseGruntApproachesPlayerMovement
	opentext
	writetext RocketBaseBossFThrashText
	waitbutton
	closetext
	cry DRAGONITE
	turnobject TEAMROCKETBASEB2F_ROCKET_GIRL, LEFT
	turnobject PLAYER, LEFT
	appear TEAMROCKETBASEB2F_DRAGON
	applymovement TEAMROCKETBASEB2F_DRAGON, RocketBaseDragoniteAttacksMovement
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, RocketBaseBossFHitMovement
	applymovement TEAMROCKETBASEB2F_ROCKET1, RocketBaseGruntProtectsBossFMovement
	appear TEAMROCKETBASEB2F_LANCE
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceApproachesBossFMovement
	opentext
	writetext RocketBaseLanceShareFunText
	waitbutton
	closetext
	turnobject PLAYER, RIGHT
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, RocketBaseBossFFacesPlayerMovement
	opentext
	writetext RocketBaseBossDontMeddleText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_ROCKET1, RocketBaseGruntBattlesLanceMovement
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, RocketBaseBossFBattlesPlayerMovement
	winlosstext RocketBaseBossWinText, 0
	setlasttalked TEAMROCKETBASEB2F_ROCKET_GIRL
	loadtrainer EXECUTIVEF, EXECUTIVEF_2
	startbattle
	disappear TEAMROCKETBASEB2F_DRAGON
	setevent EVENT_TEAM_ROCKET_BASE_B2F_EXECUTIVE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_GRUNT_WITH_EXECUTIVE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_EXECUTIVEF_2
	opentext
	writetext RocketBaseBossRetreatText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear TEAMROCKETBASEB2F_ROCKET1
	disappear TEAMROCKETBASEB2F_ROCKET_GIRL
	disappear TEAMROCKETBASEB2F_ROCKET2
	disappear TEAMROCKETBASEB2F_ROCKET3
	disappear TEAMROCKETBASEB2F_ROCKET4
	pause 15
	special FadeInQuickly
	setscene SCENE_TEAMROCKETBASEB2F_ELECTRODES
	clearevent EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	turnobject TEAMROCKETBASEB2F_LANCE, DOWN
	opentext
	writetext RocketBaseLancePostBattleText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceChecksPlayerMovement
	turnobject PLAYER, UP
	opentext
	writetext RocketBaseLancePowerOffText
	waitbutton
	closetext
	follow TEAMROCKETBASEB2F_LANCE, PLAYER
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceApproachesMachineMovement
	stopfollow
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLancePacesMovement
	opentext
	writetext RockerBaseLanceElectrodeFaintText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceApproachesElectrodesMovement
	disappear TEAMROCKETBASEB2F_LANCE

RocketBaseCantLeaveScript:
	applymovement PLAYER, RocketBasePlayerCantLeaveElectrodesMovement
	end

RocketBaseLancesSideScript:
	opentext
	writetext RocketBaseLancesSideText
	waitbutton
	closetext
	applymovement PLAYER, RocketBasePlayerCantGoRightMovement
	end

LanceHealsScript1:
	turnobject PLAYER, UP
	sjump LanceHealsCommon

LanceHealsScript2:
	turnobject PLAYER, RIGHT
	turnobject TEAMROCKETBASEB2F_LANCE, LEFT
LanceHealsCommon:
	opentext
	writetext LanceHealsText1
	waitbutton
	closetext
	special FadeOutPalettes
	special StubbedTrainerRankings_Healings
	playsound SFX_FULL_HEAL
	special HealParty
	special FadeInPalettes
	opentext
	writetext LanceHealsText2
	waitbutton
	closetext
	setscene SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS
	setevent EVENT_LANCE_HEALED_YOU_IN_TEAM_ROCKET_BASE
	readvar VAR_FACING
	ifequal RIGHT, .FacingRight
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceLeavesAfterHealMovement
	disappear TEAMROCKETBASEB2F_LANCE
	end

.FacingRight:
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceLeavesAfterHealRightMovement
	disappear TEAMROCKETBASEB2F_LANCE
	end

TrainerGruntM17:
	trainer GRUNTM, GRUNTM_17, EVENT_BEAT_ROCKET_GRUNTM_17, GruntM17SeenText, GruntM17BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM17AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM18:
	trainer GRUNTM, GRUNTM_18, EVENT_BEAT_ROCKET_GRUNTM_18, GruntM18SeenText, GruntM18BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM18AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM19:
	trainer GRUNTM, GRUNTM_19, EVENT_BEAT_ROCKET_GRUNTM_19, GruntM19SeenText, GruntM19BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM19AfterBattleText
	waitbutton
	closetext
	end

RocketElectrode1:
	cry ELECTRODE
	loadwildmon ELECTRODE, 23
	startbattle
	iftrue TeamRocketBaseB2FReloadMap
	disappear TEAMROCKETBASEB2F_ELECTRODE1
	disappear TEAMROCKETBASEB2F_ELECTRODE4
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	iffalse TeamRocketBaseB2FReloadMap
	reloadmapafterbattle
	special PlayMapMusic
	applymovement PLAYER, RocketBasePlayerLeavesElectrodesMovement1
	sjump RocketBaseElectrodeScript

RocketElectrode2:
	cry ELECTRODE
	loadwildmon ELECTRODE, 23
	startbattle
	iftrue TeamRocketBaseB2FReloadMap
	disappear TEAMROCKETBASEB2F_ELECTRODE2
	disappear TEAMROCKETBASEB2F_ELECTRODE5
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	iffalse TeamRocketBaseB2FReloadMap
	reloadmapafterbattle
	special PlayMapMusic
	applymovement PLAYER, RocketBasePlayerLeavesElectrodesMovement2
	sjump RocketBaseElectrodeScript

RocketElectrode3:
	cry ELECTRODE
	loadwildmon ELECTRODE, 23
	startbattle
	iftrue TeamRocketBaseB2FReloadMap
	disappear TEAMROCKETBASEB2F_ELECTRODE3
	disappear TEAMROCKETBASEB2F_ELECTRODE6
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	iffalse TeamRocketBaseB2FReloadMap
	reloadmapafterbattle
	special PlayMapMusic
	applymovement PLAYER, RocketBasePlayerLeavesElectrodesMovement3
	sjump RocketBaseElectrodeScript

TeamRocketBaseB2FReloadMap:
	reloadmapafterbattle
	end

RocketBaseElectrodeScript:
	moveobject TEAMROCKETBASEB2F_LANCE, 18, 6
	appear TEAMROCKETBASEB2F_LANCE
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceLeavesElectrodesMovement
	turnobject PLAYER, RIGHT
	opentext
	writetext RocketBaseLanceElectrodeDoneText
	promptbutton
	verbosegiveitem HM_WHIRLPOOL
	setevent EVENT_GOT_HM06_WHIRLPOOL
	writetext RocketBaseLanceWhirlpoolText
	waitbutton
	closetext
	turnobject TEAMROCKETBASEB2F_LANCE, DOWN
	opentext
	writetext RocketBaseLanceMonMasterText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement TEAMROCKETBASEB2F_LANCE, RocketBaseLanceLeavesBaseMovement
	disappear TEAMROCKETBASEB2F_LANCE
	setevent EVENT_CLEARED_ROCKET_HIDEOUT
	clearflag ENGINE_ROCKET_SIGNAL_ON_CH20
	setevent EVENT_ROUTE_43_GATE_ROCKETS
	setevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	setscene SCENE_TEAMROCKETBASEB2F_NOOP
	clearevent EVENT_LAKE_OF_RAGE_CIVILIANS
	setevent EVENT_TURNED_OFF_SECURITY_CAMERAS
	setevent EVENT_SECURITY_CAMERA_1
	setevent EVENT_SECURITY_CAMERA_2
	setevent EVENT_SECURITY_CAMERA_3
	setevent EVENT_SECURITY_CAMERA_4
	setevent EVENT_SECURITY_CAMERA_5
	end

TeamRocketBaseB2FLockedDoor:
	conditional_event EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER, .Script

.Script:
	opentext
	checkevent EVENT_LEARNED_HAIL_GIOVANNI
	iftrue .KnowsPassword
	writetext RocketBaseDoorNoPasswordText
	waitbutton
	closetext
	end

.KnowsPassword:
	writetext RocketBaseDoorKnowPasswordText
	waitbutton
	playsound SFX_ENTER_DOOR
	changeblock 14, 12, $07 ; floor
	reloadmappart
	closetext
	setevent EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	waitsfx
	end

TeamRocketBaseB2FTransmitterScript:
	opentext
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .Deactivated
	writetext RocketBaseB2FTransmitterText
	waitbutton
	closetext
	end

.Deactivated:
	writetext RocketBaseB2FDeactivateTransmitterText
	waitbutton
	closetext
	end

TeamRocketBaseB2FTMThief:
	itemball TM_THIEF

TeamRocketBaseB2FHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_TEAM_ROCKET_BASE_B2F_HIDDEN_FULL_HEAL

TeamRocketBaseB2FMachinery:
  itemball MACHINERY

RocketBaseLanceLeavesAfterHealMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RocketBaseLanceLeavesAfterHealRightMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RocketBasePlayerApproachesBossFMovement:
	step DOWN
	step DOWN
	step DOWN
	turn_head RIGHT
	step_end

RocketBaseBossFApproachesPlayerMovement:
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	turn_head DOWN
	step_end

RocketBaseGruntApproachesPlayerMovement:
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

RocketBaseDragoniteAttacksMovement:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

RocketBaseBossFHitMovement:
	fix_facing
	set_sliding
	jump_step RIGHT
	remove_sliding
	remove_fixed_facing
	step_end

RocketBaseBossFFacesPlayerMovement:
	slow_step DOWN
	turn_head LEFT
	step_end

RocketBaseLanceApproachesBossFMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RocketBaseBossFBattlesPlayerMovement:
	big_step LEFT
	step_end

RocketBaseGruntBattlesLanceMovement:
	big_step LEFT
	step_end

RocketBaseGruntProtectsBossFMovement:
	big_step LEFT
	big_step UP
	turn_head LEFT
	step_end

RocketBaseLanceChecksPlayerMovement:
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

RocketBaseLanceApproachesMachineMovement:
	step UP
	step UP
	step UP
	step_end

RocketBaseLancePacesMovement:
	step_sleep 8
	step LEFT
	step LEFT
	turn_head UP
	step_sleep 8
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_sleep 8
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

RocketBaseLanceApproachesElectrodesMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

RocketBasePlayerCantLeaveElectrodesMovement:
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

RocketBasePlayerCantGoRightMovement:
	step LEFT
	step_end

RocketBaseLanceLeavesElectrodesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step_end

RocketBaseLanceLeavesBaseMovement:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

RocketBasePlayerLeavesElectrodesMovement1:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RocketBasePlayerLeavesElectrodesMovement2:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RocketBasePlayerLeavesElectrodesMovement3:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RocketBaseExecutiveFHoldItText:
	text "Fermati lì"
	line "dove sei!"
	done

RocketBaseBossFThrashText:
	text "Non possiamo"
	line "permetterci di"
	cont "avere tipi come te"
	cont "tra i piedi!"

	para "Altrimenti, che ne"
	line "sarebbe dell'"
	cont "orgoglio di TEAM"
	cont "ROCKET?"

	para "Per quanto tu sia"
	line "forte, non potrai"

	para "mai farcela contro"
	line "noi due insieme!"

	para "Mi spiace, ma è la"
	line "tua fine!"
	done

RocketBaseLanceShareFunText:
	text "Ehi, non essere"
	line "egoista. Fai"
	cont "divertire anche"
	cont "gli altri."
	done

RocketBaseBossDontMeddleText:
	text "Come? Avevi un"
	line "complice?"

	para "Ma dov'è il tuo"
	line "senso dell'onore?"

	para "Io sono il capo"
	line "in assenza di"

	para "GIOVANNI, e ti"
	line "dimostrerò che"

	para "grave errore è"
	line "stato sfidare"
	cont "TEAM ROCKET!"
	done

RocketBaseBossWinText:
	text "Ehi, ma allora"
	line "sei forte."

	para "Che peccato!"

	para "Se ti unissi a"
	line "TEAM ROCKET"

	para "potresti diventare"
	line "un GENERALE."
	done

RocketBaseBossRetreatText:
	text "…Il rifugio"
	line "è perduto…"

	para "Ma non importa."
	line "L'esperimento di"
	cont "trasmissione ha"
	cont "funzionato."

	para "Ora non importa"
	line "cosa accadrà a"
	cont "questo covo."

	para "Abbiamo piani"
	line "molto più grandi."

	para "Molto presto"
	line "capirai la vera"

	para "forza di TEAM"
	line "ROCKET."

	para "Divertiti"
	line "finché puoi…"

	para "Fififi…"
	done

RocketBaseLancePostBattleText:
	text "LANCE: È fatta."
	line "Abbiamo battuto"

	para "tutti i ROCKET in"
	line "questo posto."

	para "Ma mi preoccupa"
	line "quel bambino con"

	para "cui ho combattuto"
	line "prima…"
	done

RocketBaseLancePowerOffText:
	text "Scusa, <PLAY_G>."
	line "Ho visto che te la"

	para "stavi cavando bene"
	line "e non sono"
	cont "intervenuto."

	para "Ora dobbiamo"
	line "soltanto spegnere"

	para "quel terribile"
	line "segnale radio."
	done

RockerBaseLanceElectrodeFaintText:
	text "È questa macchina"
	line "la causa di tutti"
	cont "i problemi."

	para "Ma non trovo"
	line "l'interruttore…"

	para "Non c'è altra"
	line "scelta. Dobbiamo"

	para "mettere ko tutti"
	line "gli ELECTRODE."

	para "Così la macchina"
	line "dovrebbe smettere"

	para "di trasmettere"
	line "questo segnale."

	para "Mi dispiace,"
	line "perché i #MON"

	para "non ne hanno"
	line "colpa."

	para "<PLAY_G>,"
	line "dividiamoci."
	done

RocketBaseLancesSideText:
	text "LANCE: Io mi"
	line "occupo di questo"
	cont "lato."
	done

RocketBaseLanceElectrodeDoneText:
	text "LANCE: Quel"
	line "terribile segnale"
	cont "si è fermato."

	para "Il LAGO dovrebbe"
	line "essere tornato"
	cont "alla normalità."

	para "Che eroismo! Ti"
	line "ringrazio a"

	para "nome di tutti i"
	line "#MON."

	para "Ah, dimenticavo."
	line "Prendi questo."

	para "L'ho trovato qui,"
	line "ma non ne ho"
	cont "bisogno."
	done

RocketBaseReceivedHM06Text: ; unreferenced
	text "<PLAYER> riceve"
	line "MN06."
	done

RocketBaseLanceWhirlpoolText:
	text "È MULINELLO."
	line "Insegnalo ad un"

	para "#MON, così"
	line "potrai affrontare"
	cont "anche le acque"

	para "agitate. Ma non"
	line "dimenticare:"

	para "lo strumento può"
	line "essere usato fuori"

	para "dalla lotta solo"
	line "se hai la MEDAGLIA"
	cont "della PALESTRA di"
	cont "MOGANIA."
	done

RocketBaseLanceMonMasterText:
	text "<PLAY_G>…"

	para "La strada per"
	line "diventare CAMPIONE"

	para "di #MON è"
	line "lunga e difficile."

	para "Vuoi comunque"
	line "proseguire?"

	para "…"

	para "Capisco. Sì, hai"
	line "ragione."

	para "Se ti arrendessi"
	line "facilmente, non"

	para "avresti mai"
	line "iniziato ad"

	para "inseguire quel"
	line "sogno."

	para "Spero di rivederti"
	line "presto!"
	done

LanceHealsText1:
	text "LANCE: Va tutto"
	line "bene?"

	para "I tuoi #MON"
	line "sono deboli e"
	cont "stanchi."

	para "Eccoti delle"
	line "medicine."
	done

LanceHealsText2:
	text "LANCE: <PLAY_G>,"
	line "cerca di dare"
	cont "sempre il massimo"
	cont "per i #MON."
	done

GruntM17SeenText:
	text "Non si apre la"
	line "porta?"

	para "Ti serve una"
	line "password che"

	para "conosce soltanto"
	line "TEAM ROCKET."
	done

GruntM17BeatenText:
	text "Come?! Ho perso?"
	done

GruntM17AfterBattleText:
	text "Io sono solo una"
	line "RECLUTA ROCKET."

	para "Non conosco la"
	line "password. Peggio"
	cont "per te."
	done

GruntM18SeenText:
	text "E tu chi sei? Non"
	line "lo faccio"

	para "volentieri, ma"
	line "devo eliminarti."
	done

GruntM18BeatenText:
	text "Lo sapevo…"
	done

GruntM18AfterBattleText:
	text "Anche nella scorsa"
	line "missione mi ha"
	cont "battuto un bimbo."

	para "Mentre rapivamo"
	line "i #MON, un"

	para "bambino con lunghi"
	line "capelli rossi e lo"

	para "sguardo malevolo"
	line "m'ha fatto fuori…"
	done

GruntM19SeenText:
	text "Ehi tu! Piccola"
	line "peste puzzolente!"
	done

GruntM19BeatenText:
	text "Grrrr…"
	done

GruntM19AfterBattleText:
	text "Solo il capo sa"
	line "la password per"
	cont "aprire la porta."

	para "Dov'è il capo?"
	line "E chi lo sa?"
	cont "Cercalo!"
	done

RocketBaseDoorNoPasswordText:
	text "La porta è chiusa…"

	para "Serve una password"
	line "per aprirla."
	done

RocketBaseDoorKnowPasswordText:
	text "La porta è chiusa…"

	para "<PLAYER> inserisce"
	line "la password."

	para "La porta si apre!"
	done

RocketBaseB2FTransmitterText:
	text "È il radiotra-"
	line "smettitore che sta"

	para "trasmettendo il"
	line "sinistro segnale."

	para "Sta funzionando"
	line "a tutta forza."
	done

RocketBaseB2FDeactivateTransmitterText:
	text "Il radiotrasmet-"
	line "titore ha smesso"

	para "di trasmettere"
	line "quel terribile"
	cont "segnale."
	done

FossilScientistIntroText:
	text "Sono un importante"
	line "scienziato!"

	para "Studio i fossili"
	line "dei #MON!"

	para "Questa macchina è"
	line "in grado di"
	cont "resuscitarli."

	para "Hai per caso un"
	line "fossile?"
	done

FossilScientistNoText:
	text "No! che peccato!"
	line "Torna di nuovo!"
	done

FossilScientistPartyFullText:
	text "No! Che peccato!"

	para "La tua squadra"
	line "è piena!"
	done

FossilScientistTimeText:
	text "Stai a guardare!"
	done

FossilScientistDoneText:
	text "Il tuo fossile è"
	line "tornato in vita!"
	done

FossilScientistMonText:
	text "Oh! Altro che"
	line "un fossile!"

	para "Questo è un"
	line "@"
	text_ram wStringBuffer3
	text "!"
	prompt

FossilScientistMon2Text:
	text "Questo fossile è"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Questo #MON"
	line "è ormai estinto"
	cont "da un pezzo!"

	para "Il mio apparecchio"
	line "lo farà tornare"
	cont "in vita."
	
	para "Vuoi provare?"
	done

NoFossilText:
	text "No! Che peccato!"

	para "Non hai alcun"
	line "fossile con te!"
	done

NoOtherFossilText:
	text "No! Che peccato!"

	para "Non hai altri"
	line "fossili con te!"
	done

FossilScientistGiveText:
	text "Ok! adesso"
	line "consegnamelo!"

	para "<PLAYER> consegna"
	line "il fossile."
	done

FossilScientistReceiveText:
	text "<PLAYER> riceve"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

AnotherFossilText:
	text "Hai un altro"
	line "fossile da"
	cont "resuscitare?"
	done

AskMachineryText:
  text "Accidenti!"
  
  para "Il TEAM ROCKET mi"
  line "ha rubato il"
  
  para "MACCHINARIO che"
  line "uso per svolgere i"
  cont "miei esperimenti!"
  
  para "Credo l'abbiano"
  line "nascosto nella"
  
  para "stanza che usano"
  line "per emettere il"
  cont "segnale radio."
  
  para "Puoi recuperarlo"
  line "per me?"
  done
  
AskTakeMachineryText:
  text "Sì è proprio"
  line "Questo!"
  
  para "Ti prego,"
  line "consegnamelo!"
  
  para "Così posso"
  line "continuare a"
  cont "lavorare."
  done

ThankYouMachineryText:
  text "<PLAYER> consegna"
  line "il MACCHINARIO"
  cont "allo scienziato."
  
  para "Grazie mille,"
  line "menomale che me"
  cont "l'hai ritrovato!"
  
  para "Ora questo"
  line "apparecchio"
  cont "funziona di nuovo!"
  
  para "Oh che sbadato,"
  line "non mi sono ancora"
  cont "presentato!"
  done

DontTakeMachineryText:
  text "Oh no! E ora come"
  line "faccio?"
  done

TeamRocketBaseB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 14, TEAM_ROCKET_BASE_B1F, 2
	warp_event  3,  2, TEAM_ROCKET_BASE_B3F, 1
	warp_event 27,  2, TEAM_ROCKET_BASE_B3F, 2
	warp_event  3,  6, TEAM_ROCKET_BASE_B3F, 3
	warp_event 27, 14, TEAM_ROCKET_BASE_B3F, 4

	def_coord_events
	coord_event  5, 14, SCENE_TEAMROCKETBASEB2F_LANCE_HEALS, LanceHealsScript1
	coord_event  4, 13, SCENE_TEAMROCKETBASEB2F_LANCE_HEALS, LanceHealsScript2
	coord_event 14, 11, SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS, RocketBaseBossFLeft
	coord_event 15, 11, SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS, RocketBaseBossFRight
	coord_event 14, 12, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseCantLeaveScript
	coord_event 15, 12, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseCantLeaveScript
	coord_event 12,  3, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseLancesSideScript
	coord_event 12, 10, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseLancesSideScript
	coord_event 12, 11, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseLancesSideScript

	def_bg_events
	bg_event 14, 12, BGEVENT_IFNOTSET, TeamRocketBaseB2FLockedDoor
	bg_event 15, 12, BGEVENT_IFNOTSET, TeamRocketBaseB2FLockedDoor
	bg_event 17,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 16,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 15,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 14,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 13,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  8, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  7, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  6, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  5, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 13,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 14,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 15,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 16,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  5, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  6, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  7, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  8, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 26,  7, BGEVENT_ITEM, TeamRocketBaseB2FHiddenFullHeal

	def_object_events
	object_event 20, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_GRUNT_WITH_EXECUTIVE
	object_event 20, 16, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_EXECUTIVE
	object_event  5, 13, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	object_event  9, 13, SPRITE_DRAGON, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_DRAGONITE
	object_event  7,  5, SPRITE_ELECTRODE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketElectrode1, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	object_event  7,  7, SPRITE_ELECTRODE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketElectrode2, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	object_event  7,  9, SPRITE_ELECTRODE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketElectrode3, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	object_event 22,  5, SPRITE_ELECTRODE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	object_event 22,  7, SPRITE_ELECTRODE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	object_event 22,  9, SPRITE_ELECTRODE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	object_event 25, 13, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM17, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGruntM18, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 21, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerGruntM19, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  3, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB2FTMThief, EVENT_TEAM_ROCKET_BASE_B2F_TM_THIEF
	object_event 24,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FossilScientist, -1
	object_event 22,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB2FMachinery, EVENT_TEAM_ROCKET_BASE_B2F_MACHINERY