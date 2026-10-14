# 📘 Module 4 User Interaction, State & Navigation

> **Sumber File:** `Module 4 User Interaction, State & Navigation.pdf`  
> **Mata Kuliah:** Pengembangan Aplikasi Mobile (Semester 5)  
> **Total Halaman:** 38 Halaman  

---

## 📄 Halaman / Slide 1

Mobile Application
Development
Module 4: User Interaction, State & Navigation

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
• Implement user input and interaction using Flutter event handlers.
• Manage simple interactive state using StatefulWidget and setState().
• Build validated forms and handle common edge cases.
• Represent loading, success, and error states in the UI.
• Design application flow and navigate between multiple screens.
• Use navigation stack, named routes, and pass data between screens.
• Use AI assistance to implement and refine interactive features while
reviewing the result.

|  |
| --- |
| Learning Objectives |
| • Implement user input and interaction using Flutter event handlers. • Manage simple interactive state using StatefulWidget and setState(). • Build validated forms and handle common edge cases. • Represent loading, success, and error states in the UI. • Design application flow and navigate between multiple screens. • Use navigation stack, named routes, and pass data between screens. • Use AI assistance to implement and refine interactive features while reviewing the result. |
| 02/10/2026 2 |
|  |

---

## 📄 Halaman / Slide 3

AGENDA
1. Input & State
2. Forms & Edge Cases
3. Navigation
4. Core idea: a real app responds to users, manages
changing state, handles failure, and moves through a
coherent flow.

---

## 📄 Halaman / Slide 4

“
“Don’t make me think!”
- Steve Krug, Don’t Make Me Think: A Common Sense Approach to Web Usability
“

---

## 📄 Halaman / Slide 5

Interaction & State

---

## 📄 Halaman / Slide 6

User Interaction in Flutter

|  |
| --- |
| User Interaction in Flutter |
|  |
| 02/10/2026 6 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 6)
```dart
BUTTON onPressed Submit • Add • Save Add to Cart TEXT FIELD onChanged Input changes Search food... Q Nasi Goreng Q Bakso Q Mie Ayam TextFieId( onchanged: (value) { // handle input x GESTURE onTap Select • Open Nasi Goreng Indonesian fried rice Rp 15.000 ElevatedButton( onPressed: ( ) { // handle action child: Text( Add to select Cart') decoration : hint Text : InputDecoration( 'Search food... ', GestureDetector( OnTap: ( ) { // navigate or child: USER ACTION User taps, types, or selects EVENT HANDLER onPressed / onChanged / onTap is triggered APP LOGIC Process the input, update state, perform action SWITCH / CHECKBOX onChanged Toggle value Only show available items I agree to the terms and conditions Switch( value: isAvai1ableOnIy, onChanged: (value) { setState(() { isAvailableOnly value; D; Ul MAY CHANGE Flutter rebuilds and shows a visible response
```

---

## 📄 Halaman / Slide 7

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 7)
```dart
Input Logic Input is processing user intent—not just collecting text. EXAMPLE: SEARCH INPUT Typical input flow 1 3 10 11 12 final controller = TextEditingContr011er() ; 1 Q User enters a value Nasi Gorengl 2 App reads the value 3 Check or transform it 4 void searchFood() { = controller. text. trim() ; final query // You can validate, transform, or call if (query .isEmpty) { // handle empty input API return ; // process the print( ' Search: final query = controller.text .trim(); query = "Nasi Goreng" • • • • Trim whitespace Validate (not empty) Apply business logic (e.g. min length) query $query ooonoai z x CA bnm@ sear ch Perform an action Search for "Nasi Goreng" call API / Filter data 5 U I reflects the result q Nasi Goreng Food Drink Snacks Nasi Goreng Special Nasi Goreng Aya m 22 OOO Nasi Goreng 22.000 Think ahead What if the input is empty, invalid, unexpected, or repeated? Should we show an error message? Should we disable the action button? How do we handle special characters or very long input? What happens if the user searches many times in a row?
```

