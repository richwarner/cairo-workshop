"In Cairo programs, you write what results are **acceptable**, not **how to** come up with results."
 
 In solidity we might write a stament to extract an amount from a balance, in Cairo we would write a statement to check that for the parties involved the sum of the balances hasn't changed   
 
 ### Data types - the field element
 In Cairo, the basic data type is an integer in the range $0≤x<P$ where P is a prime number. All the computations are done modulo P.
 
Problems working with modulo P :

In Cairo when you don’t specify a type of a variable/argument, its type is a **field element** (represented by the keyword `felt`). In the context of Cairo, when we say “a field element” we mean an integer in the range $−P/2<x<P/2$ where $P$ is a very large (prime) number (currently it is a 252-bit number, which is a number with 76 decimal digits). When we add, subtract or multiply and the result is outside the range above, there is an overflow, and the appropriate multiple of P is added or subtracted to bring the result back into this range (in other words, the result is computed modulo P).

The most important difference between integers and field elements is **division**: Division of field elements (and therefore division in Cairo) _is not_ the integer division you have in many programming languages, where the integral part of the quotient is returned (so you get `7 / 3 = 2`). As long as the numerator is a multiple of the denominator, it will behave as you expect (`6 / 3 = 2`). If this is not the case, for example when we divide `7/3`, it will result in a field element `x` that will satisfy `3 * x = 7`. It won’t be `2.3333` because `x` has to be an integer. If this seems impossible remember that if `3 * x` is outside the range $−P/2<x<P/2$  an overflow will occur which can bring the result down to 7. It’s a well-known mathematical fact that unless the denominator is zero, there will always be a value `x` satisfying `denominator * x = numerator`.


### Memory model

Cairo supports a read-only nondeterministic memory, which means that the value for each memory cell is chosen by the prover, but it cannot change over time (during a Cairo program execution). We use the syntax $[x]$  to represent the value of the memory at address $x$. The above implies, for example, that if we assert that $[0] = 7$  at the beginning of a program, then the value of $[0]$ will be $7$ during the entire run.

It is usually convenient to think of the memory as a write-once memory: you may write a value to a cell once, but you cannot change it afterwards. Thus, we may interpret an instruction that asserts that $[0] == 7$ either as “read the value from the memory cell at address $0$ and verify that you got $7$” or “write the value $7$ to that memory cell” depending on the context (in the read-only nondeterministic memory model they mean the same thing).
 
 ###  Registers

The only values that may change over time are held within designated registers:

-   `ap` (allocation pointer) - points to a yet-unused memory cell.
    
-   `fp` (frame pointer) - points to the frame of the current function. The addresses of all the function’s arguments and local variables are relative to the value of this register. When a function starts, it is equal to `ap`. But unlike `ap`, the value of `fp` remains the same throughout the scope of a function.     
-   `pc` (program counter) - points to the current instruction.
 
 A simple Cairo program 
 
 `[ap] = [ap - 1] * [fp]; ap++`
