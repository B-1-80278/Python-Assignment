/*Q4) Accept a character from user and display its ascii value. */

import java.util.Scanner;
public class Q4 {

    public static void main(String args[]) 
    {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter any character to get it's ASCII value: ");
        char c = sc.next().charAt(0);
        int ascii = c;
        System.out.println("ASCII value is: "+ascii);
        sc.close();
    } 
}
