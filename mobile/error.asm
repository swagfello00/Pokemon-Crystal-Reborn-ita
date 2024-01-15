BattleTowerMobileError: ; all of this moved from mobile_5f
	call FadeToMenu
	xor a
	ld [wc303], a
	ldh a, [rSVBK]
	push af
	ld a, $1
	ldh [rSVBK], a

	call DisplayMobileError

	pop af
	ldh [rSVBK], a
	call ExitAllMenus
	ret

DisplayMobileError:
.loop
	call JoyTextDelay
	call .RunJumptable
	ld a, [wc303]
	bit 7, a
	jr nz, .quit
	farcall HDMATransferAttrmapAndTilemapToWRAMBank3
	jr .loop

.quit
	call .deinit
	ret

.deinit
	ld a, [wMobileErrorCodeBuffer]
	cp $22
	jr z, .asm_17f597
	cp $31
	jr z, .asm_17f58a
	cp $33
	ret nz
	ld a, [wMobileErrorCodeBuffer + 1]
	cp $1
	ret nz
	ld a, [wMobileErrorCodeBuffer + 2]
	cp $2
	ret nz
	jr .asm_17f5a1

.asm_17f58a
	ld a, [wMobileErrorCodeBuffer + 1]
	cp $3
	ret nz
	ld a, [wMobileErrorCodeBuffer + 2]
	and a
	ret nz
	jr .asm_17f5a1

.asm_17f597
	ld a, [wMobileErrorCodeBuffer + 1]
	and a
	ret nz
	ld a, [wMobileErrorCodeBuffer + 2]
	and a
	ret nz

.asm_17f5a1
	ld a, BANK(sMobileLoginPassword)
	call OpenSRAM
	xor a
	ld [sMobileLoginPassword], a
	call CloseSRAM
	ret

.RunJumptable:
	jumptable .Jumptable, wc303

.Jumptable:
	dw Function17f5c3
	dw Function17ff23
	dw Function17f5d2

Function17f5c3:
	call Function17f5e4
	farcall FinishExitMenu
	ld a, $1
	ld [wc303], a
	ret

Function17f5d2:
	call Function17f5e4
	farcall HDMATransferAttrmapAndTilemapToWRAMBank3
	call SetPalettes
	ld a, $1
	ld [wc303], a
	ret

Function17f5e4:
	ld a, $8
	ld [wMusicFade], a
	ld de, MUSIC_NONE
	ld a, e
	ld [wMusicFadeID], a
	ld a, d
	ld [wMusicFadeID + 1], a
	ld a, " "
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	ld a, $6
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	hlcoord 2, 1
	ld b, $1
	ld c, $e
	call Function3eea
	hlcoord 0, 4;1, 4
	ld b, $c
	ld c, $12;$10
	call Function3eea
	hlcoord 3, 2
	ld de, String_17f6dc
	call PlaceString
	call Function17ff3c
	jr nc, .asm_17f632
	hlcoord 11, 2
	call Function17f6b7

.asm_17f632
	ld a, [wMobileErrorCodeBuffer]
	cp $d0
	jr nc, .asm_17f684
	cp $10
	jr c, .asm_17f679
	sub $10
	cp $24
	jr nc, .asm_17f679
	ld e, a
	ld d, $0
	ld hl, Table_17f706
	add hl, de
	add hl, de
	ld a, [wMobileErrorCodeBuffer + 1]
	ld e, a
	ld a, [wMobileErrorCodeBuffer + 2]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld h, a
	ld l, c
	ld a, [hli]
	and a
	jr z, .asm_17f679
	ld c, a
.asm_17f65d
	ld a, [hli]
	ld b, a
	ld a, [hli]
	cp $ff
	jr nz, .asm_17f667
	cp b
	jr z, .asm_17f66e

.asm_17f667
	xor d
	jr nz, .asm_17f674
	ld a, b
	xor e
	jr nz, .asm_17f674

.asm_17f66e
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	jr .asm_17f67d

.asm_17f674
	inc hl
	inc hl
	dec c
	jr nz, .asm_17f65d

.asm_17f679
	ld a, $d9
	jr .asm_17f684

.asm_17f67d
	hlcoord 1, 6;2, 6
	call PlaceString
	ret

.asm_17f684
	sub $d0
	ld e, a
	ld d, 0
	ld hl, Table_17f699
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	hlcoord 1, 6;2, 6
	call PlaceString
	ret

