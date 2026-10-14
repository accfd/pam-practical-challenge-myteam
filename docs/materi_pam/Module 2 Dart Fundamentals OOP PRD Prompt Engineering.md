# 📘 Module 2 Dart Fundamentals OOP PRD Prompt Engineering

> **Sumber File:** `Module 2 Dart Fundamentals OOP PRD Prompt Engineering.pdf`  
> **Mata Kuliah:** Pengembangan Aplikasi Mobile (Semester 5)  
> **Total Halaman:** 36 Halaman  

---

## 📄 Halaman / Slide 1

Mobile Application
Development
Module 2: Dart Fundamentals, OOP, PRD & Prompt Engineering

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 1)
```text
UNIVERSITAS ANDALAS
```

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 1)
```text
verdekq
```

---

## 📄 Halaman / Slide 2

Learning Objectives
• Explain the role of Dart in Flutter application development.
• Use fundamental Dart syntax, variables, control flow, collections, and
functions.
• Apply basic object-oriented programming concepts in Dart.
• Identify a user problem and translate it into clear product requirements.
• Create a concise Product Requirements Document (PRD).
• Write structured prompts that provide useful context to AI coding assistants.
07/09/2026 2

|  |
| --- |
| Learning Objectives |
| • Explain the role of Dart in Flutter application development. • Use fundamental Dart syntax, variables, control flow, collections, and functions. • Apply basic object-oriented programming concepts in Dart. • Identify a user problem and translate it into clear product requirements. • Create a concise Product Requirements Document (PRD). • Write structured prompts that provide useful context to AI coding assistants. |
| 07/09/2026 2 |
|  |

---

## 📄 Halaman / Slide 3

AGENDA
• Dart Fundamentals
• Object-Oriented Programming (OOP) with Dart
• Problem Identification
• Product Requirements Document (PRD)
• Prompt Engineering for AI-Assisted Development

---

## 📄 Halaman / Slide 4

“
“The hardest single part of building a software system is deciding
precisely what to build”
- Fred Brooks
“

---

## 📄 Halaman / Slide 5

Why Dart for Flutter?
• Dart is the programming language that powers Flutter.
• Dart is designed for client development and multi-platform applications.
• Dart supports type safety, type inference, and sound null safety.
• Dart also provides tools for formatting, analyzing, and testing code.
• Flutter uses Dart to build UI experiences for mobile, desktop, and web.
07/09/2026 5

|  |
| --- |
| Why Dart for Flutter? |
| • Dart is the programming language that powers Flutter. • Dart is designed for client development and multi-platform applications. • Dart supports type safety, type inference, and sound null safety. • Dart also provides tools for formatting, analyzing, and testing code. • Flutter uses Dart to build UI experiences for mobile, desktop, and web. |
| 07/09/2026 5 |
|  |

---

## 📄 Halaman / Slide 6

Dart: A Quick Look
• Type safe: the language uses static type checking.
• Type annotations are optional because Dart supports type inference.
• Null safety is built into the language.
• Everything is an object, including numbers and functions.
• Dart supports object-oriented programming, generics, asynchronous
programming, and collections.
07/09/2026 6

|  |
| --- |
| Dart: A Quick Look |
| • Type safe: the language uses static type checking. • Type annotations are optional because Dart supports type inference. • Null safety is built into the language. • Everything is an object, including numbers and functions. • Dart supports object-oriented programming, generics, asynchronous programming, and collections. |
| 07/09/2026 6 |
|  |

---

## 📄 Halaman / Slide 7

Your First Dart Program
void main() {
print('Hello, Flutter!');
}
Execution starts from the top-level main() function.

| Your First Dart Program |
| --- |
| void main() { print('Hello, Flutter!'); } Execution starts from the top-level main() function. |
|  |

---

## 📄 Halaman / Slide 8

Variables & Types
var name = 'Alya'; // inferred as String
int age = 20;
double score = 87.5;
bool isActive = true;
final course = 'Mobile Programming';
const maxTeamSize = 5;
Dart supports type inference with var and immutable variables with final/const.

