.data
	int:.word 0
.text	
	li $v0,5
	syscall
	sw $v0,int

	lw $t0,int
	add $t0,$t0,$t0	#2
	la $t1,0($t0)
	add $t0,$t0,$t0	#4
	add $t0,$t0,$t0	#8
	add $t0,$t1,$t0
	la $a0,0($t0)
	li $v0,1
	syscall
	
	li $v0,10
	syscall
