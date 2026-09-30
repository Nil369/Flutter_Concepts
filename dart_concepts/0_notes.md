# Dart — A Professional Developer’s Guide for Flutter

This guide is designed as **practical senior-level notes**, not merely a syntax cheat sheet. The goal is to help you understand:

1. What Dart is and why it exists
2. Dart's history and evolution
3. Core programming concepts
4. Dart syntax from the official language documentation
5. How Dart compares with **JavaScript, TypeScript, Java, and Python**
6. Dart's type system and null safety
7. OOP, generics, collections, functions, async/await, exceptions
8. Dart 3 features such as **records, patterns, sealed classes, enhanced enums**
9. Dart-specific concepts that matter in production Flutter
10. Dart's runtime, JIT/AOT compilation, isolates and concurrency
11. `pub`, packages, analysis, formatting and testing
12. The "superpowers" that make Dart particularly useful for Flutter

The examples below follow the current Dart language documentation; the official Dart documentation currently reflects Dart 3.x. ([Dart][1])

---

# 1. What is Dart?

**Dart is a client-optimized, strongly typed, object-oriented programming language developed by Google.**

Its primary goal is to provide a productive language for building applications that can run across multiple platforms.

Dart powers **Flutter**, but Dart itself is not Flutter.

Think about the relationship like this:

```text
Dart
 ├── Programming language
 ├── Runtime
 ├── Compiler
 ├── Standard libraries
 ├── Package ecosystem
 └── Developer tools
       │
       ▼
Flutter
 ├── UI framework
 ├── Rendering
 ├── Widgets
 ├── Animation
 ├── Gestures
 └── Platform integration
```

Dart is designed around three major goals:

| Goal       | Meaning                                                            |
| ---------- | ------------------------------------------------------------------ |
| Productive | Easy to write, analyze, debug and iterate                          |
| Portable   | Runs on mobile, desktop, web and other targets                     |
| Fast       | Supports JIT during development and AOT compilation for production |

The official Dart overview explicitly describes Dart as a **client-optimized language** designed for fast multi-platform applications. ([Dart][2])

---

# 2. Dart's history

A simplified history:

```text
2011
 │
 ├── Dart introduced by Google
 │
 ▼
Dart 1.x
 │
 ├── Early language/runtime
 │
 ▼
Dart 2.0
 │
 ├── Stronger static type system
 ├── Major language redesign
 │
 ▼
Dart 2.12
 │
 └── Sound null safety introduced
 │
 ▼
Dart 2.x
 │
 ├── Flutter adoption grows
 ├── Better tooling
 ├── Better async support
 │
 ▼
Dart 3.0 — 2023
 │
 ├── Sound null safety becomes mandatory
 ├── Records
 ├── Patterns
 ├── Class modifiers
 └── Major modern-language features
 │
 ▼
Dart 3.x
 │
 ├── Extension types
 ├── Improved patterns
 ├── Better tooling
 └── Continued Flutter integration
```

One especially important milestone for Flutter developers is **Dart 3**: sound null safety became mandatory with Dart 3. ([Dart][3])

---

# 3. The most important mental model

If you've used JavaScript, TypeScript, Java or Python, Dart will feel familiar.

The easiest way to think about Dart is:

> **Java/C# style OOP + TypeScript-like type inference + JavaScript-like functions/async syntax + Python-like readability + Flutter-oriented runtime/tooling.**

But that isn't literally how Dart is implemented. It's simply a useful mental model.

---

# 4. Your first Dart program

```dart
void main() {
  print('Hello, Dart!');
}
```

`main()` is the entry point.

Compare:

### Dart

```dart
void main() {
  print('Hello, Dart!');
}
```

### Java

```java
public class Main {
    public static void main(String[] args) {
        System.out.println("Hello, Java!");
    }
}
```

### JavaScript

```javascript
console.log("Hello, JavaScript!");
```

### TypeScript

```typescript
console.log("Hello, TypeScript!");
```

### Python

```python
print("Hello, Python!")
```

Dart deliberately keeps the basic syntax relatively lightweight.

---

# 5. Variables

The basic Dart syntax:

```dart
var name = 'John';
var age = 30;
var height = 5.9;
var isDeveloper = true;
```

Dart infers the types:

```dart
var name = 'John';       // String
var age = 30;            // int
var height = 5.9;        // double
var isDeveloper = true;  // bool
```

The official documentation recommends using `var` for local variables where the type is obvious. ([Dart][4])

You can explicitly specify types:

```dart
String name = 'John';
int age = 30;
double height = 5.9;
bool isDeveloper = true;
```

---

# 6. Dart vs TypeScript variable declaration

### Dart

```dart
var name = 'John';

String name2 = 'Jane';

final age = 30;

const pi = 3.14159;
```

### TypeScript

```typescript
let name = "John";

const name2 = "Jane";

const age = 30;

const pi = 3.14159;
```

Important difference:

```text
Dart                 TypeScript

var                  let
final                const-like runtime immutability
const                compile-time constant
```

But don't mechanically translate `let` to `var`.

In production Dart:

```dart
final user = User();
```

is often preferred when the variable should not be reassigned.

---

# 7. `var`, `final`, `const`, `late`

These are extremely important in Flutter.

## `var`

The variable can be reassigned.

```dart
var name = 'John';

name = 'Mike';
```

---

## `final`

The variable can be assigned only once.

```dart
final name = 'John';

name = 'Mike'; // ERROR
```

But the object itself may still be mutable:

```dart
final users = <String>[];

users.add('John');
users.add('Mike');
```

This is valid.

Think:

```text
final = reference cannot be reassigned

NOT

final = object is immutable
```

---

# 8. `const`

`const` represents a compile-time constant.

```dart
const pi = 3.14159;
```

Objects can also be constant:

```dart
const user = User(
  name: 'John',
);
```

This becomes particularly important in Flutter:

```dart
const Text('Hello');
```

Flutter developers will use `const` constantly.

---

# 9. `late`

`late` means:

> "I promise Dart that this non-nullable variable will be initialized before I use it."

```dart
late String username;

void main() {
  username = 'john';
  print(username);
}
```

You can also use `late` for lazy initialization:

```dart
late final expensiveObject = createExpensiveObject();
```

The initialization occurs when the value is first accessed.

The official documentation specifically describes these two primary uses of `late`: delayed initialization and lazy initialization. ([Dart][4])

---

# 10. Null safety — one of Dart's biggest superpowers

This is one of the most important Dart concepts for Flutter.

In Dart:

```dart
String name = 'John';
```

means:

```text
name CANNOT be null
```

To allow null:

```dart
String? name;
```

Now:

```text
name = "John";  // valid
name = null;    // valid
```

Dart's sound null safety is designed to detect potential null dereferences during static analysis instead of allowing them to become ordinary runtime null errors. ([Dart][3])

---

# 11. Null safety comparison

### Dart

```dart
String? name;

print(name?.length);
```

### TypeScript

```typescript
let name: string | null = null;

console.log(name?.length);
```

### Java

Modern Java can represent nullable references:

```java
String name = null;

System.out.println(
    name != null ? name.length() : null
);
```

### Python

```python
name = None

if name is not None:
    print(len(name))
```

The major Dart advantage is that nullability is integrated directly into the type system.

---

# 12. Dart null-safety operators

You'll use these constantly.

## Nullable type

```dart
String? name;
```

---

## Null-aware access

```dart
print(name?.length);
```

Meaning:

```text
If name != null:
    return name.length

Otherwise:
    return null
```

---

## Null-coalescing

```dart
final displayName = name ?? 'Guest';
```

Equivalent conceptually to:

```dart
if (name != null) {
  displayName = name;
} else {
  displayName = 'Guest';
}
```

---

## Null-aware assignment

```dart
name ??= 'Guest';
```

Means:

```text
If name is null:
    assign Guest
```

---

## Null assertion

```dart
print(name!.length);
```

`!` means:

> "I know this isn't null."

If you're wrong, you get a runtime failure.

So don't abuse `!`.

Bad:

```dart
user!.profile!.address!.city!
```

Better:

```dart
final city = user?.profile?.address?.city;
```

or handle the missing state explicitly.

---

# 13. Basic data types

Dart's core types include:

```dart
int
double
num
String
bool
List
Set
Map
Record
Object
dynamic
Null
```

An important Dart philosophy:

> Everything is an object.

The official language documentation notes that numbers, functions and even `null` participate in Dart's object model. ([Dart][5])

---

# 14. Numbers

```dart
int age = 25;

double price = 99.99;

num value = 100;
value = 99.5;
```

