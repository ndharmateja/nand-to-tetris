// Pseudo code:
// x = RAM[0]
// y = RAM[1]
// i = 0, product = 0
// for(i=0; i<y; i++) {
//     product = product + x;
// }
// RAM[2] = product

    // x = RAM[0]
    @R0
    D=M
    @x
    M=D

    // y = RAM[1]
    @R1
    D=M
    @y
    M=D

    // i = 0, product = 0
    @i
    M=0
    @product
    M=0

(LOOP)
    // Jump to LOOPEND if i == n
    @i
    D=M
    @y
    D=D-M
    @LOOPEND
    D;JGE

    // Add x to product
    @x
    D=M
    @product
    M=D+M

    // i++ and jump to LOOP
    @i
    M=M+1
    @LOOP
    0;JMP
(LOOPEND)

    @product
    D=M
    @R2
    M=D

(END)
    @END
    0;JMP