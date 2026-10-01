import 'dart:io';

void main() {

    // ============================================================
    // OPERATORS IN DART
    // ============================================================

    // Common operators — same concept as JS/TS, Java, C, Python, etc.
    // Arithmetic: +  -  *  /  %
    // Comparison: ==  !=  >  <  >=  <=
    // Logical:    &&  ||  !
    // Assignment: =  +=  -=  *=  /=  %=
    // Ternary:    condition ? value1 : value2

    print("\n🔧 Welcome to Dart Operators Demo!\n");

    // Taking input from the user

    stdout.write("Enter 1st number: ");
    final num1 = double.tryParse(stdin.readLineSync() ?? "") ?? 0;

    stdout.write("Enter 2nd number: ");
    final num2 = double.tryParse(stdin.readLineSync() ?? "") ?? 0;

    print("\nYou entered: num1 = $num1, num2 = $num2\n");
    print("------------------------------------------------------------");

    // ------------------------------------------------------------
    // Arithmetic operators
    // ------------------------------------------------------------

    print("\n📐 Arithmetic Operators");

    print("Addition: $num1 + $num2 = ${num1 + num2}");
    print("Subtraction: $num1 - $num2 = ${num1 - num2}");
    print("Multiplication: $num1 x $num2 = ${num1 * num2}");
    print("Division: $num1 / $num2 = ${num1 / num2}");
    print("Remainder: $num1 % $num2 = ${num1 % num2}");

    // ~/ → Integer division
    // Converts the result to an integer by truncating the decimal part.
    final int1 = num1.toInt();
    final int2 = num2.toInt();

    if (int2 != 0) {
        print("Integer division: $int1 ~/ $int2 = ${int1 ~/ int2}");
    }


    // ------------------------------------------------------------
    // Comparison operators
    // ------------------------------------------------------------

    print("\n🔍 Comparison Operators");

    print("Are the numbers equal? ${num1 == num2}");
    print("Is the 1st number greater? ${num1 > num2}");
    print("Is the 2nd number greater? ${num2 > num1}");
    print("Are the numbers different? ${num1 != num2}");


    // ------------------------------------------------------------
    // Logical operators
    // ------------------------------------------------------------

    final firstIsPositive = num1 >= 0;
    final secondIsPositive = num2 >= 0;

    print("\n🧠 Logical Operators");

    print(
        "Are both numbers positive or zero? "
        "${firstIsPositive && secondIsPositive}",
    );

    print(
        "Is at least one number positive or zero? "
        "${firstIsPositive || secondIsPositive}",
    );

    print(
        "Is the first number NOT positive? "
        "${!firstIsPositive}",
    );


    // ------------------------------------------------------------
    // ?? → Null-coalescing operator
    // ------------------------------------------------------------

    String? nickname;

    print("\n🛡️ Null-aware Operators");

    print(
        "Nickname: ${nickname ?? "Not provided"}",
    );

    // ??= → assign only if the value is null
    nickname ??= "Guest";

    print("Nickname after ??=: $nickname");


    // ------------------------------------------------------------
    // ?. → Null-aware member access
    // ------------------------------------------------------------

    String? email;

    print(
        "Email length: ${email?.length ?? 0}",
    );

    // If email is null → email?.length returns null.
    // ?? 0 then provides a fallback value.


    // ------------------------------------------------------------
    // ! → Null assertion
    // ------------------------------------------------------------

    String? language = "Dart";

    // ! tells Dart that we guarantee this value isn't null.
    final confirmedLanguage = language!;

    print(
        "The confirmed language is: $confirmedLanguage",
    );


    // ------------------------------------------------------------
    // is / is! → Runtime type checking
    // ------------------------------------------------------------

    dynamic value = num1;

    print("\n🔎 Type Operators");

    print("Is the value a double? ${value is double}");
    print("Is the value NOT a String? ${value is! String}");


    // ------------------------------------------------------------
    // as → Type casting
    // ------------------------------------------------------------

    dynamic textValue = "Dart";

    final text = textValue as String;

    print("After casting, the value is: $text");


    // ------------------------------------------------------------
    // .. → Cascade operator
    // ------------------------------------------------------------

    final buffer = StringBuffer()
        ..write("Hello")
        ..write(" ")
        ..write("Dart");

    print("\n🔗 Cascade Operator");
    print("Cascade result: ${buffer.toString()}");


    // ------------------------------------------------------------
    // ... → Spread operator
    // ------------------------------------------------------------

    final frontend = ["HTML", "CSS"];
    final backend = ["Dart", "Firebase"];

    final skills = [
        ...frontend,
        ...backend,
    ];

    print("\n📦 Spread Operator");
    print("My skills: $skills");


    // ------------------------------------------------------------
    // ...? → Null-aware spread
    // ------------------------------------------------------------

    List<String>? optionalSkills;

    final allSkills = [
        "Dart",
        ...?optionalSkills,
    ];

    print(
        "Skills including optional skills: $allSkills",
    );


    // ------------------------------------------------------------
    // ?[] → Null-aware index access
    // ------------------------------------------------------------

    List<String>? languages;

    print(
        "First language: ${languages?[0] ?? "No language available"}",
    );


    // ============================================================
    // ⭐ Dart operators worth remembering for Flutter
    // ============================================================

    // ~/    → Integer division
    // ??    → Null fallback
    // ??=   → Assign if null
    // ?.    → Null-aware access
    // !     → Assert non-null
    // is    → Runtime type check
    // as    → Type cast
    // ..    → Cascade
    // ?..   → Null-aware cascade
    // ...   → Spread
    // ...?  → Null-aware spread
    // ?[]   → Null-aware index access

}