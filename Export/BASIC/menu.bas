1 'SAVE "MENU.BAS"
10 CLEAR ,&H8FFF:DEFINT A-Z:CLS:POKE &HE3FF,50:POKE &HD456,1
1000 CN=0:Y=8:GOSUB 5600:CMD SCREEN 1:LINE (60,17)-(326,46),6,BF
1010 LINE (64,19)-(322,44),5,BF
1020 LINE (68,20)-(318,42),1,BF
1030 LINE (230,62)-(560,156+Y),6,BF
1040 LINE (234,64)-(556,154+Y),5,BF
1050 LINE (238,66)-(552,152+Y),1,BF
1190 BM$="ＭＩＲＲＯＲＳ　ＭＥＮＵ":CMD WIDTH &HC78C,&H40,7:CMD KANJI BM$
1195 YY=&HD835
1200 BM$="ゲームを最初から始める。":CMD WIDTH YY,&H40,7:CMD KANJI BM$:YY=YY+&H50*20
1210 BM$="ゲームを途中から始める。":CMD WIDTH YY,&H40,7:CMD KANJI BM$:YY=YY+&H50*20
1214 BM$="場面保存・ディスクを作る。":CMD WIDTH YY,&H40,7:CMD KANJI BM$:YY=YY+&H50*20
1215 BM$="システムを設定する。":CMD WIDTH YY,&H40,7:CMD KANJI BM$:YY=YY+&H50*20
1216 CMD SCREEN 0:BM$="［８］・［２］のキ−で選択、決定はリタ−ン・キ−です。":CMD WIDTH &HF70D,&H40,7:CMD KANJI BM$
1217 GOSUB 5620
1220 CM=4:GOSUB 5400
1230 IF CN=1 THEN 1300
1240 IF CN=2 THEN 2000
1245 IF CN=3 THEN GOSUB 1260:GOTO 1000
1246 IF CN=4 THEN GOSUB 9000:GOTO 1000
1250 GOTO 1220
1254 '
1255 '
1260 GOSUB 5600:BM$="ドライブ１に、ブランク・ディスクを入れて下さい。":GOSUB 4010:GOSUB 4000
1261 CMD SCREEN 1:GOSUB 5600:GOSUB 4250:BM$="ドライブ１のディスクが消されます。間違いありませんか？　（Ｙ／Ｎ）":CMD WIDTH &HD6D7,&H40,7:CMD KANJI BM$:GOSUB 5620
1262 S$=INKEY$:IF S$="" THEN 1262
1263 IF S$="n" OR S$="N" THEN GOTO 1260
1264 IF S$="y" OR S$="Y" THEN GOTO 1268
1265 GOTO 1262
1268 GOSUB 5600:BM$="ドライブ１のディスクに、プログラムをＳＡＶＥしています。":GOSUB 4040:GOSUB 5620
1270 CMD FOR &H00:CMD READ &H00,&H4F,&H05,&H4000:POKE &H43FE,200:POKE &H43FF,201
1280 CMD WRITE &H00,&H4F,&H05,&H4000:
1281 POKE &HE302,0:POKE &HE303,0:
1282 CMD WRITE &H00,&H00,&H01,&HE300
1285 GOSUB 5600:BM$="　　　場面保存・ディスクが出来ました。":GOSUB 4020
1286 BM$="　　　ディスクに名前を書いて下さい。":GOSUB 4030:GOSUB 4000
1290 RETURN
1298 '
1299 '
1300 GOSUB 5600:BM$="ドライブ１とドライブ２に、ブランク・ディスクを入れて下さい。":GOSUB 4040:GOSUB 4000
1304 GOSUB 5600:BM$="ドライブ１とドライブ２のディスクのＤＡＴＡが消されます。":GOSUB 4050
1305 BM$="間違いありませんか？　（Ｙ／Ｎ）":GOSUB 4060:GOSUB 5620
1306 S$=INKEY$:IF S$="" THEN 1306
1307 IF S$="n" OR S$="N" THEN GOTO 1300
1308 IF S$="y" OR S$="Y" THEN GOTO 1315
1309 GOTO 1306
1310 '
1311 '
1315 CMD READ &H00,&H4F,&H05,&H4000:CMD PEEK &H4000,A:CMD PEEK &H4001,B
1316 IF A=ASC("I") AND B=ASC("P") THEN 1370
1320 GOSUB 5600:BM$="ドライブ１のディスクを、ＦＯＲＭＡＴしています。":GOSUB 4010:GOSUB 5620
1330 CMD FOR &H00:
1370 GOSUB 5600:BM$="ドライブ１のディスクに、プログラムをＳＡＶＥしています。":GOSUB 4040:GOSUB 5620
1380 COMMON COPY &H00,13381
1400 '
1405 CMD READ &H01,&H4F,&H05,&H4000:CMD PEEK &H4000,A:CMD PEEK &H4001,B
1406 IF A=ASC("I") AND B=ASC("P") THEN 1450
1410 GOSUB 5600:BM$="ドライブ２のディスクを、ＦＯＲＭＡＴしています。":GOSUB 4010:GOSUB 5620
1420 CMD FOR &H01:
1450 GOSUB 5600:BM$="ドライブ２のディスクに、プログラムをＳＡＶＥしています。":GOSUB 4040:GOSUB 5620
1480 COMMON COPY &H01,13581
1500 '
1510 CMD SET "A:":CMD READ &H00,&H4F,&H05,&H4000:
1520 POKE &H43FE,100:POKE &H43FF,101
1530 CMD WRITE &H00,&H4F,&H05,&H4000
1540 '
1550 CMD SET "B:":CMD READ &H01,&H4F,&H05,&H4000:
1560 POKE &H43FE,0:POKE &H43FF,0
1570 CMD WRITE &H01,&H4F,&H05,&H4000
1580 '
1600  GOSUB 5600:BM$="ドライブ１のディスクが、ＭＡＩＮ・ディスクです。ＭＡＩＮ・ディスクに名前を書いて下さい。":GOSUB 4070
1700 BM$="ドライブ２のディスクが、ゲ−ム・ディスクです。ゲ−ム・ディスクにも名前を書いて下さい。":GOSUB 4080:GOSUB 4000
1750 GOSUB 5600:BM$="ドライブ１に、ＭＡＩＮ・ディスクを入れて下さい。":GOSUB 4020
1780 BM$="ドライブ２に、ゲ−ム・ディスクを入れて下さい。":GOSUB 4030:GOSUB 4000
1800 CMD SET "A:":CMD PEEK &HF3FE,AA:CMD PEEK &HF3FF,AB
1810 IF AA=100 AND AB=101 THEN 1850
1820 GOSUB 5600:BM$="  ドライブ１の、ＭＡＩＮ・ディスクが違います。":GOSUB 4010:GOSUB 4000:GOTO 1750
1850 CMD SET "B:":CMD PEEK &HF7FE,AA:CMD PEEK &HF7FF,AB
1860 IF AA=0 AND AB=0 THEN 1900
1870 GOSUB 5600:BM$="ドライブ２の、ゲ−ム・ディスクが違います。":GOSUB 4010:GOSUB 4000:GOTO 1750
1900 '
1990 CMD SET:GOSUB 5600:COLOR=(7,7):CMD SCREEN 0:CMD RUN "NO0"
1998 '
1999 '
2000 '
2010 GOSUB 5600:BM$="    ドライブ１に、場面保存・ディスクを入れて下さい。":GOSUB 4040:GOSUB 4000
2020 CMD SET "A:":CMD PEEK &HF3FE,AA:CMD PEEK &HF3FF,AB
2025 IF AA=200 AND AB=201 THEN 2030
2026 GOSUB 5600:BM$="ドライブ１のディスクが、場面ＳＡＶＥ・ディスクと違います。":GOSUB 4040:GOSUB 4000:GOTO 2010
2030 CMD READ &H00,&H00,&H01,&H3000:
2040 CMD PEEK &H3002,SA:CMD PEEK &H3003,SB:
2199 '
2200 RESTORE 7000
2210 READ A,B,C,D,E$,F:IF A=99 THEN 2260
2220 IF A=SA AND B=SB THEN 2400
2250 GOTO 2210
2260 GOSUB 5600:BM$="場面保存・ディスクの、ＤＡＴＡが不良です。":GOSUB 4020:
2265 BM$="最初から始めて下さい。":GOSUB 4030:GOSUB 4000:GOTO 1000
2270 '
2395 '
2400 GOSUB 5600:BM$="ドライブ１に、ＭＡＩＮ・ディスク":GOSUB 4020
2405 BM$="ドライブ２に、ゲ−ム・ディスクを入れて下さい。":GOSUB 4030:GOSUB 4000
2410 CMD SET "A:":CMD PEEK &HF3FE,AA:CMD PEEK &HF3FF,AB
2420 IF AA=100 AND AB=101 THEN 3000
2430 GOSUB 5600:BM$="  ドライブ１の、ディスクが、ＭＡＩＮ・ディスクと違います。":GOSUB 4040:GOSUB 4000:GOTO 2400
2450 '
3000 CMD SET "B:":CMD PEEK &HF7FE,AC:CMD PEEK &HF7FF,AD
3010 IF AC=C AND AD=D THEN 3900:
3015 '
3020 GOSUB 5600:BM$="ドライブ２の、ゲ−ム・ディスクが、ＳＡＶＥした時のディスクと違います。このディスクをゲ−ム・ディスクにしてもいいですか？　（Ｙ／Ｎ）":GOSUB 4090:GOSUB 5620
3050 S$=INKEY$:IF S$="" THEN 3050
3060 IF S$="y" OR S$="Y" THEN 3100
3070 IF S$="n" OR S$="N" THEN 3090
3080 GOTO 3050
3090 GOSUB 5600:BM$="ドライブ２のディスクに、ゲ−ム・ディスクを入れて下さい。":GOSUB 4040:GOSUB 4000:GOTO 3000
3099 '
3100 '
3101 CMD READ &H01,&H4F,&H05,&H4000:CMD PEEK &H4000,A:CMD PEEK &H4001,B
3102 IF A=ASC("I") AND B=ASC("P") THEN 3120
3105 GOSUB 5600:BM$="ドライブ２のディスクを、ＦＯＲＭＡＴしています。":GOSUB 4010:GOSUB 5620
3110 CMD FOR &H01:
3120 '
3130 GOSUB 5600:BM$="ドライブ２のディスクに、プログラムをＳＡＶＥしています。":GOSUB 4040:GOSUB 5620
3398 '
3400 GOSUB 6000
3499 '
3500 '
3510 '
3520 '
3530 '
3540 '
3899 '
3900 '
3910 CMD SET:GOSUB 5600:COLOR=(7,7):CMD SCREEN 0:CMD RUN E$
3999 '
4000 CMD SCREEN 0:BM$="用意ができたら、リタ−ン・キ−を押して下さい。":CMD WIDTH &HF2B0,&H20,7:CMD KANJI BM$
4001 BM$="ＭＥＮＵに戻る時は、［ＥＳＣ］キ−を押して下さい。":CMD WIDTH &HF710,&H20,2:CMD KANJI BM$:GOSUB 5620
4006 S$=INKEY$:IF S$="" THEN 4006
4007 IF S$=CHR$(27) THEN RETURN 1000
4008 IF S$=CHR$(13) THEN GOSUB 5600:RETURN :ELSE 4006
4010 CMD SCREEN 1:GOSUB 4100:CMD WIDTH &HD6DF,&H40,7:CMD KANJI BM$:RETURN:'---1
4020 CMD SCREEN 1:GOSUB 4130:CMD WIDTH &HD6DF,&H40,7:CMD KANJI BM$:RETURN:'-2-1
4030 CMD WIDTH &HDD1F,&H40,7:CMD KANJI BM$:RETURN:'---2-2
4040 CMD SCREEN 1:GOSUB 4160:CMD WIDTH &HD6D9,&H40,7:CMD KANJI BM$:RETURN:'1
4050 CMD SCREEN 1:GOSUB 4130:CMD WIDTH &HD6DC,&H40,7:CMD KANJI BM$:RETURN:'-2-1
4060 CMD WIDTH &HDD1C,&H40,7:CMD KANJI BM$:RETURN
4070 CMD SCREEN 1:GOSUB 4190:CMD WIDTH &HCF0F,&H18,7:CMD KANJI BM$:RETURN:'-2-1
4080 CMD WIDTH &HDB8F,&H17,7:CMD KANJI BM$:RETURN
4090 CMD SCREEN 1:GOSUB 4220:CMD WIDTH &HCF0F,&H17,7:CMD KANJI BM$:RETURN:'-2-1
4100 LINE (96,68)-(524,93),6,BF
4110 LINE (98,69)-(522,92),5,BF
4120 LINE (100,70)-(520,91),1,BF:RETURN
4130 LINE (76,68)-(554,114),6,BF
4140 LINE (78,69)-(552,113),5,BF
4150 LINE (80,70)-(550,112),1,BF:RETURN
4160 LINE (58,68)-(562,93),6,BF
4170 LINE (60,69)-(560,92),5,BF
4180 LINE (62,70)-(558,91),1,BF:RETURN
4190 LINE (76,36)-(544,130),6,BF
4200 LINE (78,37)-(542,129),5,BF
4210 LINE (80,38)-(540,128),1,BF:RETURN
4220 LINE (76,36)-(544,106),6,BF
4230 LINE (78,37)-(542,105),5,BF
4240 LINE (80,38)-(540,104),1,BF:RETURN
4250 LINE (48,68)-(585,93),6,BF
4260 LINE (50,69)-(583,92),5,BF
4270 LINE (52,70)-(581,91),1,BF:RETURN
4999 '
5400 '
5420 LINE(258,75+CN*20)-(530,94+CN*20),7,BF,XOR:CN2=CN
5430 I$=INKEY$:IF I$="" THEN 5430
5435 IF I$="8" THEN IF CN=0 THEN 5430 :ELSE CN=CN-1:GOTO 5440
5436 IF I$="2" THEN IF CN=CM-1 THEN 5430 :ELSE CN=CN+1
5440 LINE(258,75+CN2*20)-(530,94+CN2*20),7,BF,XOR
5450 IF I$=CHR$(13) THEN CN=CN+1:RETURN :ELSE 5420
5500 '
5600 CMD COLOR[F,0,0,0,0,0,0,0,0]:CLS 2:RETURN
5610 CMD COLOR[F,0,0,0,0,0,0,0,511]:RETURN
5620 CMD COLOR[F,0,&O101,&O552,&O333,&O444,&O333,&O666,&O777]:RETURN
5979 '
5998 '
5999 '                                                                          6000 ON F GOTO 6010,6020,6030,6040,6050,6060,6070,6080,6090,6100,6110,6120,6130,6140,6150,6160,6170,6180,6190,6200,6210,6220,6230,6240,6250,6260,6270,6280,6290,6300,6310,6340
6000 ON F GOSUB 6010,6020,6030,6040,6050,6060,6070,6080,6090,6100,6110,6120,6130,6140,6150,6160,6170,6180,6190,6200,6210,6220,6230,6240,6250,6260,6270,6280,6290,6300,6310,6320,6330,6340,6350,6360,6370,6380,6390,6400,6410,6420,6430:RETURN
6001 '
6010 COMMON COPY &H01,13581:RETURN
6020 COMMON COPY &H01,13781:RETURN
6030 COMMON COPY &H01,13981:RETURN
6040 COMMON COPY &H01,14181:RETURN
6050 COMMON COPY &H01,14381:RETURN
6060 COMMON COPY &H01,14581:RETURN
6070 COMMON COPY &H01,14781:RETURN
6080 COMMON COPY &H01,14981:RETURN
6090 COMMON COPY &H01,15181:RETURN
6100 COMMON COPY &H01,15381:RETURN
6110 COMMON COPY &H01,15581:RETURN
6120 COMMON COPY &H01,15781:RETURN
6130 COMMON COPY &H01,25981:RETURN
6140 COMMON COPY &H01,26181:RETURN
6150 COMMON COPY &H01,26381:RETURN
6160 COMMON COPY &H01,26581:RETURN
6170 COMMON COPY &H01,26781:RETURN
6180 COMMON COPY &H01,26981:RETURN
6190 COMMON COPY &H01,27181:RETURN
6200 COMMON COPY &H01,27381:RETURN
6210 COMMON COPY &H01,27581:RETURN
6220 COMMON COPY &H01,17781:RETURN
6230 COMMON COPY &H01,17981:RETURN
6240 COMMON COPY &H01,18181:RETURN
6250 COMMON COPY &H01,18381:RETURN
6260 COMMON COPY &H01,18581:RETURN
6270 COMMON COPY &H01,18781:RETURN
6280 COMMON COPY &H01,18981:RETURN
6290 COMMON COPY &H01,19181:RETURN
6300 COMMON COPY &H01,19381:RETURN
6310 COMMON COPY &H01,19581:RETURN
6320 COMMON COPY &H01,19781:RETURN
6330 COMMON COPY &H01,19981:RETURN
6340 COMMON COPY &H01,20181:RETURN
6350 COMMON COPY &H01,20381:RETURN
6360 COMMON COPY &H01,20581:RETURN
6370 COMMON COPY &H01,20781:RETURN
6380 COMMON COPY &H01,20981:RETURN
6390 COMMON COPY &H01,21181:RETURN
6400 COMMON COPY &H01,21381:RETURN
6410 COMMON COPY &H01,21581:RETURN
6420 COMMON COPY &H01,21781:RETURN
6430 COMMON COPY &H01,21981:RETURN
6900 '
6901 '
6902 '
6903 '
6905 '
7000 DATA 0,0  ,0,0   ,NO0  ,1
7005 DATA 1,0  ,1,0   ,NO1  ,2
7010 DATA 2,0  ,1,0   ,NO2  ,2
7020 DATA 3,1  ,1,0   ,N3-1 ,2
7030 DATA 3,2  ,1,1   ,N3-2 ,3
7040 DATA 4,0  ,1,1   ,NO4  ,3
7050 DATA 4,2  ,2,0   ,N4-2 ,4
7060 DATA 5,0  ,2,0   ,NO5  ,4
7070 DATA 6,0  ,3,0   ,NO6  ,5
7080 DATA 7,0  ,4,0   ,NO7  ,6
7090 DATA 8,0  ,5,0   ,NO8  ,7
7100 DATA 9,0  ,5,0   ,NO9  ,7
7110 DATA 10,0 ,7,0   ,NO10 ,8
7120 DATA 11,0 ,7,0   ,NO11 ,8
7130 DATA 12,0 ,8,0   ,NO12 ,9
7140 DATA 13,0 ,8,0   ,NO13 ,9
7150 DATA 14,0 ,9,0   ,NO14 ,10
7160 DATA 15,0 ,9,0   ,NO15 ,10
7170 DATA 16,0 ,9,1   ,NO16 ,11
7180 DATA 17,0 ,9,1   ,NO17 ,11
7190 DATA 18,0 ,10,0  ,NO18 ,12
7200 DATA 19,0 ,10,0  ,NO19 ,12
7210 DATA 20,0 ,10,0  ,NO20 ,12
7215 DATA 20,1 ,10,0  ,20-1 ,12
7220 DATA 21,0 ,11,0  ,NO21 ,13
7230 DATA 21,1 ,11,0  ,21-1 ,13
7240 DATA 22,0 ,11,0  ,NO22 ,13
7250 DATA 23,0 ,11,0  ,NO23 ,13
7260 DATA 24,0 ,12,0  ,NO24 ,14
7270 DATA 25,0 ,12,0  ,NO25 ,14
7280 DATA 25,1 ,12,0  ,25-1 ,14
7290 DATA 26,0 ,13,0  ,NO26 ,15
7300 DATA 27,0 ,13,0  ,NO27 ,15
7310 DATA 28,0 ,14,0  ,NO28 ,16
7320 DATA 28,1 ,14,0  ,28-1 ,16
7330 DATA 29,0 ,14,0  ,NO29 ,16
7340 DATA 30,0 ,15,0  ,NO30 ,17
7350 DATA 31,0 ,15,0  ,NO31 ,17
7360 DATA 32,0 ,15,0  ,NO32 ,17
7370 DATA 33,0 ,16,0  ,NO33 ,18
7380 DATA 34,0 ,16,0  ,NO34 ,18
7390 DATA 35,0 ,16,0  ,NO35 ,18
7400 DATA 36,0 ,17,0  ,NO36 ,19
7410 DATA 37,0 ,17,0  ,NO37 ,19
7420 DATA 38,0 ,18,0  ,NO38 ,20
7430 DATA 39,0 ,18,0  ,NO39 ,20
7440 DATA 40,0 ,18,0  ,NO40 ,20
7450 DATA 41,0 ,18,0  ,NO41 ,20
7460 DATA 42,0 ,19,0  ,NO42 ,21
7470 DATA 43,0 ,19,0  ,NO43 ,21
7480 DATA 44,0 ,19,0  ,NO44 ,21
7490 DATA 45,0 ,20,0  ,NO45 ,22
7500 DATA 45,1 ,20,0  ,45-1 ,22
7510 DATA 46,0 ,20,0  ,NO46 ,22
7520 DATA 47,0 ,21,0  ,NO47 ,23
7530 DATA 48,0 ,21,0  ,NO48 ,23
7540 DATA 49,0 ,21,0  ,NO49 ,23
7550 DATA 49,1 ,21,0  ,49-1 ,23
7560 DATA 50,0 ,22,0  ,NO50 ,24
7570 DATA 51,0 ,22,0  ,NO51 ,24
7580 DATA 52,0 ,22,1  ,NO52 ,25
7590 DATA 53,0 ,22,1  ,NO53 ,25
7600 DATA 53,1 ,23,0  ,53-1 ,26
7610 DATA 54,0 ,23,0  ,NO54 ,26
7620 DATA 55,0 ,23,0  ,NO55 ,26
7630 DATA 56,0 ,24,0  ,NO56 ,27
7640 DATA 57,0 ,24,0  ,NO57 ,27
7650 DATA 58,0 ,24,1  ,NO58 ,28
7660 DATA 58,1 ,24,1  ,58-1 ,28
7670 DATA 59,0 ,24,1  ,NO59 ,28
7680 DATA 59,1 ,24,1  ,59-1 ,28
7690 DATA 60,0 ,25,0  ,NO60 ,29
7700 DATA 60,1 ,25,0  ,60-1 ,29
7710 DATA 60,2 ,25,0  ,60-2 ,29
7720 DATA 61,0 ,26,0  ,NO61 ,30
7730 DATA 62,0 ,26,0  ,NO62 ,30
7740 DATA 63,0 ,27,0  ,NO63 ,31
7750 DATA 63,1 ,27,0  ,63-1 ,31
7760 DATA 64,0 ,28,0  ,NO64 ,32
7770 DATA 65,0 ,28,0  ,NO65 ,32
7780 DATA 66,0 ,29,0  ,NO66 ,33
7790 DATA 67,0 ,29,0  ,NO67 ,33
7800 DATA 67,1 ,29,1  ,67-1 ,34
7810 DATA 68,0 ,29,1  ,NO68 ,34
7820 DATA 69,0 ,30,0  ,NO69 ,35
7830 DATA 69,1 ,30,0  ,69-1 ,35
7840 DATA 70,0 ,30,0  ,NO70 ,35
7850 DATA 70,1 ,30,0  ,70-1 ,35
7860 DATA 71,0 ,31,0  ,NO71 ,36
7870 DATA 72,0 ,31,0  ,NO72 ,36
7880 DATA 73,0 ,31,0  ,NO73 ,36
7890 DATA 74,0 ,31,0  ,NO74 ,36
7900 DATA 75,0 ,32,0  ,NO75 ,37
7910 DATA 76,0 ,32,0  ,NO76 ,37
7920 DATA 77,0 ,33,0  ,NO77 ,38
7930 DATA 78,0 ,33,0  ,NO78 ,38
7940 DATA 79,0 ,33,1  ,NO79 ,39
7950 DATA 80,0 ,34,0  ,NO80 ,40
7960 DATA 81,0 ,34,0  ,NO81 ,40
7970 DATA 82,0 ,34,0  ,NO82 ,40
7980 DATA 83,0 ,35,0  ,NO83 ,41
7990 DATA 84,0 ,35,1  ,NO84 ,42
8000 DATA 84,1 ,35,1  ,84-1 ,42
8010 DATA 85,0 ,36,0  ,EMD  ,43
8020 DATA 99,99,99,99,99,99,99
8999 '
9000 '
9005 GOSUB 5600:CMD SCREEN 1
9010 LINE (96,68)-(524,93+20),6,BF
9020 LINE (98,69)-(522,92+20),5,BF
9030 LINE (100,70)-(520,91+20),1,BF
9040 BM$="ＣＤ音楽リピ−ト　：　ＯＮ  ＯＦＦ":CMD WIDTH &HD6DF,&H40,7:CMD KANJI BM$
9050 BM$="文字表示スピ−ド　：　１・２・３":CMD WIDTH &HDD1F,&H40,7:CMD KANJI BM$
9100 CMD SCREEN 0:BM$="８・２で選択して４・６で設定しリタ−ンで決定して下さい":CMD WIDTH &HF70C,&H40,7:CMD KANJI BM$
9110 GOSUB 5620
9120 CN=0:CM=2:DX=0
9125 X1=PEEK(&HD456):IF X1=3 THEN X1=1 :ELSE X1=0
9126 V1=PEEK(&HE3FF):IF V1=150 THEN V1=2 :ELSE IF V1=50 THEN V1=1 :ELSE V1=0
9900 '8 / 2 ﾃﾞ ｾﾝﾀｸ
9910 GOSUB 10100:GOSUB 11100
9920 LINE(96+16,72+CN*20)-(264,89+CN*20),7,BF,XOR:CN2=CN
9930 I$=INKEY$:IF I$="" THEN 9930
9935 IF I$="8" THEN DX=0:IF CN=0 THEN 9930 :ELSE CN=CN-1:GOTO 9940
9936 IF I$="2" THEN DX=1:IF CN=CM-1 THEN 9930 :ELSE CN=CN+1:GOTO 9940
9937 IF I$="4" THEN IF DX=0 THEN 10000 :ELSE IF DX=1 THEN 11000
9938 IF I$="6" THEN IF DX=0 THEN 10010 :ELSE IF DX=1 THEN 11010
9939 IF I$="Y" THEN POKE &HE00C,&HC9
9940 LINE(96+16,72+CN2*20)-(264,89+CN2*20),7,BF,XOR
9950 IF I$=CHR$(13) THEN 9970
9952 IF I$=CHR$(&H27) THEN RETURN
9960 GOTO 9920
9970 IF X1=1 THEN POKE &HD456,3 :ELSE POKE &HD456,1
9980 IF V1=2 THEN POKE &HE3FF,150 :ELSE IF V1=1 THEN POKE &HE3FF,50 :ELSE POKE &HE3FF,1
9990 RETURN
9999 '
10000 IF X1=0 THEN 9930 :ELSE X1=X1-1:GOSUB 10110:GOSUB 10100:GOTO 9930
10010 IF X1=1 THEN 9930 :ELSE X1=X1+1:GOSUB 10110:GOSUB 10100:GOTO 9930
10100 LINE(296+X1*48,72)-(344+X1*48,89),7,BF,XOR:X2=X1:RETURN
10110 LINE(296+X2*48,72)-(344+X2*48,89),7,BF,XOR:RETURN
10119 '
11000 IF V1=0 THEN 9930 :ELSE V1=V1-1:GOSUB 11110:GOSUB 11100:GOTO 9930
11010 IF V1=2 THEN 9930 :ELSE V1=V1+1:GOSUB 11110:GOSUB 11100:GOTO 9930
11100 LINE(296+V1*32,72+20)-(314+V1*32,89+20),7,BF,XOR:V2=V1:RETURN
11110 LINE(296+V2*32,72+20)-(314+V2*32,89+20),7,BF,XOR:RETURN
