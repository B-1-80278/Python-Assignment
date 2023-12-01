// Q8) accept one value from user, and it Returns true if this 
// Float value is a Not-a-Number (NaN) else it should return false otherwise.
import java.util.Scanner;

public class Q8 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter float value : ");

        float f=sc.nextFloat();

        System.out.print("Is float Nan : ");
        System.out.println((Float.isNaN(f)));


        sc.close();
    }
}