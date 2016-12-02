import java.util.Scanner;
public class HelloWorld {

  public static void main(String[] args) {

    Scanner scan = new Scanner(System.in); 
    System.out.println("Welcome to Grand Circus' Room Detail Generator!");
    System.out.println();
    System.out.print("Enter Length: ");
    double length = Double.parseDouble(scan.nextLine());    
    System.out.print("Enter Width: ");
    double  width = Double.parseDouble(scan.nextLine());
    System.out.println("Area: " + length*width);
    System.out.println("Perimeter: " + 2*(length + width));
  
  }
}
