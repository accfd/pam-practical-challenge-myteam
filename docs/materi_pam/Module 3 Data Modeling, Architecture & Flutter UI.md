# 📘 Module 3 Data Modeling, Architecture & Flutter UI

> **Sumber File:** `Module 3 Data Modeling, Architecture & Flutter UI.pdf`  
> **Mata Kuliah:** Pengembangan Aplikasi Mobile (Semester 5)  
> **Total Halaman:** 51 Halaman  

---

## 📄 Halaman / Slide 1

Mobile Application
Development
Module 3: Data Modeling, Architecture & Flutter UI

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
• Explain how project requirements are translated into data models.
• Design a simple data model using JSON Schema or ERD.
• Explain the role of Dart model classes in a Flutter application.
• Describe the basic separation of UI, data, and application logic.
• Explain Flutter's widget-based UI and Widget Tree.
• Apply basic layout constraints and responsive/adaptive UI concepts.
08/09/2026 2

|  |
| --- |
| Learning Objectives |
| • Explain how project requirements are translated into data models. • Design a simple data model using JSON Schema or ERD. • Explain the role of Dart model classes in a Flutter application. • Describe the basic separation of UI, data, and application logic. • Explain Flutter's widget-based UI and Widget Tree. • Apply basic layout constraints and responsive/adaptive UI concepts. |
| 08/09/2026 2 |
|  |

---

## 📄 Halaman / Slide 3

AGENDA
1. Review the Project Proposal / PRD
2. Data Modeling
3. Application Architecture
4. Flutter Fundamentals & Widgets
5. UI & Material Design
6. Widget Tree & Layout Constraints
7. Responsive & Adaptive UI
8. Preparation for Practical 1

---

## 📄 Halaman / Slide 4

“
“Simplicity is prerequisite for reliability”
- Edsger W. Dijkstra
“

---

## 📄 Halaman / Slide 5

PRD to Technical Design

---

## 📄 Halaman / Slide 6

From PRD to Technical Design
08/09/2026 6

|  |
| --- |
| From PRD to Technical Design |
|  |
| 08/09/2026 6 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 6)
```text
PRD tells us what the product should achieve. Requirements Understand the problem and define what to build. Technical design describes how the application can represent and implement those requirements. Data Identify and structure the data needed. User id name email • • • Architecture Design the structure of the application. Presentation Layer (IJI) Business Logic Layer (ViewModel / Controller) Data Layer (Models / Services / API) Choose architecture (e.g., MVVM) Define layers and responsibilities Plan data flow Apply clean code principles Design and implement the user interface. PRD o • Target users User needs Goals Features Constraints o o Post Comment Widgets Layout Navigation Responsive Ul • Needs / Pain points • Functional & Non-functional requirements • Success criteria • • Identify data entities Define relationships (ERD) Design data structure (e.g., JSON) Create data models (Dart classes) • • • Design IJI based on requirements Use Material Design Implement widget tree Handle layout constraints Ensure responsive/adaptive UI What to build How to build (from PRD) (technical design)
```

---

## 📄 Halaman / Slide 7

From PRD to Technical Design
08/09/2026 7

|  |
| --- |
| From PRD to Technical Design |
|  |
| 08/09/2026 7 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 7)
```text
Requirement What should the app do? Students can browse food menus available at campus cafeterias. Data What information is needed? Architecture How should the app be organized? Presentation Layer (UI) Screens, Widgets, User Interaction Business Logic Layer (ViewModeI / Controller) Handle state, fetch data, filtering, etc. Data Layer Models / Services / API Get menu and cafeteria data (from backend or local database) Key responsibilities • IJI: Display menus, handle user interaction. • Business Logic: Manage state, apply filters, coordinate data fetching. • Data: Provide menu and cafeteria data (e.g., from API or local storage). • Keep responsibilities separated. How will the user interact with it? Campus Food Menultem - id: String - name: String price: double category: String - image: String - cafeteriald: String N 1 Cafeteria - id: String - name: String - location: String - description: String Why this data? Rice I want to see what food is available on campus. o O Target User Students Related needs Many menu items belong to one cafeteria Noodles Nasi Goreng Cafeteria A Rp 15.000 Cafeteria Rp 13.000 Es Teh Manis Cafeteria C Rp 5.000 Ayam Geprek Cafeteria A Rp 18.000 Drinks o • See menus from different cafeterias • Filter by category (e.g., rice, noodles, drinks) • View food details (name, price, image) • Find out which cafeteria it belongs to • Menultem stores the food information displayed to users. cafeteriald links a menu to its cafeteria. Cafeteria stores information about each campus cafeteria. Hom e Main Ul components • AppBar • Search (IconButton) • Chip (category filter) • ListView Card / ListTile • • Image Text (name, cafeteria, price) BottomNavigationBar
```

---

## 📄 Halaman / Slide 8

Data Modeling

---

## 📄 Halaman / Slide 9

What Is Data Modeling?
Data modeling describes what information the application needs and how the
information is related.
• What entities exist?
• What attributes does each entity have?
• How are entities related?
• Which data is required or optional?
08/09/2026 9

|  |
| --- |
| What Is Data Modeling? |
| Data modeling describes what information the application needs and how the information is related. • What entities exist? • What attributes does each entity have? • How are entities related? • Which data is required or optional? |
| 08/09/2026 9 |
|  |

---

## 📄 Halaman / Slide 10

Example: Campus Food App Data
Possible entities:
Cafeteria
Cafeteria
- id
- name
MenuItem
- location
Review
User MenuItem
- id
- name
What information does each entity need? - price
- category
- cafeteriaId

| Example: Campus Food App Data |
| --- |
| Possible entities: Cafeteria Cafeteria - id - name MenuItem - location Review User MenuItem - id - name What information does each entity need? - price - category - cafeteriaId |
|  |

---

## 📄 Halaman / Slide 11

JSON Structure
• JSON makes the data structure explicit.
{
• It can be used as a bridge between
"id": "M001",
requirements and implementation. "name": "Nasi Goreng",
"price": 15000,
• The same structure can be represented
"category": "Rice",
by a Dart model.
"cafeteriaId": "C01"
}

