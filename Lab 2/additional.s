.data
    n:          .word         12                                          # Declare a word with number of elements in array
    A:          .word         0, 1, 2, 7, -8, 4, 5, 12, 11, -2, 6, 3      # Declare the array A
    B:          .word         8, 3, -9, -2, 7, 5, 1, -5, -11, 0, 6, 15    # Declare the array B
    C:          .word         0                                           # Declare the output array
    
    space:    .string       ""                                            # this used to add a space in console output 

.text
.globl main
main:
    li a0,0                                    # a0 will be used to reference the index of the arrays
    lw a1,n                                    # a1 contains number of elements in the arrays
    la a2, A                                   # Reference to the first element of array A
    la a4, B                                   # Reference to the first element of array B
    la a6, C                                   # Reference to the first element of array C
# check whether n (number of elements in array) is zero
# if not we need to find the address of last element of array B
# for this we use the array_end code block
    beq a1,a0, array_end
    
array_end:
# we already have the address of the first element of array B
# distance between first and last elements of array is n * word size = n * 4
# to find the distance to last element we shift the value stored in a1 (n) to the left by two positions
# which is equivalent to multplying by 4
    slli a5,a1,2
# since we are already at the first element we have to deduct 4
    addi a5,a5, -4
# finally the address of last element is stored in a4
    add a4,a4,a5
    
loop:
# this code block will carry out the operation of forming the array_c in the required method
# if we have completely traversed array A and array B we will exit the 'loop' code block
# load value stored in the memory location pointed to by address stored in a2 to a3
# a3 is used to store elements of array A
    lw a3, 0(a2)
# load value stored in the memory location pointed to by address stored in a4 to a5
# a3 is used to store elements of array B
    lw a5, 0(a4)

# add values in registers a3 and a5 and store it in a7
# a3 is used to store elements of array C
    add a7,a5,a3
# we store the value in a7 to the memory location pointed by the address stored in a6
# that is array B
    sw a7,0(a6)
# increment values in a2,a4,a6,a0 to iterate over the arrays and jump to beginning of 'loop' code block    
    addi a2,a2,4
    addi a4,a4,-4
    addi a6,a6,4
    addi a0,a0,1
    blt a0,a1, -32   
loop_end:
    
# the array C has been completely formed at this point
# we will be printing the array to the console output in this code block
# a2 is used to reference the index of array C
    li a2,0
# Reference to the first element of array C
    la a6, C
# load value stored in the memory location pointed to by address stored in a6 to a0
    lw a0, 0(a6)

# we will output the value stored in a0
    li a7, 1
    ecall
# we will add some space between elements in the console output for clarity
    la a0, space
    li a7, 4
    ecall
    ecall

# increment a2,a6 to iterate over array C
    addi a6,a6,4
    addi a2,a2,1
# check whether we have completely traversed array C
# if not we go 10 instructions backwards
# if we have completed traversing we will end the program
    blt a2,a1, -40