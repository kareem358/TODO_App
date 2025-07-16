Simple To-Do List App in Flutter

A basic yet functional Flutter app to manage your daily tasks. Users can add, view, mark complete, and delete To-Do items — all within a clean and responsive interface.
Features
-  Add a new task with a title and description
-  Mark tasks as completed
-  Delete tasks from the list
-  Show/hide input form dynamically
-  UI designed using Flutter's built-in widgets
-  Clear feedback via `SnackBar` for empty input

📱 Screenshots
 

Tech Stack
Flutter
Dart
State Management setState()`UI Widgets: `TextFormField`, `ListView.builder`, `ElevatedButton`, `SnackBar`
Folder Structure
lib/
├── models/
│ └── todo_model.dart # Model class for ToDo items
├── widgets/
│ └── todo.dart # Custom widget to display a ToDo
├── screens/
│ └── home_screen.dart # Main screen with list & form
└── main.dart # App entry point