| JSON Structure |
| --- |
| • JSON makes the data structure explicit. { • It can be used as a bridge between "id": "M001", requirements and implementation. "name": "Nasi Goreng", "price": 15000, • The same structure can be represented "category": "Rice", by a Dart model. "cafeteriaId": "C01" } |
|  |

---

## 📄 Halaman / Slide 12

From Data Model to Dart Model
class MenuItem {
final String id;
final String name;
final double price;
final String category;
MenuItem{
required this.id,
required this.name,
required this.price,
required this.category,
});
}

| From Data Model to Dart Model |
| --- |
| class MenuItem { final String id; final String name; final double price; final String category; MenuItem{ required this.id, required this.name, required this.price, required this.category, }); } |
|  |

---

## 📄 Halaman / Slide 13

Why Use Model Classes?

| Why Use Model Classes? |
| --- |
|  |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 13)
```dart
Represent application data with a clear structure. Model classes define the shape of your data explicitly. Without model class (JSON / Map<String, dynamic>) " id"• "MOOI" , "Nasi Goreng" " name "price • 15000, "category": "Rice" With model class (Dart) Make data easier to read, validate, and maintain. With a model class, each field has a specific type, so errors are easier to catch. Using Map<String, dynamic> menu data; Var price = var // What type is 'price'? // int? double? String? Using model class Menultem menu = ... ; double prrce = menu.prxce; // Type is clear and checked 9 • Easier to read • Easier to validate (type safety) • Easier to maintain Reduce dependence on loosely typed Map<String, dynamic> data. Map<String, dynamic> is flexible but can lead to runtime errors because the structure is not enforced. Loosely typed data Map<String, dynamic> menu = { "id": "Meel" "price": "fifteen thousand" , O No type checking Possible runtime errors Model class with typed fields class Menultem { final String id; final double price; e Strongly typed More reliable code Create a consistent contract between data and application logic. Model classes define a shared understanding of the data structure across the application (API, business logic, and IJI). API / Database (JSON) Model Class (e.g., Menuitem) class Menultem final String final String final double final String id; name ; price; category ; Business Logic ViewModel (Widgets) The structure is clear and self-documenting. Everyone uses the same structure, reducing confusion and miscommunication. Make Al-generated code easier to review because the expected structure is explicit. When the data structure is clearly defined, it is easier to evaluate, validate, and correct Al-generated code. Check if the fields match the expected model Verify the correct data types Identify missing or extra fields Easier and faster code review
```

---

## 📄 Halaman / Slide 14

Data Modeling
08/09/2026 14

|  |
| --- |
| Data Modeling |
|  |
| 08/09/2026 14 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 14)
```text
1. Scenario You are part of the development team for a Campus Library App. Read the requirement below carefully. Requirement "Students can search for books and check whether a book is available." What information does the application need to make this requirement work? Remember: Not all possible information is needed. Choose only the data that is relevant to this requirement. 2. Your Detective Tasks What entities do we need? List the main data entities (e.g., Book, Student, 1. 2. 3. Work in groups (3-5 members). Discuss and fill in the following. 8 Data Clues (Not all are needed!) Here are some possible pieces of information you can consider: What attributes does each entity need? List the important attributes for each entity. Book title • • Author • ISBN • Category • Publication year • Availability status Student ID • 3• Deliverable Student name • Borrowing date • Return date • Library / Location • Book cover image Fine amount • (others) Entity: Entity: How are the entities related? Describe the relationship between the entities (e.g., one-to-many). 1 (Optional) Represent one object in JSON Choose one entity and write an example of its JSON representation. " key" : "value" , Prepare a short summary (I slide or I page) with the following: Requirement (rewrite in your own words) e Entities (list) Attributes (for each entity) Relationships (with cardinality) (Optional) JSON example Goal Identify the right data based on the requirement, not just list all possible data.
```

---

## 📄 Halaman / Slide 15

Application Architecture

---

## 📄 Halaman / Slide 16

Application Architecture
• Architecture defines how the major parts of the application are organized.
• A simple mental model:
• UI → Application / Business Logic → Data
• The goal is separation of responsibilities, not simply creating many folders.
08/09/2026 16

|  |
| --- |
| Application Architecture |
| • Architecture defines how the major parts of the application are organized. • A simple mental model: • UI → Application / Business Logic → Data • The goal is separation of responsibilities, not simply creating many folders. |
| 08/09/2026 16 |
|  |

---

## 📄 Halaman / Slide 17

Application Architecture
08/09/2026 17

|  |
| --- |
| Application Architecture |
|  |
| 08/09/2026 17 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 17)
```text
MVC Model — View — Controller Separates IJI, input handling, and data. Controller handles user interaction and updates the model. MVVM Model — View — ViewModel ViewModel manages Ul-related state and coordinates actions between the View and Model. View MVP Model — View — Presenter Presenter handles the presentation logic and acts as a mediator between View and Model. View User input View Update Controller (Input & Logic) Read / Write User interaction (Lil) State updates ViewModeI (State & Logic) Read / Write data Model (Data) User actions (Lil) Update view Presenter (Logic) Read / Write data Model (Data) data Model (Data) When to use? • Simple to medium-sized apps • Easy to understand • Good for learning the concept Of separation Of concerns When to use? • Apps with more complex IJI and state management • Keeps IJI and business logic well separated • Popular in Flutter development When to use? • Apps with clear separation between IJI and logic • Useful for testing (Presenter can be tested independently) • Common in enterprise apps Layered Architecture Presentation — Business — Data Organizes the application into layers, each with a specific responsibility. Presentation Layer (IJI / Widgets) Business Logic Layer (Use cases / Services) Data Layer (Repositoities / APIs / DB) When to use? • Works well for most applications • Simple and easy to understand • Good starting point for larger projects Clean Architecture Domain — Data — Presentation Focuses on separation by dependency and keeps the core business logic independent of external details. Presentation Application (Use Cases) Domain (Business Logic) Data (External: API, DB, etc) When to use? • Medium to large applications • When long-term maintainability is important • Helps keep business logic independent from Ul and data sources
```

---

