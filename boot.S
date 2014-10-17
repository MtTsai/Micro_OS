.code16					# using 16-bit mode

.text
	mov		%cs, %ax
	mov		%ax, %ds	# Here still work when data segment doesn't be set
	mov		%ax, %es
	call	DispStr		# call display string method
	jmp		.			# infinite loop

DispStr:
	mov		$BootMessage, %ax
	mov		%ax, %bp
	mov		$16, %cx
	mov		$0x1301, %ax
	mov		$0x00c, %bx
	mov		$0, %dl
	int		$0x10
	ret

BootMessage:
	.ascii	"Hello, OS world!"

	.org	510
	.word	0xaa55