| Variables & Types |
| --- |
| var name = 'Alya'; // inferred as String int age = 20; double score = 87.5; bool isActive = true; final course = 'Mobile Programming'; const maxTeamSize = 5; Dart supports type inference with var and immutable variables with final/const. |
|  |

---

## 📄 Halaman / Slide 9

Null Safety
String name = 'Alya';
String? nickname = null;
print(nickname?.toUpperCase());
print(nickname ?? 'No nickname');
• A non-nullable variable cannot contain null.
• Use ? when a value is allowed to be null.
• The compiler helps detect potential null-related errors before runtime.
• Use null-aware operators when working with nullable values.

| Null Safety |
| --- |
| String name = 'Alya'; String? nickname = null; print(nickname?.toUpperCase()); print(nickname ?? 'No nickname'); • A non-nullable variable cannot contain null. • Use ? when a value is allowed to be null. • The compiler helps detect potential null-related errors before runtime. • Use null-aware operators when working with nullable values. |
|  |

---

## 📄 Halaman / Slide 10

String? username = null;
print(username?.toUpperCase());
print(username ?? 'Guest’);
Exercise
• Predict the output.
07/09/2026 10

| Exercise | String? username = null; print(username?.toUpperCase()); print(username ?? 'Guest’); • Predict the output. |
| --- | --- |
| 07/09/2026 | 10 |
|  |  |

---

## 📄 Halaman / Slide 11

Operators & Expressions
final total = price * quantity;
final status = isPaid ? 'Paid' : 'Unpaid';
final displayName = nickname ?? 'Guest';
• Arithmetic: +, -, *, /, ~/ and %
• Comparison: ==, !=, >, <, >=, <=
• Logical: &&, ||, !
• Conditional expression: condition ? valueIfTrue : valueIfFalse
• Null-aware operators: ?, ??, ??=

| Operators & Expressions |
| --- |
| final total = price * quantity; final status = isPaid ? 'Paid' : 'Unpaid'; final displayName = nickname ?? 'Guest'; • Arithmetic: +, -, *, /, ~/ and % • Comparison: ==, !=, >, <, >=, <= • Logical: &&, ||, ! • Conditional expression: condition ? valueIfTrue : valueIfFalse • Null-aware operators: ?, ??, ??= |
|  |

---

## 📄 Halaman / Slide 12

Control Flow
if (score >= 80) {
print('Excellent');
} else if (score >= 60) {
print('Good');
} else {
print('Keep learning');
}
for (final item in items) {
print(item);
}
Control flow lets the program make decisions and repeat operations.

| Control Flow |
| --- |
| if (score >= 80) { print('Excellent'); } else if (score >= 60) { print('Good'); } else { print('Keep learning'); } for (final item in items) { print(item); } Control flow lets the program make decisions and repeat operations. |
|  |

---

## 📄 Halaman / Slide 13

void main() {
final score = 75;
if (score >= 80) {
print('Excellent');
Exercise } else if (score >= 60) {
print('Good');
} else {
print('Keep learning');
}
}
07/09/2026 14

| Exercise | void main() { final score = 75; if (score >= 80) { print('Excellent'); } else if (score >= 60) { print('Good'); } else { print('Keep learning'); } } |
| --- | --- |
| 07/09/2026 | 14 |
|  |  |

---

## 📄 Halaman / Slide 14

Collections in Dart
Common Collections
List<T> — ordered collection
Set<T> — unique values
Map<K, V> — key-value pairs
Generics make collection types explicit.
• final menus = <String>['Nasi Goreng', 'Mie Ayam'];
• final tags = <String>{'food', 'campus'};
• final user = <String, dynamic>{'name': 'Alya', 'age': 20};
• Use loops and collection methods to process data.

| Collections in Dart |
| --- |
| Common Collections List<T> — ordered collection Set<T> — unique values Map<K, V> — key-value pairs Generics make collection types explicit. • final menus = <String>['Nasi Goreng', 'Mie Ayam']; • final tags = <String>{'food', 'campus'}; • final user = <String, dynamic>{'name': 'Alya', 'age': 20}; • Use loops and collection methods to process data. |
|  |

---

## 📄 Halaman / Slide 15

Functions
double calculateTotal(double price, int quantity) {
return price * quantity;
}
double discount(double total) => total * 0.10;
void main() {
final total = calculateTotal(15000, 2);
print(total);
}
Functions encapsulate reusable behavior. Dart also supports concise arrow syntax.

| Functions |
| --- |
| double calculateTotal(double price, int quantity) { return price * quantity; } double discount(double total) => total * 0.10; void main() { final total = calculateTotal(15000, 2); print(total); } Functions encapsulate reusable behavior. Dart also supports concise arrow syntax. |
|  |

---

## 📄 Halaman / Slide 16

Create a function called
calculateFinalPrice()
that receives:
- price
- quantity
Exercise
- discount percentage
The function should return the final price.
07/09/2026 18

| Exercise | Create a function called calculateFinalPrice() that receives: - price - quantity - discount percentage The function should return the final price. |
| --- | --- |
| 07/09/2026 | 18 |
|  |  |

---

## 📄 Halaman / Slide 17

From Functions to Objects
class MenuItem {
String name;
double price;
MenuItem(this.name, this.price);
double getPrice() => price;
}
• A function describes behavior.
• An object combines data and behavior.
• Classes define the structure and behavior of objects.
• This becomes important as Flutter applications grow beyond simple
screens.

| From Functions to Objects |
| --- |
| class MenuItem { String name; double price; MenuItem(this.name, this.price); double getPrice() => price; } • A function describes behavior. • An object combines data and behavior. • Classes define the structure and behavior of objects. • This becomes important as Flutter applications grow beyond simple screens. |
|  |

---

## 📄 Halaman / Slide 18

OOP Fundamentals in Dart
07/09/2026 20

|  |
| --- |
| OOP Fundamentals in Dart |
|  |
| 07/09/2026 20 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 18)
```dart
Class — blueprint for creating objects. Object — a of a class. n instance myCar1 brand: Toyota year. 2020 Class: Car (blueprint) - brand: String - year: int + start(): void + sto ): void Objects (instances) myCar2 brand: Honda year: 2021 Class: BankAccount Data (fields) - _balance: double class Car { String brand; int year; void start() { void stop ( ) { void main() { var myCar1 = Car(); myCar1. brand 'Toyota' ; myCar1. year = 202ø; var myCar2 = Car(); myCar2 . brand ' Honda' ; = 2021; myCar2. year class BankAccount { double _ balance = 0; // private void deposit (double amount) { / * void withdraw(double amount) { / * Encapsulaion — keep data and behavior together. Inheritance — create a new class based on an existing class. Polymorphism — different objects can respond to the same interface. Abstraction — expose what is needed while hiding unnecessary implementation details. Behavior (methods) + deposit(amount) + withdraw(amount) + getBalance() Motorcycle + ride() double getBa1ance() class Vehicle { void start() { void stop() { / * class Car extends Vehicle void drive() { void startVehic1e(Vehic1e v) _ balance ; Vehicle + start() + stop() Car + drive() Same method call, different behavior. vroom! Sapose interface (What) abstract class Shape ( double area(); brumm! Hide implementation detail (how) C lass Circ extends class Rectangle Shape double area() doubte v. start(); // works for any Vehicle // vroom! startVehic1e(Motorcyc1e ( ) ) ; // brumm! abstract class Shape { double area(); class Circle extends Shape { double area() { class Rectangle extends Sha e { double area() { / *
```

---

## 📄 Halaman / Slide 19

Class, Constructor & Methods
class Student {
final String name;
final String studentId;
Student(this.name, this.studentId);
void introduce() {
print('I am $name ($studentId)');
}
}
final student = Student('Alya', '231234');
student.introduce();

| Class, Constructor & Methods |
| --- |
| class Student { final String name; final String studentId; Student(this.name, this.studentId); void introduce() { print('I am $name ($studentId)'); } } final student = Student('Alya', '231234'); student.introduce(); |
|  |

---

## 📄 Halaman / Slide 20

• Create a MenuItem class with:
• name
• price
• a constructor
Exercise
• a method displayInfo()
Then create two MenuItem objects and
call displayInfo().
07/09/2026 22

| Exercise | • Create a MenuItem class with: • name • price • a constructor • a method displayInfo() Then create two MenuItem objects and call displayInfo(). |
| --- | --- |
| 07/09/2026 | 22 |
|  |  |

---

## 📄 Halaman / Slide 21

Why OOP Matters in Flutter
• Flutter applications are built from objects such as widgets and controllers.
• Application data can be represented as model classes.
• Classes help organize state, business logic, and reusable behavior.
• Good object design makes code easier to understand, test, and maintain.
• AI-generated code is easier to evaluate when you understand the objects and
relationships behind it.
07/09/2026 23

|  |
| --- |
| Why OOP Matters in Flutter |
| • Flutter applications are built from objects such as widgets and controllers. • Application data can be represented as model classes. • Classes help organize state, business logic, and reusable behavior. • Good object design makes code easier to understand, test, and maintain. • AI-generated code is easier to evaluate when you understand the objects and relationships behind it. |
| 07/09/2026 23 |
|  |

---

## 📄 Halaman / Slide 22

• Create a Dart program for a simple campus food menu.
• Create a MenuItem class with name, price, and category.
• Create at least three MenuItem objects.
• Store the objects in a collection.
Exercise
• Write a function to calculate the total price of selected
items.
• Add one business rule, such as a student discount.
• Run and test your program in DartPad.
Rule: Try to solve the problem yourself before using AI.
07/09/2026 24

| Exercise | • Create a Dart program for a simple campus food menu. • Create a MenuItem class with name, price, and category. • Create at least three MenuItem objects. • Store the objects in a collection. • Write a function to calculate the total price of selected items. • Add one business rule, such as a student discount. • Run and test your program in DartPad. Rule: Try to solve the problem yourself before using AI. |
| --- | --- |
| 07/09/2026 | 24 |
|  |  |

---

## 📄 Halaman / Slide 23

Now Ask AI to:
• Identify potential problems;
Exercise
• Explain parts of your code;
• Suggest improvements;
• Propose test cases.
07/09/2026 25

| Exercise | Now Ask AI to: • Identify potential problems; • Explain parts of your code; • Suggest improvements; • Propose test cases. |
| --- | --- |
| 07/09/2026 | 25 |
|  |  |

---

## 📄 Halaman / Slide 24

Before We Ask AI: Identify the Problem
• Do not start with: “Build me an app.”
• Start with a real user problem.
• Identify who experiences the problem.
• Understand what users currently do.
• Identify pain points, constraints, and desired outcomes.
• Only then define what the application should do.
07/09/2026 26

|  |
| --- |
| Before We Ask AI: Identify the Problem |
| • Do not start with: “Build me an app.” • Start with a real user problem. • Identify who experiences the problem. • Understand what users currently do. • Identify pain points, constraints, and desired outcomes. • Only then define what the application should do. |
| 07/09/2026 26 |
|  |

---

## 📄 Halaman / Slide 25

Problem Statement
07/09/2026 27

|  |
| --- |
| Problem Statement |
|  |
| 07/09/2026 27 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 25)
```text
WEAK "Students need a food app." Food App • Too vague • Does not explain the real issue • Hard to define the right solution STRONGER "Students often spend too much time deciding where to eat because campus food information is scattered across multiple sources and menus are not easy to compare." Cafeteria Notice Board - - Social Media Website • Specific and clear Explains the root cause / underlying issue • Guides us to the right solution direction Campus Food Q Search foad place Nasi Goreng s IS.DOO e
```

