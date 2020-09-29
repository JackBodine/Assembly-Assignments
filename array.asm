	.data
array:	.space 20

string:	.asciiz ", "

	.text
main:	la	$s1, array	# loads the address of the array into a register

	li	$t0, 1
	sw	$t0, 0($s1)	# stores 1 in array[0]
	li	$t0, 2
	sw	$t0, 4($s1)	# stores 2 in array[1]
	li	$t0, 3
	sw	$t0, 8($s1)	# stores 3 in array[2]
	li	$t0, 4
	sw	$t0, 12($s1)	# stores 4 in array[3]
	li	$t0, 5
	sw	$t0, 16($s1)	# stores 5 in array[4]
	
	#loads the array into temporary variables 
	lw $t0,0($s1)		# load array[0] into $t0
	lw $t1,4($s1)		# load array[1] into $t1
	lw $t2,8($s1)		# load array[2] into $t2
	lw $t3,12($s1)		# load array[3] into $t3
	lw $t4,16($s1)		# load array[4] into $t4
	
	sub	$t0, $t2, $t0	# $t0 = $t0 - $t2
	sw	$t0, 0($s1)	# stores $t0 in array[0]
	
	add	$t4, $t0, $t4	# $t4 = $t0 + $t2
	add	$t4, $t2, $t4	# $t4 = $t0 + $t4
	sw	$t4, 16($s1)	# stores $t4 in array[4]
	
	or	$t1, $t1, $t3	# Bitwise-or $t1 with $t3. Stored in $t1 
	sw	$t1, 4($s1)	# stores $t1 in array[1]
	
	sll	$t1, $t1, 2	# Shifts the items in $t1 left by 2
	sw	$t1, 4($s1)	# stores $t1 in array[1]
	
	andi	$t3, $t1, 21	# $t3 = $t1 & 21
	sw	$t3, 12($s1)	# stores $t3 in array[3]
	
	not	$t2, $t4	# $t2 = ~$t4
	sw	$t2, 8($s1)	# stores $t2 in array[2]
	
	#prints the array.
	li	$v0, 1		#loads print int
	move	$a0, $t0	#prints $t0
	syscall
	li	$v0, 4		#loads print string
	la	$a0, string	#prints ","
	syscall
	
	li	$v0, 1		#loads print int
	move	$a0, $t1	#prints $t1
	syscall
	li	$v0, 4		#loads print string
	la	$a0, string	#prints ","
	syscall
	
	li	$v0, 1		#loads print int
	move	$a0, $t2	#prints $t2
	syscall
	li	$v0, 4		#loads print string
	la	$a0, string	#prints ","
	syscall
	
	li	$v0, 1		#loads print int
	move	$a0, $t3	#prints $t3
	syscall
	li	$v0, 4		#loads print string
	la	$a0, string	#prints ","
	syscall
	
	li	$v0, 1		#loads print int
	move	$a0, $t4	#prints $t4
	syscall
	
	
	li	$v0, 10		# exit cleanly
	syscall