Table_17f699:
	dw String_17fedf
	dw String_17fdd9
	dw String_17fdd9
	dw String_17fe03
	dw String_17fd84
	dw String_17fe63
	dw String_17fdb2
	dw String_17fe4b
	dw String_17fe03
	dw String_17fe03
	dw String_17fe03

Palette_17f6af:
	RGB  5,  5, 16
	RGB  8, 19, 28
	RGB  0,  0,  0
	RGB 31, 31, 31

Function17f6b7:
	ld a, [wMobileErrorCodeBuffer]
	call .bcd_two_digits
	inc hl
	ld a, [wMobileErrorCodeBuffer + 2]
	and $f
	call .bcd_digit
	ld a, [wMobileErrorCodeBuffer + 1]
	call .bcd_two_digits
	ret

.bcd_two_digits
	ld c, a
	and $f0
	swap a
	call .bcd_digit
	ld a, c
	and $f

.bcd_digit
	add "0"
	ld [hli], a
	ret

String_17f6dc:
	db "ERRORE:　　　-@"		; "つうしんエラー　　　ー@"

String_17f6e8:
	db   "Unknown error." 	; "みていぎ<NO>エラーです"
	next "Please check"		; "プログラム<WO>"
	next "the program."		; "かくにん　してください"
	db   "@"

Table_17f706:
	dw Unknown_17f74e
	dw Unknown_17f753
	dw Unknown_17f758
	dw Unknown_17f75d
	dw Unknown_17f762
	dw Unknown_17f767
	dw Unknown_17f778
	dw Unknown_17f77d
	dw Unknown_17f782
	dw Unknown_17f782
	dw Unknown_17f782
	dw Unknown_17f782
	dw Unknown_17f782
	dw Unknown_17f782
	dw Unknown_17f782
	dw Unknown_17f782
	dw Unknown_17f782
	dw Unknown_17f787
	dw Unknown_17f78c
	dw Unknown_17f791
	dw Unknown_17f796
	dw Unknown_17f79b
	dw Unknown_17f7a0
	dw Unknown_17f7a5
	dw Unknown_17f7a5
	dw Unknown_17f7a5
	dw Unknown_17f7a5
	dw Unknown_17f7a5
	dw Unknown_17f7a5
	dw Unknown_17f7a5
	dw Unknown_17f7a5
	dw Unknown_17f7a5
	dw Unknown_17f7a5
	dw Unknown_17f7ea
	dw Unknown_17f7ff
	dw Unknown_17f844

Unknown_17f74e: db 1
	dbbw $0, $0, String_17f891

Unknown_17f753: db 1
	dbbw $0, $0, String_17f8d1

Unknown_17f758: db 1
	dbbw $0, $0, String_17f913

Unknown_17f75d: db 1
	dbbw $0, $0, String_17f8d1

Unknown_17f762: db 1
	dbbw $0, $0, String_17fa71

Unknown_17f767: db 4
	dbbw $0, $0, String_17f946
	dbbw $1, $0, String_17f946
	dbbw $2, $0, String_17f946
	dbbw $3, $0, String_17f946

Unknown_17f778: db 1
	dbbw $0, $0, String_17f98e

Unknown_17f77d: db 1
	dbbw $0, $0, String_17f98e

Unknown_17f782: db 1
	dbbw $0, $0, String_17f98e

Unknown_17f787: db 1
	dbbw $0, $0, String_17f98e

Unknown_17f78c: db 1
	dbbw $0, $0, String_17f9d0

Unknown_17f791: db 1
	dbbw $0, $0, String_17fa14

Unknown_17f796: db 1
	dbbw $0, $0, String_17fcbf

Unknown_17f79b: db 1
	dbbw $0, $0, String_17fa71

Unknown_17f7a0: db 1
	dbbw $0, $0, String_17fbfe

Unknown_17f7a5: db 17
	dbbw $0, $0, String_17f98e
	dbbw $21, $2, String_17fcbf
	dbbw $21, $4, String_17fcbf
	dbbw $50, $4, String_17faf9
	dbbw $51, $4, String_17fcbf
	dbbw $52, $4, String_17fcbf
	dbbw $0, $5, String_17f98e
	dbbw $1, $5, String_17f98e
	dbbw $2, $5, String_17f98e
	dbbw $3, $5, String_17f98e
	dbbw $4, $5, String_17f98e
	dbbw $50, $5, String_17faf9
	dbbw $51, $5, String_17faf9
	dbbw $52, $5, String_17fcbf
	dbbw $53, $5, String_17faf9
	dbbw $54, $5, String_17fcbf
	dbbw $ff, $ff, String_17fcbf

