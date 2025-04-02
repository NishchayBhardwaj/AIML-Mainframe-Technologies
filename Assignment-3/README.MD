# **README**
# Assignment 3: Removing Duplicates and Sorting a PS File Using REXX

## Overview
This assignment involves creating a Physical Sequential (PS) file containing 120 records, each 100 bytes in length. The records are structured such that the primary key is located between columns 25 and 32.

- Out of the 120 records, 15 are duplicates, and the remaining 105 are unique.
- The records are stored in random order.
- A REXX program will be written to:
  - Remove duplicate records.
  - Sort the remaining records based on the primary key (columns 25-32).

## Folder Structure
```
Assignment3/
│-- processRecords.rexx      # REXX script to remove duplicates and sort records
│-- input.txt                # Input PS file with 120 records (including duplicates)
│-- output.txt               # Output file with sorted and unique records
```

## Steps to Complete the Assignment

### Step 1: Create the Input File (input.txt)
1. Open ISPF (Interactive System Productivity Facility).
2. Navigate to Option 3.2 (Data Set Utility) to create a new PS file.
3. Enter the dataset name `userid.JCL.INPUT` and specify:
   - **RECFM**: FB (Fixed Block)
   - **LRECL**: 100 (Record Length of 100 bytes)
   - **BLKSIZE**: 1000 (Optional)
4. Save the dataset.
5. Edit `userid.JCL.INPUT` using ISPF 3.4 and manually enter 120 records.
6. Ensure that the primary key is located in columns 25-32.
7. Include 15 duplicate records and ensure the data is in random order.

### Step 2: Write the REXX Program (processRecords.rexx)
1. Inside the `Assignment3` folder, create a new REXX script named `processRecords.rexx`.
2. Open the file and enter the following REXX script:

```rexx
inputFile  = "input.txt"    /* Input PS file */
outputFile = "output.txt"   /* Output file after removing duplicates & sorting */

say "Processing file: " inputFile

/* Step 1: Read the file and store unique records */
records. = ""
uniqueRecords. = ""
sortedKeys. = ""
recordCount = 0
uniqueCount = 0

/* Read the input file */
infile = open(inputFile, "r")
if infile == 0 then do
    say "Error: Unable to open input file."
    exit 1
end

do while lines(inputFile) > 0
    record = linein(inputFile)
    recordCount = recordCount + 1
    key = substr(record, 25, 8)  /* Extract primary key from columns 25-32 */
    
    /* Store unique records using the primary key as an index */
    if uniqueRecords.key == "" then do
        uniqueCount = uniqueCount + 1
        uniqueRecords.key = record  /* Store record with primary key as index */
        sortedKeys.uniqueCount = key /* Store key for sorting */
    end
end
call lineout inputFile  /* Close input file */

say recordCount "records read."
say uniqueCount "unique records found."

/* Step 2: Sort unique records based on primary key */
call sortKeys sortedKeys, uniqueCount

/* Step 3: Write sorted records to output file */
call lineout outputFile

do i = 1 to uniqueCount
    key = sortedKeys.i
    call lineout outputFile, uniqueRecords.key
end
call lineout outputFile

say "Processing complete. Sorted output saved in " outputFile
exit

/* Function to sort keys */
sortKeys: procedure
    parse arg sortedKeys., count
    do i = 1 to count - 1
        do j = i + 1 to count
            if sortedKeys.i > sortedKeys.j then do
                temp = sortedKeys.i
                sortedKeys.i = sortedKeys.j
                sortedKeys.j = temp
                
                tempRec = uniqueRecords.sortedKeys.i
                uniqueRecords.sortedKeys.i = uniqueRecords.sortedKeys.j
                uniqueRecords.sortedKeys.j = tempRec
            end
        end
    end
```

### Step 3: Execute the REXX Program
1. Open the TSO/E command prompt.
2. Navigate to the directory where `processRecords.rexx` is stored.
3. Run the REXX script using the command:
   ```
   EXEC 'userid.REXX.PROGRAM(processRecords)'
   ```
4. If the script runs successfully, you will see messages about the number of records read, duplicates removed, and the sorted file being saved.

### Step 4: Verify the Output File (output.txt)
1. Navigate to ISPF 3.4.
2. Open the dataset `userid.JCL.OUTPUT`.
3. Confirm that:
   - The duplicate records have been removed.
   - The remaining 105 records are sorted by the primary key (columns 25-32).

