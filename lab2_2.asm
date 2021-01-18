.data
	old: .asciiz"abc"
	new:.space 6
.text
	la $a0,old
	la $a1,new
	
	lb $t0,($a0)
	sb $t0,($a1)
	subi $t0,$t0,32
	sb $t0,1($a1)
	
	lb $t1,1($a0)
	sb $t1,2($a1)
	subi $t1,$t1,32
	sb $t1,3($a1)
	
	lb $t2,2($a0)
	sb $t2,4($a1)
	subi $t2,$t2,32
	sb $t2,5($a1)
	
	
	la $a0,($a1)
	li $v0,4
	syscall	
	li $v0,10
	syscall
