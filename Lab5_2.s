@============================================================================
@ *lab5_2.s*
@ Description: (1) Convert a given eight ASCII characters in the variable 
@                  STRING to an 8-bit binary number in the variable NUMBER. 
@                  Clear the byte variable ERROR if all the ASCII characters 
@                  are either ASCII “1” or ASCII “0”; otherwise set ERROR
@                  to all ones (0xFF).
@============================================================================
@============================================================================
@
@ EDIT HISTORY FOR MODULE
@
@ $Header: $
@ Guide: Prof. Madhumutyam IITM, PACE
@
@ when          who                    what, where, why
@ -----------   -------------------    --------------------------
@ 12 Nov 2019    Swapneel Pimparkar     (Bengaluru) First Draft
@============================================================================

@------------------------------------------------------------------------------
@ Logic: (1) Loop through 8 times. Each time, read next memory location for 
@            ASCII character.
@        (2) If read ASCII character is "0" or "1" then left shift 
@            output register content and add the binary 0 or 1.
@            Else, set ERROR location to 0xFF.
@        (3) Store the final content of output register.
@------------------------------------------------------------------------------

_PROG_DATA:
.data        
@ At the time of running, one of the TEST portion (below TEST line) should be uncommented.

@TEST 1 :  This is good case.
@    STRING: 
@           .ascii "11010101"
@    NUMBER: 
@           .byte 0x0
@    .align 3
@    ERROR: 
@           .byte 0xFF

          
          
@TEST 2 :  This is error case.
    STRING: 
           .ascii "11078101"
    NUMBER: 
           .byte 0x0
    .align 3
    ERROR: 
           .byte 0xFF


.text
.align 2
.global _MAIN
.global _SHIFT_AND_ADD
.global _LOOP
.global _END

@ Program starts here
    _MAIN:
        LDR R0,=STRING          @Load the address of input string into R0
        LDR R6,=NUMBER          @Load the address of output NUMBER into R6
        LDR R7,=ERROR           @Load the address of output ERROR into R7

        EOR R3, R3, R3          @Clear NUMBER (R3).

        LDR R3, [R6]            @Load the contents of NUMBER into R3.
        MOV R9, #0              @R9 is used as loop counter
        
    _LOOP:
        ADD   R9, R9,    #1     @Increase the count by 1.
        LDRB  R1, [R0],  #1     @Load the content of string byte by byte.
        CMP   R1, #0x30         @Check if read byte is ASCII "0"
        BEQ  _SHIFT_AND_ADD     @If equal then jump to _SHIFT_AND_ADD
        CMP   R1, #0x31         @Check if read byte is ASCII "1"
        BEQ  _SHIFT_AND_ADD     @If equal then jump to _SHIFT_AND_ADD
        EOR   R3, R3,    R3     @Clear NUMBER (R3).
        MOV   R8, #0xFF         @In fact this is not necessary as ERROR is initialized with 0xFF.
        STRB  R3, [R6]          @Store value of NUMBER to its address in memory.
        STRB  R8, [R7]          @Store value of ERROR to its address in memory.
        B    _END
        
    _SHIFT_AND_ADD:
        LSL   R3, R3,    #1     @Left Shift (logical) by 1 bit. This will make way to set or reset LSB.
        AND   R1, R1,    #0x1   @Clear everything except LSB. This is the bit we desire. Either 0 or 1.
        ORRS  R3, R3,    R1     @OR with shifted contents of R3 to set or reset LSB.
        CMP   R9, #8            @Are we done with count?
        BNE   _LOOP             @If not, then loop through again.
        
        MOV   R8, #0x00         @Clear ERROR
        STRB  R8, [R7]          @Store desired value of ERROR to its address in memory.
        STRB  R3, [R6]          @Store desired value of NUMBER to its address in memory.
        
@ Program ends here
    _END:
.end
