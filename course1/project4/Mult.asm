// Pseudo code:
// i = 0, RAM[2] = 0
// for(i=0; i<RAM[1]; i++) {
//     RAM[2] = RAM[2] + RAM[0];
// }

    // i = 0, RAM[2] = 0
    @i
    M=0
    @R2
    M=0

(LOOP)
    // Jump to END if i == RAM[1]
    @i
    D=M
    @R1
    D=D-M
    @END
    D;JGE

    // Add RAM[0] to RAM[2]
    @R0
    D=M
    @R2
    M=D+M

    // i++ and jump to LOOP
    @i
    M=M+1
    @LOOP
    0;JMP

(END)
    @END
    0;JMP