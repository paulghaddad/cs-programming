# Computer Science: Programming

My work for the [teachyourselfcs](https://teachyourselfcs.com) Programming Module.

## Week 1: Functional Programming

This week consists of section 1.1, with the following topics:

* Basic syntax of Scheme
* Functions and their constructs: formal parameters, actual argument expression, actual argument value
* Evaluating combinations and using compound procedures
* The substitution model for procedure application
* Normal vs. Applicative Order
* Conditional expressions and predicates
* Procedures as black box abstractions, including the idea of recursion

## Week 2: Higher-Order Procedures

This week consists of section 1.3, with the following topics:

* Functions as data, or objects, as opposed to the more familiar view of functions as processes.
* Higher-order procedures are procedures that take in procedures as arguments or return procedures.
* Using functions as arguments, allowing us to generalize procedures, ir _ideas_. These higher-order procedures can take in a number or function that specifies what _varies_ in using the pattern, such as calculating the area of various shapes or summing a series.
* Function vocabulary:
  * Domain: What types of things does a function take as arguments?
  * Range: What types of things does a function return?
  * Real mathematicians say, "The function x maps to ax + b." This allows us to state the formal parameters to a function. See the work of Alonzo Church.
* Unnamed functions (lambdas): extends Alonzo's work above. `(lambda (x) (x + 2))` -> The function `x` maps to `x + 2`.
* First-class data types:
  * the value of a variable (ie, it is named)
  * an argument to a function
  * the return value from a function
  * a member of an aggregate
  * can be unnamed (ie anonymous)
* Functions as return values
  * For example, the derivative of a function is itself a function.
  * It transforms the input to another function.
* Using `let`

## Week 3: Procedures and the Process They Generate

This week consists of Section 1.2, with the following topics:

* Linear Recursion and Iteration
  * Recursion: expansion then contraction
  * Iteration: a process whose state can be summarized by a fixed number of _state variables_
  * Recursive process vs. recursive procedure: a recursive procedure means the procedure refers to itself; a recursive process refers to how the process evolves, not how the procedure is defined.
  * You can have a recursive procedure than has an iterative process
  * Tail recursive: a language implementation where a recursive procedure that generates an iterative process _properly_ executes in constant space. Many languages don't have this feature and recursive procedures with iterative processes still consumes memory linearly with the number of procedure calls.
* Tree Recursion
  * Differences in growth of time (steps) and space between tree recursion and linear iteration, illustrated with the Fibonacci sequence.
  * The use of memoization to transform tree recursion processes from an exponential number of steps into process whose space and time requirements grow linearly with the input.
* Orders of Growth
  * If `n` measures the size of the problem (which can be various properties) and `R(n)` is the amount of resources the process requires, then `R(n)` has order of growth `theta(f(n))` and is sandwiched between:
  ```
  k1f(n) <= R(n) <= k2f(n)
  ```
  * Example algorithms with time and space growth of theta(n) and theta(n); theta(n) and theta(1); theta(log n) and theta(log n)
  * Probabilistic algorithms