## 📄 Halaman / Slide 18

A Simple MVVM Mental Model
• View: displays the UI and receives user
interaction.
• ViewModel: manages UI-related state and
coordinates actions.
• Model: represents application data and
domain information.
• The exact implementation can vary; the
key idea is separation of responsibilities.

| A Simple MVVM Mental Model |
| --- |
| • View: displays the UI and receives user interaction. • ViewModel: manages UI-related state and coordinates actions. • Model: represents application data and domain information. • The exact implementation can vary; the key idea is separation of responsibilities. |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 18)
```text
User Interaction View Ul (Widgets) • Ul state Business logic Entities Repositories Data sources (API, DB, etc.) ViewModel Manages state and coordinates actions Model / Data Application data and domain information • Tap Type • Swipe • etc. • Displays IJI • Receives user interaction Holds IJI state Processes user input • Coordinates with Model • Notifies the View (e.g., using state management) Represents application data • Handles data access • Contains business/domain logic (if needed)
```

---

## 📄 Halaman / Slide 19

Clean Code: What Should We Look For?
• Clear names
• Small functions with focused responsibilities
• Avoid unnecessary duplication (DRY)
• Readable structure
• Separation of concerns
• Code that another developer can understand and modify
08/09/2026 19

|  |
| --- |
| Clean Code: What Should We Look For? |
| • Clear names • Small functions with focused responsibilities • Avoid unnecessary duplication (DRY) • Readable structure • Separation of concerns • Code that another developer can understand and modify |
| 08/09/2026 19 |
|  |

---

## 📄 Halaman / Slide 20

Exercise
08/09/2026 20

|  |
| --- |
| Exercise |
|  |
| 08/09/2026 20 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 20)
```dart
Refine Requirements Convert your project idea (Stage I) into key functional and data requirements. Example: Campus Food App • Students can browse cafeterias. "id". "MOI", • Students can view menu items. • Students can leave reviews. • Students can manage their profile. Design the Data Model Identify the main entities, their attributes, and relationships. (Use ERD or JSON Schema) Example: ERD (simplified) Define JSON Structure Represent the data structure using JSON (for API or local data). Example: Menultem "name": "Nasi Goreng" , "price" . 15000 , "category": "Rice" , "cafeteriald" Example: Review "id": "ROOI" , " rating" : 5, "comment": "Great food!" "userld" : "menultemld": "MOOI" Create Initial Dart Model(s) Define Dart model classes based on your data structure. Example: Menultem model class Menultem final String final String final double final String final String Plan the Application Architecture Choose an architecture (e.g., MVVM) and sketch the main components. Example: MWM (simplified) View (IJI / Widgets) User id (PK) name email Cafeteria id (PK) name location Review id (PK) rating comment userld (FK) menultemld (FK) Menultem id (PK) name price category cafeteriald (FK) id; name; pnce; category ; cafeteriald; User interaction State updates Menultem ( { required required required required required this. id, this. name , this. price; this. category , this. cafeteriald, ViewModeI (State & Logic) Get/Update Data gattata Model / Repository (API / Database)
```

---

## 📄 Halaman / Slide 21

Flutter Fundamentals

---

## 📄 Halaman / Slide 22

Flutter Fundamentals
08/09/2026 22

|  |
| --- |
| Flutter Fundamentals |
|  |
| 08/09/2026 22 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 22)
```dart
Flutter builds interfaces from widgets. In Flutter, the IJI is constructed using widgets. Widgets are the building blocks everything on the screen. Everything visible on the screen is composed from widgets. Buttons, text, images, icons, layouts, spacing, and even the entire page are widgets. Widgets describe what the UI should look like. Each widget defines its appearance and behavior based on the properties (parameters) you provide. Widgets can be combined to create more complex interfaces. Simple widgets are nested together in a tree structure (widget tree) to build rich and complex Uls. Example: A Simple Flutter UI Here is a simple app built using widgets. Travel App Beautiful Destinations Explore amazing places around the world. Popular 9 Nearby Get Started Saved Ul Code (simplified) Scaffold( appear: Appear( title: Text( 'Travel App'), body: Column( children: [ Image. asset( images/mountain. jpg' ) , padding ( padding: Edgelnsets. all (16) , child: Column( crossAx isA1ignment : CrossAxisA1ignment. start, children: [ Text( 'Beautiful Destinations' , TextStyle(fontSize: 20, style: fontWeight: FontWeight.b01d)) Text( Explore amazing places around the world. • ) , Row( mainAxisA1 i gnment : MainAxisAlignment. spaceEven ly , children: [ _bui1dFeature(lcons. star, 'Popular'), _buiIdFeature(lcons. location_on, ftucc.f). _bui1dFeature(Icons. favorite, hearty) , SizedBox(heiqht: 16), ElevatedButton( onPressed: ( ) (i, child: Text( •Get Started' Widget Tree Widgets are nested to form a tree. MaterialApp Scaffold AppBar Text ('Travel App•) Column (body) Image padding Column Text ('Beautiful Destinations') Text ('Explore amazing places2) Icon + Text ('Popular') Icon + Text ('Nearby') Icon Text (•saved•) ElevatedButton ('Get Started)
```

---

## 📄 Halaman / Slide 23

Common Flutter Widgets
08/09/2026 23

|  |
| --- |
| Common Flutter Widgets |
|  |
| 08/09/2026 23 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 23)
```text
Scaffold Basic screen structure that provides the overall Icon (Icons. more_vert) , ListTi1e(tit1e: Text('ltem 1')) layout for a page. Scaffold( appBar: AppBar( title: Text('My App body: Center( child: Text( ' Hello' Icon Displays icons from Material Icons or custom icons. My App Hello, Flutter! Container AppBar Application bar displayed at the top of the screen. AppBar ( title: Text( 'Home'), actions: [ Icon( Icons. search) , Home Text Displays text content with various styles. Text( Hello, Flutter! • , style: TextSty1e( fontSize: 20, fontWeight: FontWeight. bold, color: Colors. black, Hello, Flutter! This is a text widget. Image Displays images from assets, files, or network. Image. network( ' https://example.com/image.jpg' , width: 120, height: 120, fit: BoxFit.cover, Row / Column Arranges children horizontally (Row) or vertically (Column). ListView Displays scrollable lists Button Widgets Handle user actions and Icon( Icons. favorite , size : 48, color: Colors. red, favorite A versatile widget for layout, styling, and decoration. Container( padding: Edgelnsets. , decoration: BoxDecoration( color: Colors.blue. shadeløa, borderRadius: BorderRadius.circu1ar(8) , child: Text('A styled cmtainer'), A styled container Row (horizontal) ROW( children: [ Icon(lcons. home) Icon(lcons. search) , Icon(lcons .person) , Column (vertical) Column( children: [ Icon(lcons.hone) , Icon(lcons. search) , Icon(lcons.person) , of widgets. ListView( children: [ ListTi1e(title: Text ( ListTile(tit1e. • Text( Item 1 Item 2 Item 3 'Item •Item 3')) interactions. ElevatedButton OutlinedButton TextButton home settings person ElevatedButton (primary action) OutlinedButton (secondary action) TextButton (minimal style) FloatingAction Button (quick action)
```

---

## 📄 Halaman / Slide 24

Common Flutter Widgets
08/09/2026 24

|  |
| --- |
| Common Flutter Widgets |
|  |
| 08/09/2026 24 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 24)
```dart
Widget Bank 1. 2. 3. 4. • Instructions Observe each numbered area in the app UI. Guess the Flutter widget(s) that are used. Some parts may use more than one widget. Discuss with your group and write your answers. Discussion Questions Which widget is the root of this screen? How would you create a scrollable list of places? What widget is suitable for the "All / Popular / Recent" section? Can you think of alternative widgets for any part? .41 My App *Hello, Flutter! Let's build something amazing. Home All Favorite Popular Settings Beautiful Lake A calm and peaceful place Green Forest Nature always heals Sunny Beach Good vibes only Scaffold AppBar Text Icon Image Container Row Column ListView Card NavigationBar SafeArea BottomNavigationBar IconButton TextButton ElevatedButton OutlinedButton TextField Chip TabBar ListTile Divider Padding (others) 10
```

---

## 📄 Halaman / Slide 25

Common Flutter Widgets
08/09/2026 25

|  |
| --- |
| Common Flutter Widgets |
|  |
| 08/09/2026 25 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 25)
```text
AppBar Top application bar with title and menu button. Text Displays text content ("Hello, Flutter!"). BottomNavigationBar (or NavigationBar) Navigation menu at the bottom (Home, Favorite, Settings). Card + ListTile A card containing a place item (with image, title, subtitle, and trailing icon). ListTile (in a ListView) Another place item in the list. 9:41 My App -v Hello, Flutter! Let's build something amazing. Home Favorite Popular Beautiful Lake Settings Recent IconButton A clickable icon (search). Image Displays an image (e.g., using Image.asset or Image.network). Chip Selectable filter options (All / Popular / Recent). ListView A scrollable list of place items (contains multiple ListTlle widgets). Scaffold Root widget of the screen (contains AppBar, body, etc.). I. 2. 3. 4. A calm and peaceful place Green Forest Nature always heals Sunny Beach Good vibes only Which widget is the root of this screen? Scaffold How would you create a scrollable list of places? ListView What widget is suitable for the "All / Popular / Recent" section? Chip (Alternatively, SegmentedButton) Can you think of alternative widgets for any part? • • • • • BottomNavigationBar —+ NavigationBar ListTile -+ Row + Image + Text + Icon Card -+ Container Chip -+ SegmentedButton and many others!
```

---

## 📄 Halaman / Slide 26

Common Flutter Widgets
08/09/2026 26

|  |
| --- |
| Common Flutter Widgets |
|  |
| 08/09/2026 26 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 26)
```text
Scaffold Basic screen structure. Scaffold ( appBar: AppBar(tit1e: Text( 'Home' body: . AppBar Application bar at the top. AppBa r ( title: Text( 'My App'), actions: [Icon (Icons . search)] , Text Displays text content. Text( 'Hello, Flutter! , style: TextSty1e(fontSize: 20) Image Displays images. Image . asset( ' assets/ images/cat. jpg width: 10@, height: lee , My App Hello, Flutter! Let's build something amazing. Home Favorite Popular Beautiful Lake Settings Recent Icon Displays icons. Icon( Icons . favorite, size: 24, color: Colors. red, Container A layout and styling wrapper. Container( padding: Edgelnsets . all (16) , decoration: BoxDecoration( color: Colors.grey. shade100, borderRadius: BorderRadius.circu1ar(12) , child: . Row / Column Arrange children horizontally or vertically. A calm and peaceful place Green Forest Nature always heals Sunny Beach Good vibes only Row (horizontal) aaa ListView Displays scrollable lists Of widgets. ListView( children: [ ListTi1e( title: Text('ltem V), subtitle: Text( 'Description'), A styled container Column (vertical) Button Widgets Handle user actions. ElevatedButton OutlinedButton TextButton
```

---

## 📄 Halaman / Slide 27

Stateless vs Stateful Widgets
08/09/2026 27

|  |
| --- |
| Stateless vs Stateful Widgets |
|  |
| 08/09/2026 27 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 27)
```dart
StatelessWidget UI depends on inputs and does not manage mutable local state. Does not hold or change state Renders the same output for the same input Used for static Ul elements Simpler and lighter class GreetingText extends StatelessWidget { final String name; const required this .name}); @override Widget build(BuiIdContext context) { return Text( 'Hello, $name! ' style: TextStyle(fontSize: 20) , 9:41' My App Hello, Flutter! This text is the same every time (no state). StatefulWidget UI can change because it manages mutable state. Holds and manages mutable state IJI can change over time Used for interactive IJI elements Slightly more complex My App Count: O class CounterButton extends StatefulWidget { const @override createState() _CounterButtonState( ) ; class _CounterButtonState extends State<CounterButton> { int _count = e; Override Widget build(BuildContext context) { return ElevatedButton( onPressed: ( ) { _ count-t. ; child: Text( 'Count: $_count•), Count: 1 The IJI changes when the button is pressed (state).
```

