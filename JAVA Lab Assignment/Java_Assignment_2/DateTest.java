//package q3;

public class DateTest {

	public static void main(String[] args) {
		Date d1=new Date(2,4,1998);
		System.out.println("Month : "+d1.getMonth());
		
		d1.setDay(15);
		d1.displayDate();
		
	}

}