---

## 📄 Halaman / Slide 8

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 8)
```dart
TextEditingController Use a controller when the application needs access to the current text value. Dart = TextEditingContr011er() ; What it gives you final nameContr011er // Read current input 6 7 10 11 final = nameControIIer. text. trim(); name // When the widget is removed Override void dispose() { nameControIIer. dispose() ; super .dispose() ; Important Name John Doel Email john@example.com Save I. User types The text field updates as the user types. 2. Read the value Use controller.text to get the current input. 3. Use in app logic Validate, save, or process the input. When to use? You need to read the input value 11 Access to current text Read the value anytime using controller.text Programmatic control Set, clear, or modify the text from code Centralized input handling Useful for forms and more complex logic Remember to dispose Call dispose() when the controller is no longer needed Controllers should be disposed when they are no longer needed. You need to set or clear the text programmatically You are building a form or more complex input logic
```

---

## 📄 Halaman / Slide 9

State & Interactive UI

|  |
| --- |
| State & Interactive UI |
|  |
| 02/10/2026 9 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 9)
```text
Initial state 1 Selected category: All Food Categories User taps Tap "Rice" category Food Categories oo 00 New state 3 Selected category: Rice Food Categories 00 00 UI updates The list shows rice dishes Food Categories 00 00 All Rice Noodles Drinks Rice Mie Ayam Chicker, Noodles Drinks Rice Noodles Drinks Rice Noodles Drinks Nasi Goreng Indonesian fried rice Rp 15.000 Chicken noodles Rp 12.000 Nasi Goreng Indonesian fried rice Rp 15.000 Nasi Uduk Coconut rice Rp 13.000 Nasi Goreng Indonesian fried rice Rp 15.000 Nasi Uduk Coconut rice Rp 13.000
```

---

## 📄 Halaman / Slide 10

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 10)
```dart
StatefulWidget and setState() State is changing data; setState() tells Flutter that the Ul needs to rebuild. Dart Food Categories Food Categories selectedlndex = O; int void selectCategory(int index) setState(() { selectedlndex = index; Keep it simple All Drinks 00 oo All RiQq Noodles Rice Noodles Nasi Goreng Indonesian fried rice Rp 15.000 Nasi Uduk Coconut rice Rp 13.000 Drinks Three things to understand State = data that changes Example: selectedlndex setState() = announces the change Tells Flutter to rebuild the IJI. build() = describes the updated Ul IJI is rebuilt based on the new state. At this stage, focus on local interactive state before introducing state-management packages.
```

---

## 📄 Halaman / Slide 11

State Flow: Event → State → UI

|  |
| --- |
| State Flow: Event → State → UI |
|  |
| 02/10/2026 11 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 11)
```dart
EVENT Tap / Type / Select Add to Cart 1 Nasi Goreng Indonesian fried rice Rp 15.000 Example STATE CHANGE Update value void increment() { setState(() { quantity = quantity 1 State before: 2 State after: 1; REBUILD Flutter rebuilds Flutter rebuilds the widget tree Flutter rebuilds the affected widget subtree based on the new state. NEW Ul User sees state Add to Cart 2 Nasi Goreng Indonesian fried rice Rp 15.000 Quantity updated! Tap "Add" quantity changes card updates total changes.
```

---

## 📄 Halaman / Slide 12

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 12)
```text
Interactive UI Example A small feature is enough to demonstrate the full Event State Ul loop. 1 BEFORE • Selected category: All • All category chip is active • List shows all items Food Categories USER ACTION • Tap "Rice" • onTap / onPressed fires • selectedCategory changes Food Categories AFTER • Selected category: Rice • Rice chip is active • List reflects new state Food Categories 00 oo Rice 6 Noodles Drinks 00 oo 6 Noodles Rice 6 Noodles Drinks Rice I Drinks Nasi Goreng Indonesian fried rice Rp 15.000 Mie Ayam Chicken noodles Rp 12.000 Key takeaway A simple interaction shows how Event State IJI works together. Nasi Goreng Indonesian fried rice Rp 15.000 Nasi Uduk Coconut rice Rp 13.000
```

