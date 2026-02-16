// Adds 1 + ... + 100

// sum = 0
@sum
M=0

// i = 1
@i
M=1

(LOOP)
// if i > 100 ir a END
@i
D=M
@100
D=D-A
@END
D;JGT

// sum = sum + i
@i
D=M
@sum
M=M+D

// i = i + 1
@i
M=M+1

@LOOP
0;JMP

(END)
@END
0;JMP
