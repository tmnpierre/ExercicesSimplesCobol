       IDENTIFICATION DIVISION.
       PROGRAM-ID. FindMinMaxSalaries.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FICHIERCLIENT ASSIGN TO 'fichierclient.txt'
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  FICHIERCLIENT.
       01  CLIENT-RECORD.
           03 CLIENT-ID       PIC X(9).
           03 CLIENT-NOM      PIC X(20).
           03 CLIENT-PRENOM   PIC X(20).
           03 CLIENT-POSTE    PIC X(14).
           03 CLIENT-SALAIRE  PIC 9(6).
           03 CLIENT-AGENCE   PIC X(3).

       WORKING-STORAGE SECTION.
       01  END-OF-FILE         PIC X VALUE 'N'.
           88 END-OF-FILE-YES  VALUE 'Y'.
           88 END-OF-FILE-NO   VALUE 'N'.

       01  MAXIMUM-SALARY      PIC 9(6) VALUE ZEROS.
       01  MINIMUM-SALARY      PIC 9(6) VALUE 999999.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           OPEN INPUT FICHIERCLIENT.

           PERFORM UNTIL END-OF-FILE-YES
               READ FICHIERCLIENT INTO CLIENT-RECORD
                   AT END
                       SET END-OF-FILE-YES TO TRUE
                   NOT AT END
                       PERFORM PROCESS-SALARY
               END-READ
           END-PERFORM.

           CLOSE FICHIERCLIENT.

           DISPLAY "Maximum Salary: " MAXIMUM-SALARY.
           DISPLAY "Minimum Salary: " MINIMUM-SALARY.

           STOP RUN.

       PROCESS-SALARY.
           IF CLIENT-SALAIRE > MAXIMUM-SALARY
               MOVE CLIENT-SALAIRE TO MAXIMUM-SALARY
           END-IF.

           IF CLIENT-SALAIRE < MINIMUM-SALARY
               MOVE CLIENT-SALAIRE TO MINIMUM-SALARY
           END-IF.