---

## 📄 Halaman / Slide 26

From Problem to Solution
• Problem — What is happening now?
• User — Who experiences it?
• Context — When and where does it happen?
• Pain Point — Why is it a problem?
• Goal — What outcome should improve?
• Solution — What could a mobile application do to help?
07/09/2026 28

|  |
| --- |
| From Problem to Solution |
| • Problem — What is happening now? • User — Who experiences it? • Context — When and where does it happen? • Pain Point — Why is it a problem? • Goal — What outcome should improve? • Solution — What could a mobile application do to help? |
| 07/09/2026 28 |
|  |

---

## 📄 Halaman / Slide 27

What Is a PRD?
• PRD stands for Product Requirements Document.
• A PRD describes what a product should achieve and what it should do.
• It provides a shared reference for developers, designers, and stakeholders.
• For this project, the PRD becomes an important input for design,
development, testing, and AI-assisted coding.
07/09/2026 29

|  |
| --- |
| What Is a PRD? |
| • PRD stands for Product Requirements Document. • A PRD describes what a product should achieve and what it should do. • It provides a shared reference for developers, designers, and stakeholders. • For this project, the PRD becomes an important input for design, development, testing, and AI-assisted coding. |
| 07/09/2026 29 |
|  |

---

## 📄 Halaman / Slide 28

