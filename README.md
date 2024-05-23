# HarvestHero Mobile App
Welcome to the HarvestHero Mobile App GitHub repository! HarvestHero is a mobile application designed to help farmers detect plant diseases using machine learning. Built with Flutter, Firebase, and TensorFlow Lite, the app leverages cutting-edge technology to provide accurate and timely information to users.

# Features
Disease Detection: Uses a machine learning model to detect diseases in plants from images taken by the user's phone camera.
Flutter Framework: Cross-platform development for both Android and iOS.
Firebase Integration: For backend services including authentication, database, and storage.
TensorFlow Lite: For on-device machine learning to enable offline capabilities and faster processing.

# Installation
Prerequisites
Flutter SDK: Install Flutter
Firebase Account: Create a Firebase project
TensorFlow Lite Model: Trained TensorFlow Lite model for plant disease detection
Steps
Clone the Repository

```shell
git clone https://github.com/Gagan0505/HarvestHero.git
```
```shell
cd harvesthero
```
Set Up Firebase

Go to the Firebase console, create a new project.
Add an Android/iOS app to the Firebase project.
Download the google-services.json (for Android) or GoogleService-Info.plist (for iOS) and place it in the appropriate directory.
Install Dependencies

```shell
flutter pub get
```
Configure TensorFlow Lite

Place your TensorFlow Lite model (model.tflite) in the assets directory.
Update pubspec.yaml to include the assets:
assets:
```shell
  - assets/model.tflite
```
Run the App

```shell
flutter run
```
# Usage
Sign In/Sign Up: Use Firebase authentication to sign in or create a new account.
Capture Image: Use the app's camera feature to take a photo of the plant.
Disease Detection: The app will process the image and provide a diagnosis based on the TensorFlow Lite model.
View Results: Get detailed information about the detected disease and suggested remedies.
Contributing
We welcome contributions to improve HarvestHero. To contribute, please follow these steps:

Fork the Repository
Create a Branch

```shell
git checkout -b feature-branch
```
Make Changes and Commit

```shell
git commit -m
```
"Description of changes"
Push to the Branch

```shell
git push origin feature-branch
```
Create a Pull Request: Describe your changes and submit the PR for review.
# License
This project is licensed under the MIT License. See the LICENSE file for more details.

# Contact
For questions, issues, or suggestions, please open an issue on GitHub or contact the project maintainers:

GitHub Issues: HarvestHero Issues
Thank you for using HarvestHero! We hope this app makes your farming experience more efficient and productive.

