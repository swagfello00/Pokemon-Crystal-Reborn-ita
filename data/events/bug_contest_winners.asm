BugContestantPointers:
	table_width 2, BugContestantPointers
	dw BugContestant_BugCatcherDon ; this reverts back to the player
	dw BugContestant_BugCatcherDon
	dw BugContestant_BugCatcherEd
	dw BugContestant_CooltrainerMNick
	dw BugContestant_PokefanMWilliam
	dw BugContestant_BugCatcherBenny
	dw BugContestant_CamperBarry
	dw BugContestant_PicnickerCindy
	dw BugContestant_BugCatcherJosh
	dw BugContestant_YoungsterSamuel
	dw BugContestant_SchoolboyKipp
	assert_table_length NUM_BUG_CONTESTANTS + 1

; contestant format:
;   db class, id
;   dbw 1st-place mon, score
;   dbw 2nd-place mon, score
;   dbw 3rd-place mon, score

BugContestant_BugCatcherDon:
	db BUG_CATCHER, DON
	dbw KAKUNA,     300
	dbw METAPOD,    285
	dbw CATERPIE,   226

BugContestant_BugCatcherEd:
	db BUG_CATCHER, ED
	dbw BUTTERFREE, 286
	dbw BUTTERFREE, 251
	dbw CATERPIE,   237

BugContestant_CooltrainerMNick:
	db COOLTRAINERM, NICK
	dbw VENONAT,    257
	dbw BUTTERFREE, 249
	dbw PARAS,	    268

BugContestant_PokefanMWilliam:
	db POKEFANM, WILLIAM
	dbw PINSIR,     332
	dbw BUTTERFREE, 324
	dbw VENONAT,    321

BugContestant_BugCatcherBenny:
	db BUG_CATCHER, BUG_CATCHER_BENNY
	dbw BUTTERFREE, 318
	dbw WEEDLE,     295
	dbw CATERPIE,   285

BugContestant_CamperBarry:
	db CAMPER, BARRY
	dbw BUTTERFREE, 328
	dbw VENONAT,    319
	dbw KAKUNA,     304

BugContestant_PicnickerCindy:
	db PICNICKER, CINDY
	dbw BUTTERFREE, 321
	dbw METAPOD,    301
	dbw CATERPIE,   264

BugContestant_BugCatcherJosh:
	db BUG_CATCHER, JOSH
	dbw SCYTHER,    326
	dbw BUTTERFREE, 292
	dbw METAPOD,    282

BugContestant_YoungsterSamuel:
	db YOUNGSTER, SAMUEL
	dbw WEEDLE,     270
	dbw PINSIR,     282
	dbw CATERPIE,   251

BugContestant_SchoolboyKipp:
	db SCHOOLBOY, KIPP
	dbw VENONAT,    267
	dbw PARAS,      254
	dbw KAKUNA,     259

BugContestantPointers2:
	table_width 2, BugContestantPointers2
	dw BugContestant_BugCatcherDon2 ; this reverts back to the player
	dw BugContestant_BugCatcherDon2
	dw BugContestant_BugCatcherEd2
	dw BugContestant_CooltrainerMNick2
	dw BugContestant_PokefanMWilliam2
	dw BugContestant_BugCatcherBenny2
	dw BugContestant_CamperBarry2
	dw BugContestant_PicnickerCindy2
	dw BugContestant_BugCatcherJosh2
	dw BugContestant_YoungsterSamuel2
	dw BugContestant_SchoolboyKipp2
	assert_table_length NUM_BUG_CONTESTANTS + 1

; contestant format:
;   db class, id
;   dbw 1st-place mon, score
;   dbw 2nd-place mon, score
;   dbw 3rd-place mon, score

BugContestant_BugCatcherDon2:
	db BUG_CATCHER, DON
	dbw BEEDRILL,	800
	dbw BUTTERFREE,	785
	dbw YANMA,   	726

BugContestant_BugCatcherEd2:
	db BUG_CATCHER, ED
	dbw VENOMOTH, 	786
	dbw LEDIAN, 	751
	dbw ARIADOS,   	737

BugContestant_CooltrainerMNick2:
	db COOLTRAINERM, NICK
	dbw VENOMOTH,  	757
	dbw BUTTERFREE,	749
	dbw PARASECT,	768

BugContestant_PokefanMWilliam2:
	db POKEFANM, WILLIAM
	dbw PINSIR,     832
	dbw HERACROSS,	824
	dbw VENOMOTH,   821

BugContestant_BugCatcherBenny2:
	db BUG_CATCHER, BUG_CATCHER_BENNY
	dbw HERACROSS,	818
	dbw VENOMOTH,   795
	dbw YANMA,   	785

BugContestant_CamperBarry2:
	db CAMPER, BARRY
	dbw SCIZOR,		828
	dbw VENOMOTH,	819
	dbw BEEDRILL,   804

BugContestant_PicnickerCindy2:
	db PICNICKER, CINDY
	dbw HERACROSS, 	821
	dbw BUTTERFREE, 801
	dbw BEEDRILL,   764

BugContestant_BugCatcherJosh2:
	db BUG_CATCHER, JOSH
	dbw SCYTHER,    826
	dbw BUTTERFREE, 792
	dbw YANMA,    	782

BugContestant_YoungsterSamuel2:
	db YOUNGSTER, SAMUEL
	dbw BEEDRILL,	770
	dbw PINSIR,		782
	dbw BUTTERFREE,	751

BugContestant_SchoolboyKipp2:
	db SCHOOLBOY, KIPP
	dbw VENOMOTH,	767
	dbw PARASECT,	754
	dbw BEEDRILL,	759
