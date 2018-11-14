	@---------------------
	@
	@Authors: Gabriel Hernandez, Nick Moore
	@Assignment:PA6-2.s
	@Date:11.14.18
	@
	@Description:Code creates a function that performs integer division
	@	It takes two values, a and b passed as parameters,and returns
	@	a/b. 
	@	R0 holds a, R1 holds b, R0 holds the result
	@
	@--------------------
	.extern printf
        .global main
        .func main 		
main:		@	DO NOT TOUCH!
		PUSH	{LR}
		MOV	R0, #5
		MOV	R1, #9
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #9
		MOV	R1, #5
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #80
		MOV	R1, #7
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #19
		MOV	R1, #4
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #60
		MOV	R1, #12
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		POP	{PC}
		
		@---------------------
		@	div function.  Your code goes here!
		@---------------------
	
div:
		PUSH	{LR}		@ Leave this here
		MOV	R2, R1		@Moves R1 into R2
		MOV	R1, R0		@Moves R0 into R1
		MOV	R4, R2
		CMP	R4, R1,LSR #1
	div1:
		MOVLS 	R4, R4, LSL #1
		CMP	R4, R1, LSR#1
		BLS 	div1
		MOV	R3, #0
	div2:
		CMP	R1, R4
		SUBCS 	R1, R1, R4
		ADC	R3, R3, R3

		MOV 	R4, R4, LSR#1
		CMP 	R4, R2
		BHS 	div2
		MOV	R0, R3		@Moves R3 into R0
		@ Your code here
	
		POP	{PC} 	@ return statement
.data
out:	.asciz "%d\n"	@ String for printf
