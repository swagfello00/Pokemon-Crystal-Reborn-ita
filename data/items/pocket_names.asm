ItemPocketNames:
; entries correspond to item type constants
	table_width 2, ItemPocketNames
	dw .Item
	dw .Key
	dw .Ball
	dw .TM
	dw .Berry
	dw .Med
	assert_table_length NUM_ITEM_TYPES

.Item: db "TASCA STRUM.@"
.Key:  db "TASCA BASE@"
.Ball: db "TASCA BALL@"
.TM:   db "TASCA MT@"
.Berry: db "TASCA BACCHE@"
.Med:	db "TASCA CURE@"
