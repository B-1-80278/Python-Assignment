// Custom exception for negative diameter
class NegativeDiameterException extends Exception {
    public NegativeDiameterException(String message) {
        super(message);
    }
}

// Circle class
public class Circle {
    private double myX;
    private double myY;
    private double myDiameter;

    // Default constructor
    public Circle() {
        myX = 0;
        myY = 0;
        myDiameter = 100;
    }

    // Accessor methods for center coordinates and diameter
    public double getMyX() {
        return myX;
    }

    public double getMyY() {
        return myY;
    }

    public double getMyDiameter() {
        return myDiameter;
    }

    // Method to set the circle's parameters
    public void setCircle(double x, double y, double diameter) throws NegativeDiameterException {
        if (diameter < 0) {
            throw new NegativeDiameterException("Diameter cannot be negative.");
        }
        myX = x;
        myY = y;
        myDiameter = diameter;
    }

    public static void main(String[] args) {
        // Example usage
        Circle circle = new Circle();

        try {
            circle.setCircle(2.0, 3.0, 120); // Setting parameters
            System.out.println("Center X: " + circle.getMyX());
            System.out.println("Center Y: " + circle.getMyY());
            System.out.println("Diameter: " + circle.getMyDiameter());

            // Trying to set a negative diameter (throws an exception)
            circle.setCircle(4.0, 5.0, -50);
        } catch (NegativeDiameterException e) {
            System.out.println(e.getMessage());
        }
    }
}
