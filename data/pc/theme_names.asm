BillsPC_ThemeNames:
	table_width 2, BillsPC_ThemeNames
	dw .Pokedex
	dw .PokegearM
	dw .PokegearF
	dw .PackM
	dw .PackF
	dw .TrainerM
	dw .TrainerF
	dw .Normal
	dw .Fighting
	dw .Flying
	dw .Poison
	dw .Ground
	dw .Rock
	dw .Bug
	dw .Ghost
	dw .Steel
	dw .Fire
	dw .Water
	dw .Grass
	dw .Electric
	dw .Psychic
	dw .Ice
	dw .Dragon
	dw .Dark
	assert_table_length NUM_BILLS_PC_THEMES

.Pokedex:   db "#DEX@"
.PokegearM: db "#GEAR♂@"
.PokegearF: db "#GEAR♀@"
.PackM:     db "ZAINO♂@"
.PackF:     db "ZAINO♀@"
.TrainerM:  db "ALLENAT.♂@"
.TrainerF:  db "ALLENAT.♀@"
.Normal:    db "NORMALE@"
.Fighting:  db "LOTTA@"
.Flying:    db "VOLANTE@"
.Poison:    db "VELENO@"
.Ground:    db "TERRA@"
.Rock:      db "ROCCIA@"
.Bug:       db "COLEOTT.@"
.Ghost:     db "SPETTRO@"
.Steel:     db "ACCIAIO@"
.Fire:      db "FUOCO@"
.Water:     db "ACQUA@"
.Grass:     db "ERBA@"
.Electric:  db "ELETTRO@"
.Psychic:   db "PSICO@"
.Ice:       db "GHIACCIO@"
.Dragon:    db "DRAGO@"
.Dark:      db "BUIO@"