---

## 📄 Halaman / Slide 13

Forms & Robust Interaction

---

## 📄 Halaman / Slide 14

Forms in Flutter

|  |
| --- |
| Forms in Flutter |
|  |
| 02/10/2026 14 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 14)
```text
INPUT FIELDS User enters data Name Andi Pratama Email andi@mail.com 20 Submit VALIDATE Check input and show feedback Name o Andi Pratama Email E andi@mail Please enter a valid email address Age 20 Submit 0 PROCESS Handle the submission Submitting... Please wait a moment SHOW RESULT Display success or error Form Submitted! Thank you, Andi Pratama. Your data has been saved. Back to Home Common Flutter building blocks Form — groups the fields and validation o TextFormFieId — provides input plus validator and feedback
```

---

## 📄 Halaman / Slide 15

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 15)
```text
Form Structure A clear structure makes validation and submission easier to reason about. Create Account Fill in your information to continue. Name Andi Pratama Email * andi@mail.com Password * Create Account Form TextFormField (Name) @ validator TextFormFieId (Email) @ validator A TextFormField U (Password) @ validator Submit Button (validate process) Think in one task 2 3 4 What is the user trying to submit? Which fields are required? What makes the input valid? What happens after validation?
```

---

## 📄 Halaman / Slide 16

Form Validation with GlobalKey

|  |
| --- |
| Form Validation with GlobalKey |
|  |
| 02/10/2026 16 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 16)
```dart
Example Code Name validator() Valid Form key: _formKey Email validator() Submit Button onPressed() _formKey.currentState!.validate() Run all validators Flutter Password validator() 1 2 3 4 5 6 7 8 9 le 11 12 12 13 14 15 17 18 18 19 20 Invalid x Show error messages on each field final _formKey = ; @override Widget build(Bui1dContext context) { return Form( key: _formKey, child: Column( children: [ TextFormFie1d( decoration: InputDecoration(1abe1Text: 'Name ' ) , validator: (value) { if (value null I I value. trim() .isEmpty) { return 'Name is required' ; return null; // valid ElevatedButton( onPressed: ( ) { if (_formKey.currentState! . validate()) { // Process form data child: const Text( ' Submit' ) , Process form data (e.g. save, navigate) Key Point Use GlobalKey<FormState> to run all field validators when the user taps the submit button.
```

---

## 📄 Halaman / Slide 17

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 17)
```dart
Form Validation Validation checks whether input follows application rules. TextFo rmFie1d( validator: (value) { if (value null 11 value. trim() .isEmpty) { Dart Invalid input Email * andi Enter a valid email Valid input Email * andi@mail.com Looks good! O return 'Email is required' ; if (!value.contains('@')) { ' Enter a valid email' ; return return null; Key takeaway Result Valid Validator returns null Invalid Validator returns an error message Validation rules Based on application logic— not visual appearance. Use validators to enforce rules and provide helpful feedback to users.
```

---

## 📄 Halaman / Slide 18

Validation: Think in Rules

| Validation: Think in Rules |
| --- |
|  |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 18)
```text
REQUIRED Name is not empty FORMAT Email follows expected format RANGE Age / quantity is allowed CONSISTENCY Password = confirmation Name * Enter your name Name is required Name * Andi Pratama Looks good! O Email * andi@mail Enter a valid email address o BUSINESS RULE Quantity stock O Age -5 Age must be between O and 120 Age 20 Looks good! Password * Confirm Password * Passwords do not match Confirm Password * Looks good! Quantity 15 O Email * andi@mail.com Looks good! e Only 10 items available Stock: 10 Quantity 5 Looks good! Stock: 10 Design question What can go wrong even if the user follows the screen as intended?
```

