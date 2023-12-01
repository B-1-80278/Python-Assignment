// Q1) Accept one int value from user, and convert it in Integer.

import java.util.Scanner;

class Q1 {
    public static void main(String[] args)
    {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the int value: ");
        int n = sc.nextInt();
        System.out.println("Integer is "+Integer.valueOf(n));
        sc.close();
    }
}

    
