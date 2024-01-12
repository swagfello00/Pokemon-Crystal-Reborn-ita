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

.B4F: db "4ºS@"
.B3F: db "3ºS@"
.B2F: db "2ºS@"
.B1F: db "1ºS@"
._1F: db "PT@"
._2F: db "1ºP@"
._3F: db "2ºP@"
._4F: db "3ºP@"
._5F: db "4ºP@"
._6F: db "5ºP@"
._7F: db "6ºP@"
._8F: db "7ºP@"
._9F: db "8ºP@"
._10F: db "9ºP@"
._11F: db "10ºP@"
.ROOF: db "TETTO@"
