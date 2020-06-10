		AREA myData, DATA, READWRITE
x		DCD  5	; local variable to be declared static & stored in memory
		AREA myCode, CODE, READONLY
		EXPORT __main						; __main and not _main as defined 
		ALIGN								; startup_stm32l1xx_md.s. lines 192,
		ENTRY								; 217, and 36
__main	PROC
		; local variable use. scope is really local
		BL myFunc	; r0 = 6
		BL myFunc	; r0 = 6
		BL myFunc	; r0 = 6
stop	B  stop
		ENDP
myFunc	PROC
		MOV r0, #5		; local variable stored in register whose value is lost 
		ADD r0, r0, #1	; after myFunc finishes (BX lr). therefore, it is always 
		BX  lr			; reinitialized when called again.
		ENDP
		; local variable declared static use
		BL myFunc1	; r0 = 6
		BL myFunc1	; r0 = 7
		BL myFunc1	; r0 = 8
stop1	B  stop1
		ENDP
myFunc1	PROC
		LDR r1, =x		; load address of x
		LDR r0, [r1]	; load value of x. by storing in memory, local static 
		ADD r0, r0, #1	; variable is initialized once only. initialization 
						; carried out at compile time not runtime.
		STR r0, [r1]	; save value of x to memory. x value is updated each time.
		BX  lr
		ENDP
		END