Unknown_17f7ea: db 5
	dbbw $0, $0, String_17f98e
	dbbw $2, $0, String_17fb2a
	dbbw $3, $0, String_17fb6e
	dbbw $4, $0, String_17f98e
	dbbw $ff, $ff, String_17fcbf

Unknown_17f7ff: db 17
	dbbw $0, $0, String_17f98e
	dbbw $1, $3, String_17f98e
	dbbw $2, $3, String_17f98e
	dbbw $0, $4, String_17f98e
	dbbw $1, $4, String_17f98e
	dbbw $3, $4, String_17fbb6
	dbbw $4, $4, String_17fbb6
	dbbw $5, $4, String_17f98e
	dbbw $6, $4, String_17f98e
	dbbw $7, $4, String_17f98e
	dbbw $8, $4, String_17fbfe
	dbbw $0, $5, String_17fa49
	dbbw $1, $5, String_17f98e
	dbbw $2, $5, String_17fa49
	dbbw $3, $5, String_17fab0
	dbbw $4, $5, String_17fa49
	dbbw $ff, $ff, String_17fa49

Unknown_17f844: db 19
	dbbw $1, $1, String_17fc3e
	dbbw $2, $1, String_17fc88
	dbbw $3, $1, String_17fcff
	dbbw $4, $1, String_17fd84
	dbbw $5, $1, String_17fd84
	dbbw $6, $1, String_17fd47
	dbbw $1, $2, String_17fb6e
	dbbw $2, $2, String_17f98e
	dbbw $3, $2, String_17fd84
	dbbw $4, $2, String_17f98e
	dbbw $5, $2, String_17fa49
	dbbw $6, $2, String_17fd84
	dbbw $99, $2, String_17fc88
	dbbw $1, $3, String_17fa49
	dbbw $1, $4, String_17fa49
	dbbw $2, $4, String_17fa49
	dbbw $3, $4, String_17fa49
	dbbw $4, $4, String_17fa49
	dbbw $ff, $ff, String_17fa49

String_17f891: ; 18 max!
	db   "L'ADATTATORE " ; "モバイルアダプタが　ただしく"
	next "MOBILE non è" ; "さしこまれていません"
	next "collegato" ; "とりあつかいせつめいしょを"
	next "correttamente." ; "ごらんのうえ　しっかりと"
	next "consulta il" ; "さしこんで　ください"
	next "manuale."
	db   "@"

String_17f8d1:
	db   "Linea occupata," ; "でんわが　うまく　かけられないか"
	next "impossibile" ; "でんわかいせんが　こんでいるので"
	next "connettersi." ; "つうしん　できません"
	next "Riprova più" ; "しばらく　まって"
	next "tardi." ; "かけなおして　ください"
	db   "@" 

String_17f913:
	db   "Linee sovracca-" ; "でんわかいせんが　こんでいるため"
	next "riche impossibile," ; "でんわが　かけられません"
	next "connettersi." ; "かけなおして　ください"
	next "Riprova più" 
	next "tardi."	
	db   "@" 

String_17f946:
	db   "Errore dell' " ; "モバイルアダプタの　エラーです"
	next "ADATTATORE MOBILE." ; "しばらく　まって"
	next "Riprova. Se il" ; "かけなおして　ください"
	next "problema persiste," ; "なおらない　ときは"
	next "contatta" ; "モバイルサポートセンターへ"
	next "l'assistenza." ; "おといあわせください"
	db   "@" 

String_17f98e:
	db   "Errore di " ; "つうしんエラーです"
	next "comunicazione." ; "しばらく　まって"
	next "Riprova. Se il" ; "かけなおして　ください"
	next "problema persiste," ; "なおらない　ときは"
	next "contatta" ; "モバイルサポートセンターへ"
	next "l'assistenza." ; "おといあわせください"
	db   "@" 

