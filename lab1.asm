.data	#���ݶ�
str:.asciiz"hi"		#str���ַ��� ascii��asciiֵ���� z�����/0 �ַ����������

.text			#����� ָ���
CS202main:
	li $v0,4	#v0:service type li:immidiate number
	la $a0,str	#a0:parameter  la��load address
	syscall		#--print string //ָ������ʲô����ϵͳ���� eg �ϵ����  id:4 syscallִ��v0��id= 4�ĳ����
	
	li $v0,10	#
	syscall		#--exit