A Simple PRD for Your Project
07/09/2026 30

|  |
| --- |
| A Simple PRD for Your Project |
|  |
| 07/09/2026 30 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 28)
```text
Problem & Users Problem Statement Students often spend too much time deciding where to eat because campus food information is scattered across multiple sources and menus are not easy to compare. Target Users University students (undergraduate & graduate) who eat on campus. User Needs / Pain Points • Need one place to find campus food information. • Want to compare menus, prices, and reviews easily. • Hard to know current promotions or availability. • Time-consuming to decide where to eat. Project Goal Build a mobile app that helps students discover, compare, and choose campus food quickly and easily. Success at a glance Students can find the right food, save time, and make better eating decisions on campus. oo oo Product Requirements Core Features / Functional Requirements • Browse cafeterias and menus • Search and filter food (by name, category, price, cafeteria) • View details: price, description, rating, location • Add to favorites • Submit and view reviews • View promotions / announcements User Flow (Example) Open App —9 Browse/Home Search/Filter -4 View Details Compare -4 Add to Favorites / Decide Feedback (Review) Data Requirements • Cafeteria data: name, location, open hours • Menu data: name, category, price, description, image, availability • Review data: rating, comment, user, timestamp • User data: profile, favorites Constraints & Assumptions • Internet connection is required. • Data is provided by campus / cafeteria management. • App supports Android first. Success Criteria • Students can find and compare food in less than 2 minutes. • At least 70% Of users find the information they need. • Average user rating 2 4.0 after first release.
```

