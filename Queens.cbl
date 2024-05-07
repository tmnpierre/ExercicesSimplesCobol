       IDENTIFICATION DIVISION.
       PROGRAM-ID. ChessQueens.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WHITE-COL        PIC X.
       01 WHITE-ROW        PIC X.
       01 BLACK-COL        PIC X.
       01 BLACK-ROW        PIC X.
       01 WHITE-COL-NUM    PIC 9 VALUE 0.
       01 WHITE-ROW-NUM    PIC 9 VALUE 0.
       01 BLACK-COL-NUM    PIC 9 VALUE 0.
       01 BLACK-ROW-NUM    PIC 9 VALUE 0.
       01 ATTACK           PIC X(3) VALUE 'Non'.
       
       PROCEDURE DIVISION.
           DISPLAY 
           "Entrez le numéro de ligne de la reine blanche (1-8) : " 
           WITH NO ADVANCING.
           ACCEPT WHITE-ROW.
           DISPLAY 
           "Entrez la lettre de colonne de la reine blanche (A-H) : " 
           WITH NO ADVANCING.
           ACCEPT WHITE-COL.
           MOVE FUNCTION UPPER-CASE(WHITE-COL) TO WHITE-COL.
           DISPLAY " ".
           
           DISPLAY 
           "Entrez le numéro de ligne de la reine noire (1-8) : " 
           WITH NO ADVANCING.
           ACCEPT BLACK-ROW.
           DISPLAY 
           "Entrez la lettre de colonne de la reine noire (A-H) : " 
           WITH NO ADVANCING.
           ACCEPT BLACK-COL.
           MOVE FUNCTION UPPER-CASE(BLACK-COL) TO BLACK-COL.
           DISPLAY " ".
       
           COMPUTE WHITE-COL-NUM = 
               FUNCTION NUMVAL(WHITE-COL) - FUNCTION NUMVAL("A") + 1.
           COMPUTE WHITE-ROW-NUM = 
               FUNCTION NUMVAL(WHITE-ROW) - FUNCTION NUMVAL("1") + 1.
           COMPUTE BLACK-COL-NUM = 
               FUNCTION NUMVAL(BLACK-COL) - FUNCTION NUMVAL("A") + 1.
           COMPUTE BLACK-ROW-NUM = 
               FUNCTION NUMVAL(BLACK-ROW) - FUNCTION NUMVAL("1") + 1.
       
           IF WHITE-COL = BLACK-COL OR
              WHITE-ROW = BLACK-ROW OR
              WHITE-ROW-NUM - BLACK-ROW-NUM = 
              WHITE-COL-NUM - BLACK-COL-NUM OR
              WHITE-ROW-NUM - BLACK-ROW-NUM = 
              BLACK-COL-NUM - WHITE-COL-NUM
           THEN
               MOVE "Oui" TO ATTACK
           END-IF.
       
           DISPLAY "Les reines peuvent-elles s'attaquer ? " ATTACK.
           STOP RUN.
       