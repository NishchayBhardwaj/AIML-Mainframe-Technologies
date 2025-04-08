       IDENTIFICATION DIVISION.
       PROGRAM-ID. KSDS-SIM.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CUSTOMER-FILE ASSIGN TO "customer_data.txt"
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS FS.

       DATA DIVISION.
       FILE SECTION.
       FD CUSTOMER-FILE.
       01 CUSTOMER-RECORD.
           05 CUST-ID         PIC X(8).
           05 CUST-NAME       PIC X(32).
           05 CUST-ADDRESS    PIC X(60).

       WORKING-STORAGE SECTION.
       01 FS                  PIC XX.
       01 WS-EOF              PIC X VALUE 'N'.
          88 EOF              VALUE 'Y'.
          88 NOT-EOF          VALUE 'N'.
       01 SEARCH-ID           PIC X(8).
       01 DISPLAY-ID          PIC X(8).
       01 FOUND-FLAG          PIC X VALUE 'N'.
          88 FOUND            VALUE 'Y'.
          88 NOT-FOUND        VALUE 'N'.

       01 WS-LINE             PIC X(120).

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY "----- All Customer Records -----"
           OPEN INPUT CUSTOMER-FILE
           PERFORM UNTIL EOF
               READ CUSTOMER-FILE
                   AT END
                       SET EOF TO TRUE
                   NOT AT END
                       STRING
                           "ID: " DELIMITED BY SIZE
                           CUST-ID DELIMITED BY SIZE
                           " | Name: " DELIMITED BY SIZE
                           CUST-NAME DELIMITED BY SIZE
                           " | Address: " DELIMITED BY SIZE
                           CUST-ADDRESS DELIMITED BY SIZE
                           INTO WS-LINE
                       END-STRING
                       DISPLAY WS-LINE
               END-READ
           END-PERFORM
           CLOSE CUSTOMER-FILE

           DISPLAY "-------------------------------"
           DISPLAY "Enter Customer ID to search (8 digits): "
           ACCEPT SEARCH-ID

           CLOSE CUSTOMER-FILE
           OPEN INPUT CUSTOMER-FILE
           SET NOT-EOF TO TRUE
           SET NOT-FOUND TO TRUE

           PERFORM UNTIL EOF
               READ CUSTOMER-FILE
                   AT END
                       SET EOF TO TRUE
                   NOT AT END
                       IF CUST-ID = SEARCH-ID
                           DISPLAY "----- Customer Found -----"
                           DISPLAY "ID      : " CUST-ID
                           DISPLAY "Name    : " CUST-NAME
                           DISPLAY "Address : " CUST-ADDRESS
                           SET FOUND TO TRUE
                           SET EOF TO TRUE
                       END-IF
               END-READ
           END-PERFORM

           IF NOT FOUND
               DISPLAY "Customer ID not found."
           END-IF

           CLOSE CUSTOMER-FILE
           STOP RUN.
