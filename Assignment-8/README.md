# GDG Handling and SORT Concatenation using JCL

## Student ZID: Z67427

This repository contains a JCL script that performs the following tasks related to Generation Data Groups (GDGs) and data concatenation using SORT utility.

---

## 📝 Problem Statement

1. Create a GDG base with:
   - Maximum of **4 generations**
   - `SCRATCH` and `NOEMPTY` attributes.

2. Write **4 records** each into **4 successive generations**:
   - GDG(+1)
   - GDG(+2)
   - GDG(+3)
   - GDG(+4)

3. Use the `SORT` utility to **concatenate at record level**:
   - GDG(+1) and GDG(+4) ➝ `PS14OUT`
   - GDG(+2) and GDG(+3) ➝ `PS23OUT`

4. Output should be 2 PS (Physical Sequential) datasets:
   - Each with **LRECL=80**
   - Each containing **4 combined records**

---

## 📂 File Structure

```bash
.
├── GDG_CONCAT.JCL   # Main JCL script performing GDG creation, writes, and concatenation
└── README.md        # Documentation file (this file)

💡 Key Concepts Used
1. GDG (Generation Data Group):
   Used to manage datasets with versions.
   LIMIT(4) restricts to 4 versions.
   SCRATCH deletes old generations when limit is reached.
   NOEMPTY retains remaining datasets even if some are deleted.

2. IEBGENER Utility:
   Used to write static records to each GDG generation.

3. SORT Utility with JOINKEYS:
   Used to concatenate records from two datasets line by line.
   Reformatting is done using REFORMAT FIELDS=(F1:1,40,F2:1,40)
   Final output is 80 bytes per record.
