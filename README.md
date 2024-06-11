
 # VSDSquadron

 ## TASK1

 RISC-V toolchain installation has been done successfully.
 Next,the task was to compile the C code, which calculates the sum from 1to n. For,this I used the leafpad tool and the command to open it is "leafpad sum1ton.c & ". After that, the code for sum from 1to n is compiled successfully. The snapshot below depicts the same for n=5 and 100. The command "./a.out" is used to display the output.
 
![VirtualBox_vsdworkshop_22_05_2024_19_13_31](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/6fcfd059-ab5f-46f8-8273-82831a650a92)

![VirtualBox_vsdworkshop_22_05_2024_19_16_34](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/356b3e75-9cd1-4941-9b34-6c380a388b0b)

![VirtualBox_vsdworkshop_22_05_2024_19_17_41](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/d09e4df3-e80a-48cd-9b8a-40528bbdd00f)

![VirtualBox_vsdworkshop_22_05_2024_19_19_25](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/e3056ff1-d320-4935-828c-5453b0bcbd02)

Now again compiling the same code with RISC-V compiler.For that we use the command "cat sum1ton.c". Here, we consider the case for n=100.

![VirtualBox_vsdworkshop_22_05_2024_19_21_16](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/29366a27-f1c8-4f71-b55c-496f4938ebc9)

Next, we create a .o file and observe no. of instructions for O1.

![VirtualBox_vsdworkshop_22_05_2024_19_30_11](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/ffb2614e-d3db-4f38-a0bd-2d3a692d6601)

Now, we get a large set of instructions in assembly language, using the command as depicted in the snapshot.

![VirtualBox_vsdworkshop_22_05_2024_21_08_44](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/9038f418-44e0-44eb-ab46-1f5743e7b127)

![VirtualBox_vsdworkshop_22_05_2024_19_34_49](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/01e10635-08ed-4634-8b35-15b808f11329)

Now we write a command "riscv64-unknown-elf-objdump -d sum1ton.o | less" to reduce this large set of assembly language instructions. After that we use the command "/main" as we are mainly concerned about the main,as this is the part where our c code lies, and then press n. we get 15 possible instructions for O1 as can be depicted from the snapshot.

![VirtualBox_vsdworkshop_22_05_2024_22_25_45](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/bb2cac95-7cad-4ec3-b728-6c27ee6c1991)

Also on verifying the result with the help of a programming calculator we get the no. of instructions as 15, for O1 and n=100.

Now, again we create a .o file and observe the no. of instructions for ofast, by following the same procedure as we did it for O1. So, we will find that the no. of instructions is reduced to 12 as can be depicted from the snapshot.

![VirtualBox_vsdworkshop_22_05_2024_22_47_06](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/4c7eac53-bf2b-4f29-9c8a-2545d308f94f)

Similarly,here also on verifying the result with the help of a programming calculator we get the no. of instructions as 12, for ofast and n=100.

Therefore, it is evident that no. of instructions is different for o1 and ofast i.e, 15 and 12, for n=100.

## TASK 2

We have to identify instruction type of all the given instructions with its exact 32 bits instruction code in the desired instruction type format.

### What is RISC-V?
- RISC-V is an open source instruction set architecture (ISA) that allows developers to develop processors for specific applications.
- RISC-V is based on reduced instruction set computer principles and is the fifth generation of processors built on this concept.
- RISC-V can also be understood as an alternative processor technology which is free and open, meaning that it does not require, one to purchase the license of RISC-V to use it,i.e. it is an open source platform.
### INSTRUCTIONS FORMAT IN RISC-V
The instructions format of a processor is the way in which machine language instructions are structured and organized for a processor to execute. It is made up of series of 0s and 1s, each containing information about the location and operation of data. There are six instruction format in RISC-V:
- R-format
- I-format
- S-format
- B-format
- U-format
- J-format

![word-image-1](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/99063392-23d4-4fc9-8e84-41cb8ac52314)

Let's discuss each of the instruction formats in detail with examples.

### 1. R-type instruction
In RV32, each instruction is of size 32 bits. In R-type instruction, R stands for register which means that operations are carried on the Registers and not on memory location. This instruction type is used to execute various arithmetic and logical operations. The entire 32 bits instruction is divided into six fields as shown below:

