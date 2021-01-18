.data	#数据段
str:.asciiz"hi"		#str：字符串 ascii：ascii值保存 z：添加/0 字符串结束标记

.text			#代码段 指令段
CS202main:
	li $v0,4	#v0:service type li:immidiate number
	la $a0,str	#a0:parameter  la：load address
	syscall		#--print string //指定调用什么样的系统服务 eg 断点调用  id:4 syscall执行v0中id= 4的程序号
	
	li $v0,10	#
	syscall		#--exit
