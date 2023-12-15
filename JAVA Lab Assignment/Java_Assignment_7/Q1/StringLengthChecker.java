import java.util.Scanner;
class ExceptionLineTooLong extends Exception {
    public ExceptionLineTooLong(String message) {
        super(message);
    }
}


public class StringLengthChecker {
    public static void main(String[] args) {
        try {
            // Read a string from the user
            Scanner scanner = new java.util.Scanner(System.in);
            System.out.println("Enter a string: ");
            String input = scanner.nextLine();
            scanner.close();

            // Calculate the length of the string
            int length = input.length();

            // Check if the length exceeds 80 characters
            if (length > 80) {
                // Throw custom exception
                throw new ExceptionLineTooLong("The string is too long.");
            } else {
                System.out.println("String length is within limits.");
            }
        } catch (ExceptionLineTooLong e) {
            System.out.println(e.getMessage());
        }
    }
}