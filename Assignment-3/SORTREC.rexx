/* REXX - Remove Duplicates and Sort by Key (Cols 25-32) */
ADDRESS TSO

inFile  = "Z67427.REXX.INPUT"
outFile = "Z67427.REXX.OUTPUT"

SAY "Freeing existing file allocations..."
"FREE FI(INFILE)"
"FREE FI(OUTFILE)"
"DELETE '"outFile"'"  /* Delete output file if it exists */

SAY "Allocating INFILE..."
"ALLOC FI(INFILE) DA('"inFile"') SHR REUSE"

SAY "Allocating OUTFILE..."
allocCmd = "ALLOC FI(OUTFILE) DA('"outFile"') NEW SPACE(1,1) CYL",
            "RECFM(F B) LRECL(100) BLKSIZE(100)"
ADDRESS TSO allocCmd

SAY "Files allocated. Starting processing..."

/* Read all lines from INFILE */
SAY "Reading input..."
'EXECIO * DISKR INFILE (STEM inLines. FINIS'

unique. = ""     /* associative array to store unique records */
keyList. = ""    /* indexed array of keys */
count = 0

DO i = 1 TO inLines.0
   rec = inLines.i
   key = SUBSTR(rec, 25, 8)

   IF \DATATYPE(unique.key, 'S') THEN DO
      count = count + 1
      unique.key = rec
      keyList.count = key
   END
END

"FREE FI(INFILE)"
SAY "INFILE deallocated."

/* Sort keys */
SAY "Sorting keys..."
DO i = 1 TO count - 1
   DO j = i + 1 TO count
      IF keyList.i > keyList.j THEN DO
         temp = keyList.i
         keyList.i = keyList.j
         keyList.j = temp
      END
   END
END

/* Write Output */
SAY "Writing to OUTFILE..."
DO i = 1 TO count
   key = keyList.i
   outLines.i = unique.key
END
outLines.0 = count
'EXECIO 'count' DISKW OUTFILE (STEM outLines. FINIS'

"FREE FI(OUTFILE)"
SAY "OUTFILE deallocated."

SAY count 'unique records written to output.'
