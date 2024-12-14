
// push constant 111
// D = 111
@111
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 333
// D = 333
@333
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 888
// D = 888
@888
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// pop static 8
// SP--
@SP
M=M-1
// D = *SP
@SP
A=M
D=M
@StaticTest.8
M=D

// pop static 3
// SP--
@SP
M=M-1
// D = *SP
@SP
A=M
D=M
@StaticTest.3
M=D

// pop static 1
// SP--
@SP
M=M-1
// D = *SP
@SP
A=M
D=M
@StaticTest.1
M=D

// push static 3
@StaticTest.3
D=M
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push static 1
@StaticTest.1
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

// push static 8
@StaticTest.8
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
