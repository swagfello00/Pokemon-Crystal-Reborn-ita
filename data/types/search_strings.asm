PokedexTypeSearchStrings:
; entries correspond with PokedexTypeSearchConversionTable (see data/types/search_types.asm)
	table_width POKEDEX_TYPE_STRING_LENGTH, PokedexTypeSearchStrings
	db "  ----  @"
	db "NORMALE @"
	db " FUOCO  @"
	db " ACQUA  @"
	db "  ERBA  @"
	db "ELETTRO @"
	db "GHIACCIO@"
	db " LOTTA  @"
	db " VELENO @"
	db " TERRA  @"
	db "VOLANTE @"
	db " PSICO  @"
	db "COLEOTT.@"
	db " ROCCIA @"
	db "SPETTRO @"
	db " DRAGO  @"
	db "  BUIO  @"
	db "ACCIAIO @"
	assert_table_length NUM_TYPES + 1
