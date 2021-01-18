.data
	str1:.asciiz"Takes "
	str2:.asciiz" hours and "
	str3:.asciiz" minutes"

 .text
 	li $t0,1800
 	li $t1,350
 	li $t2,60
 	
 	
 	la $a0,str1
 	li $v0,4
 	syscall#str1
 	
 	div $t0,$t1
 	mflo $a0
 	li $v0,1
 	syscall#hours
 	
 	la $a0,str2
 	li $v0,4
 	syscall#str2
 	
 	mfhi $t4
 	div $t1,$t2
 	mflo $t5
 	div $t4,$t5
 	mflo $a0	
 	li $v0,1
 	syscall
 	
 	la $a0,str3
 	li $v0,4
 	syscall#str3
 	
 	li $v0,10
	syscall
