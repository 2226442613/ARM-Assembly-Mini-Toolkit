    .section .data
array:
    .word 12, 7, 25, 3, 18, 30, 9
length:
    .word 7

max_value:
    .word 0

    .section .text
    .global _start

_start:
    LDR r0, =array        @ r0 = address of array
    LDR r1, =length
    LDR r1, [r1]          @ r1 = number of elements

    LDR r2, [r0]          @ r2 = current max = first element
    ADD r0, r0, #4        @ move to next element
    SUB r1, r1, #1        @ one element already used

loop:
    CMP r1, #0
    BEQ done

    LDR r3, [r0]          @ load current array element
    CMP r3, r2
    BLE skip_update
    MOV r2, r3            @ update max

skip_update:
    ADD r0, r0, #4        @ next element
    SUB r1, r1, #1
    B loop

done:
    LDR r4, =max_value
    STR r2, [r4]          @ store result

stop:
    B stop