![326074559-4a17f03e-ae74-4809-a8d9-79924fb8b421](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/3402b3b1-2a52-46b8-9688-6b25badb956b)

- The first field in the instruction format is known as **opcode**, also referred as operation code. The opcode is of length 7 bits and is used to determine the type of instruction format.
- The next subfield is known as **rd** field which is referred as Destination Register. The rd field is of length 5 bits and is used to store the final result of operation.
- The next subfield is **func3** also referred as function 3. Here the '3' represents the size of this field. This field tells the detail about the operation, i.e., the type of the arithmetic or logical operation, that is performed.
- The next two subfields are the source registers, **rs1 and rs2** each of length 5 bits. These are mainly used to store and manipulate the data during the execution of instructions.
- The last subfield is **func7** also referred as function 7. Here 7 represents the size of the field. The function of func7 field is same as that of func3 field.
### 2. I-type instruction
In RV32, each instruction is of size 32 bits. In I-type instruction, I stands for immediate which means that operations use Registers and immediate value for their execution and are not related with memory location. This instruction type is used in immediate and load operations. The entire 32 bits instructions is divided into five fields as shown below:

![326074718-4a53f5fa-d55a-4308-8f93-a0f2f3aedba0](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/259f09ad-f5b6-4267-874b-64cdf1131d74)

- The first field in the instruction format is known as **opcode**, also referred as operation cofde. The opcode is of length seven bits and is used to determine the type of instruction format.
- The next subfield is known as **rd** field which is referred as Destination Register. The rd field is of length five bits and is used to store the final result of operation.
- The next subfield is **func3** also referred as function 3. Here the '3' represents the size of this field. This field tells the detail about the operation, i.e., the type of arithmetic and logical operations that is performed.
- The next subfield is the source registers, **rs1** of length five bits. It is mainly used to store and manipulate the data during the execution of instructions.
- The only difference between R-type and I-type is **rs2 and func7** field of R-type has been replaced by 12-bits signed immediate, **imm[11:0]**.
  
### 3. S-type instruction
In RV32, each instruction is of size 32 bits. In S-type instruction, S stand for store which means it is store type instruction that helps to store the value of register into the memory. Mainly, this instruction type is used for store operations. The entire 32 bits instruction is divided into six fields as shown below:

  ![326074837-fc9ddedc-4c99-4b6f-9765-c2e8c8e29302](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/731cdba2-3ba0-4f36-b43d-90ec0b56f4fa)

- The first field in the instruction format is known as **opcode**, also referred as operation cofde. The opcode is of length seven bits and is used to determine the type of instruction format.
- S-type instructions encode a 12-bit signed immediate, with the top seven bits **imm[11:5] in bits[31:25]** of the instruction and the lower five bits **imm[4:0] in bits[11:7]** of the instruction.
- S-type instruction doesn't have rd fields which states that this instructions are not used to write value to a register, but to write/store a value to a memory.
- The value to be stored is defined in **rs1** field and address to which we have to store this value is calculated using **rs1 and immediate** field. The width of the operation and types of instruction is defined by func3, it can be a word, half-word or byte.

### 4. B-type instruction
In RV32, each instruction is of size 32 bits. In B-type instruction, B stand for branching which means it is mainly used for branching based on certain conditions. The entire 32 bits instruction is divided into eight fields as shown below:

![326074920-14486f41-f3e4-4c4a-85b0-9acc56be3f46](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/4ac6450f-9026-4cc2-bda7-3946b1c75086)

- The first field in the instruction format is known as opcode, also referred as operation code. The opcode is of length seven bits and is used to determine the type of the instruction format.
- B-type instructions encode a 12-bit signed immediate, with the most significant bit **imm[12] in bit [31]** of the instruction, six bits **imm[10:5] in bits [25:30]** of the instruction, four bits **imm[4:1] in bits[11:8] and one bit **imm[11] on bit[7]**.
- There are two source registers **rs1 and rs2** on which various operations are performed based on certain conditions, and those conditions are defined by **func3** field.
- After performing operations on the source register based on the conditions, it is evaluated that if the condition is true, Program Counter value gets updated by ``PC= Present PC Value + Immediate value``, and if the condition is false then PC will be given as ``PC= Present PC value + 4 bytes``, which states that PC will move to next instruction set.
- RV32 instructions are word-alligned, which means that address is always defined in the multiple of 4 bytes.

