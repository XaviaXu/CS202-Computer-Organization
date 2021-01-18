.data
	str:.asciiz "Please input two numbers:\n"
	str2:.asciiz "Please input the operation between two numbers:\n"
	plus:.asciiz "+"
	minus:.asciiz"-"
	multiple:.asciiz"*"
	division:.asciiz"/"
	ending:.asciiz"The result is: "
	operation:.asciiz""
	

.text
	la $a0,str
	li $v0,4
	syscall

	li $v0,5
	syscall
	move $s0,$v0
	
	li $v0,5
	syscall
	move $s1,$v0
	
	la $a0,str2
	li $v0,4
	syscall
	
	la $a0,operation
	li $a1,4
	li $v0,8
	syscall
	
	lb $t0,plus
	lb $t1,minus
	lb $t2,multiple
	lb $t3,division
	lb $a1,operation
	
	bne $t0,$a1,min
	add $a2,$s0,$s1
	
	la $a0,ending
	li $v0,4
	syscall
	
	move $a0,$a2
	li $v0,1
	syscall
	j exit
	
min:	bne $t1,$a1,multi
	la $a0,ending
	li $v0,4
	syscall
	li $t0,-1
	mul $s1,$s1,$t0
	add $a0,$s0,$s1
	li $v0,1
	syscall
	j exit
	
multi:	bne $t2,$a1,divi
	mulo $a2,$s0,$s1
	la $a0,ending
	li $v0,4
	syscall
	move $a0,$a2
	li $v0,1
	syscall
	j exit

divi:	teqi $s1,0
	div $s0,$s1
	mflo $a0
	li $v0,1
	syscall
	
exit:	li $v0,10
	syscall
	
	
.ktext 0x80000180
	la $a0,msg
	li $v0,4
	syscall
	mfc0 $a0,$14
	li $v0,34
	syscall
	
	mfc0 $k0,$13
	bne $k0,0x20,err2
	la $a0,error1
	j print
err2:	bne $k0,0x30,err3
	la $a0,error2
	j print
err3:	bne $k0,0x24,err4
	la $a0,error2
	j print
err4:	la $a0,error3

print:	li $v0,4
	syscall
	li $v0,10
	syscall

.kdata
	msg:.asciiz "\nRun time exception at: "
	error1:.asciiz "\nillegal input"
	error2:.asciiz "\narithmetic overflow"
	error3:.asciiz "\ndivide by zero"
