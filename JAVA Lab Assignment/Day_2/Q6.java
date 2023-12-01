// Q6) Accept two numbers from user give choice to user,
//  a) Supply int data
//  b) Supply float data
//  c) Supply double data
//  and then in each case , try to find min and max value. 
//  Also compare two objects numerically and display the result.

import java.util.Scanner;

public class Q6 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter 1: int , 2: float, 3: double ");


        int type=sc.nextInt();
        
        switch (type) {
            case 1:
                System.out.print("Enter first int number : ");
                int n1=sc.nextInt();

                System.out.print("Enter second int number : ");
                int n2=sc.nextInt();

                System.out.println("int stored...");
                System.out.println("max value: "+Integer.max(n1, n2));
                System.out.println("min value : "+Integer.min(n2, n1));

                System.out.println("Are two int equal : "+(n1==n2));
                break;
            
            case 2:
                System.out.print("Enter first int number : ");
                float f1=sc.nextFloat();

                System.out.print("Enter second int number : ");
                float f2=sc.nextFloat();

                System.out.println("float stored...");
                System.out.println("max value : "+Float.max(f2, f1));
                System.out.println("min value : "+Float.max(f2, f1));

                System.out.println("Are two float equal : "+(f1==f2));
                break;

            case 3:
                System.out.print("Enter first int number : ");
                double d1=sc.nextDouble();

                System.out.print("Enter second int number : ");
                double d2=sc.nextDouble();

                System.out.println("double stored...");
                System.out.println("max value: "+Double.max(d2, d1));
                System.out.println("min value : "+Double.min(d2, d1));
                System.out.println("Are two double equal : "+(d1==d2));

                break;
            default:
                System.out.println("Unknow key pressed.....");
        }
        sc.close();


    }
}