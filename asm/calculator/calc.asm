;Calculator
;
;Starts here

global _start

section .data
	welcome db 0dh, 0ah, 0dh, 0ah, " ****************************************** Hello and Welcome to this Calculator! ****************************************** ", 0dh, 0ah
	welcome_length equ $-welcome

	choice db "Please make your choice: ", 0dh, 0ah
	choice_length equ $-choice

	operator db "1, Add", 0dh, 0ah, "2. Substract", 0dh, 0ah, "3. Multiply", 0dh, 0ah, "4. Divide", 0dh, 0ah, "5. Exit", 10
	operator_length equ $-operator

	tmp: db 0,0
	answer db "Answer of: "
	answer_length equ $-answer
	plus db " + "
	plus_length equ $-plus
	equals db " = "
	equals_length equ $-equals
	minus db " - "
	minus_length equ $-minus
	mult db " * "
	mult_length equ $-mult
    division db " D "
    division_length equ $-division
    first_number db "Please enter your first number: ", 0dh, 0ah
    first_number_length equ $-first_number
    first_temp db 0,0
    second_number db "Please enter your second number: ", 0dh, 0ah
    second_number_length equ $-second_number
    second_temp db 0,0

section .text

_start:

LOOP:

call welcome_message
call get_choice
call operators
call get_input
call Compare_input
jmp LOOP

welcome_message:
	mov rax, 0x1
	mov rdi, 1
	mov rsi, welcome
	mov rdx, welcome_length
	syscall
	ret

get_choice:
	mov rax, 0x1
	mov rdi, 1
	mov rsi, choice
	mov rdx, choice_length
	syscall
	ret

operators:
	mov rax, 0x1
	mov rdi, 1
	mov rsi, operator
	mov rdx, operator_length
	syscall
	ret

get_input:
	mov rax, 0
	mov rdi, 0
	mov rsi, tmp
	mov rdx, 2
	syscall
	ret

Compare_input:

    cmp byte[rsi], '1'
    je Add

    cmp byte[rsi], '2'
    je Substract

    cmp byte[rsi], '3'
    je Multiply

    cmp byte[rsi], '4'
    je Divide

    cmp byte[rsi], '5'
    je Exit

Add:

	mov rax, 0x1
	mov rdi, 1
	mov rsi, first_number
	mov rdx, first_number_length
	syscall

	mov rax, 0
	mov rdi, 0
	mov rsi, first_temp
	mov rdx, 2
	syscall

	mov r8, first_temp

	mov rax, 0x1
	mov rdi, 1
	mov rsi, second_number
	mov rdx, second_number_length
	syscall

	mov rax, 0
	mov rdi, 0
	mov rsi, second_temp
	mov rdx, 2
	syscall

	mov r9, second_temp

	push r8
	push r9

	mov r8, [first_temp]
	mov r9, [second_temp]

	sub r8, 48
	sub r9, 48

	mov r10, r8
	mov r10, r9

	pop r9
	pop r8

	add r10, 48

	mov rax, 0x1
	mov rdi, 1
	mov rsi, answer
	mov rdx, answer_length
	syscall

	mov rax, 0x1
	mov rdi, 1
	mov rsi, r8
	mov rdx, 1
	syscall

	mov rax, 0x1
	mov rdi, 1
	mov rsi, plus
	mov rdx, plus_length
	syscall

	mov rax, 0x1
	mov rdi, 1
	mov rsi, r9
	mov rdx, 1
	syscall

	mov rax, 0x1
	mov rdi, 1
	mov rsi, equals
	mov rdx, equals_length
	syscall

    mov [rsp+8], r10

    mov rax, 0x1
    mov rdi, 1
    lea rsi, [rsp+8]
    mov rdx, 1
    syscall

    jmp LOOP

