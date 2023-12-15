import java.util.Scanner;

// Tester class
public class StackTester {
    public static void main(String[] args) {
        Stack chosenStack = null;
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("Menu:");
            System.out.println("1 -- Choose Fixed Stack");
            System.out.println("2 -- Choose Growable Stack");
            System.out.println("3 -- Push data");
            System.out.println("4 -- Pop data & display");
            System.out.println("5 -- Exit");

            int choice = scanner.nextInt();

            switch (choice) {
                case 1:
                    chosenStack = new FixedStack();
                    break;
                case 2:
                    chosenStack = new GrowableStack();
                    break;
                case 3:
                    if (chosenStack != null) {
                        System.out.println("Enter Employee ID, Name, Salary:");
                        int empId = scanner.nextInt();
                        String empName = scanner.next();
                        double empSalary = scanner.nextDouble();
                        Employee newEmp = new Employee(empId, empName, empSalary);
                        chosenStack.push(newEmp);
                    } else {
                        System.out.println("No stack chosen !!!");
                    }
                    break;
                case 4:
                    if (chosenStack != null) {
                        Employee emp = chosenStack.pop();
                        if (emp != null) {
                            System.out.println("Popped: " + emp.toString());
                        }
                    } else {
                        System.out.println("No stack chosen !!!");
                    }
                    break;
                case 5:
                    scanner.close();
                    System.exit(0);
                    break;
                default:
                    System.out.println("Invalid choice.");
            }
        }
    }
}