---

## 📄 Halaman / Slide 28

Widget Tree

| Widget Tree |
| --- |
|  |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 28)
```dart
9:41 Widget Tree O o Scaffold Column O Text O Row Travel App O Scaffold Column O O Scaffold Provides the basic visual structure of the screen (e.g., AppBar, body). Column Arranges children vertically (from top to bottom). Explore Beautiful Places Learn More Text Image Row Icon TextButton O o Displays a text string. Image Displays an image. Arranges children horizontally (from left to right). Icon Displays an icon. TextButton A tappable button with text. Travel App Explore Beautiful Places Learn More Tip: When debugging Ul, ask: "Where is this widget located in the tree?"
```

---

## 📄 Halaman / Slide 29

The Build Method

| The Build Method |
| --- |
|  |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 29)
```dart
Example Code class MyHomePage extends StatelessWidget { const key}) ; @override Widget build (BuildContext context) return Scaffold( appBar: AppBar( title: const Text( 'My App'), body: const Center( child: Text( 'Hello, Flutter! ' , style: TextStyIe(fontSize: build() returns a widget This widget describes the IJI for this screen. What Happens? Flutter calls build() When the widget is first shown (or when it needs to be rebuilt). You describe the UI Inside build(), you return a widget tree (e.g., Scaffold, AppBar, Text). Flutter builds the widget tree Flutter reads the widgets and renders them on the screen. The UI appears The screen is displayed as defined in build(). Result on Screen My App Hello, Flutter! 20), Widget Tree (simplified) MyHomePage (StatelessWidget) Scaffold AppBar ('My App') Center Text ('Hello, Flutter!')
```

---

## 📄 Halaman / Slide 30

UI & Material Design

---

## 📄 Halaman / Slide 31

UI & Material Design
• Material Design provides a consistent visual language and component
system.
• Use appropriate spacing, typography, hierarchy, color, and components.
• A good UI is not only visually attractive—it should support the user's task.
• Start from requirements and user flow, not from random widgets.
08/09/2026 31

|  |
| --- |
| UI & Material Design |
| • Material Design provides a consistent visual language and component system. • Use appropriate spacing, typography, hierarchy, color, and components. • A good UI is not only visually attractive—it should support the user's task. • Start from requirements and user flow, not from random widgets. |
| 08/09/2026 31 |
|  |

---

## 📄 Halaman / Slide 32

UI & Material Design
Material Design is a design system.
It provides:
• Color
• Typography
• Shape
• Elevation
• Spacing
• Components
• Interaction patterns
• Navigation
Flutter implements Material Design through Material widgets.
08/09/2026 32

|  |
| --- |
| UI & Material Design |
| Material Design is a design system. It provides: • Color • Typography • Shape • Elevation • Spacing • Components • Interaction patterns • Navigation Flutter implements Material Design through Material widgets. |
| 08/09/2026 32 |
|  |

---

## 📄 Halaman / Slide 33

UI & Material Design
08/09/2026 33

|  |
| --- |
| UI & Material Design |
|  |
| 08/09/2026 33 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 33)
```text
What is Material 3? Material 3 (Material You) is Google's latest design system. It provides guidelines, components, and design principles to create modern, consistent, and accessible user experiences. Personalized Adapts to user preferences (e.g., dynamic color). Consistent A unified visual language across platforms. Accessible Designed for everyone. Flexible Works across different devices and screen sizes. The Building Blocks of Material 3 Color Dynamic color and tonal palettes Lists Typography Readable and expressive type Shape Softer, more expressive shapes Elevation Depth and visual hierarchy UI Components A rich set of ready-to-use components. Spacing Consistent spacing system Text fields And more Example: Material 3 Ul A simple screen using Material 3 components. 9:41 O Good Food Brighter Days Discover great food on campus Q Search for food, cafeteria... All popular Near Me Healthy Cards Chips Navigation Dialogs Nasi Goreng Main Cafeteria Rp 15.000 Mie Ayam East Cafeteria Rp 13.000 Flutter Material Widgets Material 3 is implemented in Flutter through Material widgets (e.g., FilledButton, Card, NavigationBar, TextField, etc.).
```

---

## 📄 Halaman / Slide 34

UI & Material Design
08/09/2026 34

|  |
| --- |
| UI & Material Design |
|  |
| 08/09/2026 34 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 34)
```dart
O Color Consistent color scheme for brand identity and to indicate importance (e.g., primary color for main actions). O Shape Rounded corners create a friendly and modern 100k. O Spacing Consistent spacing makes the Ul clean and easy to read. 16 px Interaction patterns Users can tap, search, select, and get feedback (e.g., button press, selected chip, notification badge). 9:41 Campus Food Good Food, Better Day Q Search for food, drink, or cafeteria... Rice Noodles Snacks Drin Typography Clear text hierarchy (title, subtitle, body, label) helps users quickly understand the information. Campus Food Good Food, Better Day Nasi Goreng Favorite on campus Elevation Cards have a subtle shadow to create visual hierarchy and indicate that they are above the background. O Components Material components such as SearchBar, Chip, Card, Button, Navigationdar, etc., provide ready-to-use, consistent Ul elements. Material Design -+ Flutter Widgets Popular Today Nasi Goreng Favorite on campus RP 15.000 Mie Ayam Near You Home Fresh and tasty Rp 12.000 Ayam Geprek Spicy and delicious RP 18.000 See All 4.8 Add 4.6 + Add See All 4.7 Add Q O Order Design Element Example in Ul Color Typography Shape Elevation Spacing Components Interaction patterns Navigation Flutter Widget ColorScheme, ThemeData Text, TextTheme Card, ShapeBorder Card (elevation) Padding, SizedBox SearchBar, Card, Button, Chip, NavigationBar, etc. onPressed, GestureDetector, Feedback widgets NavigationBar, Navigator (later) + Add Rice O Navigation Bottom navigation helps users move between main sections of the app.
```

---

## 📄 Halaman / Slide 35

UI & Material Design
08/09/2026 35

