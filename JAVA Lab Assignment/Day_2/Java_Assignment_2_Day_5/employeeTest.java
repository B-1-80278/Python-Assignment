public class employeeTest {
    public static void main(String[] args){
        Employee e1 = new Employee();
        e1.setFirstName("Sumit");
        e1.setLastName("coding-wala");
        System.out.println("Employee name is "+ e1.firstName+" "+e1.lastName);
        e1.setSalary(12000);
        e1.yearlySalary();
        e1.increment();

        System.out.println("-------------------------------");

        Employee e2 = new Employee();
        e2.setFirstName("VJ");
        e2.setLastName("buldozer-wala");
        System.out.println("Employee name is "+ e2.firstName+" "+e2.lastName);
        e2.setSalary(15000);
        e2.yearlySalary();
        e2.increment();

    }
}
