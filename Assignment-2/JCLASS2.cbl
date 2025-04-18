       IDENTIFICATION DIVISION.
       PROGRAM-ID. JCLASS2.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE1 ASSIGN TO DD1
               ORGANIZATION IS SEQUENTIAL.
           SELECT INPUT-FILE2 ASSIGN TO DD2
               ORGANIZATION IS SEQUENTIAL.
           SELECT OUTPUT-FILE ASSIGN TO DD3
               ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD INPUT-FILE1.
       01 INPUT1-RECORD         PIC X(80).
       FD INPUT-FILE2.
       01 INPUT2-RECORD         PIC X(80).
       FD OUTPUT-FILE.
       01 OUTPUT-RECORD         PIC X(80).

       WORKING-STORAGE SECTION.
       01 EOF-FILE1             PIC X VALUE 'N'.
       01 EOF-FILE2             PIC X VALUE 'N'.
       01 KEY1                  PIC X(8).
       01 KEY2                  PIC X(8).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           OPEN INPUT INPUT-FILE1
                INPUT-FILE2
                OUTPUT OUTPUT-FILE

           PERFORM READ-INPUT1
           PERFORM READ-INPUT2

           PERFORM UNTIL EOF-FILE1 = 'Y' OR EOF-FILE2 = 'Y'
               MOVE INPUT1-RECORD(13:8) TO KEY1
               MOVE INPUT2-RECORD(21:8) TO KEY2

               IF KEY1 = KEY2 THEN
                   STRING INPUT1-RECORD DELIMITED BY SIZE
                          INPUT2-RECORD DELIMITED BY SIZE
                          INTO OUTPUT-RECORD
                   WRITE OUTPUT-RECORD
                   PERFORM READ-INPUT1
                   PERFORM READ-INPUT2
               ELSE
                   IF KEY1 < KEY2 THEN
                       PERFORM READ-INPUT1
                   ELSE
                       PERFORM READ-INPUT2
                   END-IF
               END-IF
           END-PERFORM

           CLOSE INPUT-FILE1 INPUT-FILE2 OUTPUT-FILE
           STOP RUN.

       READ-INPUT1.
           READ INPUT-FILE1
               AT END MOVE 'Y' TO EOF-FILE1.

       READ-INPUT2.
           READ INPUT-FILE2
               AT END MOVE 'Y' TO EOF-FILE2.
