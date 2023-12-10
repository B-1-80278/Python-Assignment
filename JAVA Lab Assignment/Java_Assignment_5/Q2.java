// Write a java code to check string is palindrome.
import java.util.Scanner;

public class Q2 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.print("Enter string : ");
        String str=sc.nextLine();
        StringBuffer sb=new StringBuffer(str);
        if (sb.reverse().toString().equals(str)) {
            System.out.println("String is palindrome");
        }
        else{
            System.out.println("Not palindrome");
        }
        sc.close();
    }
}
