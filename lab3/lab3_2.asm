.data
	int:.word 0
	odd: .word 0x55555555	#0101
	even:.word 0xaaaaaaaa	#1010
	change:.asciiz "\nexchange:"
.text
	li $v0,5
	syscall
	sw $v0,int
	
	lw $a0,int
	li $v0,35
	syscall
	
	la $a0,change
	li $v0,4
	syscall	
	
	lw $t0,int
	lw $t1,odd
	lw $t2,even
	
	and $t1,$t1,$t0
	and $t2,$t2,$t0
	sll $t1,$t1,1
	srl $t2,$t2,1
	
	or $t3,$t1,$t2
	la $a0,($t3)
	li $v0,35
	syscall
	
	li $v0,10
	syscall