### 5. U-type instruction
In RV32, each instruction is of size 32 bits. In U-type instruction, U stands for Upper Immediate instructions which means it is simply used to transfer the immediate data into the destination register. The entire 32-bits instruction is divided into 3 fields as shown below:

![326075039-4f3df58b-8c0c-45c6-ba39-a196547dd38f](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/d0e1cfae-d4b6-4a60-ac72-eadaa0ef8571)

- The first field in the instruction format is known as **opcode**, also referred as operation code. The opcode is of length seven bits and is used to determine the type of instruction format.
- The U-type instruction only consists of two instructions, i.e., `LUI` and `AUIPC`.
- For Example, lets take the instruction **lui rd, imm** and understand this instruction. `lui x15, 0x13579`:This instruction will be executed and the immediate value 0x13579 will be written in the MSB of the rdx15, and it will look like x15=0x13579000.

### 6. J-type instruction
In RV32, each instruction is of size 32 bits. In J-type instruction, J stands for jump, which means that this instruction format is used to implement jump type instruction. The entire 32 bits instruction is divided into six fields as shown below:

![326075098-5dc9a9be-4048-4a35-a99e-7b4a0075caa0](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/a3747770-0b81-469f-802d-0b1931372dc8)

- The first field in the instruction format is known as **opcode**, also referred as operation code. The opcode is of length seven bits and is used to determine the type of instruction format.
- The J-type instruction only consists of single instruction, `JAL`.
- J-type instruction encode 20 bits signed immediate which is divided into four fields.
- The J-type instructions are often used to perform jump to the desired memory location. The address of the desired memory location is defined in the instruction. These instructions are also used to implement loops.
  
### Now, let's analyse each instruction given to us one by one
`ADD r6, r2, r1`

- All the arithmetic and logical operations are performed using R-type instruction format, hence this instruction belongs to R-type instruction set.
- r6 is the destination register that will hold the sum of values stored in the register r2 and r1.
- Opcode for ADD = 0110011
- rd = r6 = 00110
- rs1 = r2 = 00010
- rs2 = r1 = 00001
- func3 = 000
- func7 = 0000000
  
## 32 bits instruction: `0000000_00001_00010_000_00110_0110011`  

`SUB r7, r1, r2`

- All the arithmetic and logical operations are performed using R-type instruction format, hence this instruction belongs to R-type instruction set.
- r7 is the destination register that will hold the difference of values stored in the register r1 and r2.
- Opcode for SUB = 0110011
- rd = r7 = 00111
- rs1 = r1 = 00001
- rs2 = r2 = 00010
- func3 = 000
- func7 = 0100000
  
## 32 bits instruction: `0100000_00010_00001_000_00111_0110011`  

`AND r8, r1, r3`

- All the arithmetic and logical operations are performed using R-type instruction format, hence this instruction belongs to R-type instruction set.
- r8 is the destination register that will hold the value of r1 and r3, means performing AND operation bit by bit.
- Opcode for AND = 0110011
- rd = r8 = 01000
- rs1 = r1 = 00001
- rs2 = r3 = 00011
- func3 = 111
- func7 = 0000000
  
## 32 bits instruction: `0000000_00011_00001_111_01000_0110011`  

`OR r9, r2, r5`

- All the arithmetic and logical operations are performed using R-type instruction format, hence this instruction belongs to R-type instruction set.
- r9 is the destination register that will hold the value of r2|r5, means performing OR operation bit by bit.
- Opcode for OR = 0110011
- rd = r9 = 01001
- rs1 = r2 = 00010
- rs2 = r5 = 00101
- func3 = 110
- func7 = 0000000
  
## 32 bits instruction: `0000000_00101_00010_110_01001_0110011`  

  `XOR r10, r1, r4`

- All the arithmetic and logical operations are performed using R-type instruction format, hence this instruction belongs to R-type instruction set.
- r10 is the destination register that will hold the value of r1^r4, means performing XOR operation bit by bit.
- Opcode for XOR = 0110011
- rd = r10 = 01010
- rs1 = r1 = 00001
- rs2 = r4 = 00100
- func3 = 100
- func7 = 0000000
  
