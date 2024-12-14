
// push constant 3030
// D = 3030
@3030
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// pop pointer 0
// SP--
@SP
M=M-1
// THIS = *SP
// D = *SP
@SP
A=M
D=M
// THIS = D
@THIS
M=D

// push constant 3040
// D = 3040
@3040
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// pop pointer 1
// SP--
@SP
M=M-1
// THAT = *SP
// D = *SP
@SP
A=M
D=M
// THAT = D
@THAT
M=D

// push constant 32
// D = 32
@32
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// pop this 2
// addr = THIS + 2
// D = THIS + 2
@THIS
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

// push constant 46
// D = 46
@46
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// pop that 6
// addr = THAT + 6
// D = THAT + 6
@THAT
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

// push pointer 0
// *SP = THIS
// D = THIS
@THIS
D=M
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push pointer 1
// *SP = THAT
// D = THAT
@THAT
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

// push this 2
// addr = THIS + 2
// D = THIS + 2
@THIS
D=M
@2
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

// push that 6
// addr = THAT + 6
// D = THAT + 6
@THAT
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
