package tester;
import com.app.geometry.*;
import java.util.Scanner;

enum UserChoice{
	EXIT,DETAILS,CHECK_EQUAL,CALC_DISTANCE
}

public class TestPointArray1 {

	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
		System.out.print("Enter the number of points you want to plot : ");
		int count=sc.nextInt();
		
		System.out.println("Now enter the points co-ordinates : ");
		Point2D points[]=new Point2D[count];
		for(int i=0;i<count;i++){
			System.out.println("Enter point "+(i+1)+" details------");
			System.out.print("Input x coordinate : ");
			double x=sc.nextDouble();
			System.out.print("Input y coordinate : ");
			double y=sc.nextDouble();
			
			points[i]=new Point2D(x,y);
		}
			
		
		menu: while(true) {
			System.out.println();
			System.out.println();
			System.out.println("-----------------Press---------------------------");
			System.out.println("0 - Exit \n1 - get details of a point \n2 - check if two points are equal\n3 - calculate distance between 2 points.");
			System.out.print("Enter your choice : ");
			int inp=sc.nextInt();
			
			choice :switch(inp) {
				case 0:
					System.out.println("EXITTING......");
					break menu;
				case 1:
					System.out.print("Enter the index of point to get details : ");
					int ind=sc.nextInt();
					if(ind<0 || ind>=points.length) {
						System.out.println("Invalid index .....");
						break choice;
					}
					Point2D p=points[ind];
					System.out.println("Printing details ....");
					System.out.println(p.getDetails());
					break;
				case 2:
					System.out.println("Lets check if two points are equal ...");
					System.out.print("Enter the index of point 1 : ");
					int ind1=sc.nextInt();
					System.out.print("Enter the index of point 2 : ");
					int ind2=sc.nextInt();
					if(ind1<0 || ind2<0 || ind1>=points.length || ind2>=points.length) {
						System.out.println("Invalid index .....");
						break choice;
					}
					
					Point2D p1=points[ind1];
					Point2D p2=points[ind2];
					System.out.println(p1.getDetails());
					System.out.println(p2.getDetails());
					if(p1.isEqual(p2)) {
						System.out.println("Equal points ....");
					}
					else {
						System.out.println("Unequal points ....");
					}
					break;
				case 3:
					System.out.println("Lets calculate the distance between 2 points ...");
					System.out.print("Enter the index of point 1 : ");
					int index1=sc.nextInt();
					System.out.print("Enter the index of point 2 : ");
					int index2=sc.nextInt();
					if(index1<0 || index2<0 || index1>=points.length || index2>=points.length) {
						System.out.println("Invalid index .....");
						break choice;
					}
					Point2D point1=points[index1];
					Point2D point2=points[index2];
					System.out.println(point1.getDetails());
					System.out.println(point2.getDetails());
					System.out.printf("Distance between 2 points : "+point1.calculateDistance(point2));
					break;
				default :
					System.out.println("Unknown choice.....");
			}
			
			System.out.println();
			System.out.println();
		}
		
		sc.close();
	}

}
