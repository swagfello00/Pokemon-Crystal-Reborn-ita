Zipcode_CharPool_Formats:
	dw Zipcode_CharPools_Format0
	dw Zipcode_CharPools_Format1
	dw Zipcode_CharPools_Format2
;________________________________
Zipcode_CharPools_Format0:          ; 0-9   0-9   0-9   0-9   0-9
	db CHARPOOL_0_TO_9
	db CHARPOOL_0_TO_9
	db CHARPOOL_0_TO_9
	db CHARPOOL_0_TO_9
	db CHARPOOL_0_TO_9
	
Zipcode_CharPools_Format1:          ; 0-9   0-9   0-9   0-9
	db CHARPOOL_0_TO_9
	db CHARPOOL_0_TO_9
	db CHARPOOL_0_TO_9
	db CHARPOOL_0_TO_9
	
Zipcode_CharPools_Format2:          ;  4  7  8  9  0-9
	db CHARPOOL_4
	db CHARPOOL_7
	db CHARPOOL_8
	db CHARPOOL_9
	db CHARPOOL_0_TO_9	