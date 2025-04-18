# COBOL Record Matching Program (JCLASS2.cbl)

This project demonstrates a COBOL batch program that reads two input files (**FILE1** and **FILE2**) and writes matching records to an output file (**FILE3**) using z/OS JCL. The job is submitted using **Zowe Explorer** from **VS Code**.

---

## 📋 Overview

- **Objective**: Match records from two sequential datasets based on a primary key and store results in a third dataset.
- **Key Matching**:
  - From **FILE1**: Key is in columns **13–20**
  - From **FILE2**: Key is in columns **21–28**
- **Output**: **FILE3** contains only the records with matching keys.

---

## 🏗️ Project Structure

- **COBOL Source**: `JCLASS2.cbl`
- **JCL Job Name**: `JCLASS2.jcl`
- **Input Datasets**:
  - `Z67427.INPUT.FILE1`
  - `Z67427.INPUT.FILE2`
- **Output Dataset**:
  - `Z67427.OUTPUT.FILE3`

---

## ⚙️ Setup Instructions

### 1. Environment

Ensure you have access to:
- IBM z/OS system with TSO/E and SDSF access.
- **Zowe Explorer extension** in Visual Studio Code.
- COBOL compiler (IBM Enterprise COBOL).
- JCL execution enabled with **JES2** or **JES3**.

---

### 2. Create and Upload Input Files

Create two PS datasets:
- `Z67427.INPUT.FILE1`
- `Z67427.INPUT.FILE2`

Add sample records ensuring some have matching keys based on column positions.

---

### 3. COBOL Program Logic

- Read records from **FILE1** and **FILE2**
- Compare the key fields.
- If keys match, write to **FILE3**
- Ensure input is sorted if not using in-memory search.
- Implemented using `READ`, `COMPARE`, and `WRITE` statements.

---

### 4. JCL Job (JCLASS2.jcl)

Use the provided JCL to:
- Compile (`IGYWCL`) and link the COBOL program.
- Run it conditionally (`IF RC = 0`) to process files.
- Allocate datasets correctly using DD names that match COBOL `ASSIGN TO` names.

---

## 🚀 Run Instructions (Zowe Explorer)

1. Open **VS Code**
2. Install and configure **Zowe Explorer**
3. Locate `Z67427.JCL(JCLASS2)` in the **Data Sets** view
4. Right-click → **Submit Job**
5. Monitor the job from the **JOBS** section
6. Check:
   - **SYSOUT** for logs
   - **SYSTSPRT** for dataset listing
   - **Z67427.OUTPUT.FILE3** for results

---

## ✅ Expected Output

- **Z67427.OUTPUT.FILE3** will contain all records from **FILE1** and **FILE2** that share the same key.
- Result format will match the structure of input files.
- Non-matching records are ignored.

---

## 🛠️ Tips

- Ensure **DISP=SHR** on input datasets.
- Make sure **SYSIN**, **STEPLIB**, and **SYSLMOD** are pointing to correct members and libraries.
- Use **LISTDS** in TSO to view output datasets:
  ```jcl
  LISTDS 'Z67427.OUTPUT.FILE3'
