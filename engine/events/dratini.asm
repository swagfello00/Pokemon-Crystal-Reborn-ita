GiveDratini:
; if wScriptVar is 0 or 1, change the moveset of the last Dratini in the party.
;  0: give it a special moveset with Extremespeed.
;  1: give it the normal moveset of a level 15 Dratini.

	ld a, [wScriptVar]
	cp $2
	ret nc
	ld bc, wPartyCount
	ld a, [bc]
	ld hl, MON_SPECIES
	call .GetNthPartyMon
	ld a, [bc]
	ld c, a
	ld de, PARTYMON_STRUCT_LENGTH
.CheckForDratini:
; start at the end of the party and search backwards for a Dratini
	ld a, [hl]
	cp DRATINI
	jr z, .GiveMoveset
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	dec c
	jr nz, .CheckForDratini
	ret

.GiveMoveset:
	push hl
	ld a, [wScriptVar]
	ld hl, .Movesets
	ld bc, .Moveset1 - .Moveset0
	call AddNTimes

	; get address of mon's first move
	pop de
	inc de
	inc de

.GiveMoves:
	ld a, [hl]
	and a ; is the move 00?
	ret z ; if so, we're done here

	push hl
	push de
	ld [de], a ; give the Pokémon the new move

	; get the PP of the new move
	dec a
	ld hl, Moves + MOVE_PP
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte

	; get the address of the move's PP and update the PP
	ld hl, MON_PP - MON_MOVES
	add hl, de
	ld [hl], a

	pop de
	pop hl
	inc de
	inc hl
	jr .GiveMoves

.Movesets:
.Moveset0:
; Dratini does not normally learn Extremespeed. This is a special gift.
	db WRAP
	db THUNDER_WAVE
	db TWISTER
	db EXTREMESPEED
	db 0
.Moveset1:
; This is the normal moveset of a level 15 Dratini
	db WRAP
	db LEER
	db THUNDER_WAVE
	db TWISTER
	db 0

.GetNthPartyMon:
; inputs:
; hl must be set to 0 before calling this function.
; a must be set to the number of Pokémon in the party.

; outputs:
; returns the address of the last Pokémon in the party in hl.
; sets carry if a is 0.

	ld de, wPartyMon1
	add hl, de
	and a
	jr z, .EmptyParty
	dec a
	ret z
	ld de, PARTYMON_STRUCT_LENGTH
.loop
	add hl, de
	dec a
	jr nz, .loop
	ret

.EmptyParty:
	scf
	ret

GiveMagikarpSpecialMove:
	ld de, -48
	ld hl, wPartySpecies + 5
	ld b, 5
.loop
	ld a, [hl]
	cp MAGIKARP
	jr nz, .CheckLoop
	ld hl, wPartyMon6Moves + 1
	ld a, b
.GiveContinue
	cp 5
	jr nz, .GiveLoop
	ld [hl], HYDRO_PUMP
	ld de, 21
	add hl, de
	ld [hl], 5
	ret

.CheckLoop:
	dec hl
	dec b
	ret z
	jr .loop

.GiveLoop
	add hl, de
	inc a
	jr .GiveContinue

GivePikachuSpecialMoves:
	ld de, -48
	ld hl, wPartySpecies + 5
	ld b, 5
.loop
	ld a, [hl]
	cp PIKACHU
	jr nz, .CheckLoop
	ld hl, wPartyMon6Moves + 2
	ld a, b
.GiveContinue
	cp 5
	jr nz, .GiveLoop
	push hl
	ld [hl], SURF
	ld de, 21
	add hl, de
	ld [hl], 15
	pop hl
	inc hl
	ld [hl], FLY
	ld de, 21
	add hl, de
	ld [hl], 15
	ret

.CheckLoop:
	dec hl
	dec b
	ret z
	jr .loop

.GiveLoop
	add hl, de
	inc a
	jr .GiveContinue

CheckDexCaughtVar:
	ld hl, wPokedexCaught
	ld b, wEndPokedexCaught - wPokedexCaught
	call CountSetBits
	ld [wScriptVar], a
	ret