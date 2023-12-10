package tester;
import com.app.geometry.*;
import java.util.Scanner;

public class TestPoint {

	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
		System.out.println("Enter the 2 points : ");
		
		System.out.print("Enter Point 1 x value : ");
		double x1=sc.nextDouble();
		System.out.print("Enter Point 1 y value : ");
		double y1=sc.nextDouble();
		Point2D p1=new Point2D(x1,y1);
				
		System.out.print("Enter Point 2 x value : ");
		double x2=sc.nextDouble();
		System.out.print("Enter Point 2 y value : ");
		double y2=sc.nextDouble();
		Point2D p2=new Point2D(x2,y2);
			
		System.out.println("Details of first point : "+p1.getDetails());
		System.out.println("Details of second point : "+p2.getDetails());
		
		System.out.println("Are points equal ? : "+p1.isEqual(p2));
		
		if(!p1.isEqual(p2)) {
			System.out.print("Distance between the points : ");
			System.out.printf("%5.2f",p1.calculateDistance(p2));
		}
		
		sc.close();
	}

}