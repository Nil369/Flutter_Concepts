import 'dart:io'; // dart:io is the Dart's core library for I/O, files, sockets, etc.


/* 
	One of the Important Concept in Dart is "Null safety"
	Dart distinguishes nullable and non-nullable types at compile time.

	String  -> cannot be null
	String? -> can be null

	?? -> null-coalescing operator:
		use the right-hand value when the left-hand value is null.

	? after a type is Dart's nullable-type syntax.
*/


void main(List<String> args) {

	stdout.write(
		"Hey👋 What's your name?  ",
	); // stdout.write() -> prints without a trailing newline


	String? name = stdin.readLineSync() ?? "Guest"; // readLineSync() -> reads a line from stdin; returns String?
	// ?? "Guest" -> fallback if input is null



	stdout.write("What's your age? ");
	String ageInput = stdin.readLineSync() ?? "0"; // ageInput -> String because terminal input is read as text
	int age = int.tryParse(ageInput) ?? 0;
	// int.tryParse() -> String -> int?; returns null when parsing fails
	// ?? 0 -> fallback value when parsing returns null

	// We can also write it in a single line like this:
	// int age = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;

	
	
	String? nickname; // nickname -> String? because it can be null if user doesn't provide input
	// String? -> nullable String; defaults to null when no value is assigned

	print("\n--------------------------------");
	print("        👤 USER PROFILE");
	print("--------------------------------");

	print("Name      : $name"); // name ?? "Not provided" -> null-coalescing fallback
	print("Age       : $age");
	print("Nickname  : ${nickname ?? "Not provided"}"); // nickname ?? "Not provided" -> null-coalescing fallback

	print("--------------------------------\n\n");


	// Adjacent string literals are concatenated automatically.
	print(
		"Hi, I'm $name! 👋 I'm $age years old. "
		"My nickname is ${nickname ?? "not provided"}.",
	);

}
