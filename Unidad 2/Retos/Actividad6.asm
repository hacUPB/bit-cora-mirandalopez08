@100
D=A
@ARR
M=D

// arr[0] = 11
@11
D=A
@100
M=D

// arr[1] = 233
@233
D=A
@101
M=D

// arr[2] = 23
@23
D=A
@102
M=D

// arr[3] = 77
@77
D=A
@103
M=D

// arr[4] = 112
@112
D=A
@104
M=D

// arr[5] = 61
@61
D=A
@105
M=D

// arr[6] = 67
@67
D=A
@106
M=D

// arr[7] = 98
@98
D=A
@107
M=D

// arr[8] = 900
@900
D=A
@108
M=D

// arr[9] = 810
@810
D=A
@109
M=D


// sum = 0
@sum
M=0

// j = 0
@j
M=0

(LOOP)

// if j >= 10 goto END
@j
D=M
@10
D=D-A
@END
D;JGE


@ARR
D=M        
@j
A=D+M      
D=M       

@sum
M=M+D

@j
M=M+1

@LOOP
0;JMP

(END)
@END
0;JMP
