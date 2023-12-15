/*
Q3) Write a Java program to replace the second element of a ArrayList with
the specified element
 */
import java.util.ArrayList;

public class Q3 {
        public static void main(String args[]){
            ArrayList<String> sixFriends = new ArrayList<>();
            sixFriends.add("Ross");
            sixFriends.add("Cat");
            sixFriends.add("Phoebe");
            sixFriends.add("Chandler");
            sixFriends.add("Monica");
            sixFriends.add("Rachel");

            System.out.println("Wrong Friends Serial List:");
            System.out.println(sixFriends);
            System.out.println();

            sixFriends.set(1, "Joey");

            System.out.println("Updated Friends Serial List:");
            System.out.println(sixFriends);

        }

}
