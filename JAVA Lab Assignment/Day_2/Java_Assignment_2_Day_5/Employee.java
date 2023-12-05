public class Employee{
    String firstName;
    String lastName;
    double salary;

    Employee(){
        this.firstName = "default";
        this.lastName = "default1";
        this.salary = 0;
    }

    Employee(String firstName, String lastName, double salary){
        this.firstName = firstName;
        this.lastName = lastName;
        this.salary = salary;
    }


    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        if(salary>=0) {
            this.salary = salary;
        }else{
            this.salary = 0;
        }
    }

    public void yearlySalary(){
        double yearlySalary1 = salary*12;
        System.out.println("Yearly Salary is "+yearlySalary1);
    }

    public void increment(){
        salary = salary*12*1.1;
        System.out.println("Salary after 10% raise is "+salary);
    }
}