String_17f9d0:
    db   "ID o Password" ; "ログインパスワードか"
    next "errati." 
	next "Si prega di" ; "ログイン　アイディーに"
    next "confermare le " ; "まちがいがあります"
    next "credenziali e" ; "パスワードを　かくにんして"
    next "riprovare." ; "しばらく　まって"
    db   "@"

String_17fa14:
	db   "Il telefono è" ; "でんわが　きれました"
	next "stato scollegato." ; "とりあつかいせつめいしょを"
	next "Consulta il" ; "ごらんのうえ"
	next "manuale e riprova." ; "しばらく　まって"
	db   "@" 

String_17fa49:
	db   "Errore di" ; "モバイルセンターの"
	next "connessione al" ; "つうしんエラーです"
	next "CENTRO MOBILE." ; "しばらくまって"
	next "Riprova più" ; "しばらくまって"
	next "tardi." ; "かけなおして　ください"
	db   "@" 

String_17fa71:
	db   "L'ADATTATORE " ; "モバイルアダプタに"
	next "MOBILE non è" ; "とうろくされた　じょうほうが"
	next "configurato" ; "ただしく　ありません"
	next "correttamente." ; "モバイルトレーナーで"
	next "Registrati dal" ; "しょきとうろくを　してください"
	next "Mobile Trainer." 
	db   "@" 

String_17fab0:
	db   "Il CENTRO MOBILE" ; "モバイルセンターが"
	next "è occupato." ; "こんでいて　つながりません"
	next "Consulta il" ; "しばらくまって"
	next "manuale e" ; "かけなおして　ください"
	next "richiama più" ; "くわしくは　とりあつかい"
	next "tardi." ; "せつめいしょを　ごらんください"
	db   "@" 

String_17faf9:
	db   "L'indirizzo" ; "あてさき　メールアドレスに"
	next "e-mail è errato." ; "まちがいがあります"
	next "Re-inseriscilo." ; "ただしい　メールアドレスを"
	db   "@" 

String_17fb2a:
	db   "Il tuo indirizzo" ; "メールアドレスに"
	next "e-mail è errato." ; "まちがいが　あります"
	next "Consulta il" ; "とりあつかいせつめいしょを"
	next "manuale e " ; "ごらんのうえ"
	next "registrati dal" ; "モバイルトレーナーで"
	next "Mobile Trainer." 
	db   "@" 

String_17fb6e:
	db   "Password errata o" ; "ログインパスワードに"
	next "errore del" ; "まちがいが　あるか"
	next "CENTRO MOBILE." ; "モバイルセンターの　エラーです"
	next "Riprova più" ; "パスワードを　かくにんして"
	next "tardi." ; "しばらく　まって"
	db   "@" 

String_17fbb6:
	db   "Impossibile" ; "データの　よみこみが　できません"
	next "leggere i dati." ; "しばらくまって"
	next "Riprova più tardi." ; "かけなおして　ください"
	next "il problema" ; "なおらない　ときは"
	next "persiste, contatta" ; "モバイルサポートセンターへ"
	next "l'assistenza." ; "おといあわせください"
	db   "@" 
	
String_17fbfe:
	db   "Tempo scaduto!" ; "じかんぎれです"
	next "Chiamata" ; "でんわが　きれました"
	next "terminata." ; "でんわを　かけなおしてください"
	next "Consulta il" ; "くわしくは　とりあつかい"
	next "manuale e riprova" ; "せつめいしょを　ごらんください"
	next "più tardi."
	db   "@" 

String_17fc3e:
	db   "Servizio non" ; "おきゃくさまの　ごつごうにより"
	next "disponibile a" ; "ごりようできません"
	next "causa del mancato" ; "ごりようが　できなくなります"
	next "pagamento." ; "くわしくは　とりあつかい"
	next "Consulta il" ; "せつめいしょを　ごらんください"
	next "manuale." ; "せつめいしょを　ごらんください"	
	db   "@" 

String_17fc88:
	db   "Servizio al" ; "おきゃくさまの　ごつごうにより"
	next "momento non" ; "ごりようできません"
	next "disponibile." ; "くわしくは　とりあつかい"
	next "Consulta il" ; "せつめいしょを　ごらんください"
	next "manuale." 
	db   "@" 

String_17fcbf:
	db   "Si è verificato" ; "でんわかいせんが　こんでいるか"
	next "un errore col" ; "モバイルセンターの　エラーで"
	next "telefono o con il" ; "つうしんが　できません"
	next "CENTRO MOBILE" ; "しばらく　まって"
	next "Riprova più" ; "かけなおして　ください"
	next "tardi." ; "かけなおして　ください"	
	db   "@" 