Arithmetic:

```dart
final a = 10;
final b = 3;

print(a + b);
print(a - b);
print(a * b);
print(a / b);
print(a ~/ b);
print(a % b);
```

Output conceptually:

```text
13
7
30
3.333...
3
1
```

`~/` performs integer division.

---

# 15. Strings

```dart
String name = 'John';
```

String interpolation:

```dart
final name = 'John';
final age = 30;

print('My name is $name');
print('I am $age years old');
```

Expressions:

```dart
print('Next year I will be ${age + 1}');
```

Compare:

### Dart

```dart
print('Hello $name');
```

### JavaScript

```javascript
console.log(`Hello ${name}`);
```

### Python

```python
print(f"Hello {name}")
```

### Java

```java
System.out.println("Hello " + name);
```

Dart's interpolation is one of the nice readability features borrowed conceptually from modern language design.

---

# 16. Multiline strings

```dart
final message = '''
Hello John,

Welcome to our application.

Regards,
Team
''';
```

Useful for:

* JSON
* SQL
* GraphQL
* generated text
* templates
* test data

---

# 17. Booleans

```dart
bool isLoggedIn = true;

if (isLoggedIn) {
  print('Dashboard');
}
```

Dart requires actual boolean expressions.

```dart
if (1) {
}
```

is invalid.

---

# 18. Lists

A Dart `List` is similar to an array in JavaScript/TypeScript.

```dart
final names = <String>[
  'John',
  'Jane',
  'Mike',
];
```

Access:

```dart
print(names[0]);
```

Add:

```dart
names.add('David');
```

Remove:

```dart
names.remove('John');
```

Length:

```dart
print(names.length);
```

---

# 19. List comparison

### Dart

```dart
final users = <String>[
  'John',
  'Jane',
];

for (final user in users) {
  print(user);
}
```

### JavaScript

```javascript
const users = [
  "John",
  "Jane"
];

for (const user of users) {
    console.log(user);
}
```

### Python

```python
users = [
    "John",
    "Jane"
]

for user in users:
    print(user)
```

### Java

```java
List<String> users = List.of(
    "John",
    "Jane"
);

for (String user : users) {
    System.out.println(user);
}
```

---

# 20. Sets

A `Set` contains unique values.

```dart
final tags = <String>{
  'flutter',
  'dart',
  'mobile',
};
```

Adding an existing value doesn't create a duplicate.

```dart
tags.add('flutter');
```

Conceptually:

```text
{
  flutter,
  dart,
  mobile
}
```

not:

```text
{
  flutter,
  flutter,
  dart,
  mobile
}
```

---

# 21. Maps

A `Map` is similar to an object/dictionary/hash map.

```dart
final user = <String, dynamic>{
  'name': 'John',
  'age': 30,
};
```

Access:

```dart
print(user['name']);
```

Better with known types:

```dart
final Map<String, String> countries = {
  'IN': 'India',
  'US': 'United States',
};
```

Compare:

| Dart   | JavaScript     | Python | Java   |
| ------ | -------------- | ------ | ------ |
| `Map`  | `Map` / object | `dict` | `Map`  |
| `List` | `Array`        | `list` | `List` |
| `Set`  | `Set`          | `set`  | `Set`  |

---

# 22. Collection literals

Dart has excellent collection syntax.

```dart
final numbers = [
  1,
  2,
  3,
];
```

Map:

```dart
final user = {
  'name': 'John',
  'age': 30,
};
```

Set:

```dart
final uniqueNumbers = {
  1,
  2,
  3,
};
```

---

# 23. Collection `if`

Very useful in Flutter.

```dart
final widgets = [
  const Text('Hello'),

  if (isLoggedIn)
    const Text('Dashboard'),
];
```

This is extremely common when constructing widget trees.

---

# 24. Collection `for`

```dart
final numbers = [
  for (final i in [1, 2, 3])
    i * 2,
];
```

Result:

```dart
[2, 4, 6]
```

Flutter example:

```dart
Column(
  children: [
    for (final user in users)
      Text(user.name),
  ],
)
```

---

# 25. Spread operator

```dart
final first = [1, 2, 3];

final second = [
  0,
  ...first,
  4,
];
```

Result:

```text
[0, 1, 2, 3, 4]
```

Null-aware spread:

```dart
final second = [
  ...?first,
];
```

This is extremely useful in Flutter widget composition.

---

# 26. Operators

Dart supports familiar operators:

```dart
+
-
*
/
%
~/
==
!=
>
<
>=
<=
&&
||
!
```

Assignment:

```dart
=
+=
-=
*=
/=
??=
```

Null-aware:

```dart
?.
??
?..
```

Cascade:

```dart
..
?..
```

---

# 27. Cascades — a Dart-specific feature

One of Dart's nicest features.

Instead of:

```dart
final person = Person();

person.name = 'John';
person.age = 30;
person.sayHello();
```

You can write:

```dart
final person = Person()
  ..name = 'John'
  ..age = 30
  ..sayHello();
```

This is called a **cascade**.

Think:

```text
object
  ..operation
  ..operation
  ..operation
```

Flutter uses this style frequently in Dart APIs.

---

# 28. Functions

Basic function:

```dart
int add(int a, int b) {
  return a + b;
}
```

Arrow function:

```dart
int add(int a, int b) => a + b;
```

Compare:

### Dart

```dart
int add(int a, int b) => a + b;
```

### TypeScript

```typescript
function add(a: number, b: number): number {
    return a + b;
}
```

### JavaScript

```javascript
const add = (a, b) => a + b;
```

### Python

```python
def add(a, b):
    return a + b
```

### Java

```java
static int add(int a, int b) {
    return a + b;
}
```

---

# 29. Functions are first-class objects

This is extremely important.

You can store a function in a variable.

```dart
int add(int a, int b) {
  return a + b;
}

final operation = add;

print(operation(10, 20));
```

You can pass functions:

```dart
void execute(
  int a,
  int b,
  int Function(int, int) operation,
) {
  print(operation(a, b));
}
```

Then:

```dart
execute(10, 20, add);
```

This concept powers:

* callbacks
* event handlers
* Flutter callbacks
* `map`
* `where`
* `fold`
* state management
* async APIs

---

# 30. Anonymous functions

```dart
final numbers = [1, 2, 3, 4];

final doubled = numbers.map(
  (number) => number * 2,
);
```

Another example:

```dart
final evenNumbers = numbers.where(
  (number) => number.isEven,
);
```

---

# 31. Higher-order functions

A function that receives or returns another function.

```dart
int Function(int) multiplier(int factor) {
  return (int value) {
    return value * factor;
  };
}
```

Usage:

```dart
final doubleValue = multiplier(2);

print(doubleValue(10)); // 20
```

This concept is very important for functional programming patterns inside Flutter.

---

# 32. Optional positional parameters

```dart
void greet(String name, [String? message]) {
  print('$name: ${message ?? 'Hello'}');
}
```

Call:

```dart
greet('John');

greet('John', 'Welcome');
```

---

# 33. Named parameters

This is one of the most important Dart features for Flutter.

```dart
void createUser({
  required String name,
  required int age,
  String? email,
}) {
  // ...
}
```

Call:

```dart
createUser(
  name: 'John',
  age: 30,
  email: 'john@example.com',
);
```

Flutter uses this everywhere:

```dart
Container(
  width: 100,
  height: 100,
  padding: const EdgeInsets.all(16),
);
```

This is a huge reason Flutter widget APIs remain readable despite having many parameters.

---

# 34. Default parameters

```dart
void connect({
  String host = 'localhost',
  int port = 8080,
}) {
  // ...
}
```

Call:

```dart
connect();
```

or:

```dart
connect(
  host: 'api.example.com',
  port: 443,
);
```

---

# 35. Required parameters

```dart
void createUser({
  required String name,
  required String email,
}) {}
```

Now this is invalid:

```dart
createUser();
```

You must provide them.

This is heavily used in production Flutter models and widgets.

---

# 36. Classes

Dart is object-oriented.

```dart
class User {
  String name;
  int age;

  User({
    required this.name,
    required this.age,
  });

  void greet() {
    print('Hello $name');
  }
}
```

Usage:

```dart
final user = User(
  name: 'John',
  age: 30,
);

user.greet();
```

---

# 37. Dart constructors

Dart has concise constructor syntax.

```dart
class User {
  final String name;
  final int age;

  User({
    required this.name,
    required this.age,
  });
}
```

The:

```dart
this.name
```

syntax assigns the constructor argument directly to the field.

