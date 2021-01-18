.data
	int:.word 0
	
.text
	li $v0,5
	syscall
	sw $v0,int

	la $a0,int
	lw $a1,int
	lbu $t0,3($a0)
	li $t1,7
	bgt $t0,$t1,Lable	#negative
	la $a0,($a1)
	li $v0,1
	syscall
	j Exit
	
Lable:
	xori $a1,$a1,0xffffffff
	addi $a1,$a1,1
	la $a0,($a1)
	li $v0,1
	syscall
Exit:	
	li $v0,10
	syscall
