// write a java program to count number of words in a String.
// Hint: You can use , trim() , length() and split() methods

import java.util.Scanner;

public class Q3 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.print("Enter a sentence : ");
        String sent=sc.nextLine();
        String words[]=sent.trim().split(" +");
        
        for (String string : words) {
            System.out.println(string);
        }
        System.out.println("Number of words = "+words.length);


        sc.close();
    }
}
