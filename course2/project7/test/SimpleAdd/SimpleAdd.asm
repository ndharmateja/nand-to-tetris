
// push constant 7
// D = 7
@7
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 8
// D = 8
@8
D=A
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
