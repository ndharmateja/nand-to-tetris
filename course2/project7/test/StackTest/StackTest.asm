
// push constant 17
// D = 17
@17
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 17
// D = 17
@17
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// eq
// SP--
@SP
M=M-1
// D = *SP
@SP
A=M
D=M
// D = -D
D=-D
// SP--
@SP
M=M-1
// D = D + *SP
@SP
A=M
D=D+M
@eq_0
D;JEQ
// D = 0
@0
D=A
// jump to end label
@end_0
0;JMP
(eq_0)
// D = 0
@0
D=A
D=D-1
(end_0)
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 17
// D = 17
@17
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 16
// D = 16
@16
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// eq
// SP--
@SP
M=M-1
// D = *SP
@SP
A=M
D=M
// D = -D
D=-D
// SP--
@SP
M=M-1
// D = D + *SP
@SP
A=M
D=D+M
@eq_1
D;JEQ
// D = 0
@0
D=A
// jump to end label
@end_1
0;JMP
(eq_1)
// D = 0
@0
D=A
D=D-1
(end_1)
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 16
// D = 16
@16
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 17
// D = 17
@17
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// eq
// SP--
@SP
M=M-1
// D = *SP
@SP
A=M
D=M
// D = -D
D=-D
// SP--
@SP
M=M-1
// D = D + *SP
@SP
A=M
D=D+M
@eq_2
D;JEQ
// D = 0
@0
D=A
// jump to end label
@end_2
0;JMP
(eq_2)
// D = 0
@0
D=A
D=D-1
(end_2)
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 892
// D = 892
@892
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 891
// D = 891
@891
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// lt
// SP--
@SP
M=M-1
// D = *SP
@SP
A=M
D=M
// D = -D
D=-D
// SP--
@SP
M=M-1
// D = D + *SP
@SP
A=M
D=D+M
@lt_3
D;JLT
// D = 0
@0
D=A
// jump to end label
@end_3
0;JMP
(lt_3)
// D = 0
@0
D=A
D=D-1
(end_3)
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 891
// D = 891
@891
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 892
// D = 892
@892
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// lt
// SP--
@SP
M=M-1
// D = *SP
@SP
A=M
D=M
// D = -D
D=-D
// SP--
@SP
M=M-1
// D = D + *SP
@SP
A=M
D=D+M
@lt_4
D;JLT
// D = 0
@0
D=A
// jump to end label
@end_4
0;JMP
(lt_4)
// D = 0
@0
D=A
D=D-1
(end_4)
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 891
// D = 891
@891
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 891
// D = 891
@891
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// lt
// SP--
@SP
M=M-1
// D = *SP
@SP
A=M
D=M
// D = -D
D=-D
// SP--
@SP
M=M-1
// D = D + *SP
@SP
A=M
D=D+M
@lt_5
D;JLT
// D = 0
@0
D=A
// jump to end label
@end_5
0;JMP
(lt_5)
// D = 0
@0
D=A
D=D-1
(end_5)
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 32767
// D = 32767
@32767
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 32766
// D = 32766
@32766
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// gt
// SP--
@SP
M=M-1
// D = *SP
@SP
A=M
D=M
// D = -D
D=-D
// SP--
@SP
M=M-1
// D = D + *SP
@SP
A=M
D=D+M
@gt_6
D;JGT
// D = 0
@0
D=A
// jump to end label
@end_6
0;JMP
(gt_6)
// D = 0
@0
D=A
D=D-1
(end_6)
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 32766
// D = 32766
@32766
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 32767
// D = 32767
@32767
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// gt
// SP--
@SP
M=M-1
// D = *SP
@SP
A=M
D=M
// D = -D
D=-D
// SP--
@SP
M=M-1
// D = D + *SP
@SP
A=M
D=D+M
@gt_7
D;JGT
// D = 0
@0
D=A
// jump to end label
@end_7
0;JMP
(gt_7)
// D = 0
@0
D=A
D=D-1
(end_7)
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 32766
// D = 32766
@32766
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 32766
// D = 32766
@32766
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// gt
// SP--
@SP
M=M-1
// D = *SP
@SP
A=M
D=M
// D = -D
D=-D
// SP--
@SP
M=M-1
// D = D + *SP
@SP
A=M
D=D+M
@gt_8
D;JGT
// D = 0
@0
D=A
// jump to end label
@end_8
0;JMP
(gt_8)
// D = 0
@0
D=A
D=D-1
(end_8)
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 57
// D = 57
@57
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 31
// D = 31
@31
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 53
// D = 53
@53
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

// push constant 112
// D = 112
@112
D=A
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
// D = -D
D=-D
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

// neg
// SP--
@SP
M=M-1
// D = *SP
@SP
A=M
D=M
// D = -D
D=-D
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// and
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
// D = D & *SP
@SP
A=M
D=D&M
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// push constant 82
// D = 82
@82
D=A
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// or
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
// D = D | *SP
@SP
A=M
D=D|M
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1

// not
// SP--
@SP
M=M-1
// D = *SP
@SP
A=M
D=M
// D = !D
D=!D
// *SP = D
@SP
A=M
M=D
// SP++
@SP
M=M+1
