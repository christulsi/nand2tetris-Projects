// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[3], respectively.)

// Put your code here.

// x=R0
// y=R1
// R2=0
// while(x > 0) {
// R2 += y
// x--
// }
	
	//x=R0
	@R0		
		D=M
	@x
		M=D

	//y=R2
	@R1
		D=M
	@y
		M=D

	//R2=0	
	@0
		D=A
	@R2
		M=D

	(WHILE)		//begin loop

		//begin condition
		@x	
		 D=M
		@END
		 D;JLE	//if x <= 0 go to (jump) END
		//end condition

		// begin body of loop
		@y
		D=M	// D = y
		@R2
		M=D+M	// sum = sum + y
		@1
		D=A	// D = 1
		@x
		M=M-D	// x = x - 1	
		// end body of loop
		
		@WHILE
		0;JMP // jump to loop start
	
	(END)	
		@END
		0;JMP // Infinite loop (program end)
