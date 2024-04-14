	const_def
	const CHARPOOL_0_TO_9
	const CHARPOOL_4
	const CHARPOOL_7
	const CHARPOOL_8
	const CHARPOOL_9

Zipcode_CharPools:
	; address of the charpool,       char pool length in bytes
	dwb Zipcode_CharPool_0to9,       10 ; CHARPOOL_0_TO_9
	dwb Zipcode_CharPool_4,           1 ; CHARPOOL_4
	dwb Zipcode_CharPool_7,           1 ; CHARPOOL_7
	dwb Zipcode_CharPool_8,           1 ; CHARPOOL_8
	dwb Zipcode_CharPool_9,           1 ; CHARPOOL_9

Zipcode_CharPool_0to9:
	db "0123"
Zipcode_CharPool_4:
	db "456"
Zipcode_CharPool_7:
	db "7"
Zipcode_CharPool_8:
	db "8"
Zipcode_CharPool_9:
	db "9"
	