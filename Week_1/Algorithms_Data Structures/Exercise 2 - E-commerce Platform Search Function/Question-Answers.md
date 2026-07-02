# Exercise 2: E-commerce Platform Search Function

### Q1: explain big o notation and how it helps in analyzing algorithms
-> big o notation is just a simple way to see how the speed or space of our code changes when we give it more data to process

-> instead of measuring time in exact seconds b/c some computers are faster than others big o looks at the actual number of operations or steps the loops have to run

-> it helps us look at the worst case scenario so we can make sure vaibhav mishras platform dont freeze or break down when we scale up to millions of products

### Q2: describe the best average and worst case scenarios for search operations
-> linear search best case is o1 b/c the item we want is right at index 0 on our very first check

-> linear search average case is on b/c we usually end up scanning through roughly half the collection to find our target

-> linear search worst case is on b/c if the product is at the very end or not in the system at all we are forced to check every single element one by one

-> binary search best case is o1 b/c our very first middle calculation lands exactly on the product id we wanted

-> binary search average case is olog n b/c we continuously divide the active search pool in half until we locate the item

-> binary search worst case is olog n b/c even if the item does not exist we only need to split the array a small number of times before running out of options

### Q3: compare the time complexity of linear and binary search algorithms
-> linear search runs in on time which means if our inventory increases the time it takes to search grows in a straight line

-> binary search runs in olog n time which is super fast b/c cutting the array in half means it can search millions of items in just a few steps

-> the biggest difference is that linear search can run on any messy unsorted array but binary search strictly needs the entire array to be sorted first or it completely breaks

### Q4: discuss which algorithm is more suitable for your platform and why
-> binary search is definitely the most suitable choice for an e-commerce platform b/c shopping websites have thousands or millions of products

-> using linear search would make the platform feel laggy and slow for customers b/c checking items one by one takes too much time when traffic scales up

-> even though keeping the inventory array sorted requires some extra coding work behind the scenes it is a smart trade-off b/c customers search for products constantly while updating inventory happens way less often