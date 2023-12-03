.equ N 3
.equ M 9

.data
A: .word 7,3,25,4,75,2,1,1,9
newline: .string "\n"

.bss
B: .word 0, 0, 0, 0

.text
.globl main

jal main
li a0,0
li a7,93
ecall

abs:
    addi sp, sp, -16
    sw s1, 0(sp)
    sw ra, 12(sp)

    mv s1, a0
    bgez t1, else1
    neg t1, t1

    else1:
    lw s1, 0(sp)
    lw ra, 12(sp)
    addi sp, sp, 16
    ret

res_triplet:
    addi sp, sp, -16
    sw s1, 0(sp)
    sw s2, 4(sp)
    sw ra, 12(sp)

    mv s1, zero # i
    mv s3, zero
    mv t1, zero # sum

    loop1:
        beq s1, a2, endloop1
        lw t2, 0(a0)
        add t1, t1, t2
        addi s1, s1, 1
        addi a0, a0, 4
        j loop1

    endloop1:
    jal abs
    #mv a0, t1
    #lw s1, 0(sp)
    lw s2, 4(sp)
    lw ra, 12(sp)
    addi sp, sp, 16
    sw t1, 0(a1)
    mv t1, zero
    addi a1, a1, 4
    addi s3, s3, 1
    bne s3, a3, loop1
    beq s3, a3, 40

main:
    addi sp, sp, -16
    sw ra, 0(sp)

    la a0, A
    la a1, B
    addi a2, zero, N
    addi a3, zero, M
    jal res_triplet

    li a0 0
    lw ra, 0(sp)
    addi sp, sp, 16
    
    li a2,0
    la a6, B
    lw a0, 0(a6)

    li a7, 1
    ecall
    
    la a0, newline
    li a7, 4
    ecall
    ecall


    addi a6,a6,4
    addi a2,a2,1

    blt a2,a3, -40
    ret