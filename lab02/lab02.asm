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
        #  Write your code here
        # NOTE: Don't print out the results! Automatic testing will get the final
        #  value of $v1 and check if it is correct
        ########################################################################
        
exit: 
        addiu      $v0, $zero, 10    # system service 10 is exit
        syscall                      # we are outta here.
        
        ###############################################################################
        # Data input.
        ###############################################################################
        .data
string: .asciiz "small  equal long atTheEnd"
