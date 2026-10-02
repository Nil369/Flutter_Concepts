import 'dart:io';

void main(List<String> args) {

    /*
    FUNCTIONS IN DART:

        Functions are reusable blocks of code that perform a specific task.

        Function Parameters in DART:
            i)   Positional Parameters
            ii)  Optional Positional Parameters
            iii) Named Parameters
            iv)  Required Named Parameters

        Other Function Types:
            v)   Anonymous Functions
            vi)  Arrow Functions

        Scope:
            i)   Local / Method Scope
            ii)  Global Scope
            iii) Lexical Scope
    */


    // Taking User Input:

    stdout.write("\nEnter your name: ");
    String name = stdin.readLineSync()!;

    stdout.write("Enter your age: ");
    int age = int.parse(stdin.readLineSync()!);


    // Positional Parameters: Arguments must be passed in the same order as the parameters.
    printUserInfo(name, "Male");


    // Optional Positional Parameters: [] makes a parameter optional. A default value can be provided.
    printPersonInfo(name, "Male");
    printPersonInfo(name, "Male", "Mr.");


    // Named Parameters: {} makes parameters named. Arguments can be passed in any order.
    displayProfile( 
        name: name,
        gender: "Male",
    );

    displayProfile(
        gender: "Female",
        name: "Debashruti",
    );


    // Required Named Parameters: required means the argument MUST be provided.
    showEmployee(
        name: name,
        age: age,
    );


    // _____________________________________________________________________________________________________

    // ANONYMOUS FUNCTIONS: A function without a name is called an anonymous function.
    // It's commonly used with collection methods such as forEach(), map(), where(), etc.


    // Anonymous Function with forEach():
    List<String> languages = [
        "Python",
        "JavaScript",
        "TypeScript",
        "C/C++",
        "Go",
        "Rust",
        "Java",
        "Kotlin",
        "Dart"
    ];

    print("\n\nAnonymous Function Examples: \n");
    languages.forEach((language) {
        print("Language: $language");
    });


    // Anonymous Function stored in a variable:
    var cube = (int number) {
        return number * number * number;
    };

    print("Cube of 3 = ${cube(3)}");


    // _____________________________________________________________________________________________________

    /*
    ARROW FUNCTIONS: Short syntax for a function containing a single expression.

        Syntax:
            returnType functionName(parameters) => expression;
    */

    print("\n\nArrow Function Examples: \n");
    // Normal Function:
    int addNumbers(int a, int b) {
        return a + b;
    }

    print("Sum = ${addNumbers(10, 20)}");


    // Arrow Function:
    int subtractNumbers(int a, int b) => a - b;
    print("Difference = ${subtractNumbers(20, 10)}");


    // Arrow Function with a single parameter:
    double squareNumber(double number) => number * number;
    print("Square = ${squareNumber(5)}");


    // Arrow Function with collections:
    final numbers = [1, 2, 3, 4, 5];

    final squares = numbers
        .map((number) => number * number)
        .toList();

    print("Squares: $squares");


    // _____________________________________________________________________________________________________

    /*
    SCOPE IN DART:

        Scope defines where a variable can be accessed.

        i)   Local Scope
        ii)  Global Scope
        iii) Lexical Scope

        Dart uses lexical scoping.
    */

    print("\n\nScope In Dart Examples: \n");
    // Local Scope:
    String localName = name;
    print(localName);


    // Global Scope:
    print(globalMessage);


    // Lexical Scope:
    String outerMessage = "I am outside.";

    if (true) {
        String innerMessage = "I am inside.";

        print(outerMessage);
        print(innerMessage);
    }

}


// _____________________________________________________________________________________________________

// Positional Parameters:
void printUserInfo(String name, String gender) {
    print("\nHello $name, your gender is $gender.");
}


// Optional Positional Parameters:
void printPersonInfo(
    String name,
    String gender, [
    String title = "sir/ma'am",
]) {
    print("Hello $title $name, your gender is $gender.");
}


// Named Parameters:
void displayProfile({
    String? name,
    String? gender,
}) {
    print("Hello $name, your gender is $gender.");
}


// Required Named Parameters:
void showEmployee({
    required String name,
    required int age,
}) {
    print("Hello $name, you are $age years old.");
}


// Global Variable:
String globalMessage = "I am a global variable.";