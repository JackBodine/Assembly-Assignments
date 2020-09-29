	.data
prompt: .asciiz "Please enter a nonnegative integer: "
comma:  .asciiz ", "
error:	.asciiz "Try again. "

	.text
main:   	
	li	$v0,4		# load printString to $v0
	la	$a0, prompt	# prints the prompt
	syscall
	
	li 	$v0,5		# load readInt to v0
	syscall
	move	$s7,$v0		# moves user input to $s7
	
	addi	$t1,$s7,1	# $t1 = $s7 + 1
	slt	$t2,$0,$t1	# check if $t1 < $0
	beq	$t2,$0,error1	# branch if we end
	
	li	$s0,1		# sets $s0 to 1
	li	$s1,1		# sets $s1 to 1
	
	li	$t0,0		# sets $t0 to 0
	
	li	$v0,1		# load printInt
	li	$a0,1		# set $a0 to 1
	syscall	
	
lStart:	slt	$t1,$t0,$s7	# check if $t0 < $s7
	beq	$t1,$0,lEnd	# branch if we end
	
	li	$v0,4		# load printString to $v0
	la	$a0,comma	# prints the comma
	syscall	
	
	add 	$s2,$s1,$s0	# $s2 = $s1 + $s0
	addi 	$s2,$s2,1	# $s2 = $s2 + 1
	
	move 	$s0,$s1		# move $s1 to $s0
	move 	$s1,$s2		# move $s2 to $s1
		
	move	$a0,$s0		# move $s0 to $a0
	li	$v0,1		# load printInt
	syscall		
	
	addi	$t0,$t0,1	# $t0 = $t0 + 1
	
	j	lStart		# always jump back
	
lEnd:	
	li	$v0, 10		# exit cleanly
	syscall
	
error1:	
	li	$v0,4		# load printString to $v0
	la	$a0,error	# prints the error
	syscall
	
	j 	main		# jumps to main