---

## 📄 Halaman / Slide 19

Edge Cases

| Edge Cases |
| --- |
|  |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 19)
```text
Name * Enter your name Name is required User leaves the field blank and tries to submit. DON'T CRASH Handle errors gracefully expected Email * andi@mail Enter a valid email address User enters data in the wrong format (e.g. missing excessive input Bio Flutter is a very powerful framework that allows developers to build... 250 / 100 Maximum 100 characters User enters text that exceeds the allowed limit. DON'T FREEZE Keep the app responsive repeated action Submitting... Submit User taps the submit button multiple times. DON'T CONFUSE Show clear, helpful messages MISSING / FAILURE Missing data or service failure Failed to submit Please check your internet connection and try again. Try Again Required data is missing or the server/network fails. RECOVER GRACEFULLY Let users try again
```

---

## 📄 Halaman / Slide 20

Loading, Success & Error

| Loading, Success & Error |
| --- |
|  |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 20)
```text
IDLE Email E andi@mail.com Submit IDLE Email E andi Enter a valid email address Submit Key takeaway LOADING Submitting... Please wait a moment LOADING O Submitting... Please wait a moment SUCCESS Success! Your data has been saved. Go to Home ERROR Failed to submit Please check your connection and try again. Try Again Example Submit form process result (success) Example Submit form process result (error) • Show clear error message • Let users try again • Don't lose their input Always give feedback for every state: loading, success, and error.
```

---

## 📄 Halaman / Slide 21

State-Driven UI

| State-Driven UI |
| --- |
|  |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 21)
```text
• LOADING Show progress and keep users informed. Saving data... Please wait a moment. O Do not close this page. Show progress Prevent duplicate actions Tell the user something is happening SUCCESS Confirm the result and guide the next step. Data saved! Your changes have been successfully submitted. View Details Add Another • Show updated data • Confirm the result Offer the next action ERROR Explain what happened and offer a way to recover. Failed to save There was a problem with your connection. Please try again. Try Again Back to Edit Explain what happened Offer recovery Preserve useful input when possible
```

---

## 📄 Halaman / Slide 22

Complete Form Flow

| Complete Form Flow |
| --- |
|  |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 22)
```text
Input User fills in the form. Create Account Andi E andi@mail.com Submit Key Point • Validation is a gate. If input is invalid, do not proceed to loading or API call. • Show clear error messages on each field. • After the user fixes the input, they can submit again. Submit User taps the submit button. Submit 4 if Validate Run all validators using _ formKey. (_formKey . currentState ! . validate()) { // valid else { // show errors Try again Valid Loading Process the data (e.g. call API). Creating account... Please wait Success Show success message and next action. Account created! Welcome, Andi! Go to Home User Corrects Input Fix the input and submit again. Next Action Navigate to the next screen (if needed). Home Welcome, Andi! Let's explore delicious food Menu Favorites Catt Invalid Show Error Display validation error messages. Create Account E and enter a en*il address o Tips after fixing the input Create Account Andi Submit • Use to run all validators. • Provide clear and specific error messages. Keep the user's input when showing errors. • Show loading, success, and error states to give proper feedback.
```

---

## 📄 Halaman / Slide 23

AI-Assisted Form Development

