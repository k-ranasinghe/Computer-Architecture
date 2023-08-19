.data
    n:          .word         12                   # Declare a word with number of elements in array
    V:          .word         0, 1                 # Declare the input array
    
    space:    .string       ""                     # this used to add a space in console output 

.text
.globl main
main:
    li a7,0                            # a7 will be used to reference the index of array V
    lw a6,n                            # a6 contains the value for number of iterations we have to run the fibonacci sequence
    la a0, V                           # Reference to the first element of array V
    lw a1, 0(a0)                       # load value stored in the memory location pointed to by address stored in a0 to a1
    addi a0,a0,4                       # add 4 to a0 to reference to the second element of array V
    lw a2, 0(a0)                       # load value stored in the memory location pointed to by address stored in a0 to a2
    
loop:
# this code block will carry out the operation of forming the array V in the required method
# next element of array V is formed by adding a1 and a2
    add a3,a2,a1
# add 4 to a0 to point to next position of array
    addi a0,a0,4
# we store the value in a3 to the memory location pointed by the address stored in a0
# that is array V
    sw a3,0(a0)
# we increment a1,a2,a7 to carry out the rest of the iterations and jump to beginning of 'loop' code block   
    addi a1,a2,0
    addi a2,a3,0
    addi a7,a7,1
    blt a7,a6,-24    
loop_end:
    
    li a2,0
# Reference to the first element of array V
    la a1, V
# load value stored in the memory location pointed to by address stored in a1 to a0
    lw a0, 0(a1)

# we will output the value stored in a0
    li a7, 1
    ecall
# we will add some space between elements in the console output for clarity
    lw a0, space
    li a7, 4
    ecall
    ecall

# increment a1,a2 to iterate over array V
    addi a1,a1,4
    addi a2,a2,1
# check whether we have completely traversed array V
# if not we go 10 instructions backwards
# if we have completed traversing we will end the program
    blt a2,a6, -40