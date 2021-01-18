.data 
	int:.word 0
	big:.asciiz "Big-endian:"
	small:.asciiz "\nSmall-endian:"
.text 	
	li $v0,5
	syscall
	sw $v0,int
	
	la $a0,big
	li $v0,4
	syscall
	
	la $t0,int
	lbu $t1,0($t0)
	la $a0,($t1)
	li $v0,34
	syscall
	lbu $t1,1($t0)
	la $a0,($t1)
	li $v0,34
	syscall
	lbu $t1,2($t0)
	la $a0,($t1)
	li $v0,34
	syscall
	lbu $t1,3($t0)
	la $a0,($t1)
	li $v0,34
	syscall
	
	la $a0,small
	li $v0,4
	syscall
	
	lbu $t1,3($t0)
	la $a0,($t1)
	li $v0,34
	syscall
	lbu $t1,2($t0)
	la $a0,($t1)
	li $v0,34
	syscall
	lbu $t1,1($t0)
	la $a0,($t1)
	li $v0,34
	syscall
	lbu $t1,0($t0)
	la $a0,($t1)
	li $v0,34
	syscall
	
	li $v0,10
	syscall
	
	
	
