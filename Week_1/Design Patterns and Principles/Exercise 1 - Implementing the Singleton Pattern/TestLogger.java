public class TestLogger {
    public static void main(String[] args) {
        Logger obj1 = Logger.getInstance();
        Logger obj2 = Logger.getInstance();

        obj1.log("Running check 1");
        obj2.log("Running check 2");

        // if this prints true then it means they point to the same memory area
        System.out.println("Is it the same instance? " + (obj1 == obj2));
    }
}


// MY LEARNING NOTES FOR EXERCISE 1:  //


// What I learnt through this:

//   - I finally understood why we use private constructors. Making it private completely blocks other classes from creating new copies.

//   - Using a static method like getInstance() is pretty clever because it acts like a single gatekeeper for the object.




// Mistakes I did: //

//   - At first, I automatically typed "public Logger()" because of habit, which let me use the 'new' keyword in my test file and broke the pattern.

//   - I forgot the static keyword on the instance variable initially, which threw a compiler error inside the static method.
