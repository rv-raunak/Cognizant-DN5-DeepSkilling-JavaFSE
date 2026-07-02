# Exercise 7: Financial Forecasting

### Q1: Explain the concept of recursion and how it can simplify certain problems

-> Recursion is just when a method calls itself to break down a big problem into smaller and smaller pieces until it hits a base case where it stops

-> It simplifies problems that naturally repeat the exact same logic over and over like compounding interest or moving through tree structures b/c we dont have to write lots of messy nested loops

-> Instead of managing complex loop counters we just write the formula once and let the method call itself with updated values until it finishes


### Q2: Discuss the time complexity of your recursive algorithm

-> The basic recursive approach has a time complexity of o n b/c if we want to forecast for n years the method has to call itself exactly n times in a straight linear chain

-> For memory it takes o n space complexity too b/c each recursive call gets piled up on the system call stack until the base case is finally reached


### Q3: Explain how to optimize the recursive solution to avoid excessive computation

-> To optimize this we can use a technique called memoization which is just a fancy word for saving our past results in an array or a hashmap so we never calculate the exact same year twice

-> For basic compound interest a simple linear recursion is fine but if we were doing complex scenarios with multiple branches saving past results stops the program from doing duplicate math operations and freezing up

-> Another way is tail recursion where we pass the running total forward into the next method call so the computer doesnt have to keep a massive stack of open frames waiting in memory