|  |
| --- |
| UI & Material Design |
|  |
| 08/09/2026 35 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 35)
```text
Color Use Material 3 cotor scheme. ThemeData ( colorSchene: ColorScheme. fromSeed( Typography Text( 'Nasi Goreng' , Primary Secondary Surface ThemeData seedcolor : Colors. green, brightness : Brightness. light, useMateria13: true, 9:41 Campus Food Good Food, Better Day Search for food, drink, or cafeteria... All Rice Noodles Snacks Shape Rounded corners for modern look. Popular Today Drinks see All Add Add 47 Add o profite Use text styles from Material 3. Nasi Goreng Favorite on campus Rp 15.000 Text / TextTheme Elevation Add subtle shadow for hierarchy. style: Theme. of (context) . textTheme. tleLarge , Text( 'Favorite on campus' , style: Theme. of(context) . textTheme. bodyMedium, Text('Rp 15.030', style: Theme. of(context) . textTheme. titLeMedium?. copywith( color: Colors.green, Card( elevation : 16 px Spacing Card( shape: RoundedRectangleaorder( borderRadius: BorderRadius.circuIar(16) , child : Nasi Goreng Favorite on campus Rp 15.000 Mie Ayam Fresh and tasty Rp 12.000 Ayam Geprek Spicy and delicious Rp 18.000 Order Components Use ready-to-use Material widgets. child : FilterChip( Card (elevation) Use consistent spacing. Padding( child; Interaction patterns Handle user interaction (tap, select, feedback). Card + ShapeBorder padding: const Edgelnsets.a11(16), Padding / SizedBox All Rice Navigation Use Material navigation components. 0 Profile Noodles NavigationBar( selectedlndex: g, destinations: const ( label: const Text( 'All'), selected: true, onselected: (value) { FilterChip NavigationBar + Add OnPressed: { // Add to order child: const Text('+ Add'), FilledButton (onpressed) NavigationDestination(icon: Icon(lcons.home), Label: •Home'), Icon(lcons.restaurant), label: 'Nenu'), Navigationtestimtion(icon: •order'), NavigationDestination(icon: Icon(lcons.person), label: 'Profile'), onDestinationSeIected: (index) { }
```

---

## 📄 Halaman / Slide 36

Layout Constraints

---

## 📄 Halaman / Slide 37

Layout Constraints: Flutter's Mental Model

| Layout Constraints: Flutter's Mental Model |
| --- |
|  |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 37)
```dart
A core Flutter rule Flutter uses a constraints-based layout system. Constraints go down Sizes go up Parent sets position. Parent gives constraints to child. Child chooses a size. Parent determines where the child is placed. A parent gives a child constraints. Constraints define the minimum and maximum size a child can use. The child chooses a size within those constraints. The child cannot be larger or smaller than the given constraints. The parent determines where the child is placed. The parent decides the child's position (e.g., top-left, centered, with padding, etc.). Example: Container Text Parent Widget (e.g., Column, Row, Container) Parent's constraints (e.g., max width & height) I. Constraints go down Parent gives constraints to the child. Child Widget (e.g., Text, Image, Button) Child chooses a size (within the constraints) 2. Sizes go up Child reports its size to the parent. Parent determines position Parent uses the child's size to decide where to place the child. Container (parent) max width: 300 Text (child) "Hello Flutter!" max height: 200 : Key Takeaway o Parent gives constraints The Container tells the Text: "You can be at most 300 px wide and 200 px high." Child chooses a size The Text measures its content and decides its size (e.g., 120 x 40 px), which is within the constraints. O Parent determines position The Container decides where the Text is placed (e.g., centered, top-left, with padding, etc.). • • • • Constraints go down, sizes go up. A parent gives constraints to its children. A child chooses a size within those constraints. The parent determines where the child is placed. Understanding this mental model helps you debug layout issues and build flexible, responsive Uls.
```

---

## 📄 Halaman / Slide 38

Common Layout Problems
08/09/2026 38

|  |
| --- |
| Common Layout Problems |
|  |
| 08/09/2026 38 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 38)
```text
Overflowing content Content is larger than the available space. Unbounded height or width A widget is placed in a parent that does not provide a finite size. Unexpected widget size The widget size is different from what you expect due to constraints or parent widgets. Problem This is a very long text that does not fit in the available space and will overflow if do not handle it properly in the layout. A RenderFlex overflowed by 45 pixels on the bottorn. Fix This is a very long text that does not fit in the available space and will overflow if we do not handle it properly in the.. Problem Vertical viemport was given unbounded height. Fix SizedBox( height: 300, child: ListView(...), Problem Button Smaller than expected Fix Button use constraints (e.g., SizedBox, Expanded) Incorrect use of Expanded / Flexible Using Expanded/Flexible in the wrong place (e.g., inside a widget that gives unbounded constraints). Hard-coded dimensions that fail on smaller screens Fixed width/height can break the layout on different screen sizes. Problem Expanded( child: Incorrect use Of ParentDataWidget. Expanded widgets rmust be placed inside Flex (Row, Column, or Flex). Fix Expanded( child: ... ) Problem Fixed width: 400 O Looks good on large screens, but overflows on smaller screens. Fix use relative sizing (e.g., MediaQuery, LayoutBuilder) Key Takeaway When a layout breaks, inspect the constraints— not only the widget." Understand parent constraints Check widget sizes and alignment e Use flexible layouts (Expanded, Flexible, MediaQuery) for different screen sizes Think in constraints, not just in widgets.
```

---

## 📄 Halaman / Slide 39

Responsive & Adaptive UI

---

## 📄 Halaman / Slide 40

Responsive vs Adaptive UI
08/09/2026 40

