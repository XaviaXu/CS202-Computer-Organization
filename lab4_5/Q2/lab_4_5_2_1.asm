
.text
	li $v0,5,
	syscall
	move $s0,$v0
	li $t0,10
	
loop:	
	div $s0,$t0
	mflo $s0
	mfhi $a0
	li $v0,1
	syscall
	bne $s0,$zero,loop	
	
	li $v0,10
	syscall