| AI-Assisted Form Development |
| --- |
|  |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 23)
```dart
1 CONTEXT Provide clear context for the form. 2 PROMPT Ask Al to generate the implementation. 3 GENERATE Get form LJI, validators, and state handling. 4 REVIEW Verify rules, read the code, run and test. Check validation rules Test invalid input Review the generated code Adjust to project standards 5 Form: User Registration • Fields: name, email, password • Validation rules: - name (required) - email (valid format) - password (min 8 chars) Expected states: loading, success, error • Use Material 3 • Target: mobile app (Flutter) Clear requirements lead to better results. Key takeaways Create a Flutter form for user registration with validation, loading state, success and error handling. Use Material 3. Al Assistant Here is the Flutter code class RegisterForm extends StatefulWidget { @override Widget build(BuiIdContext context) { return • Give context: screen purpose, fields, validation rules, expected states, Material 3 constraints. Create Account Full Name Andi Pratama Email andi@mail.com Password Create Account Ask Al to generate a form, validators, loading/error handling, or explain the widget tree. Test case o Empty name Name is required O Invalid email Enter a valid email Form submitted successfully Review: verify rules, read the code, run it, test invalid input, and fix errors. RUN / TEST Integrate, run, and test in the app. Account Created! Welcome, Andi Pratama. Go to Home Failed to create account Please check your connection and try again. Try Again • Donot let Al invent business rules without verification.
```

---

## 📄 Halaman / Slide 24

Navigation

---

## 📄 Halaman / Slide 25

Application Flow

|  |
| --- |
| Application Flow |
|  |
| 02/10/2026 25 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 25)
```text
LOGIN User signs in to access the app. Welcome Back Sign in to continue Email Password Log In Forgot passwo rd? Don't have an account? Sign up HOME 2 Landing page after login. Hello, Andi Pratama Q Search something... Menu Settings 3 MENU User browses and selects an item. Menu 4 DETAIL User reviews item details and adds to order. C) Q Search menu... Food Drinks Snack Nasi Goreng Rp 25.000 Mie Ayam Rp 20.000 Es Teh Manis Ayam Geprek Rp 22.000 5 Total Nasi Goreng Rp 25.000 Nasi goreng dengan bumbu spesial, disajikan dengan telur dan kerupuk. Add to Order ORDER User reviews the order and checks out. Your Order Nasi Goreng Rp 25.000 Es Teh Manis Rp 5000 Rp 35.000 Place Order
```

---

## 📄 Halaman / Slide 26

Navigation Stack

|  |
| --- |
| Navigation Stack |
|  |
| 02/10/2026 26 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 26)
```text
HOME Home Welcome Find your favorite food Nasi Goreng Mie Ayam Es Teh Manis Navigation Stack (bottom top) push ( ) MENU Menu Q Search menu... Food Drinks Nasi Goreng Rp 25.000 Mie Ayam Rp 20.000 Es Teh Manis RP 5.000 Snack push ( ) O Menu DETAIL Nasi Goreng Rp 25.000 Nasi goreng dengan bumbu spesial, disajikan dengan telur dan kerupuk. Jumlah Tambah ke Keranjang Detail Menu Home Two basic operations push ( ) Adds a new route to the stack. pop ( ) Removes the top route. • The top route is the current screen. Mental model Navigate forward = push ( ) Go back = pop( ) Key takeaway A navigation stack helps you reason about navigation before writing routing code and exposes missing transitions.
```

---

## 📄 Halaman / Slide 27

Push & Pop in Flutter

|  |
| --- |
| Push & Pop in Flutter |
|  |
| 02/10/2026 27 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 27)
```dart
1 Push Adds a new route to the stack. Navigator. push( context , MaterialPageRoute( builder: (context) const DetailScreen() , Removes the top route. Navigator. pop (context) ; HomeScreen Nasi Goreng push() Mie Ayam Rp 20.000 ES Teh Manis Rp S.OOO orders profile DetailScreen Detail Nasi Goreng Rp 25.000 Nasi goreng dengan bumbu spesial. disajikan dengan tetur dan Tambah ke Keranjang HomeScreen Home Nasi Goreng Rp 25.000 Mie Ayam Rp 20.000 Es Teh Manis Rp 5.000 ord«s Route Stack (after push) DetailScreen (top / current) HomeScreen A new route is added. The previous screen stays in the stack. Route Stack (after pop) HomeScreen (top / current) DetailScreen (removed) The top route is removed. The previous screen becomes visible. What happens? push: current screen stays in the stack; the new screen becomes visible. pop: the current screen is removed; the previous screen becomes visible. Always think in terms of the stack. Mental model Navigate forward = push() Go back = pop() DetailScreen Detail Nasi Goreng RP 25.000 Nasi goreng dengan bumbu disaiikan n kerupuk. Tambah ke Keranjang pop() push() DetailScreen (top) HomeScreen LoginScreen The top route is the current screen. pop()
```

