# IBM JCL SORT Utility Assignment

This project highlights the use of IBM JCL (Job Control Language) for performing file sorting, validation, conditional actions, and error management using the SORT utility and ICETOOL.

---

## 📝 Problem Statement

Create a JCL job that performs the following:

1. Sorts an input dataset (PS/PO) in descending order using IBM's SORT utility and copies it to an output dataset.  
2. Compares the total number of records in the input and output datasets.  
3. If the counts match, preserve the output dataset; if not, remove it and generate an error message.  
4. Include demonstrations of both a successful run and a failure run.

---

## 📁 Files Structure

### ✅ Success Case

These files demonstrate a working example where the sort completes successfully, and the record counts are identical:

| File Name                | Description                            |
|--------------------------|----------------------------------------|
| `SORTJOB1`               | JCL job for the successful execution   |
| `Z67427.INPUT.SORTIN1`   | Input dataset for the success test     |
| `Z67427.OUTPUT.SORTOUT1` | Output dataset produced after sorting  |

---

### ❌ Fail Case

These files replicate a failed scenario where the input and output records do **not** match (e.g., due to missing or extra entries):

| File Name                | Description                                          |
|--------------------------|------------------------------------------------------|
| `SORTJOB2`               | JCL job for the failure scenario                     |
| `Z67427.INPUT.SORTIN2`   | Input dataset containing duplicated data             |
| `Z67427.OUTPUT.SORTOUT2` | Output dataset is deleted and replaced with an error message |

---

## 💡 Features Used

- **SORT utility**: To sort data records in reverse order.  
- **ICETOOL COUNT**: For counting records in both datasets.  
- **Conditional execution (COND)**: Controls which steps run based on previous step results.  
- **IEFBR14**: Deletes the output dataset if counts differ.  
- **IEBGENER**: Prints a custom error message when the job fails.

---

## ✅ Output Behavior

- If record counts are equal, the output dataset is retained and contains the sorted data.  
- If they don't match, the output dataset is deleted and replaced with the following error message:
