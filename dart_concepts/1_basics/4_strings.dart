void main() {
    // String = immutable sequence of UTF-16 code units.
    // Dart supports single, double, and triple-quoted strings.

    String name = "Akash";
    String message = 'Hello, Dart! 👋';

    // Multi-line String
    String bio = """
        Hi, I'm $name 👋
        I'm learning Dart and Flutter.
        Dart makes writing Flutter apps fun!
    """;
    print(message);
    print(bio);

    // ------------------------------------------------------------
    // String interpolation
    // ------------------------------------------------------------

    int age = 21;

    print("My name is $name and I'm $age years old.");
    // $variable → simple interpolation

    print("Next year I'll be ${age + 1}.");
    // ${expression} → expression interpolation

    // ------------------------------------------------------------
    // Concatenation
    // ------------------------------------------------------------

    String firstName = "Akash";
    String lastName = "Halder";

    print(firstName + " " + lastName);
    // + → concatenates Strings

    // Adjacent String literals are also concatenated.
    print(
        "Hello "
        "Dart "
        "Developer!",
    );

    // ------------------------------------------------------------
    // Escape characters
    // ------------------------------------------------------------

    print("Hello\nDart"); // \n → new line
    print("Hello\tDart"); // \t → tab
    print("He said \"Hello\""); // \" → double quote
    print('It\'s Dart'); // \' → single quote
    print("C:\\Dart\\bin"); // \\ → backslash

    // ------------------------------------------------------------
    // Raw String
    // ------------------------------------------------------------

    print(r"Hello\nDart $name");
    // r"..." → escape sequences and interpolation aren't processed.



    // ============================================================
    // STRING PROPERTIES / METHODS
    // ============================================================

    String text = "Hello Dart";

    print(text.length); // Number of UTF-16 code units
    print(text.isEmpty); // true if empty
    print(text.isNotEmpty); // true if not empty
    print(text.codeUnits); // UTF-16 code units

    // ------------------------------------------------------------
    // Character / index access
    // ------------------------------------------------------------

    print(text[0]); // H
    print(text[6]); // D
    // String indexing starts at 0. Similar to list slices in Python.

    // ------------------------------------------------------------
    // Case conversion
    // ------------------------------------------------------------

    print(text.toUpperCase()); // HELLO DART
    print(text.toLowerCase()); // hello dart


    // ------------------------------------------------------------
    // Whitespace
    // ------------------------------------------------------------

    String dirtyText = "   Hello Dart   ";

    print(dirtyText.trim()); // Removes both-side whitespace
    print(dirtyText.trimLeft()); // Removes leading whitespace
    print(dirtyText.trimRight()); // Removes trailing whitespace

    // ------------------------------------------------------------
    // Search
    // ------------------------------------------------------------

    print(text.contains("Dart")); // true
    print(text.startsWith("Hello")); // true
    print(text.endsWith("Dart")); // true
    print(text.indexOf("Dart")); // Starting index

    // ------------------------------------------------------------
    // Replace
    // ------------------------------------------------------------

    String sentence = "I like JavaScript. JavaScript is great.";

    print(sentence.replaceAll("JavaScript", "Dart"));
    // Replaces every matching occurrence.

    // ------------------------------------------------------------
    // Split
    // ------------------------------------------------------------

    String languages = "Dart,JavaScript,Python,Java";

    List<String> list = languages.split(",");

    print(list);
    // ["Dart", "JavaScript", "Python", "Java"]

    // ------------------------------------------------------------
    // Substring
    // ------------------------------------------------------------

    String framework = "Flutter";

    print(framework.substring(0, 3)); // Flu
    print(framework.substring(3)); // tter

    // substring(start, end)
    // end index is exclusive.

    // ------------------------------------------------------------
    // Compare Strings
    // ------------------------------------------------------------

    print("Apple".compareTo("Apple")); // 0 → equal
    print("Apple".compareTo("Banana")); // negative
    print("Banana".compareTo("Apple")); // positive

    // ------------------------------------------------------------
    // Convert to String
    // ------------------------------------------------------------

    int number = 100;

    String numberText = number.toString();

    print(numberText);
    print(numberText.runtimeType); // String

    // ------------------------------------------------------------
    // Reverse String
    // ------------------------------------------------------------

    String word = "Dart";

    String reversed = word.split('').reversed.join();

    print(reversed); // traD
}