---

# 38. Named constructors

Another Dart feature you should know very well.

```dart
class User {
  final String name;

  User({
    required this.name,
  });

  User.guest()
      : name = 'Guest';
}
```

Usage:

```dart
final user = User.guest();
```

Another example:

```dart
class ApiResponse {
  final bool success;

  ApiResponse({
    required this.success,
  });

  ApiResponse.success()
      : success = true;

  ApiResponse.failure()
      : success = false;
}
```

This is common in Flutter architecture.

---

# 39. Factory constructors

A `factory` constructor can return an existing instance or a subtype rather than necessarily creating a new object.

```dart
class Logger {
  static final Logger _instance = Logger._internal();

  factory Logger() {
    return _instance;
  }

  Logger._internal();
}
```

Now:

```dart
final a = Logger();
final b = Logger();

print(identical(a, b)); // true
```

Factory constructors are useful for:

* caching
* singleton-like APIs
* parsing
* returning subclasses
* object creation logic

---

# 40. Getters

```dart
class User {
  final String firstName;
  final String lastName;

  User({
    required this.firstName,
    required this.lastName,
  });

  String get fullName => '$firstName $lastName';
}
```

Usage:

```dart
print(user.fullName);
```

Notice:

```dart
user.fullName
```

not:

```dart
user.fullName()
```

---

# 41. Setters

```dart
class User {
  String _name = '';

  String get name => _name;

  set name(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Name cannot be empty');
    }

    _name = value;
  }
}
```

---

# 42. Private members

Dart privacy is library-based.

A name beginning with `_` is private to the library.

```dart
class User {
  String _password = '';
}
```

This is different from Java:

```java
private String password;
```

Dart doesn't use:

```dart
private
public
protected
```

keywords in the same way.

---

# 43. Inheritance

Dart supports single inheritance.

```dart
class Animal {
  void eat() {
    print('Eating');
  }
}

class Dog extends Animal {
  void bark() {
    print('Barking');
  }
}
```

Usage:

```dart
final dog = Dog();

dog.eat();
dog.bark();
```

Dart's official documentation describes Dart as having single inheritance combined with mixins. ([Dart][1])

---

# 44. `super`

```dart
class Animal {
  void sound() {
    print('Animal sound');
  }
}

class Dog extends Animal {
  @override
  void sound() {
    super.sound();

    print('Woof');
  }
}
```

---

# 45. Interfaces

A major Dart difference:

> Every Dart class implicitly defines an interface.

So:

```dart
class UserRepository {
  Future<User> getUser() async {
    // ...
    throw UnimplementedError();
  }
}
```

Another class can:

```dart
class ApiUserRepository implements UserRepository {
  @override
  Future<User> getUser() async {
    // ...
    throw UnimplementedError();
  }
}
```

`implements` means:

> I promise to provide this API.

It does not inherit the implementation.

---

# 46. `extends` vs `implements`

This is crucial.

```dart
extends
```

means:

```text
inherit implementation
```

while:

```dart
implements
```

means:

```text
implement the interface
```

Example:

```dart
abstract class Animal {
  void eat() {
    print('Eating');
  }

  void sound();
}
```

Extending:

```dart
class Dog extends Animal {
  @override
  void sound() {
    print('Woof');
  }
}
```

Implementing:

```dart
class RobotDog implements Animal {
  @override
  void eat() {
    print('Charging');
  }

  @override
  void sound() {
    print('Electronic bark');
  }
}
```

---

# 47. Abstract classes

```dart
abstract class Shape {
  double area();

  void describe() {
    print('This is a shape');
  }
}
```

Concrete class:

```dart
class Circle extends Shape {
  final double radius;

  Circle(this.radius);

  @override
  double area() {
    return 3.14159 * radius * radius;
  }
}
```

---

# 48. Mixins

This is one of Dart's most distinctive OOP features.

```dart
mixin Logger {
  void log(String message) {
    print('[LOG] $message');
  }
}
```

Use:

```dart
class UserService with Logger {
  void createUser() {
    log('Creating user');
  }
}
```

Multiple mixins:

```dart
class MyService
    with Logger, Cacheable, Validatable {
}
```

The official documentation describes mixins as a mechanism for reusing code across multiple class hierarchies. ([Dart][1])

---

# 49. Dart vs Java inheritance

### Java

```java
class Dog extends Animal {
}
```

Java doesn't support general multiple class inheritance.

### Dart

```dart
class Dog extends Animal with Logger, Serializable {
}
```

Dart gives you:

```text
One superclass
+
Multiple mixins
```

This combination is particularly useful in Flutter libraries.

---

# 50. Enums

Simple enum:

```dart
enum Status {
  loading,
  success,
  error,
}
```

Use:

```dart
Status status = Status.loading;

if (status == Status.success) {
  print('Success');
}
```

---

# 51. Enhanced enums

Dart allows enums to contain data and methods.

```dart
enum UserRole {
  admin('Administrator'),
  user('User'),
  guest('Guest');

  const UserRole(this.label);

  final String label;
}
```

Usage:

```dart
print(UserRole.admin.label);
```

This is much more powerful than basic enums in many languages.

The official Dart language guide documents enhanced enums as enum declarations that can contain fields, constructors and methods. ([Dart][1])

---

# 52. Generics

Generics provide type safety while allowing reusable code.

```dart
class Box<T> {
  final T value;

  Box(this.value);
}
```

Usage:

```dart
final intBox = Box<int>(10);

final stringBox = Box<String>('Hello');
```

Without generics, you might use:

```dart
dynamic
```

which loses compile-time guarantees.

---

# 53. Generic functions

```dart
T first<T>(List<T> items) {
  return items.first;
}
```

Usage:

```dart
final number = first<int>([1, 2, 3]);

final name = first<String>(
  ['John', 'Jane'],
);
```

Usually Dart can infer the generic type:

```dart
final number = first([1, 2, 3]);
```

---

# 54. Generic constraints

```dart
T findById<T extends Entity>(List<T> items, String id) {
  // ...
  throw UnimplementedError();
}
```

This means:

```text
T must be Entity or a subclass of Entity
```

Very useful for reusable architecture.

---

# 55. `dynamic` vs `Object`

This is a very important professional Dart distinction.

```dart
Object value = 'Hello';
```

means:

> I know this is an object, but it may be different types.

You can only call members known to `Object`.

With:

```dart
dynamic value = 'Hello';
```

you are essentially telling Dart:

> Don't statically check this expression's members; resolve dynamically.

Example:

```dart
dynamic value = 'Hello';

print(value.length);
```

This works.

But:

```dart
Object value = 'Hello';

print(value.length); // Error
```

because `Object` does not guarantee a `length` property.

**Production rule:**

Prefer:

```dart
Object?
```

when you genuinely mean "any object".

Use:

```dart
dynamic
```

when dynamic behavior is actually required.

---

# 56. `Object`, `Object?`, `dynamic`, `void`, `Never`

These are worth understanding.

```text
Object
```

Any non-null Dart object.

```text
Object?
```

Any object or null.

```text
dynamic
```

Disable much of static checking for that expression.

```text
void
```

A function doesn't return a useful value.

```text
Never
```

The function/expression never successfully completes normally.

Example:

```dart
Never fail(String message) {
  throw Exception(message);
}
```

---

# 57. Records

Records were introduced as a Dart 3 language feature.

A record is an immutable, fixed-shape aggregate value.

```dart
final user = (
  'John',
  30,
);
```

Access:

```dart
print(user.$1);
print(user.$2);
```

Records can have named fields:

```dart
final user = (
  name: 'John',
  age: 30,
);
```

Access:

```dart
print(user.name);
print(user.age);
```

The official documentation describes records as fixed-sized, heterogeneous and typed anonymous values. ([Dart][6])

---

# 58. Records are excellent for multiple returns

Instead of:

```dart
class UserInfo {
  final String name;
  final int age;

  UserInfo(this.name, this.age);
}
```

you can sometimes simply:

```dart
(String, int) getUser() {
  return ('John', 30);
}
```

Then:

```dart
final result = getUser();

print(result.$1);
print(result.$2);
```

Or destructure:

```dart
final (name, age) = getUser();

print(name);
print(age);
```

---

# 59. Patterns

Patterns are another major Dart 3 feature.

They allow:

```text
matching
+
destructuring
+
type checking
```

Example:

```dart
final user = (
  name: 'John',
  age: 30,
);

final (:name, :age) = user;

print(name);
print(age);
```

The official documentation describes patterns as constructs that can match and/or destructure values. ([Dart][7])

---

# 60. Pattern matching

```dart
switch (value) {
  case int number:
    print('Number: $number');

  case String text:
    print('Text: $text');

  default:
    print('Something else');
}
```

This is much more powerful than a traditional switch.

---

# 61. Pattern matching with records

```dart
final response = (
  status: 200,
  message: 'OK',
);

switch (response) {
  case (status: 200, message: final message):
    print('Success: $message');

  case (status: 404, message: final message):
    print('Not found: $message');

  default:
    print('Other response');
}
```

---

# 62. Sealed classes

This becomes extremely useful in production Flutter architecture.

```dart
sealed class ApiState {}

class Loading extends ApiState {}

class Success extends ApiState {
  final String data;

  Success(this.data);
}

class Failure extends ApiState {
  final String message;

  Failure(this.message);
}
```

Then:

```dart
String getMessage(ApiState state) {
  return switch (state) {
    Loading() => 'Loading...',
    Success(data: final data) => data,
    Failure(message: final message) => message,
  };
}
```

This is excellent for representing finite application states.

For example:

```text
Loading
Success
Failure
Empty
Unauthorized
```

instead of a class containing ten booleans.

---

# 63. Extension methods

Extensions allow you to add functionality to an existing type.

```dart
extension StringExtensions on String {
  bool get isEmail {
    return contains('@');
  }
}
```

Then:

```dart
final email = 'john@example.com';

print(email.isEmail);
```

You didn't modify `String`.

This is extremely useful in Flutter projects.

Example:

```dart
extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
}
```

Then:

```dart
context.theme
```

---

# 64. Extension types

Modern Dart also provides **extension types**, which are different from ordinary extension methods.

They provide a compile-time abstraction around an existing representation type. The official documentation highlights them as particularly useful for static JavaScript interop and controlled interfaces. ([Dart][8])

Example:

```dart
extension type UserId(String value) {
  bool get isValid => value.isNotEmpty;
}
```

Then:

```dart
final id = UserId('user_123');

print(id.isValid);
```

For everyday Flutter development, extension methods are much more common, but extension types are worth knowing as the language evolves.

---

# 65. Exceptions

Dart supports exceptions.

```dart
throw Exception('Something went wrong');
```

Catch:

```dart
try {
  riskyOperation();
} catch (e) {
  print(e);
}
```

With stack trace:

```dart
try {
  riskyOperation();
} catch (error, stackTrace) {
  print(error);
  print(stackTrace);
}
```

---

# 66. `finally`

```dart
try {
  connect();
} catch (e) {
  print(e);
} finally {
  cleanup();
}
```

`finally` runs regardless of whether an exception occurs.

---

# 67. Custom exceptions

```dart
class AuthenticationException implements Exception {
  final String message;

  AuthenticationException(this.message);

  @override
  String toString() => message;
}
```

Then:

```dart
throw AuthenticationException(
  'Invalid credentials',
);
```

---

# 68. Async programming

This is probably the most important Dart topic for Flutter after null safety.

Dart uses:

```text
Future
async
await
Stream
Isolate
```

The official documentation emphasizes `async`/`await` as the primary way to write readable asynchronous Dart code. ([Dart][1])

---

# 69. Future

A `Future<T>` represents a value that will become available later.

```dart
Future<String> fetchUser() async {
  return 'John';
}
```

Usage:

```dart
final user = await fetchUser();

print(user);
```

---

# 70. Async/await

Example:

```dart
Future<void> loadUser() async {
  print('Loading...');

  final user = await fetchUser();

  print(user);
}
```

This looks synchronous:

```text
load
 ↓
await
 ↓
receive result
 ↓
continue
```

but the operation doesn't block the entire event loop.

---

# 71. JavaScript vs Dart async

### Dart

```dart
Future<User> fetchUser() async {
  final response = await api.getUser();

  return User.fromJson(response);
}
```

### JavaScript

```javascript
async function fetchUser() {
    const response = await api.getUser();

    return User.fromJson(response);
}
```

### TypeScript

```typescript
async function fetchUser(): Promise<User> {
    const response = await api.getUser();

    return User.fromJson(response);
}
```

The similarity is intentional and makes Dart relatively easy for JS/TS developers to learn.

---

# 72. Future error handling

```dart
try {
  final user = await fetchUser();
} catch (error) {
  print(error);
}
```

Or:

```dart
fetchUser()
    .then((user) {
      print(user);
    })
    .catchError((error) {
      print(error);
    });
```

For application code, `async/await` is generally much easier to read.

---

# 73. Future.wait

Suppose you need three independent API calls.

Bad:

```dart
final users = await fetchUsers();
final posts = await fetchPosts();
final settings = await fetchSettings();
```

If they're independent, this executes sequentially.

Instead:

```dart
final results = await Future.wait([
  fetchUsers(),
  fetchPosts(),
  fetchSettings(),
]);
```

Conceptually:

```text
fetchUsers() ────────┐
                     │
fetchPosts() ────────┼──> Future.wait
                     │
fetchSettings() ─────┘
```

This can substantially improve latency when operations are independent.

---

# 74. Streams

A `Future` gives you:

```text
one eventual result
```

A `Stream` gives you:

```text
zero/many results over time
```

Example:

```dart
Stream<int> counter() async* {
  for (var i = 0; i < 5; i++) {
    yield i;
    await Future.delayed(
      const Duration(seconds: 1),
    );
  }
}
```

Consume:

```dart
await for (final value in counter()) {
  print(value);
}
```

Streams are important for:

* WebSockets
* Firebase listeners
* database changes
* sensor data
* realtime events
* state updates

---

# 75. `async*` and `yield`

This is an important Dart concept.

```dart
Stream<int> numbers() async* {
  yield 1;
  yield 2;
  yield 3;
}
```

Unlike:

```dart
return 1;
```

`yield` emits values into a stream.

---

# 76. Dart's concurrency model

This is one of the biggest conceptual differences from Java, C++ and many server-side environments.

Dart uses:

```text
Event loop
+
Futures/Streams
+
Isolates
```

rather than conventional shared-memory threads.

Each isolate has its own memory and event loop. Isolates communicate through messages rather than shared mutable state. ([Dart][9])

---

# 77. Think of an isolate like this

```text
Main Isolate
 ├── Memory
 ├── Event Loop
 └── Flutter UI
       │
       │ message
       ▼
Worker Isolate
 ├── Separate Memory
 ├── Event Loop
 └── Heavy computation
```

No shared:

```text
global mutable memory
```

between isolates.

This removes entire categories of traditional thread synchronization problems.

---

# 78. When should Flutter use isolates?

Don't use an isolate for:

```text
HTTP request
Database query
Future.delayed
normal async operations
```

Those are generally asynchronous operations.

Use isolates for CPU-heavy work such as:

```text
Huge JSON parsing
Image processing
Encryption
Compression
Large data transformations
Machine-learning preprocessing
```

---

# 79. Isolate example

Conceptually:

```dart
import 'dart:isolate';

void worker(SendPort sendPort) {
  var total = 0;

  for (var i = 0; i < 100000000; i++) {
    total += i;
  }

  sendPort.send(total);
}
```

Production isolate APIs can be more involved, but the important concept is:

```text
main isolate
     |
     | message
     ▼
worker isolate
     |
     | result
     ▼
main isolate
```

---

# 80. Dart compilation — JIT vs AOT

This is one of Dart's major strengths for Flutter.

During development:

```text
Dart source
    ↓
Dart VM / JIT
    ↓
Running application
    ↓
Hot reload
```

For production:

```text
Dart source
    ↓
AOT compiler
    ↓
Native machine code
    ↓
Production application
```

The official Dart runtime documentation describes JIT compilation as important for development and hot reload, while AOT compilation produces native machine code for production native targets. ([Dart][2])

---

# 81. Why JIT is useful

During development:

```dart
Text('Hello')
```

change to:

```dart
Text('Hello World')
```

and Flutter can update the running application without rebuilding everything from scratch.

That's the famous:

> **Hot Reload**

Dart's development runtime is designed to support this workflow. ([Dart][2])

---

# 82. Why AOT is useful

Production applications can be compiled ahead of time into native machine code.

Conceptually:

```text
Dart
 ↓
AOT
 ↓
ARM/x64 machine code
 ↓
Native application
```

This gives Dart a useful combination:

```text
Development:
fast iteration

Production:
native compiled code
```

---

# 83. Web compilation

Dart can also target the web.

The official Dart documentation describes web compilation to JavaScript and WebAssembly. ([Dart][2])

