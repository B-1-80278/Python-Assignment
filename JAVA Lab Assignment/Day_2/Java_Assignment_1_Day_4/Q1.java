/*1. Accept an integer number and when the program is executed print the
        binary, octal and hexadecimal equivalent of the given number.
        Sample Output:
        java Test
        Enter Number : 20
        Given Number :20
        Binary equivalent :10100
        Octal equivalent :24
        Hexadecimal equivalent :14
        Hint : toBinaryString() , toOctalString(), toHexString()*/

import java.util.Scanner;

public class Q1 {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter number: ");
        int number = sc.nextInt();
        System.out.println("Given Number: "+number);
        String binary = Integer.toBinaryString(number);
        System.out.println("Binary equivalent: "+binary);
        String octal = Integer.toOctalString(number);
        System.out.println("Octal equivalent: "+octal);
        String hexa = Integer.toHexString(number);
        System.out.println("Hexadecimal equivalent: "+hexa);


    }

}