Substract:

    mov rax, 0x1
	mov rdi, 1
	mov rsi, first_number
	mov rdx, first_number_length
	syscall

	mov rax, 0
	mov rdi, 0
	mov rsi, first_temp
	mov rdx, 2
	syscall

	mov r8, first_temp

	mov rax, 0x1
	mov rdi, 1
	mov rsi, second_number
	mov rdx, second_number_length
	syscall

	mov rax, 0
	mov rdi, 0
	mov rsi, second_temp
	mov rdx, 2
	syscall

	mov r9, second_temp

	push r8
	push r9

	mov r8, [first_temp]
	mov r9, [second_temp]

	sub r8, 48
	sub r9, 48

	mov r10, r8
	sub r10, r9

	pop r9
	pop r8

	add r10, 48

	mov rax, 0x1
	mov rdi, 1
	mov rsi, answer
	mov rdx, answer_length
	syscall

	mov rax, 0x1
	mov rdi, 1
	mov rsi, r8
	mov rdx, 1
	syscall

	mov rax, 0x1
	mov rdi, 1
	mov rsi, minus
	mov rdx, minus_length
	syscall

	mov rax, 0x1
	mov rdi, 1
	mov rsi, r9
	mov rdx, 1
	syscall

	mov rax, 0x1
	mov rdi, 1
	mov rsi, equals
	mov rdx, equals_length
	syscall

    mov [rsp+8], r10

    mov rax, 0x1
    mov rdi, 1
    lea rsi, [rsp+8]
    mov rdx, 1
    syscall

    jmp LOOP

Multiply:

	mov rax, 0x1
	mov rdi, 1
	mov rsi, first_number
	mov rdx, first_number_length
	syscall

	mov rax, 0
	mov rdi, 0
	mov rsi, first_temp
	mov rdx, 2
	syscall

	mov r8, first_temp

	mov rax, 0x1
	mov rdi, 1
	mov rsi, second_number
	mov rdx, second_number_length
	syscall

	mov rax, 0
	mov rdi, 0
	mov rsi, second_temp
	mov rdx, 2
	syscall

	mov r9, second_temp

	push r8
	push r9

	mov r8, [first_temp]
	mov r9, [second_temp]

	sub r8, 48
	sub r9, 48

	mov r10, r8
	imul r10, r9

	pop r9
	pop r8

	add r10, 48

	mov rax, 0x1
	mov rdi, 1
	mov rsi, answer
	mov rdx, answer_length
	syscall

	mov rax, 0x1
	mov rdi, 1
	mov rsi, r8
	mov rdx, 1
	syscall

	mov rax, 0x1
	mov rdi, 1
	mov rsi, mult
	mov rdx, mult_length
	syscall

	mov rax, 0x1
	mov rdi, 1
	mov rsi, r9
	mov rdx, 1
	syscall

	mov rax, 0x1
	mov rdi, 1
	mov rsi, equals
	mov rdx, equals_length
	syscall

    mov [rsp+8], r10

    mov rax, 0x1
    mov rdi, 1
    lea rsi, [rsp+8]
    mov rdx, 1
    syscall

    jmp LOOP

Divide:
	mov rax, 0x1
	mov rdi, 1
	mov rsi, first_number
	mov rdx, first_number_length
	syscall

	mov rax, 0
	mov rdi, 0
	mov rsi, first_temp
	mov rdx, 2
	syscall

	mov r8, first_temp

	mov rax, 0x1
	mov rdi, 1
	mov rsi, second_number
	mov rdx, second_number_length
	syscall

	mov rax, 0
	mov rdi, 0
	mov rsi, second_temp
	mov rdx, 2
	syscall

	mov r9, second_temp

	push r8
	push r9

	mov r8, [first_temp]
	mov r9, [second_temp]

	sub r8, 48
	sub r9, 48

	mov r10, r8
	div r10, r9

	pop r9
	pop r8

	add r10, 48

	mov rax, 0x1
	mov rdi, 1
	mov rsi, answer
	mov rdx, answer_length
	syscall

	mov rax, 0x1
	mov rdi, 1
	mov rsi, r8
	mov rdx, 1
	syscall

	mov rax, 0x1
	mov rdi, 1
	mov rsi, mult
	mov rdx, mult_length
	syscall

	mov rax, 0x1
	mov rdi, 1
	mov rsi, r9
	mov rdx, 1
	syscall

	mov rax, 0x1
	mov rdi, 1
	mov rsi, equals
	mov rdx, equals_length
	syscall

    mov [rsp+8], r10

    mov rax, 0x1
    mov rdi, 1
    lea rsi, [rsp+8]
    mov rdx, 1
    syscall

    jmp LOOP

Exit:
    mov rax, 60
    mov rdi, 0
    syscall
    sysexit