So conceptually:

```text
                Dart
                  |
       ┌──────────┼──────────┐
       ▼          ▼          ▼
    Android     iOS       Web/Desktop
       |          |          |
      AOT        AOT       JS/Wasm/etc.
```

This is one reason Flutter can share application code across platforms.

---

# 84. Libraries and imports

Import a Dart library:

```dart
import 'dart:math';
```

Package:

```dart
import 'package:intl/intl.dart';
```

Your own file:

```dart
import 'models/user.dart';
```

Alias:

```dart
import 'package:some_package/some_package.dart'
    as package;
```

Then:

```dart
package.SomeClass();
```

---

# 85. `show` and `hide`

You can control imports:

```dart
import 'package:my_package/my_package.dart'
    show User, UserRepository;
```

Or:

```dart
import 'package:my_package/my_package.dart'
    hide InternalClass;
```

This becomes useful in large applications.

---

# 86. Dart package management

Dart uses **Pub**.

A Flutter project has:

```text
pubspec.yaml
```

Example:

```yaml
name: my_app

dependencies:
  flutter:
    sdk: flutter

  http: ^1.0.0
  intl: ^0.20.0
```

Then:

```bash
flutter pub get
```

For pure Dart:

```bash
dart pub get
```

The official package documentation describes `pubspec.yaml` as the package metadata/dependency declaration and `dart pub get` as the dependency retrieval command. ([Dart][10])

---

# 87. Dependency versions

For example:

```yaml
dependencies:
  http: ^1.2.0
```

The `^` constraint allows compatible versions according to Pub's dependency resolution rules.

A package project can also have:

```text
pubspec.lock
```

which records resolved dependency versions.

---

# 88. Dart tooling

Production Dart development isn't just the language.

You should know:

```bash
dart analyze
dart format .
dart test
dart run
dart pub get
dart pub outdated
```

For Flutter:

```bash
flutter analyze
flutter test
flutter pub get
flutter run
```

The Dart CLI officially provides commands for analysis, running, testing, package management and other development workflows. ([Dart][11])

---

# 89. `dart analyze`

This is essentially your static code quality gate.

```bash
dart analyze
```

It catches:

```text
type errors
undefined variables
invalid overrides
null safety problems
unused code
lint issues
many API mistakes
```

The analyzer performs the same static analysis exposed by Dart-aware IDEs. ([Dart][12])

---

# 90. `dart format`

Run:

```bash
dart format .
```

This automatically formats Dart code according to Dart's formatter. ([Dart][13])

This is important because teams shouldn't spend code-review time debating formatting.

---

# 91. Testing

Dart has a test ecosystem.

Example:

```dart
import 'package:test/test.dart';

void main() {
  test('addition works', () {
    expect(2 + 2, equals(4));
  });
}
```

Run:

```bash
dart test
```

Flutter adds:

```text
unit tests
widget tests
integration tests
```

---

# 92. A production-quality model

A common Flutter model:

```dart
class User {
  final String id;
  final String name;
  final String? email;

  const User({
    required this.id,
    required this.name,
    this.email,
  });

  factory User.fromJson(
    Map<String, dynamic> json,
  ) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
```

Notice how many Dart concepts are involved:

```text
class
final
const constructor
required parameters
nullable type
factory constructor
Map
generics
type casting
named parameters
```

---

# 93. JSON and `dynamic`

API responses often begin as:

```dart
Map<String, dynamic>
```

For example:

```dart
final json = {
  'id': 10,
  'name': 'John',
};
```

You can parse:

```dart
final id = json['id'] as int;
final name = json['name'] as String;
```

But production applications should avoid letting `dynamic` leak throughout the architecture.

Convert:

```text
JSON
 ↓
DTO/model
 ↓
typed application objects
 ↓
business logic
 ↓
UI
```

rather than:

```text
JSON
 ↓
dynamic everywhere
 ↓
runtime errors
```

---

# 94. Equality

In Dart:

```dart
==
```

is customizable.

By default, objects generally use identity-based equality unless their class overrides it.

You can override:

```dart
class User {
  final String id;

  User(this.id);

  @override
  bool operator ==(Object other) {
    return other is User && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
```

Now:

```dart
final a = User('1');
final b = User('1');

print(a == b); // true
```

This is important when working with:

* state management
* collections
* caching
* testing
* immutable models

---

# 95. Immutability

Flutter applications benefit enormously from immutable models.

Prefer:

```dart
class User {
  final String id;
  final String name;

  const User({
    required this.id,
    required this.name,
  });
}
```

instead of:

```dart
class User {
  String id;
  String name;
}
```

Why?

Because immutable data makes state easier to reason about:

```text
Old State
   ↓
create new state
   ↓
New State
```

rather than:

```text
State
 ↓
mutate random property
 ↓
who changed it?
 ↓
debugging nightmare
```

---

# 96. `copyWith`

Flutter applications frequently use the `copyWith` pattern.

```dart
class User {
  final String name;
  final int age;

  const User({
    required this.name,
    required this.age,
  });

  User copyWith({
    String? name,
    int? age,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }
}
```

Usage:

```dart
final user = User(
  name: 'John',
  age: 30,
);

final updated = user.copyWith(
  age: 31,
);
```

This is foundational for immutable state.

---

# 97. Important caveat with `copyWith` and null

The simple implementation:

```dart
String? name
```

cannot distinguish:

```text
"don't change name"
```

from:

```text
"explicitly set name to null"
```

For sophisticated APIs, you may need sentinel patterns or generated code.

This is one of those details that becomes important in large Flutter applications.

---

# 98. Callable classes

Dart allows an object to be called like a function.

```dart
class Multiplier {
  final int factor;

  Multiplier(this.factor);

  int call(int value) {
    return value * factor;
  }
}
```

Usage:

```dart
final doubleValue = Multiplier(2);

print(doubleValue(10));
```

Notice:

```dart
doubleValue(10)
```

instead of:

```dart
doubleValue.call(10)
```

This is useful for function-like objects and certain architectural patterns.

---

# 99. Operators can be overloaded

Dart allows custom operators.

```dart
class Money {
  final double amount;

  Money(this.amount);

  Money operator +(Money other) {
    return Money(amount + other.amount);
  }
}
```

Usage:

```dart
final total = Money(100) + Money(50);

print(total.amount);
```

---

# 100. Assertions

```dart
assert(age >= 0);
```

Assertions are useful during development.

Example:

```dart
class User {
  final int age;

  User(this.age) : assert(age >= 0);
}
```

Don't use assertions as production validation.

For external/user/API input:

```dart
if (age < 0) {
  throw ArgumentError('Invalid age');
}
```

---

# 101. Switch expressions

Modern Dart supports switch expressions.

```dart
final message = switch (status) {
  Status.loading => 'Loading',
  Status.success => 'Success',
  Status.error => 'Error',
};
```

This is particularly powerful with sealed classes and pattern matching.

---

# 102. Traditional switch

```dart
switch (status) {
  case Status.loading:
    print('Loading');

  case Status.success:
    print('Success');

  case Status.error:
    print('Error');
}
```

Modern Dart's pattern matching makes `switch` much more expressive than simple equality matching.

---

# 103. Type promotion

Dart's analyzer can often understand checks that narrow types.

```dart
void printLength(String? value) {
  if (value != null) {
    print(value.length);
  }
}
```

Inside the block, Dart knows:

```text
value = String
```

rather than:

```text
String?
```

This is called type promotion.

---

# 104. A powerful Flutter example

```dart
void showUser(User? user) {
  if (user == null) {
    print('No user');
    return;
  }

  print(user.name);
}
```

After the early return:

```dart
user
```

is known to be non-null.

This style is often much cleaner than repeatedly using `!`.

---

# 105. Dart vs JavaScript

Here's the broad comparison.

| Concept           | Dart                       | JavaScript                                    |
| ----------------- | -------------------------- | --------------------------------------------- |
| Type system       | Static + sound             | Dynamic                                       |
| Type inference    | Yes                        | N/A                                           |
| Null safety       | Built-in sound null safety | Runtime convention                            |
| Classes           | Yes                        | Yes                                           |
| Interfaces        | Built into class model     | No native interface type                      |
| Generics          | Yes                        | TypeScript provides them                      |
| Async             | Future/async/await         | Promise/async/await                           |
| Streams           | Native `Stream`            | Various APIs/libraries                        |
| Concurrency       | Isolates                   | Event loop + workers                          |
| AOT native        | Yes                        | Not generally the primary model               |
| Flutter           | Native language            | No                                            |
| Extension methods | Yes                        | Prototype-based alternatives                  |
| Records           | Yes                        | Objects/arrays                                |
| Pattern matching  | Yes                        | Modern JS has patterns/features but different |
| Packages          | Pub                        | npm                                           |

