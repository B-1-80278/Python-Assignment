import java.util.Scanner;

// Employee class
class Employee {
    private int id;
    private String name;
    private double salary;

    public Employee(int id, String name, double salary) {
        this.id = id;
        this.name = name;
        this.salary = salary;
    }

    @Override
    public String toString() {
        return "ID: " + id + ", Name: " + name + ", Salary: " + salary;
    }
}

// Stack interface
interface Stack {
    int STACK_SIZE = 10; // Constant for stack size

    void push(Employee emp);

    Employee pop();
}

// FixedStack implementation of Stack interface
class FixedStack implements Stack {
    private Employee[] stackArray;
    private int top;

    public FixedStack() {
        stackArray = new Employee[STACK_SIZE];
        top = -1;
    }

    @Override
    public void push(Employee emp) {
        if (top < STACK_SIZE - 1) {
            stackArray[++top] = emp;
        } else {
            System.out.println("Stack overflow - Cannot push. Stack is full.");
        }
    }

    @Override
    public Employee pop() {
        if (top >= 0) {
            return stackArray[top--];
        } else {
            System.out.println("Stack underflow - Cannot pop. Stack is empty.");
            return null;
        }
    }
}

// GrowableStack implementation of Stack interface
class GrowableStack implements Stack {
    private Employee[] stackArray;
    private int top;
    private int size;

    public GrowableStack() {
        stackArray = new Employee[STACK_SIZE];
        top = -1;
        size = STACK_SIZE;
    }

    @Override
    public void push(Employee emp) {
        if (top == size - 1) {
            Employee[] newArray = new Employee[size * 2];
            System.arraycopy(stackArray, 0, newArray, 0, size);
            stackArray = newArray;
            size *= 2;
        }
        stackArray[++top] = emp;
    }

    @Override
    public Employee pop() {
        if (top >= 0) {
            return stackArray[top--];
        } else {
            System.out.println("Stack underflow - Cannot pop. Stack is empty.");
            return null;
        }
    }
}