|  |
| --- |
| Responsive vs Adaptive UI |
|  |
| 08/09/2026 40 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 40)
```text
Responsive UI The layout adapts to different available screen sizes. e Same design, flexibly adjusts to the screen size e Uses flexible layouts (e.g., Row, Column, Expanded, MediaQuery) e Elements resize, reflow, or wrap based on available space Adaptive Ul The design may use different layouts or interactions for different environments. May use different layouts, navigation, or interactions Optimized for the platform or device type (e.g., mobile, tablet, desktop, foldable) Provides the best user experience for each environment A TravelApp 4 Discover BeautifulPßces Mobile (360 px) TravelApp Discove Beautiful Places—s Explore. Plan. Go. A TravelApp Discover Beautiful Places Explore. Plan. GO. Flights Large screen (1200 px) TravelAp Discover Beautiful•Places Explore. Plan. Go. TmelApp Horne Tips TravelApp Q a Hotels Etivities Tablet (768 px) Discover Beautiful Places bplore_ Plam GO Tablet Side navigation s.„ed Discover Beautiful Places Explore. Plan. GO. Desktop Mobile Bottom navigation Top navigation + more content
```

---

## 📄 Halaman / Slide 41

Responsive vs Adaptive UI
08/09/2026 41

|  |
| --- |
| Responsive vs Adaptive UI |
|  |
| 08/09/2026 41 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 41)
```dart
Food Menu q Mobile (360 px) 2 columns Food Menu Food Menu Nas < 6ee FoodApp Good Food Better Day Mobile Bottom navigation Profile Food App Good Food Better Day Tablet FoodApp Good Food Better Day Discover deliciousneals around campus Desktop Top navigation (NavigationBar) Different Ul structure mrlle Mie Rp 12.000 Tablet (768 px) 3 columns Sota Rp14,ooo Desktop (1200 px) 4 columns Same Ul component (GridView), but the number Of columns and size adjust automatically based on screen width. item)) Side navigation (NavigationRail) Responsive Ul — Same structure, flexible layout // Product grid that adapts to available width class FoodGrid extends StatelessWidget Qoverride Widget build (BuildContext context) { return LayoutBuiIder( builder: (context, constraints) { int crossAxisCount constraints.maxWidth // mobile: 2 columns constranns.maxWidth < 1824 Adaptive Ul — Different layout for each screen size // Choose a different layout based on screen width class FoodApp extends StatelessWidget { @override Widget build (Buildcontext context) { return LayoutBui1der( builder: (context, constraints) { if (constraints. maxwidth < 6ee) { return const Mobilescaffold(); else If (constraints.maxWidth < return const TabletScaffold(); else return const DesktopScaffold() ; 1ø24) is used for each screen size (e.g., bottom navigation, side navigation, top navigation). // tablet: 3 columns : 4; // desktop: 4 columns return GridView.count( crossAXisCount: crossAxisC0unt , childAspectRatio: e. 75, mainAxisSpacing: 16, crossAxisSpacing: 16, children: menultems. MenuCard(item le 12 14 16
```

---

## 📄 Halaman / Slide 42

AI-Assisted UI Development

---

## 📄 Halaman / Slide 43

AI-Assisted UI Development
• AI can help convert a UI description or design into Flutter code.
• Give AI enough context: screen purpose, components, constraints, and expected
behavior.
• Review the generated widget tree and layout logic.
• Run the code, test different screen sizes, and fix issues.
• The developer remains responsible for the final implementation.
08/09/2026 43

|  |
| --- |
| AI-Assisted UI Development |
| • AI can help convert a UI description or design into Flutter code. • Give AI enough context: screen purpose, components, constraints, and expected behavior. • Review the generated widget tree and layout logic. • Run the code, test different screen sizes, and fix issues. • The developer remains responsible for the final implementation. |
| 08/09/2026 43 |
|  |

---

## 📄 Halaman / Slide 44

From UI Description to Flutter Code
08/09/2026 44

|  |
| --- |
| From UI Description to Flutter Code |
|  |
| 08/09/2026 44 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 44)
```dart
Example Prompt A focused prompt with enough context for a single screen. "Create a Flutter Ul for a campus food app. Build a food list screen with: - AppBar with the title "Campus Food" - Search bar - Category chips: All, Rice, Noodles, Snacks - A list of food cards (image, name, price, rating, and an 'Add' button) Use Material 3 widgets, a green color scheme, and sample data only. Make the layout responsive." Tips: • Be clear about the screen purpose. • List the main components. • Mention design preferences and constraints. • Specify what is not needed (e.g., no backend). Generated UI (Example Result) A Flutter Ul generated from the prompt. Campus Food Search cafe, Nasi Goreng Main Cafeteria Rp 15.000 Mie Ayam (89) Rp 12.000 Rp 18Æ00 ode, Mobile (360 px) Campus Food g Order profile Nasi Rp 12.0m Mie Ayam 47 (99) 12000 Ayam 4.6170) Rp 180m äää Soto Ayam Main Ca (92) Rp 16.000 Tablet / Desktop (2 768 px) Mie 4.4 (60) Rp nooo Prone Generated Code (Simplified) A snippet of the Flutter code for the screen. dart class FoodListScreen extends StatelessWidget { const key)); @override Widget build(Bui1dContext context) { return Scaffold( appear: Appear( title: const Text( 'Campus Food • ) , actions: IconButton( icon: const Icon (Icons. search), onPressed: ( ) O, body: Column( children: ( const SearchBar( hintText; • Search food, cafe, or menu.. , const CategoryChips() , const Expended( child: FoodGridOrList() , bottomNavigationBar: const App80ttomNavBar(),
```

---

## 📄 Halaman / Slide 45

AI Coding is Iterative
08/09/2026 45

|  |
| --- |
| AI Coding is Iterative |
|  |
| 08/09/2026 45 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 45)
```dart
O Prompt Give a clear instruction with enough context. Example prompt: "Create a Flutter Ul for a campus food app. The screen should have an AppBar with the title 'Campus Food', a search bar, category chips (All, Rice, Noodles, Snacks), a list of food cards (image, name, price, rating, and an 'Add' button), and a bottom navigation bar with Home, Menu, Order, and Profile. Use Material 3, a green color scheme, and make the layout responsive." Generate Al provides code/solution. Initial result (snippet): class FoodListScreen extends StatelessWidget { @override Widget build(Bui1dContext context) { return Scaffold( appBar: Appear( title: Text( 'Campus Food'), body: Column( children: SearchBar(.-.), // more widgets Review Check the code and understand it. What to review? Run & Test Run the app and test on different devices. Initial result (mobile): Campus Food Cafeteria Ayam Contee Ayam 8 Fix Adjust the code based on issues. Example issues: Ul overflows on small screens. Spacing is not consistent. Images look too large. Category chips don't scroll. Colors don't follow Material 3. Navigation bar is not responsive for tablet. Refine Improve the IJI/UX and code quality. Refined result (tablet): e e Does the code match the requirements? Are the widgets suitable (Material 3)? Is the layout structure correct? Are there any unnecessary widgets or complexity? Do you understand how it works? Campus Food Menu Q Search Rico 1 s.cm 1 Mie Rp 1 2000 Rp '6. OCX'
```

