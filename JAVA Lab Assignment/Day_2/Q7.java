public class Q7 {
    public static void main(String[] args) 
    {
        String number = args[0];
        StringBuffer sb = new StringBuffer(number);
        sb.reverse();

        System.out.println("Reverse number of "+ number+" is "+sb);
    }
    
}