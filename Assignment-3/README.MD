# 🔄 REXX: Remove Duplicates and Sort by Key

This REXX script reads records from a dataset, removes duplicates based on a key (columns 25–32), sorts the remaining records in ascending order of that key, and writes the output to another dataset.

## 📌 Problem Statement

Eliminate duplicate records in a flat file and sort the unique records using a key present at a fixed position.

## 📁 Files

- `SORTREC.rexx` - Main REXX script
- Input dataset: `Z67427.REXX.INPUT`
- Output dataset: `Z67427.REXX.OUTPUT`

## 📥 Input Format

- Fixed-length records (RECFM=FB), LRECL=100
- Key for duplicate removal and sorting is in columns 25–32

## 🚀 How to Run

1. Upload `SORTREC.rexx` to your PDS (e.g. `Z67427.SOURCE(SORTREC)`)
2. Ensure input dataset `Z67427.REXX.INPUT` exists
3. Run using Zowe CLI: zowe tso send as {my-as-key} --data "exec 'Z67427.SOURCE(SORTREC)'", where {my-as-key} is the key obtained from zowe tso start as.
4. View output: zowe files view data-set "Z67427.REXX.OUTPUT"

## ✅ Features

- File I/O using `LINEIN` and `LINEOUT`
- Duplicate detection using associative arrays
- Key-based sorting
- TSO command integration
