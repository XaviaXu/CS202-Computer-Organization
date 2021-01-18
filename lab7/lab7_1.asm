.data
	origin:.float 0
	acc:.float 0
	divi:.float 2
.text
	li $v0,6
	syscall
	s.s $f0,origin
	
	li $v0,6
	syscall
	s.s $f0,acc
	
	l.s $f0,origin
	l.s $f1,origin
	l.s $f5,divi
	li $t0,12
	
	
loop:	div.s $f2,$f0,$f1
	add.s $f1,$f1,$f2
	div.s $f1,$f1,$f5
	addi $t0,$t0,-1
	bne $t0,$0,loop
	
	mov.s $f12,$f1
	li $v0,2
	syscall
	
	li $v0,10
	syscall
	
	

	
	
	
	