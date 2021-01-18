.data
	start:.asciiz"please input the number:"
	arr:.asciiz"please input the array:\n"

.text
.globl main
main:
	la $a0,start
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	move $s0,$v0
	beq $s0,$0,exit
	
	sll $a0,$s0,2
	li $v0,9
	syscall
	move $s1,$v0
	move $s2,$v0
	
	la $a0,arr
	li $v0,4
	syscall
	add $t0,$0,$0
	
read:	li $v0,5
	syscall
	sw $v0,($s2)
	
	addi $s2,$s2,4
	addi $t0,$t0,1
	bne $t0,$s0,read
	
	addi $t0,$0,1	
	beq $t0,$s0,exit	#n==1 ÍË³ö
	
	addi $s3,$s2,-4
	move $t0,$0
	
out:	beq $t0,$s0,exit
	move $s2,$s1
sort:		
	lw $t1,($s2)
	lw $t2,4($s2)
	blt $t1,$t2,skip
	
	sw $t2,($s2)
	sw $t1,4($s2)
	
skip:	addi $s2,$s2,4
	bne $s2,$s3,sort
	

	addi $t0,$t0,1
	beq $s2,$s3,out
	

exit:	jal print
	li $v0,10
	syscall
	
	