## 32 bits instruction: `0000000_00100_00001_100_01010_0110011`  

  `SLT r11, r2, r4`

- Since the logical operations is performed on registers, hence this instruction belongs to R-type instruction set.
- r1 is the destination register that sets to 1, if r2 is less than r4, else 0 if r2 is greater than r4.
- Opcode for SLT = 0110011
- rd = r1 = 01011
- rs1 = r2 = 00010
- rs2 = r4 = 00100
- func3 = 010
- func7 = 0000000
  
## 32 bits instruction: `0000000_00100_00010_010_01011_0110011`  

`ADDI r12, r4, 5`

- In this instruction ADD means Addition, I means Immediate, therefore ADDI means Addition with Immediate, hence this instruction belongs to I-type instruction set.
- r12 is the destination register that will store the value of r5 sum-up with the immediate value 5.
- Opcode for ADDI = 0010011
- rd = r12 = 01100
- rs1 = r4 = 00100
- imm[11:0] = 5 = 000000000101
- func3 = 100
- func7 = 0000000
  
## 32 bits instruction: `000000000101_00100_000_01100_0010011`  

`SW r3, r1, 2`

- In this instruction SW means store word, hence this instruction belongs to S-type instruction set.
- r3 is the source . This instruction will store the value located in register r3 at the address obtained by adding the immediate address 2 with the address located in register r1.
- Opcode for SW = 0100011
- rs2 = r3 = 00011
- rs1 = r1 = 00001
- imm[11:0]= 2 = 000000000010
- func3 = 010
  
## 32 bits instruction: `0000000_00011_00001_010_00010_0100011`  

`SRL r16, r14, r2`

- SRL means Logical Shift Right and since the operation is performed on registers, this instruction belongs to R-type instruction set.
- r16 is the destination register in which the value stored in r14 will be written after performing logical right shift based on the number stored in r2.
- Opcode for SRL = 0110011
- rd = r16 = 10000
- rs1 = r14 = 01110
- rs2 = r2 = 00010
- func3 = 101
- func7 = 0000000
  
## 32 bits instruction: `0000000_00010_01110_101_10000_0110011`  

`BNE r0, r1, 20`

- BNE is a branching instruction(B-type) based on conditions. Here BNE specifies the condition that the value stored in r0!= (is not equal to) the value stored in r1. If the condition becomes true, Program counter will be updated by PC +20, else PC + 4 for next instruction.
- Opcode for BNE = 1100011
- rs1 = r0 = 00000
- rs2 = r1 = 00001
- imm[12:1]= 20 = 000000010100
- func3 = 001
  
## 32 bits instruction: `0_000001_00001_00000_001_0100_0_1100011`  

`BEQ r0, r0, r15`

- BEQ is a branching instruction (B-type) based on conditions. Here BEQ specifies the condition that the value stored in r0==(is equal to) the value stored in r0. If the condition becomes true, Program Counter will be updated by PC +15, else PC + 4 for next instruction.
- Opcode for BEQ = 1100011
- rs1 = r0 = 00000
- rs2 = r0 = 00000
- imm[12:1] = 000000001111
- func3 = 000
  
## 32 bits instruction: `0_000000_00000_00000_000_1111_0_1100011`  

`LW r13, r1, 2`

- LW stands for Load Word. Word is equal to 32 bits or 4 bytes. Since there is an immediate value given in the instruction which helps to calculate the address of memory from where we have to fetch the data, hence this instruction belongs to I-type.
- r13 is the destination register that will hold the value fetched from the memory location calculated by using(address value stored in r1 + immediate value)
- Opcode for LW = 0000011
- rd = r13 = 01101
- rs1 = r1 = 00001
- imm[11:0] = 000000000010
- func3 = 010
  
## 32 bits instruction: `000000000010_00001_010_01101_0000011`  

`SLL r15, r1, r2`

- SLL means Logical Shift and since the operation is performed on registers, this instruction belongs to R-type instruction set.
- r15 is the destination register, in which the value stored in r1 will be written after performing logical left shift based on the number stored in r2.
- Opcode for SLL = 0110011
- rd = r15 = 01111
- rs1 = r1 = 00001
- rs2 = r2 =00010
- func3 = 001
- func7 = 0000000
  
