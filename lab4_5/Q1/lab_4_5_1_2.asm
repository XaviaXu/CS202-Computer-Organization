.data
	multi:.asciiz "*"
	equal:.asciiz"="
	space:.asciiz"\t"
	newline:.asciiz "\n"
	
.text
.globl print
print:	
	addi $sp,$sp,-8
	sw $v0,($sp)
	sw $a0,4($sp)
	mul $t0,$a0,$a1
	
	li $v0,1
	syscall
	
	la $a0,multi
	li $v0,4
	syscall
	
	move $a0,$a1
	li $v0,1
	syscall
	
	la $a0,equal
	li $v0,4
	syscall
	
	move $a0,$t0
	li $v0,1
	syscall
	
	la $a0,space
	li $v0,4
	syscall
	
	
	lw $a0,4($sp)
	bne $a0,$a1,skip
	la $a0,newline
	li $v0,4
	syscall
	
	
skip:	lw $v0,($sp)
	lw $a0,4($sp)
	addi $sp,$sp,8
	jr $ra
	
	
	
	
