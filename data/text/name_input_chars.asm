; see engine/menus/naming_screen.asm

NameInputLower:
	db "a b c d e f g h i"
	db "j k l m n o p q r"
	db "s t u v w x y z  "
	db "× ( ) : ; [ ] <PK> <MN>"
	db "MAIUS CANC  FINE  "

BoxNameInputLower:
	db "  abcdefghijklm  "
	db "  nopqrstuvwxyz  "
	db "  àáèéìíòóùúñ    "
	db "  <PK><MN>.,♂♀!¡?¿-×/  "
	db "  0123456789     "
	db "MAIUS CANC  FINE  "

NameInputUpper:
	db "A B C D E F G H I"
	db "J K L M N O P Q R"
	db "S T U V W X Y Z  "
	db "- ? ! / . ,      "
	db "minus CANC  FINE  "

BoxNameInputUpper:
	db "  ABCDEFGHIJKLM  "
	db "  NOPQRSTUVWXYZ  "
	db "  ÀÁÈÉÌÍÒÓÙÚÑ    "
	db "  <PK><MN>º'()[]:;&    "
	db "  0123456789     "
	db "minus CANC  FINE  "