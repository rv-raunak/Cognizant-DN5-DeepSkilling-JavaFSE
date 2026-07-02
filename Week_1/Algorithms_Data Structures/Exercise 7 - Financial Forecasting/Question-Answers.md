# Exercise 7: Financial Forecasting

### Q1: Explain the concept of recursion and how it can simplify certain problems

-> Recursion Is Just When A Method Calls Itself To Break Down A Big Problem Into Smaller And Smaller Pieces Until It Hits A Base Case Where It Stops

-> It Simplifies Problems That Naturally Repeat The Exact Same Logic Over And Over Like Compounding Interest Or Moving Through Tree Structures B/c We Dont Have To Write Lots Of Messy Nested Loops

-> Instead Of Managing Complex Loop Counters We Just Write The Formula Once And Let The Method Call Yourself With Updated Values Until It Finishes


### Q2: Discuss the time complexity of your recursive algorithm

-> The Basic Recursive Approach Has A Time Complexity Of O N B/c If We Want To Forecast For N Years The Method Has To Call Itself Exactly N Times In A Straight Linear Chain

-> For Memory It Takes O N Space Complexity Too B/c Each Recursive Call Gets Piled Up On The System Call Stack Until The Base Case Is Finally Reached


### Q3: Explain how to optimize the recursive solution to avoid excessive computation

-> To Optimize This We Can Use A Technique Called Memoization Which Is Just A Fancy Word For Saving Our Past Results In An Array Or A Hashmap So We Never Calculate The Exact Same Year Twice

-> For Basic Compound Interest A Simple Linear Recursion Is Fine But If We Were Doing Complex Scenarios With Multiple Branches Saving Past Results Stops The Program From Doing Duplicate Math Operations And Freezing Up

-> Another Way Is Tail Recursion Where We Pass The Running Total Forward Into The Next Method Call So The Computer Doesnt Have To Keep A Massive Stack Of Open Frames Waiting In Memory