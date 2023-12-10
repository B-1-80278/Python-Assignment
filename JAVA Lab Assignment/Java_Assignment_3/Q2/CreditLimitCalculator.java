package test;
import java.util.Scanner;
import com.app.customer.*;

public class CreditLimitCalculator {

	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
		System.out.println("Creating a new Customer.. Please enter customer details : ");
		System.out.print("Enter account number : ");
		int acno=sc.nextInt();
		System.out.print("Enter balance begining at the month : ");
		int bal=sc.nextInt();
		System.out.print("Enter total of all items charged : ");
		int items=sc.nextInt();
		System.out.print("Enter total of all credits applied : ");
		int cred=sc.nextInt();
		System.out.print("Enter allowed credit limit : ");
		int limit=sc.nextInt();
		
		Customer c=new Customer(acno,bal,items,cred,limit);
		
		System.out.println("New balance : "+c.calculateNewBalance());
		
		if(c.getLimit()<c.calculateNewBalance()) {
			System.out.println("Credit Limit Exceeded ....");
		}

		
		
		
		sc.close();
	}

}
