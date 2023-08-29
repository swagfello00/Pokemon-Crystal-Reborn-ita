TypeNames:
; entries correspond to types (see constants/type_constants.asm)
	table_width 2, TypeNames
	dw Normal
	dw Fighting
	dw Flying
	dw Poison
	dw Ground
	dw Rock
	dw Bird
	dw Bug
	dw Ghost
	dw Steel
	assert_table_length UNUSED_TYPES
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw CurseType
	assert_table_length UNUSED_TYPES_END
	dw Fire
	dw Water
	dw Grass
	dw Electric
	dw Psychic
	dw Ice
	dw Dragon
	dw Dark
	assert_table_length TYPES_END

Normal:    db "NORMALE@"
Fighting:  db "LOTTA@"
Flying:    db "VOLANTE@"
Poison:    db "VELENO@"
CurseType: db "???@"
Fire:      db "FUOCO@"
Water:     db "ACQUA@"
Grass:     db "ERBA@"
Electric:  db "ELETTRO@"
Psychic:   db "PSICO@"
Ice:       db "GHIACCIO@"
Ground:    db "TERRA@"
Rock:      db "ROCCIA@"
Bird:      db "@"
Bug:       db "COLEOTT.@"
Ghost:     db "SPETTRO@"
Steel:     db "ACCIAIO@"
Dragon:    db "DRAGO@"
Dark:      db "BUIO@"
