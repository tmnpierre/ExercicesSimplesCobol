       IDENTIFICATION DIVISION.
       PROGRAM-ID. Syracuse.
       AUTHOR. Pierre.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  Nmbr PIC 9(3) VALUE 0.
       01  Steps PIC 9(3) VALUE 0.
       01  EmptyLine PIC X(80) VALUE ALL "-".
       
       PROCEDURE DIVISION.
           DISPLAY "Entrez un nombre entier positif non nul : " WITH NO 
                    ADVANCING.
           ACCEPT Nmbr.
           DISPLAY EmptyLine.
       
           IF Nmbr <= 0
               DISPLAY "Erreur: Veuillez entrer un nombre entier"
                       " positif non nul."
               STOP RUN
           END-IF.
       
           DISPLAY "Suite de la conjecture de Syracuse pour le nombre " 
                   Nmbr ":".
       
           PERFORM UNTIL Nmbr = 1
               IF FUNCTION MOD (Nmbr, 2) = 0
                   DIVIDE Nmbr BY 2 GIVING Nmbr
               ELSE
                   COMPUTE Nmbr = Nmbr * 3 + 1
               END-IF
       
               ADD 1 TO Steps
               DISPLAY Steps "étape(s)."
           END-PERFORM.
       
           DISPLAY EmptyLine
           DISPLAY "Le nombre de pas nécessaire pour atteindre 1 est :" 
                   SPACE Steps
           DISPLAY EmptyLine
           STOP RUN.
