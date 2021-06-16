10 HOME : PRINT "One moment..." : PRINT CHR$ (4)"BLOAD QRCODE,A$2000"
20 VTAB 8: PRINT "This program creates and displays a": PRINT "QR code of 33 by 33 pixels.": PRINT "": PRINT "Choose an encoding type:"
30 HTAB 4: VTAB 14: PRINT "[A] for Alphanumeric.": HTAB 4: PRINT "Up to 114 characters. Limited": HTAB 4: PRINT "to upper case letters, numbers,": HTAB 4: PRINT "$ % * + - . / : and spaces."
40 HTAB 4: VTAB 19: PRINT "[B] for Bytes.": HTAB 4: PRINT "Limited to 78 ASCII characters."
50 VTAB 22: INPUT "Enter A or B :";M$
60 IF NOT (M$ = "A" OR M$ = "B" or M$="a" or M$="b") THEN GOTO 50
70 IF (M$ = "B" or M$="b") THEN M$ = "B": POKE 8,64: GOTO 700
80 IF (M$ = "A" or M$="a") THEN M$ = "A": POKE 8,32: GOTO 800
700 HOME : VTAB 8
710 PRINT "BYTE MODE:": PRINT "Enter up to 78 ASCII characters:"
730 GOTO 1000
800 HOME : VTAB 8
810 PRINT "ALPHANUMERIC MODE:": PRINT "Enter up to 114 characters:"
820 VTAB 16: INVERSE: PRINT "Valid characters:" : PRINT "A-Z 0-9 $ % * + - . / : (space)": NORMAL
1000 VTAB 12: INPUT ">";S$
1010 if ((M$ = "A" and len(S$)>114) or (M$ = "B" and len(S$)>78)) then ? "Message too long.": goto 1000
1020 CALL 8192 : REM IF THIS FAILS, THE MESSAGE CONTAINS SOMETHING OUTSIDE THE ALLOWED RANGE
1030 HOME : VTAB 5: INVERSE : ? "INVALID CHARACTERS ENTERED. TRY AGAIN.": NORMAL :VTAB 8:GOTO 810