---

## 📄 Halaman / Slide 28

Passing Data Between Screens

|  |
| --- |
| Passing Data Between Screens |
|  |
| 02/10/2026 28 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 28)
```text
9:41 MENU LIST User sees a list of menu items. Menu USER SELECTS 2 User taps a menu item. 9:41 Menu Q Search menu... Nasi Goreng RP 25.000 Mie Ayam Rp 20.000 Es Teh Manis Rp 5.000 PASS DATA 3 Pass the selected menu ID to the next screen. Navigator . push ( context , MaterialPageRoute( builder: (context) DetailScreen ( menuld: item. id, Detail Screen (receives menuld) 4 DETAIL SCREEN Receives and shows the correct data. 9:41 Detail Nasi Goreng Rp 25.000 0 Q Search menu... Nasi Goreng Rp 25.000 Mie Ayam Rp 20.000 Es Teh Manis Rp 5.000 Data flow Menu List (item with id) User Selects (menuld = MOOI) Navigator . push( DetailSc reen (menuld : MOOI)) Nasi goreng dengan bumbu spesial, disajikan dengan telur dan kerupuk. Tambah ke Keranjang Design question What data does the next screen actually need?
```

---

## 📄 Halaman / Slide 29

Passing and Returning Data

|  |
| --- |
| Passing and Returning Data |
|  |
| 02/10/2026 29 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 29)
```dart
Send data to the next screen Pass the selected item (e.g. menu) to the detail screen. Return a result to the previous screen After the user performs an action (e.g. add to cart), return a result. Flutter Menu List Nasi Goreng Indonesian fried rice Rp 15.000 Mie Ayam Chicken noodle Rp 12.000 Bakso Meatball soup Rp 13.000 Key Takeaway // Open detail screen and // pass the selected menu final added = await Navigator. ( context , MaterialPageRoute( builder: (context) DetailScreen( menuld: item.id, menuName: item. name, price: item.price, O The next screen receives the menu data through its constructor. Menu Detail Nasi Goreng Indonesian fried rice Rp 15.000 Add to Cart Flutter // After the item is added to cart, // return the result to the previous screen ElevatedButton( onPressed: ( ) { // Add item to cart (e.g. via APT) // Return true to indicate success Navigator .pop(context, true) ; child: const Text( 'Add to Cart'), Return a meaningful result (e.g. true/false), not just an ID, so the previous screen knows what happened. Use Navigator.pop(context, result) to return a value (e.g. true/false or a model) to the previous screen. The previous screen can then react (e.g. refresh the cart, show a message, etc.).
```

---

## 📄 Halaman / Slide 30

Named Routes

|  |
| --- |
| Named Routes |
|  |
| 02/10/2026 30 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 30)
```dart
1 Define named routes Centralize your routes in MaterialApp. 2 Navigate using the name Use Navigator.pushNamed() to open a route. 3 Push a named route Call Navigator.pushNamed() with the route name. MaterialApp( routes: { (context) const HomeScreen() , ' /menu' : (context) const MenuScreen() , ' /profile': (context) => const ProfileScreen() , Defined routes HomeScreen Hello, Andi Pratama Q Search someth,irw E Navigator .pushNamed ('/menu•) MenuScreen Q Search menu. , o Nasi Goreng Rp2sooo Ro 20.000 Manis Rps,ooo Route: /menu MenuScreen is shown. ProfileScreen Profile Andi pratama andi@examp'e.com Edit Prone Order HistMy Settings Out Route: /profile ProfileScreen is shown. Navigator. pushNamed ( context , ' /menu' , Navigate to another route o / menu /profile HomeScreen MenuScreen ProfileScreen Route: / User is on HomeScreen. • • • Why use them? Route configuration is centralized. Destinations are easier to identify and manage. Cleaner and more maintainable code. Makes navigation consistent across the app.
```