## 32 bits instruction: `0000000_00010_00001_001_01111_0110011`  


### TASK 3

 
   
The third task is to use the RISC-V Core(Verilog netlist and testbench) and perform functional simulation experiment and analyse the waveform.

We will use the verilog code and testbench from the given GitHub repository : https://github.com/vinayrayapati/rv32i.git

## Steps to follow :

1. We clone the above mentioned repository using the command : 

   ``git clone https://github.com/vinayrayapati/iiitb_rv32i``

2. Then we go to the ``iiitb_rv32i`` using the command :

   ``cd iiitb_rv32i``

We can observe that the instructions in verilog code are hardcoded by the designer and thus we observe a difference in the 32-bit instruction pattern between the ones we got in **Task 2** and the latter.Same goes for the Hex codes as well.

![Hardcoded instructions](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/7485062c-a8a1-4743-af9a-dc4690abbedb)


### Difference between Standard RISC-V instructions and Hardcoded instructions :

|                  	| Hardcoded Instructions 	| Standard RISC-V Instructions 	|
|:----------------:	|:----------------------:	|:----------------------------:	|
|  ADD r6, r2, r1  	|      32'h02208300      	|         32'h00110333         	|
|  SUB r7, r1, r2  	|      32'h02209380      	|         32'h202083B3         	|
|  AND r8, r1, r3  	|      32'h0230a400      	|         32'h0030F433         	|
|   OR r9, r2, r5  	|      32'h02513480      	|         32'h005164B3         	|
|  XOR r10, r1, r4 	|      32'h0240c500      	|         32'h0040C533         	|
|  SLT r11, r2, r4 	|      32'h02415580      	|         32'h004125B3         	|
|  ADDI r12, r4, 5 	|      32'h00520600      	|         32'h00520613         	|
|   SW r3, r1, 2   	|      32'h00209181      	|         32'h0030A123         	|
| SRL r16, r14, r2 	|      32'h00271803      	|         32'h00275833         	|
|  BNE r0, r1, 20  	|      32'h01409002      	|         32'h00101A63         	|
|  BEQ r0, r0, 15  	|      32'h00f00002      	|         32'h000007E3         	|
|   LW r13, r1, 2  	|      32'h00208681      	|         32'h0020A683         	|
|  SLL r15, r1, r2 	|      32'h00208783      	|         32'h002097B3         	|

3. We run and simulate the verilog code using the commands :  

   ``iverilog -o iiitb_rv32i iiitb_rv32i.v iiitb_rv32i_tb.v``

   ``./iiitb_rv32i``

  A dumpfile **iiitb_rv32i.vcd** gets created.

4. Finally we use the command ``gtkwave iiitb_rv32i.vcd`` to observe the ouput waveform using gtkwave.

### Observing the output waveform of executed instructions:

Following are the waveforms starting from top to bottom : 

- Clock
- Instruction code
- Input register A
- Input register B
- Output Waveform 

``Note:The **output waveform** and the **instruction code waveform** are delayed by one clock cycle wrt to the input registers waveform.``

1. ``add r6, r2, r1`` 

![1 ADD](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/65d3dd49-2bf5-492e-939d-98c2465c68a7)

2. ``sub r7, r1, r2``

![2 SUB](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/f3d56c01-4830-4861-887c-4eab4d38af22)

3. ``and r8, r1, r3``

![3 AND](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/03249df1-65b5-4374-8cda-31450a340ae2)

4.  ``or r9, r2, r5``

![4 OR](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/0bf56d29-23a3-4aef-81e1-61b514619e06)

5.  ``xor r10, r1, r4``

![5 XOR](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/273c4601-a431-48e0-9ed8-12221dc25e55)

6.  ``slt r11, r2, r4``

![6 SLT](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/eff0036c-ee8c-4dd3-b88a-5ce28d0838e6)

7.  ``addi r12, r4, 5``

![7 ADDI](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/c4cf9542-bd09-4297-a2be-135140cb635b)

8.  ``sw r3, r1, 2``

![8 SW](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/5faedd5e-c485-470d-9528-708e26e638d5)

9.  ``lw r13, r1, 2``

![9 LW](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/f7e3d7d5-b99b-4c1a-868c-88a28e51c675)

10. ``beq r0, r0, 15``

