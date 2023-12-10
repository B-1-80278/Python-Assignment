
public class Q3 {

	public static void main(String[] args) {
		String ar1[] = new String[] {"This","is","first","String","Array"};
		String ar2[] = new String[] {"Contents","of","second","String","Array"};
		
		System.out.println("Duplicate strings in two arrays : ");
		for(String e1:ar1) {
			for(String e2:ar2) {
				if(e1.equals(e2))
					System.out.print(e1+"  ");
			}
		}

	}

}
