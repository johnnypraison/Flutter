flutter create media_app
cd media_app

mkdir assets\images
mkdir assets\audio
mkdir assets\video


Step 3: Add an Image

Place an image file (e.g., flutter.png) inside your assets/images/ folder.
• Note: If you don't have one handy, you can save any placeholder .png or .jpg file into that directory and name it flutter.png.

Step 4 & 5: Modify pubspec.yaml and Fetch Packages

Open your pubspec.yaml file in the root folder. Scroll down to the flutter: section and declare your asset path exactly as shown below. Pay extreme attention to spaces/indentation, as YAML requires exact spacing:

flutter pub get

inside your lib/ directory, create three new files alongside main.dart so your file tree matches this layout:
text
lib/
├── main.dart
├── home.dart
├── profile.dart
└── details.dart

flutter run