---

# 106. Dart vs TypeScript

This is probably the easiest transition for many developers.

| Concept               | Dart                  | TypeScript                              |
| --------------------- | --------------------- | --------------------------------------- |
| Variable inference    | `var`                 | `let`                                   |
| Immutable variable    | `final`               | `const`                                 |
| Compile-time constant | `const`               | no direct equivalent                    |
| Nullable              | `String?`             | `string \| null`                        |
| Optional property     | `String?`             | `property?: string`                     |
| Async result          | `Future<T>`           | `Promise<T>`                            |
| Interface             | class/interface model | `interface`                             |
| Generics              | Yes                   | Yes                                     |
| Enums                 | Yes                   | Yes                                     |
| Records               | Yes                   | tuples/object types                     |
| Extension methods     | Yes                   | no direct equivalent                    |
| Mixins                | Native                | no direct equivalent                    |
| Isolates              | Native                | Web Workers / Node workers conceptually |
| Runtime               | Dart VM/native/web    | JavaScript runtime                      |
| UI framework          | Flutter               | React/Vue/Angular/etc.                  |

---

# 107. Dart vs Java

| Concept              | Dart                          | Java                                |
| -------------------- | ----------------------------- | ----------------------------------- |
| Main                 | `void main()`                 | `public static void main()`         |
| Variables            | concise                       | more verbose                        |
| Type inference       | `var`                         | `var`                               |
| Null safety          | sound                         | nullable references                 |
| Classes              | Yes                           | Yes                                 |
| Single inheritance   | Yes                           | Yes                                 |
| Mixins               | Yes                           | No native equivalent                |
| Interfaces           | Every class defines interface | Explicit `interface`                |
| Named constructors   | Yes                           | No                                  |
| Factory constructors | Yes                           | factory pattern/constructors differ |
| Async                | `Future`                      | CompletableFuture/etc.              |
| Isolates             | Native Dart model             | Threads                             |
| GC                   | Yes                           | Yes                                 |
| AOT                  | Yes                           | possible/native ecosystem differs   |
| Flutter              | Native                        | No                                  |

Dart will feel especially comfortable to Java developers because of:

```text
classes
types
interfaces
generics
constructors
inheritance
exceptions
static analysis
```

---

# 108. Dart vs Python

| Concept          | Dart                     | Python                                          |
| ---------------- | ------------------------ | ----------------------------------------------- |
| Type system      | Static/sound             | Dynamic                                         |
| Type annotations | Optional but meaningful  | Optional                                        |
| Null             | `null`                   | `None`                                          |
| List             | `List<T>`                | `list`                                          |
| Dictionary       | `Map<K,V>`               | `dict`                                          |
| Set              | `Set<T>`                 | `set`                                           |
| Functions        | First class              | First class                                     |
| Classes          | Yes                      | Yes                                             |
| Generics         | Native                   | typing system                                   |
| Async            | `Future`/`Stream`        | coroutine/asyncio                               |
| Compilation      | JIT/AOT depending target | primarily interpreted/VM                        |
| Mobile UI        | Flutter                  | not comparable                                  |
| Mixins           | Native language feature  | supported through multiple inheritance patterns |
| Pattern matching | Yes                      | Yes, but different syntax/model                 |

Python programmers usually find Dart syntax straightforward, but Dart's static type system requires a different discipline.

---

# 109. One concept in four languages

Let's implement the same user model.

## Dart

```dart
class User {
  final String name;
  final int age;

  const User({
    required this.name,
    required this.age,
  });

  String greeting() {
    return 'Hello, $name';
  }
}

void main() {
  final user = User(
    name: 'John',
    age: 30,
  );

  print(user.greeting());
}
```

## TypeScript

```typescript
class User {
    constructor(
        public readonly name: string,
        public readonly age: number
    ) {}

    greeting(): string {
        return `Hello, ${this.name}`;
    }
}

const user = new User(
    "John",
    30
);

console.log(user.greeting());
```

## Java

```java
class User {
    private final String name;
    private final int age;

    public User(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public String greeting() {
        return "Hello, " + name;
    }
}

public class Main {
    public static void main(String[] args) {
        User user = new User(
            "John",
            30
        );

        System.out.println(user.greeting());
    }
}
```

## Python

```python
class User:
    def __init__(self, name: str, age: int):
        self.name = name
        self.age = age

    def greeting(self) -> str:
        return f"Hello, {self.name}"


user = User(
    "John",
    30
)

print(user.greeting())
```

The Dart version is deliberately concise while retaining strong typing.

---

# 110. Same async API in four languages

## Dart

```dart
Future<User> fetchUser() async {
  final response = await api.get('/user');

  return User.fromJson(response);
}
```

## TypeScript

```typescript
async function fetchUser(): Promise<User> {
    const response = await api.get("/user");

    return User.fromJson(response);
}
```

## Java

```java
CompletableFuture<User> fetchUser() {
    return api.get("/user")
        .thenApply(User::fromJson);
}
```

## Python

```python
async def fetch_user() -> User:
    response = await api.get("/user")

    return User.from_json(response)
```

Dart's async model should feel immediately familiar if you know modern JavaScript/TypeScript or Python.

---

# 111. The Dart "superpowers"

Now we get to the most important part for a Flutter developer.

Dart's individual features are useful, but the real strength comes from how they work together.

---

## Superpower #1 — Sound null safety

```dart
String name = 'John';
```

The type system guarantees:

```text
name != null
```

while:

```dart
String? name;
```

explicitly represents uncertainty.

This makes nullable state visible in APIs.

---

# 112. Superpower #2 — Excellent type inference

You don't have to write:

```dart
String name = 'John';
int age = 30;
List<String> names = <String>[
  'John',
  'Jane',
];
```

You can write:

```dart
var name = 'John';
var age = 30;
var names = [
  'John',
  'Jane',
];
```

But Dart still knows the types.

This gives you:

```text
static typing
+
concise syntax
```

rather than choosing one or the other.

---

# 113. Superpower #3 — `const`

Flutter makes extensive use of compile-time constants:

```dart
const Text('Hello');
```

```dart
const EdgeInsets.all(16);
```

```dart
const Duration(seconds: 1);
```

```dart
const MyWidget();
```

The ability to express immutable compile-time values is deeply integrated into Dart and Flutter's programming style.

---

# 114. Superpower #4 — Named parameters

Consider a UI component:

```dart
MyButton(
  text: 'Login',
  icon: Icons.login,
  width: 200,
  height: 48,
  loading: isLoading,
  onPressed: login,
);
```

Compare that with:

```dart
MyButton(
  'Login',
  Icons.login,
  200,
  48,
  isLoading,
  login,
);
```

Named parameters make APIs much easier to understand.

This is one of Dart's biggest ergonomic wins for UI programming.

---

# 115. Superpower #5 — Collection literals

Flutter code becomes incredibly expressive:

```dart
Column(
  children: [
    const Text('Welcome'),

    if (user != null)
      Text(user.name),

    for (final item in items)
      ListTile(
        title: Text(item.name),
      ),
  ],
)
```

This isn't merely syntax sugar.

It allows a widget tree to remain declarative while still supporting ordinary Dart control flow.

---

# 116. Superpower #6 — Cascades

```dart
final controller = AnimationController(...)
  ..addListener(...)
  ..addStatusListener(...);
```

Instead of:

```dart
final controller = AnimationController(...);

controller.addListener(...);
controller.addStatusListener(...);
```

It's a small feature, but over a large codebase it makes certain APIs much cleaner.

---

# 117. Superpower #7 — Extension methods

Instead of utility functions like:

```dart
String formatCurrency(double value)
```

you can write:

```dart
extension CurrencyExtension on double {
  String get currency {
    return '\$$this';
  }
}
```

Then:

```dart
final price = 99.99;

print(price.currency);
```

This lets domain-specific behavior read naturally.

---

# 118. Superpower #8 — Records + patterns

Before records:

```dart
class Result {
  final String value;
  final bool success;

  Result(this.value, this.success);
}
```

Now:

```dart
(String, bool) operation() {
  return ('Done', true);
}
```

and:

```dart
final (value, success) = operation();
```

This is fantastic for small internal APIs.

---

# 119. Superpower #9 — Sealed classes + pattern matching

For state management:

```dart
sealed class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final User user;

  LoginSuccess(this.user);
}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure(this.message);
}
```

Then:

```dart
Widget build(LoginState state) {
  return switch (state) {
    LoginInitial() => const LoginPage(),

    LoginLoading() => const LoadingIndicator(),

    LoginSuccess(user: final user) =>
      HomePage(user: user),

    LoginFailure(message: final message) =>
      ErrorPage(message: message),
  };
}
```

This is a powerful way of expressing finite states.

---

# 120. Superpower #10 — JIT + hot reload + AOT

This combination is arguably Dart's biggest advantage in Flutter development.

```text
                   Dart
                     |
        ┌────────────┴────────────┐
        ▼                         ▼
 Development                  Production
        │                         │
       JIT                       AOT
        │                         │
 Hot Reload                 Native machine code
        │                         │
 Fast iteration             Release application
```

You get a highly iterative development experience while retaining native compilation for production native targets. ([Dart][2])

---

# 121. Superpower #11 — Isolates

Instead of sharing memory between threads:

```text
Thread A
    ↕
Shared memory
    ↕
Thread B
```

Dart's model is closer to:

```text
Isolate A             Isolate B

Memory A              Memory B
   │                     │
Event loop             Event loop
   │                     │
   └──── messages ───────┘
```

This greatly simplifies many concurrency problems. ([Dart][9])

---

# 122. Superpower #12 — One language across the stack

You can use Dart for:

```text
Flutter UI
        ↓
Business logic
        ↓
Networking
        ↓
Models
        ↓
Backend services
        ↓
CLI/tools
```

Dart is not limited to UI development.

---

# 123. Production Dart architecture

A professional Flutter application might look like:

```text
lib/
│
├── core/
│   ├── error/
│   ├── network/
│   ├── storage/
│   ├── constants/
│   └── utils/
│
├── features/
│   │
│   ├── authentication/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   ├── models/
│   │   │   └── repositories/
│   │   │
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repositories/
│   │   │   └── usecases/
│   │   │
│   │   └── presentation/
│   │       ├── pages/
│   │       ├── widgets/
│   │       └── controllers/
│   │
│   └── profile/
│
└── main.dart
```

This isn't mandated by Dart.

It's an architectural choice enabled by Dart's libraries, classes, types and package ecosystem.

---

# 124. Production principle: keep `dynamic` at the boundary

Imagine:

```text
HTTP JSON
    ↓
dynamic
    ↓
DTO
    ↓
Domain model
    ↓
Application state
    ↓
Flutter UI
```

Try to stop `dynamic` here:

```text
             dynamic
                │
                ▼
          API conversion
                │
                ▼
           typed models
                │
                ▼
         business logic
                │
                ▼
               UI
```

This lets Dart's static analyzer protect most of your application.

---

# 125. Production principle: prefer immutable models

Prefer:

```dart
class Product {
  final String id;
  final String name;
  final double price;

  const Product({
    required this.id,
    required this.name,
    required this.price,
  });
}
```

over:

```dart
class Product {
  String id;
  String name;
  double price;
}
```

This works especially well with Flutter's declarative UI model.

---

# 126. Production principle: model states explicitly

Avoid:

```dart
class State {
  bool isLoading;
  bool hasError;
  bool isSuccess;
  String? error;
  User? user;
}
```

This allows impossible combinations:

```text
isLoading = true
isSuccess = true
hasError = true
```

Instead:

```dart
sealed class UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final User user;

  UserSuccess(this.user);
}

class UserFailure extends UserState {
  final String message;

  UserFailure(this.message);
}
```

Now your state space is explicit.

---

# 127. Production principle: make illegal states difficult to represent

This is one of the most important lessons from modern typed programming.

Bad:

```dart
String? userId;
bool loggedIn;
bool loading;
String? error;
```

Good:

```dart
sealed class AuthState {}

class LoggedOut extends AuthState {}

class LoggingIn extends AuthState {}

class LoggedIn extends AuthState {
  final User user;

  LoggedIn(this.user);
}

class LoginFailed extends AuthState {
  final String message;

  LoginFailed(this.message);
}
```

The second design communicates the domain much better.

---

# 128. Production principle: use `required`

Instead of:

```dart
User(
  String? name,
  int? age,
)
```

prefer:

```dart
User({
  required this.name,
  required this.age,
});
```

Now the compiler forces callers to provide valid construction data.

---

# 129. Production principle: use types as documentation

This:

```dart
Future<List<User>> fetchUsers()
```

communicates much more than:

```dart
Future<dynamic> fetchUsers()
```

The first tells you:

```text
asynchronous
returns List
elements are User
```

before reading the implementation.

That is one of the biggest benefits of static typing.

---

# 130. Production principle: understand `final` vs `const`

Use:

```dart
final
```

when something is assigned once at runtime:

```dart
final user = fetchUser();
```

Use:

```dart
const
```

when something can be known at compile time:

```dart
const timeout = Duration(seconds: 30);
```

In Flutter:

```dart
const Text('Hello');
```

is common.

---

# 131. Production principle: avoid unnecessary `!`

Bad:

```dart
Text(user!.profile!.name!)
```

Better:

```dart
final name = user?.profile?.name;

if (name == null) {
  return const Text('Unknown');
}

return Text(name);
```

Or model your domain so that `name` cannot be nullable in the first place.

---

# 132. Production principle: use async correctly

Don't do CPU-heavy work like:

```dart
final result = hugeCalculation();
```

on the UI isolate if it blocks for a significant amount of time.

Instead:

```text
UI isolate
   │
   │ spawn
   ▼
worker isolate
   │
   │ computation
   ▼
result
   │
   ▼
UI
```

Dart's isolate model is designed specifically for this type of parallel CPU work. ([Dart][9])

---

# 133. Dart language features you should master for Flutter

If your objective is **production Flutter development**, prioritize these:

### Tier 1 — absolutely essential

```text
var
final
const
late
null safety
String
int/double/bool
List
Map
Set
if
for
switch
functions
anonymous functions
named parameters
required
classes
constructors
inheritance
abstract classes
interfaces
async
await
Future
Stream
exceptions
imports
generics
```

### Tier 2 — highly important

```text
factory constructors
getters/setters
mixins
extensions
cascades
collection if
collection for
spread operator
typedef
operator overloads
equality/hashCode
immutable classes
```

### Tier 3 — modern Dart

```text
records
patterns
sealed classes
class modifiers
switch expressions
enhanced enums
extension types
```

---

# 134. Dart features you should understand before senior-level Flutter

Eventually you should be comfortable with:

```text
type inference
generic variance concepts
type promotion
nullability
dynamic
Object
Object?
Never
Future
Stream
event loop
microtasks
isolates
JIT
AOT
FFI
JS interop
package management
static analysis
lints
testing
immutability
API design
library boundaries
```

You don't need to memorize everything.

You need to understand **when and why to use it**.

---

# 135. The most important Dart syntax cheat sheet

```dart
// Variable
var name = 'John';

// Explicit type
String name = 'John';

// Immutable reference
final name = 'John';

// Compile-time constant
const pi = 3.14;

// Nullable
String? name;

// Non-null assertion
name!;

// Null-aware access
name?.length;

// Null coalescing
name ?? 'Guest';

// Null-aware assignment
name ??= 'Guest';

// Function
int add(int a, int b) {
  return a + b;
}

// Arrow function
int add(int a, int b) => a + b;

// Named parameters
void greet({
  required String name,
  String message = 'Hello',
}) {}

// Class
class User {
  final String name;

  const User({
    required this.name,
  });
}

// Named constructor
User.guest() : name = 'Guest';

// Factory
factory User.fromJson(Map<String, dynamic> json) {
  return User(
    name: json['name'] as String,
  );
}

// Inheritance
class Admin extends User {
  Admin({required super.name});
}

// Interface
class ApiUser implements User {
  // ...
}

// Mixin
mixin Logger {
  void log(String message) {}
}

// Extension
extension StringExtensions on String {
  bool get isEmail => contains('@');
}

// Async
Future<User> fetchUser() async {
  return User(name: 'John');
}

// Await
final user = await fetchUser();

// Stream
Stream<int> numbers() async* {
  yield 1;
  yield 2;
}

// Record
final userInfo = (
  name: 'John',
  age: 30,
);

// Pattern
final (:name, :age) = userInfo;

// Sealed class
sealed class State {}

// Switch expression
final text = switch (state) {
  Loading() => 'Loading',
  Success() => 'Success',
};
```

---

# 136. Dart vs the languages you already know — the mental translation map