---

## 📄 Halaman / Slide 31

Named Routes & Passing Arguments

|  |
| --- |
| Named Routes & Passing Arguments |
|  |
| 02/10/2026 31 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 31)
```dart
1 Define the route Register the route and specify the destination screen. 2 Navigate with arguments Send the data using Navigator.pushNamed(). 3 Read the arguments Retrieve the data on the destination screen. 4 MaterialApp( routes: { (context) const HomeScreen(), (context) /menu const MenuScreen(), ' /detail' : (context) const DetailScreen() , Navigator. pushNamed ( context , /detail' , arguments: { ' menuld' : 'MOOI', ' menuName': ' Nasi 'price' : 15000 , Goreng' , You can pass any object, usually a Map<String, dynamic> for multiple values. class DetailScreen extends StatelessWidget { const DetailScreen( {super. key}) ; Override Widget build (Buildcontext context) { final args = ModalRoute . of (context) settings. arguments as Map<String, dynamic>?; final menuld = 'menuld' J; final menuName args?C 'menuName• final price = return Scaffold( appBar: AppBar(tit1e: Text(menuNatne ?? 'Detail' ) ) // Use the arguments O ASSUmption This screen expects the route to receive the correct argurnent structure (e.g. a Map With menuld, price). Always handle null or unexpected types when needed. Resulting screen The screen receives and uses the passed data. Menu Detail Nasi Goreng Indonesian fried rice Rp 15.000 Add toCart
```

---

## 📄 Halaman / Slide 32

Navigation Architecture

|  |
| --- |
| Navigation Architecture |
|  |
| 02/10/2026 32 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 32)
```text
SCATTERED NAVIGATION x Each screen decides everything. Each screen decides everything o Flow becomes harder to reason about e Data passing can become inconsistent DetailScreen Detail Nasi Goreng Rp 25.000 Nasi dan k_ Tambah ke Keraniang ROUTE DESIGN Define named routes and required arguments. CENTRALIZED / PLANNED Routes are defined deliberately. Routes are defined deliberately User journey is designed first Data contracts are easier to verify Route Configuration (in one place) MaterialApp( routes: { . ( _ ) const HomeScreen(), • /menu•: (_) const MenuScreen(), • /menu/detail•: ( _ ) const DetailScreen(), ' 'profile': ( _ ) const ProfileScreen(), Predictable navigation flow HomeScreen Hello. Andi pratama APP FLOW MAP Map user journe•rs and key screens. MenuScreen Nasi Rp 25000 Mie Ayam Rp 20.000 Es Teh Manis Rp SOOO 2 o Home Menu 3 4 SCREEN TRANSITIONS Implement navigation between screens. DATA PASSING Send and receive data (e.g. menuld, quantity). Detail Nasi Rp 2S.ooo IMPLEMENT Test the full flow and verify data contracts.
```

---

## 📄 Halaman / Slide 33

Navigation Architecture: Keep Flow Understandable

|  |
| --- |
| Navigation Architecture: Keep Flow Understandable |
|  |
| 02/10/2026 33 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 33)
```dart
1 USER JOURNEY What is the user trying to do? 2 APP FLOW What screen comes next? Q Sea Nasi Goreng Rp 25.000 Mie Ayam Rp 20.000 Es Teh Manis 3 ROUTE How is the destination identified? Navigator. pushNamed ( context , ' /menu/detail ' , 4 DATA CONTRACT What must be passed? 5 BACK / RESULT What comes back? Detail I want to see details of a menu item. menuld : Optional data • quantity: 2 'MOOI ' o O arguments : ' menuld ' : 'MOOI', Return result (e.g. added to cart) Navigator. pop( context , true, • source: 'menu' • other flags.. Specify the required and optional arguments. Nasi Goreng Rp 25.000 Tambah ke Keranjang Understand the user's goal and context. Goal Identify the next screen in the flow. Define the route (name or path). Define what (if anything) is returned to the previous screen. The flow should be predictable to both the user and the developer.
```

