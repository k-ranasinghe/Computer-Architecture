.data
    n:          .word         12                                          # Declare a word with number of elements in array
    A:          .word         0, 1, 2, 7, -8, 4, 5, 12, 11, -2, 6, 3      # Declare the input array
    B:          .word         0                                           # Declare the output array
    
    space:    .string       "  "                                          # this used to add a space in console output 

.text
.globl main
main:
    la a0, A                          # Load the address of array A into a0
    li a1, 0                          # a1 is the index of array A we refer to
    lw a2,n                           # a2 contains the umber of elements in array A
    la a3, B                          # Load the address of array B into a3
    li a5, 0                          # a5 is the index of array B we refer to
    li a6, 0                          # a6 used to reference to zero as it contains zero throughout the program
    
    
loop:
# we check whether we have traversed the whole array A so that we can exit the array
# if we have completely traversed array A we move to code block loop_end in which we print the final array B
# if not we move to the next operation
    beq a2,a1, loop_end 
# Load the value in the memory address in a0 to t0       
    lw t0, 0(a0)
# we check whether the value in t0 is less than 1
    slti t2,t0,1
# if value stored in t0 is greater than zero we jump into the 'positive' code block
    beq t2,a6,positive
# if value in t0 is less than 1 we have to move to the next element of array A 
# we increment a1 which holds the index we are refering to  
    addi a1,a1,1
# Increment the loop variable by the size of word
    addi a0,a0,4
# jump to the beginnig of 'loop' code block
    j loop
    
positive:
# the value in t0 is positive
# now we check whether value in t0 is even
# we do an and operation on the value in t0 with '1'
# t1 becomes zero only when the value in t0 is even
    andi t1,t0,1
# if t1 is zero we move to the even_number code block
    beq t1,a6,even_number
# if t1 is 1 then we increment a1 and a0 and jump to the beginning of 'loop' code block    
    addi a1,a1,1
    addi a0,a0,4
    j loop
    
even_number:
# the value stored in t0 is positive and even
# we store the value in t0 to the memory location pointed by the address stored in a3
# that is array B
    sw t0,0(a3)
# we increment a5 and a3 so we can more elements to array B
    addi a5,a5,1
    addi a3,a3,4
# we increment a1 and a0 and jump to the beginning of 'loop' code block 
    addi a0,a0,4
    addi a1,a1,1
    j loop
    
loop_end:
# we have finished traversing array A and the final array B is formed
### we are going to print the final array of even numbers
# we can find the number of elements in array A using a5
# we use a1 to reference the index of array B
    li a1,0
# Load the address of the first element of array B to a3
    la a3, B
# load value of first element of array B to register a0
    lw a0, 0(a3)
# the value in a0 will be printed on console output
    li a7, 1
    ecall
# we add a space between the elements in the cosole output for clarity    
    la a0, space
    li a7, 4
    ecall
# increment a3 and a1 to traverse array B    
    addi a3,a3,4
    addi a1,a1,1
# check whether the index is greater than the size of array B
# if index is less than size of array we go 9 instructions backwards
# if index is equal or greater than size then we end the program
    blt a1,a5, -36
    
    
    
