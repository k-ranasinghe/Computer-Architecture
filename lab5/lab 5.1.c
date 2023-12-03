asm("li sp, 0x100000"); // SP set to 1 MB
asm("jal main"); // call main
asm("mv a1, a0"); // save return value in a1
asm("li a7, 10"); // prepare ecall exit
asm("ecall"); // now your simulator should stop

int main() {
    int array[260];
    
    // Fill the array with values
    for (int i = 0; i < 260; i++) {
        array[i] = i * 10;
    }
    
    int num_read;
    
    // Access the array in a contiguous manner to induce cache misses
    for (int i = 0; i < 100; i += 1) {
        num_read = array[i];
    }
    return 0;
}
