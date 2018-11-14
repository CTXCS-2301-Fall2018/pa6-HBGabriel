	@---------------------
	@		
	@Authors: Gabriel Hernandez, Nick Moore
	@Assignment:PA6-1.s
	@Date:11.14.18
	@
	@Description:Code  will use the provided function pow to
	@	compute a^b - 3a. The result is in R4 after the program
	@	completes.
	@	R0 holds a, R1 holds b, R4 holds the result	
	@	
	@---------------------
	
	.extern printf
	.global	main
	.func main
main:	PUSH {LR}
	@	Your code goes here
	LDR	R0, =a		@loads address a into R0
	LDR	R0, [R0]	@loads contents of a into R0
	LDR	R1, =b		@loads address b into R1
	LDR	R1, [R1]	@loads contents of b into R1
	
	MOV	R4, R0		@moves a into R4
	BL	pow		@calls function pow
	
	MOV	R5, #3		@moves 3 into R5
	MUL	R4,R5,R4	@Computes 3a stores into R4
	SUB	R4, R0,R4	@computes a^b-3a stores into R4

	@ Code to print your answer.  DO NOT CHANGE!
	LDR	R0, =out
	MOV	R1, R4
	BL 	printf
	POP	{PC}

	@---------------------
	@  pow function.  DO NOT CHANGE!
	@---------------------
pow:	PUSH		{LR}
	PUSH		{R4-R6}
	MOV		R4, R1
	MOV		R5, #1
loop:	CMP		R4, #0
	BEQ		exit
	MUL		R5, R0, R5
	SUB		R4, R4, #1
	BAL		loop
exit:	MOV		R0, R5
	POP		{R4-R6}
	POP		{PC}

.data
a:	.word	3
b:	.word	4
out:	.asciz "Answer: %d\n"
