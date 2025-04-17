VSAM KSDS File Creation and Load using JCL
This project demonstrates how to create a VSAM Key-Sequenced Data Set (KSDS) using IDCAMS in JCL, populate it with data from a pre-loaded PS (flat) file, and then verify the structure using LISTCAT.

📌 Problem Statement
Create a VSAM KSDS file using IDCAMS in step #1 of a JCL.
Use another IDCAMS step to write a pre-loaded PS file into this KSDS file.
Run LISTCAT on the loaded KSDS dataset and analyze the output.

📁 JCL Breakdown
The JCL consists of 4 main steps:

✅ STEP 1: Create and Populate PS (Flat) File
//STEP1 EXEC PGM=IEBGENER
Uses the IEBGENER utility to create and load a flat file (Z67427.PS.TRAN) with sample transaction records.

✅ STEP 2: Create VSAM KSDS using IDCAMS
//STEP2 EXEC PGM=IDCAMS
Uses the DEFINE CLUSTER command to create a VSAM KSDS dataset named Z67427.ASS7.KSDS.
It specifies keys, record size, space allocation, control interval size, and free space.

✅ STEP 3: Load PS Data into KSDS
//STEP3 EXEC PGM=IDCAMS
Uses the REPRO command to copy data from the flat file (Z67427.PS.TRAN) into the VSAM KSDS file.

✅ STEP 4: List KSDS Catalog Info
//STEP4 EXEC PGM=IDCAMS
Uses the LISTC command to display catalog information of the VSAM dataset, confirming successful creation and data load.

📦 Dataset Summary

Field	Description
Key ->	First 10 bytes (e.g., 0000000001)
Transaction Description ->	Mid part of the line
Date ->	Fixed at 2025-04-14
Transaction Code ->	Last 5 characters (e.g., TXN01)

🛠️ How to Run
1. Submit the JCL on your z/OS system.
2. Check SYSPRINT outputs after each step.
3. In STEP 4, verify:
    -> Dataset name
    -> KSDS attributes (Key Length, CI Size, etc.)
    -> Number of records loaded

📚 Tools Used
JCL (Job Control Language)
IDCAMS utility
IEBGENER utility
