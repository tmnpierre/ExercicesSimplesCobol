       IDENTIFICATION DIVISION.
       PROGRAM-ID. CmdPizza.
       AUTHOR. Pierre.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Convives PIC 9(3).
       01 PizzasEntieres PIC 9(3).
       01 TotalPizzas PIC 9(3)V9(1).
       01 Temp PIC 9(3)V9(1).
       01 Separator PIC X VALUE SPACE.
       01 EmptyLine PIC X(80) VALUE ALL "-".
       
       PROCEDURE DIVISION.
       
           DISPLAY "Bienvenue dans le système de commande de pizzas!".
           DISPLAY EmptyLine.
           DISPLAY "Veuillez entrer le nombre de convives : " WITH NO 
                   ADVANCING.
           ACCEPT Convives.
       
           MULTIPLY Convives BY 1.1 GIVING TotalPizzas.
       
           COMPUTE Temp = FUNCTION MOD(TotalPizzas, 1).
           IF Temp = 0
               MOVE TotalPizzas TO PizzasEntieres
           ELSE
               ADD 1 TO TotalPizzas
               MOVE TotalPizzas TO PizzasEntieres
           END-IF.
       
           DISPLAY EmptyLine.
           DISPLAY "Nombre de pizzas à commander : " PizzasEntieres.
           DISPLAY EmptyLine.
           STOP RUN.