---

## 📄 Halaman / Slide 46

From AI Chat to AI Coding Assistant
08/09/2026 46

|  |
| --- |
| From AI Chat to AI Coding Assistant |
|  |
| 08/09/2026 46 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 46)
```dart
Al Chat (Ask Mode) Get answers and code, then apply them yourself. AI Coding Assistant (Agent Mode) Works directly with your project using tools and plugins. 0 ChatGPT Create a Flutter Ul for a campus food app. The screen should have an AppBar with the title "Campus Food", a search bar, category ghips (All, Rice, with image, name, price, and an Add button. Use Material 3 and sample data only. Here is the Flutter code: class FoodListScreen extends Statelessuidget ( "Soget build(BuiIdContext CMtext) ( return Scaffold( appBar: Appear( title: canst Food•), Paste to your IDE and run 9 rnü'_dart S mtx*ls Widgets 12 Wbspecyaml 12 13 class FcodListScreen ewer ride Widget build(3ui1dCcv ft?turn Scaffold( appear: AppBar( title: const Tek' Copy code Both use prompts! You still write natural language instructions. EXPLORER v campus_food v lib models screens food-fist-screen.dart home_screen.dart widgets main.dart pubspec.yaml Copilot (Agent) Add a search feature to the food list. Keep the existing Material 3 design and don't change the navigation. Reading project files... Analyzing code... Updating Running analyzer... No issues found! O Ive added the search feature. You can run the app to see tip changes. Ask or give a task... Ask anything... e Easyto use e Works in any browser or device e Good for learning, quick questions, and small tasks Run the app No direct access to your project You need to copy-paste Code Doesn't automatically check your errors Limited context (only what you provide) Can access and work with your project (via tools/plugins) Can read, modify, and create files Can use Flutter tools (analyzer, test runner, etc.) e Speeds up development workflow Requires plugin/extension setup (e.g. VS Code, Cursor, Claude Code) Might need initial configuration (API key, permissions) Still needs your guidance and review Works best with supported tools
```

---

## 📄 Halaman / Slide 47

From Figma to Flutter

---

## 📄 Halaman / Slide 48

From Figma to Flutter
08/09/2026 48

|  |
| --- |
| From Figma to Flutter |
|  |
| 08/09/2026 48 |
|  |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 48)
```dart
Understand the screen and user goal. What is this screen for? Who will use it? What action should they take? Plan Your Next Trip Oiscover beautifu I øiaces the Popular Destinations Goal: Help users find travel destinations. Identify the major UI sections. Break the design into main sections. Plan Your Next Trip beautiful places the Q AppBar (top bar) Herosection (title search) Content section (list) r —s Bottom navigation Map sections to widgets. Choose appropriate Flutter widgets for each section. AppBar AppBar Title & subtitle Text, Column Search bar -i TextField Destination card -+ Card, Image, Text, Row Bottom navigation BottomNavigationBar Build the Widget Tree. Organize widgets into a tree structure. Scaffold (Column) Hero Section (Column) Search Bar (TextField) Destination List (ListView) Bottom Navigation (BottomNavigationBar) Apply layout constraints and styling. Use layout widgets, constraints, and styles to match the design. Scaffold ( app8ar: Appear ( Teyt('Trave1App•), body: Column( children: [ Paddinq( padding: Edgelnsets.aII(26), child: Text( •plan Your Next Trip', style: TertStyIe( fontSize: 28. fonthight: FontWe.ight. inputDecoration( hintText: 'Search destination... prefixlcon: Icon(lcons.search), Expanded ( child: ListVfew( children: cards itenS: G' • Test responsive behavior. Check on different screen sizes and orientations. Review and refine the Al-generated code. Check, clean up, and improve the code. Next Mobile (360 x 800) Next Trip Tablet (768 * 1024) p Ian Your Next Trip Landscape (800 x 360) Try multiple screen sizes and orientations. o Check for correctness Improve readability Refactor if needed Ensure good practice and performance Test the user flow Add your own improvements Al can generate code, but you make it production ready.
```

---

## 📄 Halaman / Slide 49

Preparation for Practical 1
Before the practical session, each team should have:
• PRD
• A basic data model (JSON Schema / ERD)
• Initial Dart model(s)
• A simple architecture sketch
• UI design / Figma reference
• A clear list of screens to implement
08/09/2026 49

|  |
| --- |
| Preparation for Practical 1 |
| Before the practical session, each team should have: • PRD • A basic data model (JSON Schema / ERD) • Initial Dart model(s) • A simple architecture sketch • UI design / Figma reference • A clear list of screens to implement |
| 08/09/2026 49 |
|  |

---

## 📄 Halaman / Slide 50

Key Takeaways
• PRD → tells us what the product needs to achieve.
• Data Model → defines what information the app needs.
• Architecture → organizes responsibilities.
• Widgets → build the Flutter UI.
• Widget Tree + Constraints → explain how the UI is laid out.
• Responsive/Adaptive UI → helps the app work across different screens.
• AI assists development; the developer reviews and validates the result.
08/09/2026 50

|  |
| --- |
| Key Takeaways |
| • PRD → tells us what the product needs to achieve. • Data Model → defines what information the app needs. • Architecture → organizes responsibilities. • Widgets → build the Flutter UI. • Widget Tree + Constraints → explain how the UI is laid out. • Responsive/Adaptive UI → helps the app work across different screens. • AI assists development; the developer reviews and validates the result. |
| 08/09/2026 50 |
|  |

---

## 📄 Halaman / Slide 51

Thank You

---