---

## 📄 Halaman / Slide 29

Why PRD Before Coding?
• A clear PRD reduces ambiguity.
• It prevents the team from building unrelated features.
• It helps divide responsibilities among team members.
• It provides context for UI/UX design and technical decisions.
• It gives AI a better problem context than a one-line prompt.
• It becomes a reference during testing and code review.
07/09/2026 31

|  |
| --- |
| Why PRD Before Coding? |
| • A clear PRD reduces ambiguity. • It prevents the team from building unrelated features. • It helps divide responsibilities among team members. • It provides context for UI/UX design and technical decisions. • It gives AI a better problem context than a one-line prompt. • It becomes a reference during testing and code review. |
| 07/09/2026 31 |
|  |

---

## 📄 Halaman / Slide 30

Prompt Engineering for AI-Assisted Development
• Prompt engineering is the practice of designing instructions that help an AI system
produce a useful response.
• For software development, a good prompt provides enough context for the AI to
reason about the task.
• The goal is not simply to write a longer prompt.
• The goal is to provide the right context, constraints, expected output, and validation
criteria.
07/09/2026 32

|  |
| --- |
| Prompt Engineering for AI-Assisted Development |
| • Prompt engineering is the practice of designing instructions that help an AI system produce a useful response. • For software development, a good prompt provides enough context for the AI to reason about the task. • The goal is not simply to write a longer prompt. • The goal is to provide the right context, constraints, expected output, and validation criteria. |
| 07/09/2026 32 |
|  |

