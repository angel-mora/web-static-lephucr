---
title: Leap Year x86-64 Assembly
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Leap Year x86-64 Assembly

## ✅ TODOs


## 📌 Summary
Please solve and explain to me the following exercise:

## 🧠 Full Chat


Please solve and explain to me the following exercise:
https://exercism.org/tracks/x86-64-assembly/exercises/leap/

This exercise requires you to write an x86-64 Assembly language program to determine if a given year is a leap year.

A leap year is a year that is evenly divisible by 4, except for years that are both divisible by 100 and not divisible by 400.

Here's a high-level explanation of how the solution might look:

1. Load the year into the RAX register
2. Divide the year by 4 and store the result in RAX
3. Check if the result is an integer (that is, there is no remainder)
4. If the result is not an integer, jump to the end and return false
5. Divide the year by 100 and store the result in RDX
6. Check if the result is an integer
7. If the result is an integer, divide the year by 400 and store the result in RDX
8. Check if the result is an integer
9. If the result is an integer, return true, otherwise return false

Note that this is just a high-level explanation and the actual code will be more complex.

How would the code look like?

Here is an example implementation of the algorithm in x86-64 Assembly language:

```
.section .data
.section .text
.globl _start

_start:
    # Load the year into the RAX register
    movq $YEAR, %rax

    # Divide the year by 4 and store the result in RAX
    movq $0, %rdx
    divq $4

    # Check if the result is an integer
    test %rdx, %rdx
    jne not_leap

    # Divide the year by 100 and store the result in RDX
    movq $0, %rdx
    divq $100

    # Check if the result is an integer
    test %rdx, %rdx
    je not_leap

    # Divide the year by 400 and store the result in RDX
    movq $0, %rdx
    divq $400

    # Check if the result is an integer
    test %rdx, %rdx
    je leap

not_leap:
    # Return false
    movq $0, %rax
    jmp end

leap:
    # Return true
    movq $1, %rax

end:
    # Exit the program
    xorq %rdi, %rdi
    movq $60, %rax
    syscall
```

Note that in this example, the year is defined as a constant value `YEAR`. Replace this value with the year you want to check.

This is what I need to adapt the algorithm to
section .text
global leap_year
leap_year:
    ; Provide your implementation here
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif

Here's an example of the code adapted to the provided format:

```
section .text
global leap_year

leap_year:
    # Load the year into the RAX register
    movq 8(%rsp), %rax

    # Divide the year by 4 and store the result in RAX
    movq $0, %rdx
    divq $4

    # Check if the result is an integer
    test %rdx, %rdx
    jne not_leap

    # Divide the year by 100 and store the result in RDX
    movq $0, %rdx
    divq $100

    # Check if the result is an integer
    test %rdx, %rdx
    je not_leap

    # Divide the year by 400 and store the result in RDX
    movq $0, %rdx
    divq $400

    # Check if the result is an integer
    test %rdx, %rdx
    je leap

not_leap:
    # Return false
    movq $0, %rax
    ret

leap:
    # Return true
    movq $1, %rax
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
```

In this code, the year is passed to the function as an argument on the stack. The argument is loaded into the RAX register using `movq 8(%rsp), %rax`, where `8(%rsp)` is the memory address of the argument on the stack. The function returns either 0 or 1 in the RAX register, indicating whether the year is a leap year or not.

section .text
global leap_year

leap_year:
    # Load the year into the RAX register
    movq 8(%rsp), %rax

    # Divide the year by 4 and store the result in RAX
    movq $0, %rdx
    divq $4

    # Check if the result is an integer
    test %rdx, %rdx
    jne not_leap

    # Divide the year by 100 and store the result in RDX
    movq $0, %rdx
    divq $100

    # Check if the result is an integer
    test %rdx, %rdx
    je not_leap

    # Divide the year by 400 and store the result in RDX
    movq $0, %rdx
    divq $400

    # Check if the result is an integer
    test %rdx, %rdx
    je leap

not_leap:
    # Return false
    movq $0, %rax
    ret

leap:
    # Return true
    movq $1, %rax
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif


That looks correct! This code implements the algorithm to determine if a given year is a leap year or not. The year is passed as an argument on the stack and is loaded into the RAX register using `movq 8(%rsp), %rax`. The function then uses the division and testing operations to determine if the year is a leap year or not. If the year is a leap year, the function returns 1 in the RAX register. If it is not a leap year, the function returns 0. The code is also equipped with the `%ifidn` directive to ensure that the stack is properly configured for the output format.