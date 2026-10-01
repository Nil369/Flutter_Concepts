/*
  ============================================================
  Practice Questions — Dart Basics
  ============================================================

  1. Write a Dart program to print your name.

  2. Write a program to print Hello I am “John Doe” and Hello I’am “John Doe” with single and double quotes.

  3. Declare a constant integer variable and assign it the value 7.

  4. Write a Dart program to calculate Simple Interest.

     Formula:
       Simple Interest = (P × T × R) / 100 || Where P = Principal amount, T = Time, R = Rate of interest

  5. Write a program to print full name of a person from first name and last name using user input.

  6. Write a Dart program to swap the values of two variables.

  7. Write a Dart program to remove all whitespace characters from a given String.

  8. Write a Dart program to convert a String into an integer.


  9. You often go to a restaurant with your friends and need to split the bill equally.

      Write a Dart program that takes the total bill amount
      and the number of people as input and calculates the
      amount each person has to pay.

      Formula:
        Amount per person = Total bill amount / Number of people



  10. Your office is 25 km away from your home, and you travel
      at an average speed of 40 km/h.

      Write a Dart program to calculate the time required to
      reach the office in minutes.

      Formula:
        Time (hours) = Distance / Speed
        Time (minutes) = Time (hours) × 60

*/

import 'dart:io';

void main(List<String> args) {

    // Sol 1.
    print("\nSol 1. My name is Akash Halder.");



    // Sol 2.
    print("Sol 2. Hello I am \"John Doe\"  ||  Hello I'am \'John Doe\'.");



    // Sol 3.
    const int myConstant = 7;
    print("Sol 3. The constant integer variable is: $myConstant");



    // Sol 4.
    double principal = 1000;
    int time = 2;
    double rate = 5;

    double simpleInterest = (principal * time * rate) / 100;
    print("Sol 4. The Simple Interest is: $simpleInterest");




    // Sol 5.
    stdout.write("\nEnter Your First Name: ");
    String firstName = stdin.readLineSync()!;

    stdout.write("Enter Your Last Name: ");
    String lastName = stdin.readLineSync()!;

    print("Sol 5. Full Name: ${firstName + " " + lastName}");




    // Sol 6.
    int a = 10;
    int b = 20;
    print("Sol. 6: \n");
    print("Before swapping: a = $a, b = $b");

    // Swap the values
    (a, b) = (b, a);

    print("After swapping:  a = $a, b = $b");




    // Sol 7.
    String text = "Hello Dart Flutter";
    String result = text.replaceAll(" ", "");   // Remove all spaces from the String
    print("\n\nSol 7. ");
    print("Original: $text");
    print("Without spaces: $result");

    

    // Sol 8.
    int number = 69;
    print("\n\nSol 8. I love to do $number but when its in string format like this: '${number.toString()}' it looks so weird.");



    // Sol 9.
    stdout.write("\nEnter the total bill amount: ");
    double totalBill = double.parse(stdin.readLineSync()!);
    stdout.write("Enter the number of people: ");
    int numberOfPeople = int.parse(stdin.readLineSync()!);

    double amountPerPerson = totalBill / numberOfPeople;
    print("\nSol 9. Amount per person: $amountPerPerson");




    // Sol 10.

    int dist = 28; // Distance in km
    int speed = 40; // Speed in km/h
    print("\nSol 10. Time required to reach the office in minutes: ${(dist / speed) * 60} minutes\n");
}
