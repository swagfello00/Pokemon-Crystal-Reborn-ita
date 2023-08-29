ElevatorFloorNames:
; entries correspond to FLOOR_* constants
	table_width 2, ElevatorFloorNames
	dw .B4F
	dw .B3F
	dw .B2F
	dw .B1F
	dw ._1F
	dw ._2F
	dw ._3F
	dw ._4F
	dw ._5F
	dw ._6F
	dw ._7F
	dw ._8F
	dw ._9F
	dw ._10F
	dw ._11F
	dw .ROOF
	assert_table_length NUM_FLOORS

.B4F: db "4º S@"
.B3F: db "3º S@"
.B2F: db "2º S@"
.B1F: db "1º S@"
._1F: db "PT@"
._2F: db "1º P@"
._3F: db "2º P@"
._4F: db "3º P@"
._5F: db "4º P@"
._6F: db "5º P@"
._7F: db "6º P@"
._8F: db "7º P@"
._9F: db "8º P@"
._10F: db "9º P@"
._11F: db "10º P@"
.ROOF: db "TETTO@"
