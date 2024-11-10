# Flutter Authentication App

This Flutter application provides a robust authentication solution, allowing users to register, log in, and securely access protected content. Built with Firebase for backend services, it supports email-password authentication and offers a scalable foundation for any app that requires user authentication.

## Features

- User Registration: New users can create an account using their email and password.
- User Login: Registered users can log in securely.
- Firebase Integration: Uses Firebase Authentication for secure, reliable backend services.
- Session Management: Keeps users logged in across sessions.
- Password Reset: Allows users to reset their password via email.
- Intuitive UI: Simple, clean, and user-friendly interface.

## Getting Started

To get started with this project, follow these steps:

Prerequisites

Ensure you have the following installed:
- Flutter SDK
- Firebase Project with Authentication enabled
- Dart SDK (comes with Flutter)

Installation
1. Clone the repository:

```
git clone https://github.com/UmarTanwar3527/flutter-auth.git
cd flutter-auth
```

2. Install dependencies:

```
flutter pub get
```

3. Set up Firebase:

- Create a Firebase project at Firebase Console.
- Enable Email/Password Authentication under Authentication.
- Download the google-services.json file for Android and GoogleService-Info.plist for iOS and place them in the respective folders of your Flutter project:
- android/app/ for google-services.json
- ios/Runner/ for GoogleService-Info.plist

4. Run the app:

```
flutter run
```

## Project Structure
```
lib/
├── main.dart               # Main entry point of the application
├── screens/                # UI screens (e.g., login, register, dashboard)
├── services/               # Firebase authentication services
└── widgets/                # Custom widgets for reusability
```

## Dependencies

This project uses the following dependencies:

- firebase_core: For Firebase core functionality
- firebase_auth: For handling user authentication
- provider: For state management

Install these by running:
```
flutter pub add firebase_core firebase_auth provider
```
## Contributing

Contributions are welcome! If you'd like to contribute, please fork the repository and make a pull request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
