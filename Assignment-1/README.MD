# Assignment #1: Sorting a PS File in Zowe Explorer

## Steps to Create and Process the PS File

### 1. Create the Input Dataset in Zowe Explorer
1. Open **Zowe Explorer** inside VS Code.
2. Navigate to `Z#####.INPUT.SORTIN`.
3. Create a new **Physical Sequential (PS) dataset** with **LRECL=80** and **RECFM=FB**.
4. Manually enter **100 records** with:
   - **Primary key** located in **columns 13-20**.
   - **10 duplicate records** and **90 unique records**.
   - The records stored in **random order**.
5. Save the dataset.

### 2. Write the JCL to Sort and Remove Duplicates
1. Navigate to `Z#####.JCL`.
2. Create a new JCL member named `JCLASS1.JCL`.
3. Add the following JCL code:

```jcl
//SORTJOB  JOB (ACCT),'SORT JOB',CLASS=A,MSGCLASS=A,NOTIFY=&SYSUID
//SORTSTEP EXEC PGM=SORT
//SYSOUT   DD SYSOUT=*
//SORTIN   DD DSN=Z#####.INPUT.SORTIN,DISP=SHR
//SORTOUT  DD DSN=Z#####.OUTPUT.SORTOUT,DISP=(NEW,CATLG,DELETE),
//         SPACE=(CYL,1),UNIT=SYSDA,LRECL=80,RECFM=FB
//SYSIN    DD *
  SORT FIELDS=(13,8,CH,A)   //* Sorting based on key in columns 13-20
  SUM FIELDS=NONE           //* Remove duplicates
/*
//
```

4. Save the JCL file.

### 3. Submit the JCL for Execution
1. Open Zowe Explorer and navigate to the `JCLASS1.JCL` file.
2. Right-click on the JCL file and select **Submit Job**.
3. Monitor the job execution in the **Zowe Jobs** panel.
4. Check the output dataset `Z#####.OUTPUT.SORTOUT` to verify:
   - The records are sorted in ascending order based on **columns 13-20**.
   - Duplicate records have been removed.

### 4. Verify the Output
1. Open `Z#####.OUTPUT.SORTOUT`.
2. Ensure the dataset contains **90 unique records** sorted based on the primary key.
3. If needed, check the **JESMSGLG** and **JESYSMSG** logs for job execution details.

## Conclusion
By following these steps, we have successfully created a **Physical Sequential (PS) file**, sorted it based on a **primary key**, and removed duplicate records using **JCL SORT** in **Zowe Explorer**.

