
// push constant 10
// D = 10
@10
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// pop local 0
// addr = LCL + 0
// D = LCL + 0
@LCL
D=M
@0
D=D+A
// addr = D
@addr
M=D
// SP--
@SP
M=M-1
// *addr = *SP
// D = *SP
@SP
A=M
D=M
// *addr = D
@addr
A=M
M=D

// push constant 21
// D = 21
@21
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 22
// D = 22
@22
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// pop argument 2
// addr = ARG + 2
// D = ARG + 2
@ARG
D=M
@2
D=D+A
// addr = D
@addr
M=D
// SP--
@SP
M=M-1
// *addr = *SP
// D = *SP
@SP
A=M
D=M
// *addr = D
@addr
A=M
M=D

// pop argument 1
// addr = ARG + 1
// D = ARG + 1
@ARG
D=M
@1
D=D+A
// addr = D
@addr
M=D
// SP--
@SP
M=M-1
// *addr = *SP
// D = *SP
@SP
A=M
D=M
// *addr = D
@addr
A=M
M=D

// push constant 36
// D = 36
@36
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// pop this 6
// addr = THIS + 6
// D = THIS + 6
@THIS
D=M
@6
D=D+A
// addr = D
@addr
M=D
// SP--
@SP
M=M-1
// *addr = *SP
// D = *SP
@SP
A=M
D=M
// *addr = D
@addr
A=M
M=D

// push constant 42
// D = 42
@42
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 45
// D = 45
@45
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// pop that 5
// addr = THAT + 5
// D = THAT + 5
@THAT
D=M
@5
D=D+A
// addr = D
@addr
M=D
// SP--
@SP
M=M-1
// *addr = *SP
// D = *SP
@SP
A=M
D=M
// *addr = D
@addr
A=M
M=D

// pop that 2
// addr = THAT + 2
// D = THAT + 2
@THAT
D=M
@2
D=D+A
// addr = D
@addr
M=D
// SP--
@SP
M=M-1
// *addr = *SP
// D = *SP
@SP
A=M
D=M
// *addr = D
@addr
A=M
M=D

// push constant 510
// D = 510
@510
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// pop temp 6
// addr = R5 + 6
// D = R5 + 6
@R5
D=A
@6
D=D+A
// addr = D
@addr
M=D
// SP--
@SP
M=M-1
// *addr = *SP
// D = *SP
@SP
A=M
D=M
// *addr = D
@addr
A=M
M=D

// push local 0
// addr = LCL + 0
// D = LCL + 0
@LCL
D=M
@0
D=D+A
// addr = D
@addr
M=D
// *SP = *addr
// D = *addr
@addr
A=M
D=M
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push that 5
// addr = THAT + 5
// D = THAT + 5
@THAT
D=M
@5
D=D+A
// addr = D
@addr
M=D
// *SP = *addr
// D = *addr
@addr
A=M
D=M
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// add
// SP--
@SP
M=M-1
// D = *SP
@SP
A=M
D=M
// SP--
@SP
M=M-1
// D = D + *SP
@SP
A=M
D=D+M
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push argument 1
// addr = ARG + 1
// D = ARG + 1
@ARG
D=M
@1
D=D+A
// addr = D
@addr
M=D
// *SP = *addr
// D = *addr
@addr
A=M
D=M
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// sub
// SP--
@SP
M=M-1
// D = *SP
@SP
A=M
D=M
// SP--
@SP
M=M-1
D=-D
// D = D + *SP
@SP
A=M
D=D+M
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push this 6
// addr = THIS + 6
// D = THIS + 6
@THIS
D=M
@6
D=D+A
// addr = D
@addr
M=D
// *SP = *addr
// D = *addr
@addr
A=M
D=M
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push this 6
// addr = THIS + 6
// D = THIS + 6
@THIS
D=M
@6
D=D+A
// addr = D
@addr
M=D
// *SP = *addr
// D = *addr
@addr
A=M
D=M
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// add
// SP--
@SP
M=M-1
// D = *SP
@SP
A=M
D=M
// SP--
@SP
M=M-1
// D = D + *SP
@SP
A=M
D=D+M
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// sub
// SP--
@SP
M=M-1
// D = *SP
@SP
A=M
D=M
// SP--
@SP
M=M-1
D=-D
// D = D + *SP
@SP
A=M
D=D+M
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push temp 6
// addr = R5 + 6
// D = R5 + 6
@R5
D=A
@6
D=D+A
// addr = D
@addr
M=D
// *SP = *addr
// D = *addr
@addr
A=M
D=M
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// add
// SP--
@SP
M=M-1
// D = *SP
@SP
A=M
D=M
// SP--
@SP
M=M-1
// D = D + *SP
@SP
A=M
D=D+M
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1
