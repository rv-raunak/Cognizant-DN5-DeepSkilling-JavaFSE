public class VaibhavSearchTest {

    // linear search checks one by one
    public static Product linearSearch(Product[] arr, int targetId) {
        for (int i = 0; i < arr.length; i++) {
            if (arr[i].productId == targetId) {
                return arr[i];
            }
        }
        return null; 
    }

    // binary search cuts the array in half each time
    public static Product binarySearch(Product[] arr, int targetId) {
        int left = 0;
        int right = arr.length - 1;

        while (left <= right) {
            int mid = left + (right - left) / 2;

            if (arr[mid].productId == targetId) {
                return arr[mid];
            }
            if (arr[mid].productId < targetId) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        return null;
    }

    public static void main(String[] args) {
        // setting up vaibhavs mock database of products
        Product p1 = new Product(101, "Wireless Mouse", "Electronics");
        Product p2 = new Product(205, "Desk Lamp", "Home");
        Product p3 = new Product(310, "Mechanical Keyboard", "Electronics");
        Product p4 = new Product(450, "Coffee Mug", "Kitchen");
        Product p5 = new Product(599, "Gaming Chair", "Furniture");

        // array for linear search (doesnt matter if sorted but keeping it same for test)
        Product[] inventory = {p1, p2, p3, p4, p5};

        System.out.println("--- vaibhavs e-commerce search test ---");

    
        Product foundLinear = linearSearch(inventory, 450);
        if (foundLinear != null) {
            System.out.println("linear search found: " + foundLinear.productName);
        }

        Product foundBinary = binarySearch(inventory, 205);
        if (foundBinary != null) {
            System.out.println("binary search found: " + foundBinary.productName);
        }
    }
}

// MY LEARNING NOTES:  //


// What I learnt through this:  

//   -> figured out how big o notation actually applies to real code and why keeping a database sorted is so important for fast searches
//   -> writing the binary search logic helped me see how it jumps to the middle of the array to cut down time


// Mistakes I did: //

//   -> at first i forgot that binary search strictly needs a sorted array first so when i tested it with random product ids earlier my code was returning weird null errors
//   -> i messed up the while loop condition in binary search by using less than instead of less than or equal to which skipped checking the very last element