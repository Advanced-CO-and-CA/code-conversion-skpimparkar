@============================================================================
@ *lab5_3.s*
@ Description: (1) Convert a given eight-digit packed binary-coded-decimal 
@                  number in the BCDNUM variable into a 32-bit number in a 
@                  NUMBER variable.
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
@ Logic: (1) There are two ways. First is that ARM assembly inherently stores 
@            number as hex. So, no extra effort is needed. Just store it after
@            reading back to destination.
@        (2) Second is convert the packed BCD (i.e. decimal) to hex. 
@            This can be achieved using positional logic. 
@
@ NOTE: Because there was no special instruction, using first (and easy) method.
@------------------------------------------------------------------------------

_PROG_DATA:
.data        

@TEST 1 :  This is good case.
    BCDNUM: 
           .word 92529673
    NUMBER: 
           .word 0x0

.text
.align 2
.global _MAIN
.global _END

@ Program starts here
    _MAIN:
        LDR R0,=BCDNUM          @Load the address of input BCDNUM into R0
        LDR R6,=NUMBER          @Load the address of output NUMBER into R6
        LDR R1, [R0]
        STR R1, [R6]
    _END:
        .end
        