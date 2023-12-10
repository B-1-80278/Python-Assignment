// Write a java program to reverse a String

public class Q1{
    public static void main(String[] args) {
        String str="1234";
        StringBuffer sb=new StringBuffer(str);
        sb = sb.reverse();
        String rev=sb.toString();
        System.out.println("Reversed String : "+rev);
    }
}