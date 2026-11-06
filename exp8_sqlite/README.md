flutter create sqlite_app
cd sqlite_app


Open the pubspec.yaml file located in the root of your project directory. Scroll down to the dependencies: block and add the sqflite and path packages exactly as shown:
yaml
dependencies:
  flutter:
    sdk: flutter
  
  # Add suitable SQLite packages here
  sqflite: ^2.3.0
  path: ^1.9.0



  flutter pub get



Step 3: Create Database Helper File

Inside the lib/ directory, create a new file named database_helper.dart
