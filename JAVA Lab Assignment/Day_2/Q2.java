// Q2) Accept name and mobile number from the user using command line 
// argument and represent mobile number in int format.

public class Q2 {
    public static void main(String args[])
    {
        String name = args[0];
        long mobile = Long.parseLong(args[1]);
        System.out.println("Name: "+name+"\t"+"Mobile: "+mobile);
    }
}
