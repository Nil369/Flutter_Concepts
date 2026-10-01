void main() {

	// Data Types means the type of data that can be stored in a variable.
	// Dart is a statically typed language, which means that
	// variables have types that are checked at compile time.

	/*
		1. Numbers: int(99) and double (69.99)
		2. Booleans: bool (true or false)
		3. Strings: Strings(UTF-16 chars) & Runes(UTF-32 chars)
		4. Lists: List ['Jupiter', 'Saturn', 'Uranus', 'Neptune'] // similar to python list
		5. Maps: Map. Its similar to python map
	*/


	// Variables are used to store data in a program. In Dart Variables can be declared by explicitly specifying
	// their data type. Syntax: type variableName = value;

	String name = "Akash Halder";
	int age = 21;
	double height = 5.85;
	bool isDeveloper = true;
	List <String> favoriteLanguages = ['Dart', 'Python', 'JavaScript'];
	Map <String, String> userDetails = {
		'name': 'Akash Halder',
		'age': '21',
		'height': '5.85',
		'isDeveloper': 'true'
	};


	print("Name: $name");
	print("Age: $age");
	print("Height: $height");
	print("Is Developer: $isDeveloper");
	print("Favorite Languages: $favoriteLanguages");
	print("User Details: $userDetails \n\n");


	// Or you can just use the var & other keywords and Dart will automatically infer the Data Type

	
  	var myName = "Akash"; // var -> Dart automatically infers the type
	final myAge = 21; // final -> value can be assigned only once
	const country = "India"; // const -> compile-time constant

	dynamic role = "Developer"; // dynamic → variable can hold values of different types
	role = ["Anime Lover", "Developer"]; // Change dynamic variable to another type


	// Multiline with proper fromatting
	print("""Multine String & Str. Interpolation Ex:
	  Hi, I'm $myName! 👋
	  I'm $myAge years old and I'm an $role.
	  I'm from $country 🇮🇳
	  """
	);

	// NOTE: const & final value can't be changed after decleration
	// country = "Japan";
	// myAge = 22;

}
