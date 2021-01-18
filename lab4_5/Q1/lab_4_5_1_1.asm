.data
.text
.globl main
main:
	li $a0 1	#a
	li $a1 0	#b
	li $a2 10

for1:	beq $a0,$a2,exit
	jal for2
	addi $a0,$a0,1
	move $a1,$zero
	j for1

for2:	
	addi $a1,$a1,1
	addi $sp,$sp,-4
	sw $ra,($sp)
	jal print
	lw $ra,($sp)
	addi $sp,$sp,4
		
	bne $a0,$a1,for2

next:	jr $ra
exit:	li $v0,10
	syscall
