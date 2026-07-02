public class VaibhavForecastingTest {

    // recursive method to calculate future value with constant growth rate
    public static double calculateFutureValue(double presentValue, double growthRate, int years) {
        // base case if years is 0 then value stays the same
        if (years == 0) {
            return presentValue;
        }
        
        // recursive step calculating next year value
        double nextYearValue = presentValue * (1 + growthRate);
        return calculateFutureValue(nextYearValue, growthRate, years - 1);
    }

    public static void main(String[] args) {
        double initialInvestment = 1000.0; 
        double annualRate = 0.05; // 5% growth
        int forecastYears = 5;

        System.out.println("--- vaibhav mishras financial forecasting tool ---");
        
        double finalValue = calculateFutureValue(initialInvestment, annualRate, forecastYears);
        
        System.out.printf("initial investment: %.2f\n", initialInvestment);
        System.out.printf("forecasted value after %d years: %.2f\n", forecastYears, finalValue);
    }
}


// MY LEARNING NOTES FOR EXERCISE 7:  //


// What I learnt through this:  

//   -> i finally got how recursion works by passing the updated values forward into the next method call like a chain
//   -> understood that every recursive function absolutely needs a base case or it will just run forever and crash the program


// Mistakes I did: //

//   -> at first i forgot to subtract 1 from the years variable inside the recursive call which caused a bad stackoverflowerror crash
//   -> i accidentally initialized the growth rate as 5 instead of 0.05 which made the math look completely wrong before i fixed the decimal spot