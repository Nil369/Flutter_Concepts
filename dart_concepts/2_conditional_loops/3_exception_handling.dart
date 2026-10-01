import "dart:io";

void main(List<String> args) {
    /*
    Exception Handling in DART:

        i)   try-catch
        ii)  on
        iii) finally
        iv)  throw
        v)   rethrow

    Exception handling is used to handle runtime exceptions
    without unexpectedly terminating the program.
    */


    // Try-Catch:
    // try  → code that may throw an exception
    // catch → handles the exception

    print("\nUsing Try-Catch:");

    try {
        int result = 10 ~/ 0;
        print("Result: $result");
    } catch (e) {
        print("Something went wrong: $e");
    }


    // "on":
    // Used to catch a specific type of exception.

    print("\nUsing on:");

    try {
        int number = int.parse("Hello");
        print("Number: $number");
    } on FormatException {
        print("Invalid number format.");
    }


    // "on" + "catch":
    // "on" specifies the exception type.
    // "catch" gives access to the exception object.

    print("\nUsing on + catch:");

    try {
        int number = int.parse("Dart");
        print("Number: $number");
    } on FormatException catch (e) {
        print("Format Error: $e");
    }


    // Finally:
    // finally always executes whether an exception occurs or not.

    print("\nUsing Finally:");

    try {
        int result = 10 ~/ 2;
        print("Result: $result");
    } catch (e) {
        print("Error: $e");
    } finally {
        print("This block always executes.");
    }


    // Throw:
    // throw is used to manually create/raise an exception.

    print("\nUsing Throw:");

    try {
        int age = 15;

        if (age < 18) {
            throw Exception("You must be 18 or older.");
        }

        print("Access granted.");
    } catch (e) {
        print("Error: $e");
    }


    // Throw can also be used with user input.

    print("\nUser Input Example:");

    stdout.write("Enter your age: ");
    int age = int.parse(stdin.readLineSync()!);

    try {
        if (age < 0) {
            throw Exception("Age cannot be negative.");
        }

        print("Your age is $age.");
    } catch (e) {
        print("Invalid input: $e");
    }


    // _____________________________________________________________________________________________________

    /*
    RETHROW:

        rethrow is used inside a catch block to pass the same
        exception to the outer scope.

        It is mainly useful when you want to inspect/log an
        exception but still allow another catch block to handle it.
    */

    print("\nUsing Rethrow:");

    try {
        try {
            int result = 10 ~/ 0;
            print(result);
        } catch (e) {
            print("Inner catch: $e");

            rethrow;
        }
    } catch (e) {
        print("Outer catch: $e");
    }


    /*
    IMPORTANT:

        Exception → A runtime problem that can potentially be handled.

        Error → Usually indicates a programming error.

        try-catch → Handle an exception.
        on        → Catch a specific exception type.
        finally   → Always execute this block.
        throw     → Manually raise an exception.
        rethrow   → Pass an exception to an outer catch block.
    */
}