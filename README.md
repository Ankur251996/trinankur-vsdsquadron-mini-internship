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

" R, I, S, B, U and J".
