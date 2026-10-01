void main(List<String> args) {
    /*
    Loops in DART:-

        The primary purpose of loops is to repeat a block of code
        There are 4 types of loops in Dart which are:

            i) For Loop
            ii) For-Each Loop
            iii) While Loop
            iv) Do-While Loop

    */


    // For Loop:
    // Syntax => for (initialization; condition; increment/decrement) { }
    print("\nUsing For Loop:");

    for (int i = 1; i <= 5; i++) {
        print("Iteration: $i");
    }


    // For-Each Loop:
    // Used to iterate through each element of a collection.
    print("\nUsing For-In & For-Each Loop:");

    List<String> languages = [
        "Dart",
        "Flutter",
        "JavaScript",
        "Python",
    ];

    // Also known as for-in loop
    for (String language in languages) { 
        print("Currently Leaning: '$language' using for-in");
    }


    // You can also use the forEach() method:
    languages.forEach((language) {
        print("Learning: $language using 'forEach()' method");
    });


    // While Loop:
    // Executes the block while the condition is true.
    print("\nUsing While Loop:");

    int count = 1;

    while (count <= 5) {
        print("Count: $count");
        count++;
    }


    // Do-While Loop:
    // Executes the block at least once, then checks the condition.

    print("\nUsing Do-While Loop:");

    int number = 1;

    do {
        print("Number: $number");
        number++;
    } while (number <= 5);


    // _____________________________________________________________________________________________________

    /*
    Loop Control Statements in Dart:

        break    → Immediately exits the loop.
        continue → Skips the current iteration and moves to the next one.
    */


    // break: Stops the loop when the condition is satisfied.
    print("\nUsing break:");

    for (int i = 1; i <= 10; i++) {
        if (i == 5) {
            break;
        }

        print(i);
    }


    // continue: Skips the current iteration.
    print("\nUsing continue:");

    for (int i = 1; i <= 5; i++) {
        if (i == 3) {
            continue;
        }

        print(i);
    }


    // _____________________________________________________________________________________________________

    /*
    INFINITE LOOPS in Dart:

        An infinite loop is a loop whose condition never becomes false.

        Be careful with infinite loops because they can keep the
        program running indefinitely.

        Use break when you intentionally want to stop the loop.
    */


    // Infinite For Loop: No condition/increment is provided, so it runs forever.

    /*
        for (;;) {
            print("This will run forever!");
        }
    */


    // Infinite While Loop:
    /*
        while (true) {
            print("This will run forever!");
        }
    */


    // Infinite loop with break:
    // Useful when the stopping condition is handled inside the loop.
    int i = 1;
    print("\n");
    while (true) {
        print("Value: $i");

        if (i == 5) {
            break;
        }

        i++;
    }

}