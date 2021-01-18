
.text
	li $t0,10
	li $v0,5
	syscall
	move $s0,$v0
	
	jal recur
	li $v0,10
	syscall
	
	
recur:	addi $sp,$sp,-8
	sw $ra,4($sp)
	sw $a0,($sp)
	bne $s0,$zero,L1
	
	addi $sp,$sp,8
	jr $ra
	
L1:	div $s0,$t0
	mflo $s0
	mfhi $a0
	li $v0,1
	syscall
	jal recur
	
	lw $a0,0($sp)
	lw $ra,4($sp)
	addi $sp,$sp,8
	jr $ra

