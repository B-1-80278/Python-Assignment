/*  Write Java program to demonstrate Boxing and Unboxing
a) byte to Byte object
b) int to Integer  and Integer to int 
c) float to Float and  Float to float
d) double to Dobule  and Double to double */

public class Q3 {
    public static void main(String args[]) 
    {
        byte b = 2;
        Byte byteobj = Byte.valueOf(b);
        System.out.println(byteobj);
    
        int i = 12;
        Integer intobj=Integer.valueOf(i); // p- np
        System.out.println(intobj);
        int n2=intobj.intValue();
        System.out.println(n2);

        float f = 7.5f;
        Float floatobj = Float.valueOf(f);
        System.out.println(floatobj);

        float f1 = floatobj.floatValue();
        System.out.println(f1);

        double d = 724.45;
        Double doubleobj = Double.valueOf(d);
        System.out.println(doubleobj);

        double d1 = doubleobj.doubleValue();
        System.out.println(d1);
    }
    
}