![10 BEQ](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/34c8f44a-90c5-4540-a3e7-e8283e0650f7)

11. ``add r14, r2, r2``

![11 ADD](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/2cb8c687-c605-4aa2-b6f4-13352a354059)

Thus Task 3 is successfully performed.

### TASK 4

### BCD-to-seven-segment decimal display from 0 to 9

### Overview

A seven-segment indicator is used for displaying any one of the decimal digits 0 through 9. Usually, the decimal digit is available in BCD. The code for BCD-to-seven-segment accepts a decimal digit in BCD and generates the corresponding seven segment code. The circuit connections necessary between the VSD SquadronMini and the display is shown in the figure below. 

### Components Required for building the application

- CH32V003X
- Seven-segment Display 5161AS
- Power Supply
- Bread Board
- Jumper Wires

### Circuit Connection for BCD-to-seven-segment decimal display from 0 to 9

The Pins 3,5,4,7,0,1,2 of C-Port acts as the output pins of the VSD SquadronMini and are connected to segments:a,b,c,d,e,f,g and as we are using a common cathode seven segment display,so the common is grounded.

### Pinout Diagram for BCD-to-seven-segment decimal display from 0 to 9

![Screenshot 2024-06-11 221630](https://github.com/Ankur251996/trinankur-vsdsquadron-mini-internship/assets/170226117/690d1d7e-5bbc-44f3-ad62-a5928abd7460)

### Table for Pin Connection:

|                  	|  seven-segment display  |          CH32V003x 	          |
|:----------------:	|:----------------------:	|:----------------------------:	|
|                  	|      Common    	        |            GND        	       |
|   	               |       a      	          |            PC3        	       |
|    	              |       b     	           |            PC5         	      |
|     	             |       c      	          |            PC4        	       |
|  	                |       d      	          |            PC7        	       |
|  	                |       e               	 |            PC0        	       |
|  	                |       f               	 |            PC1        	       |
|  	                |       g               	 |            PC2        	       |

### Code for the BCD-to-seven-segment decimal display from 0 to 9


#include <ch32v00x.h>
#include <debug.h>

void GPIO_Config(void)
{
    GPIO_InitTypeDef GPIO_InitStructure = {0};
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC, ENABLE);
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_3 | GPIO_Pin_5 | GPIO_Pin_4 | GPIO_Pin_7 | GPIO_Pin_0 | GPIO_Pin_1 | GPIO_Pin_2;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOC, &GPIO_InitStructure);
}

