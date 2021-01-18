.data
	space:.asciiz"\n"
	alar:.asciiz"The array is:\n"
.text
.globl print
print:
	beq $s0,$0,exit
	la $a0,alar
	li $v0,4
	syscall
	
	move $t0,$0	
loop:	beq $t0,$s0,exit	
	lw $a0,($s1)
	li $v0,1
	syscall
	la $a0,space
	li $v0,4
	syscall
	addi $s1,$s1,4
	addi $t0,$t0,1
	j loop	
	
exit:	jr $ra	
	
	
	
	
	
	