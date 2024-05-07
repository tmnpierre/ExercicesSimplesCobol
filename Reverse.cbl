       IDENTIFICATION DIVISION.
       PROGRAM-ID. Reverse.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 INPUT-STRING     PIC X(20).
       01 REVERSED-STRING  PIC X(20).
       01 WORD-LGTH        PIC 9(3).
       01 I                PIC 9(3).
       
       PROCEDURE DIVISION.
           DISPLAY "Entrez un mot : " WITH NO ADVANCING.
           ACCEPT INPUT-STRING.
           
           COMPUTE WORD-LGTH = FUNCTION LENGTH(INPUT-STRING).
           MOVE WORD-LGTH TO I.
           PERFORM REVERSE-STRING UNTIL I = 0.
           
           DISPLAY "Le mot inversé est : " REVERSED-STRING.
           STOP RUN.
       
       REVERSE-STRING.
           MOVE INPUT-STRING(I:1) TO REVERSED-STRING
                                     (WORD-LGTH - I + 1:1).
           SUBTRACT 1 FROM I.
