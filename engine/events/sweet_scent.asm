SweetScentFromMenu:
	ld hl, .SweetScent
	call QueueScript
	ld a, $1
	ld [wFieldMoveSucceeded], a
	ret

.SweetScent:
	reloadmappart
	special UpdateTimePals
	readmem wCurItem
	ifequal TM_ZAP_CANNON, .UseTMSweetScent
	callasm GetPartyNickname
	callasm PrepareOverworldMove
	farscall PokepicFunction
	writetext UseSweetScentText
.continue
	waitbutton
	callasm SweetScentEncounter
	iffalse SweetScentNothing
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugCatchingContest
	randomwildmon
	startbattle
	reloadmapafterbattle
	end

.UseTMSweetScent
	writetext UseTMSweetScentText
	loadmem wCurItem, 0
	sjump .continue

.BugCatchingContest:
	farsjump BugCatchingContestBattleScript

SweetScentNothing:
	writetext SweetScentNothingText
	waitbutton
	closetext
	end

SweetScentEncounter:
	farcall CanUseSweetScent
	jr nc, .no_battle
	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BUG_CONTEST_TIMER_F, [hl]
	jr nz, .not_in_bug_contest
	farcall GetMapEncounterRate
	ld a, b
	and a
	jr z, .no_battle
	farcall ChooseWildEncounter
	jr nz, .no_battle
	jr .start_battle

.not_in_bug_contest
	farcall ChooseWildEncounter_BugContest

.start_battle
	ld a, $1
	ld [wScriptVar], a
	ret

.no_battle
	xor a
	ld [wScriptVar], a
	ld [wBattleType], a
	ret

UseSweetScentText:
	text_far _UseSweetScentText
	text_end

UseTMSweetScentText:
	text_far _UseTMSweetScentText
	text_end

SweetScentNothingText:
	text_far _SweetScentNothingText
	text_end
