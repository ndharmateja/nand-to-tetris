// Pseudo code
//  while(true) {
//      if (key is pressed) {
//          for(i=0; i<8192; i++) {
//              SCREEN[i] = -1; // For black
//          }
//      }
//      if (key is not pressed) {
//          for(i=0; i<8192; i++) {
//              SCREEN[i] = 0;
//          }
//      }
//      
//  }

(INFINITE_LOOP)
    // i = 0, addr = SCREEN, n = 8192
    @i
    M=0
    @SCREEN
    D=A
    @addr
    M=D
    @8192
    D=A
    @n
    M=D

    // If no key is pressed jump to white loop
    @KBD
    D=M
    @WHITE_LOOP
    D;JEQ

    // Make all the 8192 SCREEN registers -1
    // If i-n >= 0 (i >= n) jump to INFINITE_LOOP
    (BLACK_LOOP)
        @i
        D=M
        @n
        D=D-M
        @INFINITE_LOOP
        D;JGE
        
        // RAM[addr] = -1 (for black)
        @addr
        A=M
        M=-1

        // i++, addr++
        @i
        M=M+1
        @addr
        M=M+1

        // Jump to start of BLACK_LOOP
        @BLACK_LOOP
        0;JMP

    // Make all the 8192 SCREEN registers 0
    // If i-n >= 0 (i >= n) jump to INFINITE_LOOP
    (WHITE_LOOP)
        @i
        D=M
        @n
        D=D-M
        @INFINITE_LOOP
        D;JGE
        
        // RAM[addr] = 0 (for white)
        @addr
        A=M
        M=0

        // i++, addr++
        @i
        M=M+1
        @addr
        M=M+1

        // Jump to start of WHITE_LOOP
        @WHITE_LOOP
        0;JMP

    