String_17fcff:
	db   "Hai raggiunto la" ; "ごりよう　りょうきんが"
	next "quota mensile." ; "じょうげんを　こえているため"
	next "Consulta il" ; "こんげつは　ごりようできません"
	next "manuale per" ; "くわしくは　とりあつかい"
	next "ulteriori" ; "せつめいしょを　ごらんください"
	next "dettagli." 
	db   "@" 

String_17fd47:
	db   "Il CENTRO MOBILE" ; "げんざい　モバイルセンターの"
	next "è in manutenzione." ; "てんけんを　しているので"
	next "maintenance." ; "つうしんが　できません"
	next "Riprova più" ; "しばらく　まって"
	next "tardi." ; "かけなおして　ください"
	db   "@" 
	
String_17fd84:
	db   "Impossibile" ; "データの　よみこみが　できません"
	next "leggere i dati." ; くわしくは　とりあつかい
	next "Consulta il" ; "せつめいしょを　ごらんください"
	next "manuale per" 
	next "ulteriori" 
	next "informazioni." 	
	db   "@" 

String_17fdb2:
	db   "Chiamata" ; "３ぷん　いじょう　なにも"
	next "terminata per" ; "にゅうりょく　しなかったので"
	next "inattività in" ; "でんわが　きれました"
	next "tre minuti." 
	db   "@"

String_17fdd9:
	db   "Comunicazione non" ; "つうしんが　うまく"
	next "riuscita." ; "できませんでした"
	next "Ricomincia e" ; "もういちど　はじめから"
	next "riprova più" ; "やりなおしてください"
	next "tardi." 
	db   "@" 

String_17fe03:
	db   "Impossibile" ; "データの　よみこみが　できません"
	next "leggere i dati." ; "しばらくまって"
	next "Riprova più tardi." ; "かけなおして　ください"
	next "il problema" ; "なおらない　ときは"
	next "persiste, contatta" ; "モバイルサポートセンターへ"
	next "l'assistenza." ; "おといあわせください"
	db   "@" 

String_17fe4b:
    db   "Chiamata" ; "まちじかんが　ながいので"
    next "terminata per" ; "でんわが　きれました"
    next "inattività." 
    db   "@"

String_17fe63:
	db   "Il tuo amico usa" ; "あいての　モバイルアダプタと"
	next "un altro tipo di " ; "タイプが　ちがいます"
	next "ADATTATORE MOBILE." ; "くわしくは　とりあつかい"
	next "Consulta il" ; "せつめいしょを　ごらんください"
	next "manuale per altri" 
	next "dettagli." 
	db   "@" 

String_17fe9a: ; unused
	db   "Le NOTIZIE #MON" ; "ポケモンニュースが"
	next "sono state" ; "あたらしくなっているので"
	next "aggiornate." ; "レポートを　おくれません"
	next "Riscaricale prima" ; "あたらしい　ポケモンニュースの"
	next "di aggiornare la" ; "よみこみを　さきに　してください"
	next "classifica." 
	db   "@" 

String_17fedf:
	db   "Numero errato o" ; "つうしんの　じょうきょうが"
	next "segnale debole." ; "よくないか　かけるあいてが"
	next "Riprova più" ; "まちがっています"
	next "tardi." ; "もういちど　かくにんをして"
	db   "@" 

Function17ff23:
	ldh a, [hJoyPressed]
	and a
	ret z
	ld a, $8
	ld [wMusicFade], a
	ld a, [wMapMusic]
	ld [wMusicFadeID], a
	xor a
	ld [wMusicFadeID + 1], a
	ld hl, wc303
	set 7, [hl]
	ret

Function17ff3c:
	nop
	ld a, [wMobileErrorCodeBuffer]
	cp $d0
	ret c
	hlcoord 10, 2
	ld de, String_17ff68
	call PlaceString
	ld a, [wMobileErrorCodeBuffer]
	push af
	sub $d0
	inc a
	ld [wMobileErrorCodeBuffer], a
	hlcoord 14, 2
	ld de, wMobileErrorCodeBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	pop af
	ld [wMobileErrorCodeBuffer], a
	and a
	ret

String_17ff68:
	db "１０１@"
