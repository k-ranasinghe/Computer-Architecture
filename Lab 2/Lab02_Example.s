.globl main
main:
# Load immediate values into registers
li a0, 5 # Load 5 into register a0
li a4, 52105 # Load 52106 into register a4
# Add 10 to a0 and store in register a1
addi a1, a0, 10 # a1 = a0 + 10
# Take AND operation between a4 and 0b11101111100
# and store in register a5
andi a5, a4, 0b11101111101

### check whether number stored in a5 is odd
li a6, 1
# a5 has to be greater than 0
slt a7, a6, a5
# a0 is one when a5 > 0 and odd
and a0, a5, a7

### multiply number stored in a5 by 7
li a5, 5
li a7, 3
# shift value in a5 by 3
# that is equivalent to a5 * 2^3 = a5 * 8
sll a0,a5,a7
# subtract a5 from a0
# a0 = a5 * 8 - a5 = a5 * 7
sub a0, a0, a5
# End of program

ret