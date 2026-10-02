import 'dart:io';
import 'dart:math';

void main(List<String> args) {

    /*
    MATH IN DART: It's Similar to the Maths library in C/C++/Python/Java/JS

        import 'dart:math';

        Common Math Functions:
            pow()   → Power
            sqrt()  → Square root
            max()   → Maximum
            min()   → Minimum

        Random:
            nextInt()
            nextDouble()
            nextBool()
    */


    // Taking User Input:
    stdout.write("Enter first number: ");
    double num1 = double.parse(stdin.readLineSync()!);

    stdout.write("Enter second number: ");
    double num2 = double.parse(stdin.readLineSync()!);


    // Power:

    num power = pow(num1, num2);

    print("\n$num1 raised to the power of $num2 = $power");


    // Maximum & Minimum:
    print("\nMaximum = ${max(num1, num2)}");
    print("Minimum = ${min(num1, num2)}");


    // Square Root:
    print("\nSquare root of $num1 = ${sqrt(num1)}");


    // Random Integer:
    // nextInt(10) → 0 to 9

    final random = Random();

    print("\nRandom number (0-9): ${random.nextInt(10)}");


    // Random Integer between min and max:
    stdout.write("\nEnter random range minimum: ");
    int minValue = int.parse(stdin.readLineSync()!);

    stdout.write("Enter random range maximum: ");
    int maxValue = int.parse(stdin.readLineSync()!);

    int randomNumber = minValue + random.nextInt((maxValue + 1) - minValue);

    print("\nRandom number between $minValue and $maxValue: $randomNumber");


    // Random Boolean & Double:
    print("\nRandom Boolean: ${random.nextBool()}");
    print("Random Double: ${random.nextDouble()}");


}