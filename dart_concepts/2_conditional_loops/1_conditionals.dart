import "dart:io";

void main(List<String> args) {
    /* 
    Conditionals in DART:
        i) If Condition
        ii) If-Else Condition
        iii) If-Else-If Condition
        iv) Ternary Operators
        v) Switch-case Statements
    */


    // If Condition:

    int age = 20;

    if (age >= 18) {
        print("\nYou are allowed to drive!");
    }


    // If-Else Conditions:
    stdout.write("\nEnter Your Age: ");
    int age2 = int.tryParse(stdin.readLineSync() ?? "0")!;

    if (age2>=18) {
        print("You are eligible to Vote!\n");
    }else{
        print("You are not eligible to Vote!\n");
    }



    // If-Else-If Conditions: This is an ugly and hectic way there is a better way to do the same thing
    // that is using switch case statements
    stdout.write("Enter any Week Number (Eg.3): ");
    int dayOfWeek = int.tryParse(stdin.readLineSync() ?? "0" ) ?? 0;
    
    print("\nUsing If-Else-If Ladder:");
    if (dayOfWeek == 1) {
        print("Day is Sunday.");
    }
    else if (dayOfWeek == 2) {
        print("Day is Monday.");
    }
    else if (dayOfWeek == 3) {
        print("Day is Tuesday.");
    }
    else if (dayOfWeek == 4) {
        print("Day is Wednesday.");
    }
    else if (dayOfWeek == 5) {
        print("Day is Thursday.");
    }
    else if (dayOfWeek == 6) {
        print("Day is Friday.");
    }
    else if (dayOfWeek == 7) {
        print("Day is Saturday.");
    }else{
        print("Invalid Weekday.");
    }





    // Switch Case Statements:

    print("\n\nUsing Switch Case Statements");
    switch (dayOfWeek) {
        case 1:
            print("Day is Sunday.");
            break;
        case 2:
            print("Day is Monday.");
        break;
        case 3:
        print("Day is Tuesday.");
        break;
        case 4:
            print("Day is Wednesday.");
        break;
        case 5:
            print("Day is Thursday.");
        break;
        case 6:
            print("Day is Friday.");
        break;
        case 7:
            print("Day is Saturday.");
        break;
        default:
            print("Invalid Weekday.");
        break;
    }



    // Ternary Operator (Syntax => condition ? exprIfTrue : exprIfFalse)
    stdout.write("\n\nEnter any number: ");
    int number = int.parse(stdin.readLineSync()!);

    final response = (number % 2 == 0) ? "$number is an Even Number" : "$number is an Odd Number";
    print(response);
    

    // _____________________________________________________________________________________________________

    /*
    ASSERT in Dart:
        assert() is used to check a condition during development.

        If the condition is:
            true  → nothing happens
            false → AssertionError is thrown

        Syntax:
            assert(condition);
            assert(condition, "Error message");

        Note: Assertions are mainly for development/debugging and are mostly disabled in production.
    */

    
    // Basic Assert
    int age3 = 20;
    assert(age3 != 20);


    // Assert with an error message
    stdout.write("\n\nEnter your marks in Science Subject : ");
    int marks = int.parse(stdin.readLineSync()!);

    assert(
        marks >= 0 && marks <= 100,
        "Marks must be between 0 and 100",
    );


    // Simple String example
    stdout.write("\n\nEnter your name : ");
    String name = stdin.readLineSync()!;
    assert(name.isNotEmpty, "Name cannot be empty");
    
}
