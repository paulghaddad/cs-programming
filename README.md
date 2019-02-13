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
