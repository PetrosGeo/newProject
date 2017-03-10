# Find longest word in a string
#   in MIPS assembly using MARS
# for MYΥ-402 - Computer Architecture
# Department of Computer Engineering, University of Ioannina
# Aris Efthymiou

        .globl main # declare the label main as global. 
        
        .text 
     
main:
        la         $a0, string         # The address of the string
        addu       $v1, $zero, $a0     # The address of longest word

        ########################################################################
		      
        add	$t7, $0, $0		
        add	$t6, $0, $0		
        add	$t5, $0, $a0		
        add	$t4, $0, $a0		
        
        li 	$t3, 32			
        
loop:
	lb	$t2, 0($a0)		
	addi	$a0, $a0,1		
	beq	$t2, $0 NoWord	
	beq	$t2, $t1 CounterReset	
	addi	$t7, $t7,1		
	j loop				
	
CounterReset:
	beq	$t6, $t7, CounterRemain	
	slt	$s0, $t6,$t0		
	bne	$s0, $0, CounterChange		
	add	$t5, $0,$a0		
	add	$t7, $0,$0		
	j loop				
	
CounterChange:
	add	$t6, $0, $t7				
	add	$t4, $0, $t5		
	add	$t7, $0, $0		
	add	$t5, $0, $a0		
	j loop				
	
CounterRemain:
	add	$t4, $0, $t5		
	add	$t5, $0, $a0		
	add	$t7, $0, $0		
	j loop				
	
NoWord:
	bne	$t7, $0 resetAndExit	
	add	$v1, $0, $t4			
	j exit
       
resetAndExit:
	slt	$s0,$t6,$t7				
	bne	$s0,$0,CounterChange		
	add	$v1,$0,$t4	

        ########################################################################
        
exit: 
        addiu      $v0, $zero, 10    # system service 10 is exit
        syscall                      # we are outta here.
        
        ###############################################################################
        # Data input.
        ###############################################################################
        .data
string: .asciiz "small  equal long atTheEnd"