---

## 📄 Halaman / Slide 31

From Vague Prompt to Structured Prompt
07/09/2026 33

|  |
| --- |
| From Vague Prompt to Structured Prompt |
|  |
| 07/09/2026 33 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 31)
```text
VAGUE PROMPT "Make a Flutter food-ordering app." Little context Al does not know the background or purpose. Unclear users Al does not know who will use the app. Unclear scope Al does not know what features or limits to focus on. Unclear output Al does not know the format or level of detail you expect. vs o STRUCTURED PROMPT Context: project + target users Al understands the background and who the app is for. Task: specific problem/function Al knows exactly what you want it to do. Constraints: Flutter + Dart + scope Al works within the right technology and boundaries. Expected output: files, code, explanation Al provides the output in the format you need. Validation: edge cases + tests Al includes tests and handles important scenarios. Search food... All Flutter Files Rice Noodle Drink Dart Code Empty cart No results found Network error Scope defined Explanation Tests
```

---

## 📄 Halaman / Slide 32

A Practical Prompt Structure
Context
→ Problem / Goal
→ User & Use Case
→ Requirements
→ Constraints
→ Expected Output
→ Validation / Test Cases
Example:
"You are assisting with a Flutter project.
The target users are campus students...
Implement the menu filtering logic...
Use Dart null safety...
Explain the approach and provide test cases."

| A Practical Prompt Structure |
| --- |
| Context → Problem / Goal → User & Use Case → Requirements → Constraints → Expected Output → Validation / Test Cases Example: "You are assisting with a Flutter project. The target users are campus students... Implement the menu filtering logic... Use Dart null safety... Explain the approach and provide test cases." |
|  |

---

## 📄 Halaman / Slide 33

AI Should Not Replace the Developer
• AI can generate code, suggest solutions, explain concepts, and help debug.
• The developer decides whether the output fits the requirements.
• The developer must verify correctness, security, usability, and maintainability.
• A prompt is successful only when its output is useful—and verified.
• Remember the 5 questions from Module 1: What? Why? How? Risks? How to test?
07/09/2026 35

|  |
| --- |
| AI Should Not Replace the Developer |
| • AI can generate code, suggest solutions, explain concepts, and help debug. • The developer decides whether the output fits the requirements. • The developer must verify correctness, security, usability, and maintainability. • A prompt is successful only when its output is useful—and verified. • Remember the 5 questions from Module 1: What? Why? How? Risks? How to test? |
| 07/09/2026 35 |
|  |

---

## 📄 Halaman / Slide 34

Work directly on your project.
• Review your project problem
• What problem are you solving?
• Who experiences the problem?
• What is the main pain point?
Exercise
• Define your project requirements
• Define the project goal.
• Identify 4–6 core functional requirements.
• Define the main user flow.
• Create your initial PRD
07/09/2026 36

| Exercise | Work directly on your project. • Review your project problem • What problem are you solving? • Who experiences the problem? • What is the main pain point? • Define your project requirements • Define the project goal. • Identify 4–6 core functional requirements. • Define the main user flow. • Create your initial PRD |
| --- | --- |
| 07/09/2026 | 36 |
|  |  |

---

## 📄 Halaman / Slide 35

Recommended Learning Resources
Dart Overview: https://dart.dev/overview
Dart Language: https://dart.dev/language
Learn Dart: https://dart.dev/learn
DartPad: https://dartpad.dev/
07/09/2026 37

|  |
| --- |
| Recommended Learning Resources |
| Dart Overview: https://dart.dev/overview Dart Language: https://dart.dev/language Learn Dart: https://dart.dev/learn DartPad: https://dartpad.dev/ |
| 07/09/2026 37 |
|  |

---

## 📄 Halaman / Slide 36

Thank You

---
