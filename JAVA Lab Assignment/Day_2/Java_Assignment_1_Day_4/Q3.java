/*   3. Display food menu to user. User will select items from menu along with the
quantity. (eg 1. Dosa 2. Samosa 3. Idli ... 10 . Generate Bill ) Assign fixed
prices to food items(hard code the prices) When user enters 'Generate Bill'
option , display total bill & exit. */

import java.util.Scanner;

public class Q3 {
    static float bill = 0;
    static int [] price = {60,60,60,80,40,60,25,40,20,40};
    static int menu(){

        System.out.println("------Menu------");
        System.out.println("1.Idli - 60rs");
        System.out.println("2.Dosa - 60rs");
        System.out.println("3.Vada - 60rs");
        System.out.println("4.uttapam - 80rs");
        System.out.println("5.upma - 40rs");
        System.out.println("6.aappe - 60rs");
        System.out.println("7.Tea - 25rs");
        System.out.println("8.Filter coffee - 40rs");
        System.out.println("9.Water bottle - 20rs");
        System.out.println("10.Naral pani - 40rs");
        System.out.println("---------------------");
        System.out.println("11.Exit");
        System.out.println("---------------------");
        System.out.println("ENTER CHOICE");
        System.out.println("---------------------");
        Scanner sc = new Scanner(System.in);
        int m =sc.nextInt();
        return m;
    }
    static int quantity(){
        System.out.println("Enter Quantity");
        Scanner sc = new Scanner(System.in);
        return sc.nextInt();
    }

    public static void main(String[] args){

        int m;
        do {
            m = menu();
            if (m == 11){
                break;
            }
            int q = quantity();
            bill = (price[m-1] *q) + bill;
        }while(true);
        System.out.println("your bill is "+bill+" rs");
    }
}
