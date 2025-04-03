# **README**

# Assignments Overview

This document outlines multiple assignments related to JCL, COBOL, REXX, VSAM, and GDG. The tasks include file handling, sorting, duplicate elimination, conditional job execution, and VSAM/GDG management.

## Assignment #1: Sorting & Duplicate Elimination (JCL)
**Objective:**
Manually create a Physical Sequential (PS) file using ISPF 3.2, containing 100 records of 80 bytes each. The primary key is between columns 13-20. Among these, 10 records are duplicates.

**Task:**
Use JCL SORT utility to:
- Eliminate duplicate records
- Sort the remaining 90 records based on the primary key

**Concepts Covered:**
- File handling
- Sorting in JCL
- Duplicate elimination

---

## Assignment #2: File Matching (COBOL)
**Objective:**
Create two PS files:
- **File1:** 50 records, with the primary key in columns 13-20.
- **File2:** 50 records, with the primary key in columns 21-28.

**Task:**
Write a COBOL program to:
- Read both files
- Identify matching records based on primary keys
- Write matched records to File3

**Concepts Covered:**
- File processing in COBOL
- Record matching logic

---

## Assignment #3: Sorting & Duplicate Removal (REXX)
**Objective:**
Create a PS file with 120 records of 100 bytes each, with a primary key in columns 25-32. There are 15 duplicate records.

**Task:**
Write a REXX script to:
- Remove duplicate records
- Sort the remaining 105 records based on the primary key

**Concepts Covered:**
- REXX scripting
- File handling & sorting
- Data cleanup

---

## Assignment #4: Conditional Sorting & Copying (JCL)
**Objective:**
Write a JCL job to:
- Copy a PS/PO file into an output file in descending order
- Compare the total record count before and after sorting
- Keep the output file only if sorting is successful
- Print an error message if sorting fails

**Concepts Covered:**
- SORT utility in JCL
- Conditional job execution
- Error handling

---

## Assignment #5: VSAM KSDS Handling (COBOL)
**Objective:**
Create a VSAM KSDS (Key-Sequenced Data Set) with:
- **Key:** Customer ID (columns 1-8)
- **Data:**
  - Customer Name (columns 9-40)
  - Address (columns 41-100)

**Task:**
Write a COBOL program to:
- Insert 20 customer records into KSDS
- Display records in ascending order
- Search for a specific Customer ID and display the corresponding record

**Concepts Covered:**
- VSAM KSDS creation & access
- COBOL file handling

---

## Assignment #6: GDG Management & Archiving (JCL)
**Objective:**
Create a GDG (Generation Data Group) base to store daily transaction logs.

Each generation contains 100-byte records with the structure:
- **Columns 1-10:** Transaction ID
- **Columns 11-30:** Transaction Date
- **Columns 31-100:** Transaction Details

**Task:**
Write a JCL job to:
- Add a new generation with 10 sample transactions
- Use IDCAMS to list all existing generations
- Archive the last 3 generations into a PS file and then delete them

**Concepts Covered:**
- GDG base creation
- Archiving and cleanup using JCL

---

## Assignment #7: JCL & VSAM Operations
**Objective:**
Create and manage VSAM KSDS via JCL.

**Task:**
Write a JCL job to:
- **Step 1:** Create a VSAM KSDS file using IDCAMS
- **Step 2:** Load a pre-existing PS file into KSDS
- **Step 3:** Run LISTCAT on KSDS and analyze the output

**Concepts Covered:**
- VSAM KSDS creation
- Loading and listing datasets in JCL

---

## Assignment #8: GDG Management & Concatenation (JCL/REXX)
**Objective:**
Create a GDG base and manipulate multiple generations.

**Task:**
- Create a GDG base with max generations.
- Write records into four generations (each with 4 records, LRECL=40).
- Write a REXX script or SORT JCL to:
  - Concatenate GDG(+1) and GDG(+4) into one PS file (LRECL=80, total records=4)
  - Concatenate GDG(+2) and GDG(+3) into another PS file (LRECL=80, total records=4)

**Concepts Covered:**
- GDG file handling
- Concatenation of GDG generations
- Data management using REXX/JCL

---

## Summary
These assignments provide hands-on experience with:
- **JCL:** Sorting, data processing, VSAM, GDG
- **COBOL:** File handling, record matching
- **REXX:** Scripting for file operations
- **IDCAMS:** VSAM and GDG management

By completing these tasks, you will strengthen your understanding of mainframe file handling, job execution, and data manipulation techniques.

---

## Resources Required
- Mainframe System with TSO/ISPF access
- JCL, COBOL, and REXX compilers
- Dataset allocation permissions
- Access to SORT and IDCAMS utilities

---

## Instructions
1. Allocate necessary datasets using ISPF 3.2.
2. Follow the assignment tasks step by step.
3. Run the JCL/COBOL/REXX programs on the mainframe.
4. Verify the output using SDSF (System Display and Search Facility).
5. Troubleshoot errors using system logs.

---

## About
_No description, website, or topics provided._

---

## Resources
- **Readme**
- **Activity**

---

## GitHub Repository Stats
- **Stars:** 0 stars
- **Watchers:** 1 watching
- **Forks:** 0 forks

---

## Languages Used
- **JCL:** 100.0%

---

_Footer_
