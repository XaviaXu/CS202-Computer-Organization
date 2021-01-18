.data
	f1:.asciiz "The first student:\n"
	f2:.asciiz "The second student:\n"
	f3:.asciiz "The third student:\n"
	total:.asciiz "The total scores are:\n"
	aveall:.asciiz "The average of total scores are:"
	average:.asciiz "The average scores are:\n"
	p1:.asciiz "\nNot doing well for the first student:"
	p2:.asciiz "\nNot doing well for the second student:"
	p3:.asciiz "\nNot doing well for the third student:"
	index:.asciiz "\nindex:"
	expected:.asciiz "\nexpected:"
	newline:.asciiz "\n"
	divi:.float 3
	totaldiv:.float 5
	stu1:.space 20
	stu2:.space 20
	stu3:.space 20
	aver:.space 20
	

.text
	addi $t0,$0,5
	
	la $a0,f1
	li $v0,4
	syscall
	la $a0,stu1
s1:	li $v0,6
	syscall
	add.s $f1,$f1,$f0
	s.s $f0,0($a0)
	addi $a0,$a0,4
	addi $t1,$t1,1
	bne $t0,$t1,s1	
	
	la $a0,f2
	li $v0,4
	syscall
	la $a0,stu2
	li $t1,0
s2:	li $v0,6
	syscall
	add.s $f2,$f2,$f0
	s.s $f0,0($a0)
	addi $a0,$a0,4
	addi $t1,$t1,1
	bne $t0,$t1,s2
	
	la $a0,f3
	li $v0,4
	syscall
	la $a0,stu3
	li $t1,0
s3:	li $v0,6
	syscall
	add.s $f3,$f3,$f0
	s.s $f0,0($a0)
	addi $a0,$a0,4
	addi $t1,$t1,1
	bne $t0,$t1,s3
	
	la $a0,total
	li $v0,4
	syscall
	mov.s $f12,$f1
	li $v0,2
	syscall	
	la $a0,newline
	li $v0,4
	syscall
	mov.s $f12,$f2
	li $v0,2
	syscall
	li $v0,4
	syscall
	mov.s $f12,$f3
	li $v0,2
	syscall
	li $v0,4
	syscall

	
	
	
	#平均分
	la $a0,average
	li $v0,4
	syscall
	
	la $s1,stu1
	la $s2,stu2
	la $s3,stu3
	la $s0,aver
	la $a0,newline
	l.s $f0,divi
	move $t0,$0
	li $t1,5
	
ave:	l.s $f1,($s1)
	l.s $f2,($s2)
	l.s $f3,($s3)
	add.s $f12,$f1,$f2
	add.s $f12,$f12,$f3
	div.s $f12,$f12,$f0
	s.s $f12,0($s0)
	add.s $f5,$f5,$f12
	li $v0,2
	syscall
	li $v0,4
	syscall
	addi $s1,$s1,4
	addi $s2,$s2,4
	addi $s3,$s3,4
	addi $s0,$s0,4
	addi $t0,$t0,1
	bne $t0,$t1,ave
	
	
	
	la $a0,aveall
	li $v0,4
	syscall
	l.s $f10,totaldiv
	div.s $f5,$f5,$f10
	li $v0,2
	syscall
	
	
	#不符合值
	
	la $a0,p1
	li $v0,4
	syscall
	#t1 = 5
	move $t0,$0
	la $s1,stu1
	la $s0,aver
che1:	l.s $f1,($s1)
	l.s $f12,($s0)
	c.le.s $f12,$f1
	bc1t ne1
	la $a0,index
	li $v0,4
	syscall
	move $a0,$t0
	addi $a0,$a0,1
	li $v0,1
	syscall
	la $a0,expected
	li $v0,4
	syscall
	li $v0,2
	syscall
		
ne1:	addi $s0,$s0,4
	addi $s1,$s1,4
	addi $t0,$t0,1
	bne $t1,$t0,che1
	
	
	
	la $a0,p2
	li $v0,4
	syscall	
	move $t0,$0
	la $s1,stu2
	la $s0,aver
che2:	l.s $f1,($s1)
	l.s $f12,($s0)
	c.le.s $f12,$f1
	bc1t ne2
	la $a0,index
	li $v0,4
	syscall
	move $a0,$t0
	addi $a0,$a0,1
	li $v0,1
	syscall
	la $a0,expected
	li $v0,4
	syscall
	li $v0,2
	syscall
		
ne2:	addi $s0,$s0,4
	addi $s1,$s1,4
	addi $t0,$t0,1
	bne $t1,$t0,che2
	
	
	la $a0,p3
	li $v0,4
	syscall	
	move $t0,$0
	la $s1,stu3
	la $s0,aver
che3:	l.s $f1,($s1)
	l.s $f12,($s0)
	c.le.s $f12,$f1
	bc1t ne3
	la $a0,index
	li $v0,4
	syscall
	move $a0,$t0
	addi $a0,$a0,1
	li $v0,1
	syscall
	la $a0,expected
	li $v0,4
	syscall
	li $v0,2
	syscall
		
ne3:	addi $s0,$s0,4
	addi $s1,$s1,4
	addi $t0,$t0,1
	bne $t1,$t0,che3
	
	li $v0,10
	syscall
	
	