---

## 📄 Halaman / Slide 34

AI-Assisted Navigation Development

|  |
| --- |
| AI-Assisted Navigation Development |
|  |
| 02/10/2026 34 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 34)
```text
1 APP FLOW Start with a clear flow. Home 1 Menu 1 Detail Order 2 PROMPT Describe your requirements. Create Flutter navigation for this flow. - Home Menu -o Detail -t Order - Pass menuld and quantity - Use named routes - Ensure proper back behavior Got it! I'll generate the route configuration, navigation calls, arguments, and explanations. Prompt with screens, transitions, data passed, routing constraints, and expected back behavior. 3 GENERATE Get code and explanations. Generated by Al MaterialApp ( routes: { (context) const HomeScreen() , /menu•: (context) const MenuScreen() , (context) /detail ' : const DetailScreen(), ' 'order': (context) const OrderScreen() , Generate route configuration, navigation calls, arguments, and explanations. 4 REVIEW Compare with your flow. Routes match the flow Correct arguments Proper transitions Back behavior is correct Code is clean and readable 5 Hello. TEST Validate in the app. < Me Rp 25. Quant i Nasi Goreng Place Order Define screens, transitions, data passed, and expected back behavior. Goal Review: compare the generated result with the App Flow Map. Test: push/pop, back navigation, arguments, and edge cases. The flow should be predictable to both the user and the developer.
```

---

## 📄 Halaman / Slide 35

Integration & Practical

---

## 📄 Halaman / Slide 36

Practical Challenge — Build an Interactive Feature

|  |
| --- |
| Practical Challenge — Build an Interactive Feature |
|  |
| 02/10/2026 36 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 36)
```text
1 INPUT / EVENT What enters or gets tapped? My Tasks 2 STATE What changes? Add Task 3 9:41 VALIDATION What is invalid? Add Task 4 FEEDBACK Loading / success / error? Task added! 0K 5 9:41 NAVIGATION Where next? What data? My Tasks Buy groceries o Read a book o Go for a run + Add Task' User taps the "Add Task" button. Deliverable Buy coffee Add Open an input screen and update the form state as the user types. Enter a task... A Task cannot be empty Add Show an error if the task is empty (or invalid). Show a success message (or error message if it fails). o Buy groceries o Read a book o Go for a run Buy coffee + Add Task Navigate back to the list, and display the new task. A working feature + a short explanation of its event, state, validation, feedback, and navigation.
```

---

## 📄 Halaman / Slide 37

Key Takeaways
The concepts in Module 4 form one connected application behavior model.
INTERACTION STATE VALIDATION EDGE CASES
User actions generate Changing state can Input follows application Design for what can go
events. change the UI. rules. wrong.
FEEDBACK NAVIGATION AI CORE FLOWS
Loading / success / error App Flow + Stack + Data + Prompt clearly, review, Event → State → UI
are UI states. Routes. run, test, own the result. Validate → Handle → Feedback
Flow → Route → Data

|  |
| --- |
|  |
| Key Takeaways The concepts in Module 4 form one connected application behavior model. INTERACTION STATE VALIDATION EDGE CASES User actions generate Changing state can Input follows application Design for what can go events. change the UI. rules. wrong. FEEDBACK NAVIGATION AI CORE FLOWS Loading / success / error App Flow + Stack + Data + Prompt clearly, review, Event → State → UI are UI states. Routes. run, test, own the result. Validate → Handle → Feedback Flow → Route → Data |
|  |

---

## 📄 Halaman / Slide 38

Thank You

---
