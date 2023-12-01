// Q5) Take two numbers from user, write a switch case statement to perform arithmetic operations.
import java.util.Scanner;

public class Q5 {
    public static void main(String[] args) 
    {
        Scanner sc=new Scanner(System.in);
        
        System.out.print("Enter first number : ");
        int n1=sc.nextInt();

        System.out.print("Enter second number : ");
        int n2=sc.nextInt();

        System.out.println("Enter one of operation : + - * /");
        char c=sc.next().charAt(0);
        switch (c) {
            case '+':
                System.out.println("Addition = "+(n1+n2));
                break;
            case '-':
                System.out.println("Subtraction = "+(n1-n2));
                break;
            case '*':
                System.out.println("Multiplication = "+(n1*n2));
                break;
            case '/':
                System.out.println("Division = "+((float)n1/n2));
                break;
            default:
                System.out.println("Unknown operation...");
        }
        sc.close();
    }
}