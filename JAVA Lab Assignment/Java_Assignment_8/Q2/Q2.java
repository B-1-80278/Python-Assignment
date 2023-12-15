import java.util.ArrayList;
import java.util.Collections;
public class Q2 {

     public static void main(String[] args) {

            ArrayList<String> colorsList = new ArrayList<>();


            colorsList.add("Red");
            colorsList.add("Blue");
            colorsList.add("Green");
            colorsList.add("Yellow");
            colorsList.add("Orange");

            // Print the original list
            System.out.println("Original List of Colors:");
            System.out.println(colorsList);

            // Sort the ArrayList
            Collections.sort(colorsList);

            // Print the sorted list
            System.out.println("\nSorted list of colors:");
            System.out.println(colorsList);
        }

}
