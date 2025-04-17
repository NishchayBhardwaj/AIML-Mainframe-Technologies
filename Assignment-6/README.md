# GDG (Generation Data Group) Management and Archiving

## 📄 Problem Statement

This JCL job demonstrates the complete process of **GDG management and archiving** on an IBM Mainframe. The goal is to efficiently store and manage daily transaction logs using GDG generations, and implement a process to periodically archive and clean up old data.

Each transaction log record follows a fixed 100-byte structure:
- **Columns 1–10**: Transaction ID  
- **Columns 11–30**: Transaction Date  
- **Columns 31–100**: Transaction Details  

---

## ✅ Objective

1. Create a GDG base to store daily transaction logs.
2. Add **three new generations** to the GDG base, each with 10 sample transactions.
3. Use the **IDCAMS** utility to list all existing generations.
4. Archive the **last 3 generations** into a flat (PS) file.
5. Delete the last 3 generations from the GDG base as part of the cleanup process.

---

## 🔧 JCL Job Breakdown

### 🔹 Step 1: Define GDG Base
Uses the **IDCAMS** utility to define a GDG base named:
Z67427.TRAN.LOGS
With the following properties:
- **Limit**: 10 generations
- **SCRATCH**: Old generations are deleted when limit is exceeded
- **NOEMPTY**: Keeps existing generations until limit is reached

---

### 🔹 Step 2: Create GDG Generations

Each generation is created using the **IEBGENER** utility with 10 sample transactions.

- `Z67427.TRAN.LOGS(+1)` – First generation  
- `Z67427.TRAN.LOGS(+1)` – Second generation  
- `Z67427.TRAN.LOGS(+1)` – Third generation  

> Note: Each generation automatically increments due to GDG relative generation reference `(+1)`.

---

### 🔹 Step 3: List GDG Generations

Use **IDCAMS LISTC** to list all cataloged generations of the GDG base:
Z67427.TRAN.LOGS

---

### 🔹 Step 4: Archive Last 3 Generations

Uses **IEBGENER** to concatenate the last 3 generations:
- `Z67427.TRAN.LOGS(-3)`
- `Z67427.TRAN.LOGS(-2)`
- `Z67427.TRAN.LOGS(-1)`

Into a single flat file:
Z67427.TRAN.ARCHIVE

---

### 🔹 Step 5: Cleanup

Deletes the last 3 archived generations using **IEFBR14** utility.
