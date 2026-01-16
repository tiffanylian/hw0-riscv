        .section .data
input_string:   .asciz "Hello world!"

        # tohost/fromhost are data locations used by Spike
        .align 8
tohost: .byte 0
        .align 8
fromhost: .byte 0

        
        .section .text
        .globl _start
_start:
        # Load the address of the input string into a0
        la a0, input_string

        # Your code here!
        while_loop:
                lb a1, (a0)
                beq a1, x0, end_program     # Check for null

                addi a2, a1, -97            # Range check 97 <= x <= 122
                blt a2, x0, next
                addi a2, a1, -122
                bgt a2, x0, next

                addi a1, a1, -32            # Change to uppercase
                sb a1, (a0)
        next:
                addi a0, a0, 1              # Increment loop index
                j while_loop
        
end_program:
        # jump here when you're done
        j end_program

