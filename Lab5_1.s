@============================================================================
@ *lab5_1.s*
@ Description: (1) Convert the contents of a given A_DIGIT variable from an 
@                  ASCII character to a hexadecimal digit and store the result 
@                  in H_DIGIT. Assume that A_DIGIT contains the ASCII 
@                  representation of a hexadecimal digit (i.e., 7 bits with
@                  MSB=0).
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
@ Logic: (1) For printable hex digits, we have only 0-9, a-f and A-F characters.
@        (2) If A_DIGIT contains hex number equivalent within any of the above
@            three ranges, then output that digit to H_DIGIT.
@            Else, Error. Output H_DIGIT = FF
@------------------------------------------------------------------------------

_PROG_DATA:
.data        
@ At the time of running, one of the TEST portion (below TEST line) should be uncommented.

@TEST 1 : This is error case.
@    A_DIGIT: 
@           .word 0x74
@    H_DIGIT: 
@           .word 0xFF
           
@TEST 2 :  Output H_DIGIT = 0d is expected (or 0D due to case insensitivity)
@    A_DIGIT: 
@           .word 0x64
@    H_DIGIT: 
@           .word 0xFF
           
@TEST 3 :  Output H_DIGIT = 05 is expected.
@    A_DIGIT: 
@           .word 0x35
@    H_DIGIT: 
@           .word 0xFF
           
@TEST 4 :  Output "C" i.e. H_DIGIT = 0C is expected.
@    A_DIGIT: 
@           .word 0x43
@    H_DIGIT: 
@           .word 0xFF

@TEST 5 :  Output 0xFF i.e. H_DIGIT = FF is expected. This is error case.
    A_DIGIT: 
           .word 0x4B
    H_DIGIT: 
           .word 0xFF

.text
.align 2
.global _MAIN
.global _OUT
.global _END

@ Program starts here
    _MAIN: 

        LDR   R6, =A_DIGIT      @ Read A_DIGIT address into R6
        LDR   R7, =H_DIGIT      @ Read H_DIGIT address into R7. This is where output will be stored.
        LDR   R8, [R6]          @ Load the contents of R6 i.e. A_DIGIT into R8
        SUB   R8, #0x30         @ Subtract 0x30 from R8 as first printable in three sets starts with 0x30 
                                @@ in ASCII table as mentioned in logic at the start of this program.
        CMP   R8, #0xA          @ Compare the subtraction in R8 with 0xA. This is for digits 0-9.
        BLT   _OUT              @ If less than 0xA then jump to _OUT. It means that digit is in the range 0-9.
        SUB   R8, #7            @ Else subtract 7 from above subtraction (16 - 9)
        
        @ With following series of three comparisons, we can take care of all the three sets of 
        @ printable ASCII characters within HEX range.
        @ i.e. 0-9, A-F and a-f.
        
        CMP   R8, #0x30         @ Compare now again with 0x30 to see if we have any character beyond f i.e. g, h, p till z. 
        BGT   _END              @ If R8 is greater than 0x30 then we have error case. Keep output as 0xFF and end. 
                                @@ To do this, jump to _END.
        CMP   R8, #0x20         @ Else compare R8 with 0xA. This is to take care of characters in the range of Capital G to Z.
        BGT   _OUT              @ Jump to _OUT if content in R8 is greater than 0x20.
        CMP   R8, #0x10         @ Compare R8 with 0x10.
        BGT   _END              @ Jump to _END if content in R8 is greater than 0xA.
    _OUT:
        AND   R8, R8, #0x0F     @ Clear for MSBs.
        STR   R8, [R7]          @ Store value in R8 into address pointed by R7 i.e. into H_DIGIT.
    _END:       
        .end
        