# CS6620: Advanced Computer Organization and Architecture with Lab
# Lab Assignment-5 

## Code-Conversion (Submission Deadline:3/11/19)

NOTE: The submission got delayed due to system crash and wiping out entire hard disc for security.
Got the laptop fixed from IT dept. and re-done all the exercises. Issue was reported to Prof.

### Part 1
Convert the contents of a given **A_DIGIT** variable from an ASCII character to
a hexadecimal digit and store the result in **H_DIGIT**. Assume that **A_DIGIT**
contains the ASCII representation of a hexadecimal digit (i.e., 7 bits with
MSB=0).

For example:

|         |           |             |
|:-------:|:---------:|:-----------:|
|  Input: |   A_DIGIT |      43     |
|  Output:|   H_DIGIT |      OC     |

### Part 2
Convert a given eight ASCII characters in the variable **STRING** to an 8-bit
binary number in the variable **NUMBER**. Clear the byte variable **ERROR** if all
the ASICC characters are either ASCII **“1”** or ASCII **“0”**; otherwise set **ERROR**
to all ones ***(0xFF)***.

For example:

|         |        | Test A       | Test B    |
|---------|--------|--------------|-----------|
| Input:  | STRING | 31('1')      | 31('1')   |
|         |        | 31('1')      | 31('1')   |
|         |        | 30('0')      | 30('0')   |
|         |        | 31('1')      | 31('1')   |
|         |        | 30('0')      | 30('0')   |
|         |        | 30('0')      | 37('7')   |
|         |        | 31('1')      | 31('1')   |
|         |        | 31('1')      | 31('1')   |
|         |        | 30('0')      | 30('0')   |
| Output: | NUMBER | D2(11010010) | 00        |
|         |        | 0(No Error)  | FF(Error) |

#### Part 3
Convert a given eight-digit packed binary-coded-decimal number in the
**BCDNUM** variable into a 32-bit number in a **NUMBER** variable.

For example:

|         |           |             |
|:-------:|:---------:|:-----------:|
|  Input: |   BCDNUM  |   92529679  |
|  Output:|   NUMBER  |   0x0583E409|



**Add necessary comments to your program for easy readability.**
**Add Directed Screenshots for the respective outputs.**

***no starter code will be provided***
