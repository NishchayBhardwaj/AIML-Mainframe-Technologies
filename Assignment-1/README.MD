# Assignment 1: Sorting and Removing Duplicates in a PS File

## Overview
This assignment involves creating a Physical Sequential (PS) file with 100 records, out of which 10 records are duplicates. We will write a JCL SORT job to:

- Eliminate duplicate records
- Sort the remaining records based on the primary key (columns 13-20)

## Folder Structure
```
Assignment1/
│-- SORTJOB.jcl              # JCL script to perform sorting and deduplication
│-- userid.JCL.SORTIN        # Input PS file with 100 records (including duplicates)
│-- userid.JCL.SORTOUT       # Output file with sorted and unique records
```

## Steps to Complete the Assignment

### Step 1: Create the Input File (SORTIN)
1. Open ISPF (Interactive System Productivity Facility).
2. Navigate to Option 3.2 (Data Set Utility) to create a new PS file.
3. Enter the dataset name `userid.JCL.SORTIN` and specify:
   - **RECFM**: FB (Fixed Block)
   - **LRECL**: 80 (Record Length of 80 bytes)
   - **BLKSIZE**: 800 (Optional)
4. Save the dataset.
5. Edit `userid.JCL.SORTIN` using ISPF 3.4 and manually enter 100 records.
6. Ensure that the primary key is located in columns 13-20.
7. Include 10 duplicate records and ensure the data is in random order.

### Step 2: Write the JCL Job (SORTJOB.jcl)
1. Inside the `userid.JCL` folder, create a new JCL script named `SORTJOB.jcl`.
2. Open the file and enter the JCL SORT utility script to:
   - Read from `userid.JCL.SORTIN`
   - Remove duplicate records
   - Sort the unique records based on columns 13-20
   - Write the output to `userid.JCL.SORTOUT`

### Step 3: Submit the Job
1. Open the JCL file `SORTJOB.jcl`.
2. Right-click on `SORTJOB.jcl` and select **Submit Job**.
3. Check the Job Status in the SDSF (Option `S.ST`).
4. If the job completes successfully (**MAXCC = 0**), proceed to the next step.

### Step 4: Verify the Output File (SORTOUT)
1. Navigate to ISPF 3.4.
2. Open the dataset `userid.JCL.SORTOUT`.
3. Confirm that:
   - The duplicate records have been removed.
   - The remaining 90 records are sorted by the primary key (columns 13-20).