int main(void)
{

    NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
    SystemCoreClockUpdate();
    Delay_Init();
    GPIO_Config();

    while(1)
    {
        GPIO_SetBits(GPIOC, GPIO_Pin_3 );
        GPIO_SetBits(GPIOC, GPIO_Pin_5 );
        GPIO_SetBits(GPIOC, GPIO_Pin_4 );
        GPIO_SetBits(GPIOC, GPIO_Pin_7 );
        GPIO_SetBits(GPIOC, GPIO_Pin_0 );
        GPIO_SetBits(GPIOC, GPIO_Pin_1 );
        GPIO_ResetBits(GPIOC, GPIO_Pin_2 );
        
        Delay_Ms(2000);

        GPIO_ResetBits(GPIOC, GPIO_Pin_3 );
        GPIO_SetBits(GPIOC, GPIO_Pin_5 );
        GPIO_SetBits(GPIOC, GPIO_Pin_4 );
        GPIO_ResetBits(GPIOC, GPIO_Pin_7 );
        GPIO_ResetBits(GPIOC, GPIO_Pin_0 );
        GPIO_ResetBits(GPIOC, GPIO_Pin_1 );
        GPIO_ResetBits(GPIOC, GPIO_Pin_2 );
        
        Delay_Ms(2000);

        GPIO_SetBits(GPIOC, GPIO_Pin_3 );
        GPIO_SetBits(GPIOC, GPIO_Pin_5 );
        GPIO_ResetBits(GPIOC, GPIO_Pin_4 );
        GPIO_SetBits(GPIOC, GPIO_Pin_7 );
        GPIO_SetBits(GPIOC, GPIO_Pin_0 );
        GPIO_ResetBits(GPIOC, GPIO_Pin_1 );
        GPIO_SetBits(GPIOC, GPIO_Pin_2 );
        
        Delay_Ms(2000);

        GPIO_SetBits(GPIOC, GPIO_Pin_3 );
        GPIO_SetBits(GPIOC, GPIO_Pin_5 );
        GPIO_SetBits(GPIOC, GPIO_Pin_4 );
        GPIO_SetBits(GPIOC, GPIO_Pin_7 );
        GPIO_ResetBits(GPIOC, GPIO_Pin_0 );
        GPIO_ResetBits(GPIOC, GPIO_Pin_1 );
        GPIO_SetBits(GPIOC, GPIO_Pin_2 );
        
        Delay_Ms(2000);

        GPIO_ResetBits(GPIOC, GPIO_Pin_3 );
        GPIO_SetBits(GPIOC, GPIO_Pin_5 );
        GPIO_SetBits(GPIOC, GPIO_Pin_4 );
        GPIO_ResetBits(GPIOC, GPIO_Pin_7 );
        GPIO_ResetBits(GPIOC, GPIO_Pin_0 );
        GPIO_SetBits(GPIOC, GPIO_Pin_1 );
        GPIO_SetBits(GPIOC, GPIO_Pin_2 );
        
        Delay_Ms(2000);

        GPIO_SetBits(GPIOC, GPIO_Pin_3 );
        GPIO_ResetBits(GPIOC, GPIO_Pin_5 );
        GPIO_SetBits(GPIOC, GPIO_Pin_4 );
        GPIO_SetBits(GPIOC, GPIO_Pin_7 );
        GPIO_ResetBits(GPIOC, GPIO_Pin_0 );
        GPIO_SetBits(GPIOC, GPIO_Pin_1 );
        GPIO_SetBits(GPIOC, GPIO_Pin_2 );
        
        Delay_Ms(2000);

        GPIO_SetBits(GPIOC, GPIO_Pin_3 );
        GPIO_ResetBits(GPIOC, GPIO_Pin_5 );
        GPIO_SetBits(GPIOC, GPIO_Pin_4 );
        GPIO_SetBits(GPIOC, GPIO_Pin_7 );
        GPIO_SetBits(GPIOC, GPIO_Pin_0 );
        GPIO_SetBits(GPIOC, GPIO_Pin_1 );
        GPIO_SetBits(GPIOC, GPIO_Pin_2 );
        
        Delay_Ms(2000);

        GPIO_SetBits(GPIOC, GPIO_Pin_3 );
        GPIO_SetBits(GPIOC, GPIO_Pin_5 );
        GPIO_SetBits(GPIOC, GPIO_Pin_4 );
        GPIO_ResetBits(GPIOC, GPIO_Pin_7 );
        GPIO_ResetBits(GPIOC, GPIO_Pin_0 );
        GPIO_ResetBits(GPIOC, GPIO_Pin_1 );
        GPIO_ResetBits(GPIOC, GPIO_Pin_2 );
        
        Delay_Ms(2000);

        GPIO_SetBits(GPIOC, GPIO_Pin_3 );
        GPIO_SetBits(GPIOC, GPIO_Pin_5 );
        GPIO_SetBits(GPIOC, GPIO_Pin_4 );
        GPIO_SetBits(GPIOC, GPIO_Pin_7 );
        GPIO_SetBits(GPIOC, GPIO_Pin_0 );
        GPIO_SetBits(GPIOC, GPIO_Pin_1 );
        GPIO_SetBits(GPIOC, GPIO_Pin_2 );
        
        Delay_Ms(2000);

        GPIO_SetBits(GPIOC, GPIO_Pin_3 );
        GPIO_SetBits(GPIOC, GPIO_Pin_5 );
        GPIO_SetBits(GPIOC, GPIO_Pin_4 );
        GPIO_SetBits(GPIOC, GPIO_Pin_7 );
        GPIO_ResetBits(GPIOC,  GPIO_Pin_0 );
        GPIO_SetBits(GPIOC, GPIO_Pin_1 );
        GPIO_SetBits(GPIOC, GPIO_Pin_2 );
        
        Delay_Ms(2000);
    }
}

### Video of the Project Implemented

https://drive.google.com/file/d/1eZplKa9YxzAY5oVP-sQyj-Em8BQY8TUJ/view?usp=drivesdk