If you're coming from JavaScript:

```text
JavaScript Promise<T> → Dart Future<T>
JavaScript Array      → Dart List<T>
JavaScript Map        → Dart Map<K,V>
JavaScript Set        → Dart Set<T>
async/await           → async/await
```

If you're coming from TypeScript:

```text
TypeScript string | null → Dart String?
Promise<T>                → Future<T>
readonly                  → final
interface                 → Dart implicit interfaces / abstract/interface classes
tuple                     → Record
union states              → sealed classes + patterns
```

If you're coming from Java:

```text
class          → class
extends        → extends
implements     → implements
interface      → implicit/explicit interface model
Future-like    → Future
static typing  → static typing
GC             → GC
```

If you're coming from Python:

```text
None            → null
list            → List<T>
dict            → Map<K,V>
set             → Set<T>
def             → function
async/await     → async/await
dataclass-like  → immutable Dart class / record
```

---

# 137. What makes Dart particularly good for Flutter?

The answer isn't simply:

> "Dart is fast."

The real advantage is the combination:

```text
                    DART
                      │
        ┌─────────────┼─────────────┐
        ▼             ▼             ▼
   Static types    Null safety    Inference
        │             │             │
        └─────────────┼─────────────┘
                      ▼
                 Safe APIs
                      │
        ┌─────────────┼─────────────┐
        ▼             ▼             ▼
     async          isolates      streams
        │             │             │
        └─────────────┼─────────────┘
                      ▼
                Responsive apps
                      │
        ┌─────────────┼─────────────┐
        ▼             ▼             ▼
       JIT           Hot Reload      AOT
        │                              │
        ▼                              ▼
 Fast development              Native production
```

Dart was designed with client development, fast iteration and multiple compilation targets in mind. ([Dart][2])

---

# 138. The real Dart "superpower"

If I had to reduce Dart's biggest advantage to one sentence:

> **Dart combines a modern statically typed language with an extremely productive development runtime and a production-oriented compilation model.**

You get:

```text
TypeScript-like developer ergonomics
+
Java-like type safety/OOP
+
JavaScript-like async syntax
+
Python-like readability
+
Native compilation
+
Hot reload
+
Isolates
+
Flutter
```

That combination is what makes Dart particularly effective for Flutter.

---

# 139. What you should NOT do as a Flutter developer

Avoid writing Dart like Java:

```dart
class UserManagerFactoryImpl {
  // excessive abstraction
}
```

Avoid writing Dart like JavaScript:

```dart
dynamic everything;
```

Avoid writing Dart like Python:

```dart
dynamic user;
dynamic response;
dynamic data;
```

Avoid writing Dart like C:

```dart
// massive procedural functions
```

Instead embrace Dart's strengths:

```dart
final
const
required
?
async/await
Future<T>
Stream<T>
sealed
switch
records
patterns
extensions
generics
immutable models
```

---

# 140. A professional Flutter/Dart example

Putting many concepts together:

```dart
sealed class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  final User user;

  const LoginSuccess(this.user);
}

class LoginFailure extends LoginState {
  final String message;

  const LoginFailure(this.message);
}

class User {
  final String id;
  final String name;
  final String? email;

  const User({
    required this.id,
    required this.name,
    this.email,
  });

  factory User.fromJson(
    Map<String, dynamic> json,
  ) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String?,
    );
  }

  User copyWith({
    String? name,
    String? email,
  }) {
    return User(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}

class AuthRepository {
  Future<User> login({
    required String email,
    required String password,
  }) async {
    // API call...
    await Future<void>.delayed(
      const Duration(seconds: 1),
    );

    return const User(
      id: '1',
      name: 'John',
      email: 'john@example.com',
    );
  }
}

class LoginController {
  final AuthRepository repository;

  LoginController({
    required this.repository,
  });

  LoginState state = const LoginInitial();

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const LoginLoading();

    try {
      final user = await repository.login(
        email: email,
        password: password,
      );

      state = LoginSuccess(user);
    } catch (error) {
      state = LoginFailure(
        error.toString(),
      );
    }
  }
}
```

This small example demonstrates:

```text
sealed classes
immutable objects
const
final
nullable fields
required named parameters
factory constructors
Map<String, dynamic>
type casts
copyWith
Future
async/await
exceptions
repository pattern
explicit application states
```

That is the kind of Dart you should aim to write in production Flutter.

---

# 141. The Dart learning roadmap I recommend

Don't learn Dart as 100 unrelated syntax features.

Learn it in this order:

```text
LEVEL 1
│
├── Variables
├── Types
├── Strings
├── Lists
├── Maps
├── Sets
├── Operators
├── if/else
├── loops
└── functions
        │
        ▼
LEVEL 2
│
├── null safety
├── final
├── const
├── late
├── named parameters
├── required
└── collection operators
        │
        ▼
LEVEL 3
│
├── classes
├── constructors
├── named constructors
├── factory
├── inheritance
├── abstract classes
├── interfaces
└── mixins
        │
        ▼
LEVEL 4
│
├── generics
├── extensions
├── cascades
├── typedefs
├── equality
├── immutable models
└── operators
        │
        ▼
LEVEL 5
│
├── Future
├── async/await
├── Stream
├── event loop
└── isolates
        │
        ▼
LEVEL 6 — MODERN DART
│
├── records
├── patterns
├── sealed classes
├── switch expressions
├── enhanced enums
├── class modifiers
└── extension types
        │
        ▼
LEVEL 7 — PRODUCTION
│
├── packages
├── pubspec
├── analysis
├── formatting
├── testing
├── architecture
├── performance
├── API design
└── Flutter integration
```

---

# 142. The 20 concepts I'd memorize first

If you're starting Dart specifically for Flutter, make these second nature:

```text
1.  var
2.  final
3.  const
4.  ?
5.  !
6.  ??
7.  ??=
8.  async
9.  await
10. Future<T>
11. Stream<T>
12. required
13. named parameters
14. List<T>
15. Map<K,V>
16. generics
17. factory constructors
18. extensions
19. sealed classes
20. pattern matching
```

And then master:

```text
collections
classes
immutability
copyWith
interfaces
mixins
isolates
records
testing
packages
```

---

# 143. Final mental model

When you see Dart code like:

```dart
final users = await repository
    .getUsers()
    .then(
      (response) => response
          .where((user) => user.isActive)
          .toList(),
    );
```

you should be able to immediately identify:

```text
final
    ↓
single assignment

await
    ↓
asynchronous operation

Future<List<User>>
    ↓
eventual typed result

repository
    ↓
abstraction

where()
    ↓
higher-order function

(user) => ...
    ↓
anonymous function

List<User>
    ↓
strongly typed collection
```

That's the point where you're no longer merely **learning Dart syntax**.

You're thinking in Dart.

---

# 144. Official Dart documentation map

The official documentation is worth keeping open while learning:

* **Dart language introduction** — syntax and the major language features. [Dart Language Tour](https://dart.dev/language?utm_source=chatgpt.com)
* **Dart overview** — runtime, compilation model, platforms and the relationship to Flutter. [Dart Overview](https://dart.dev/overview?utm_source=chatgpt.com)
* **Variables and null safety** — `var`, `final`, `const`, `late` and nullable types. [Dart Variables](https://dart.dev/language/variables?utm_source=chatgpt.com)
* **Classes** — constructors, inheritance, mixins, interfaces and class design. [Dart Classes](https://dart.dev/language/classes?utm_source=chatgpt.com)
* **Records** — Dart 3 records and multiple-value structures. [Dart Records](https://dart.dev/language/records?utm_source=chatgpt.com)
* **Patterns** — destructuring and pattern matching. [Dart Patterns](https://dart.dev/language/patterns?utm_source=chatgpt.com)
* **Concurrency** — event loop, Futures and isolates. [Dart Concurrency](https://dart.dev/language/concurrency?utm_source=chatgpt.com)
* **Packages** — Pub and dependency management. [Dart Packages](https://dart.dev/tools/pub/packages?utm_source=chatgpt.com)
* **Dart CLI** — `dart run`, `dart analyze`, `dart test`, package commands and other tooling. [Dart CLI](https://dart.dev/tools/dart-tool?utm_source=chatgpt.com)

**The key takeaway:** don't learn Dart merely as "the language Flutter uses." Learn **Dart's type system, null safety, immutable data, async model, generics, patterns, sealed classes and runtime model**. Once those concepts are solid, Flutter itself becomes much easier because Flutter's API design deliberately makes heavy use of these Dart capabilities. ([Dart][2])
