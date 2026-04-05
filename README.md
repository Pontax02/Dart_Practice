# Twitch Clone

> A mobile application that replicates core Twitch features, built with Flutter and Firebase.

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.11.1+-0175C2?logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?logo=firebase&logoColor=black)
![Provider](https://img.shields.io/badge/State-Provider_6.1.5-purple)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Windows%20%7C%20macOS-lightgrey)
![License](https://img.shields.io/badge/License-MIT-green)

---

## Screenshots

> _Screenshots coming soon — screens are under active development._

---

## Features

- **User Authentication** — Email/password sign-up and login via Firebase Auth
- **Firestore Integration** — User profiles stored and retrieved from Cloud Firestore
- **Firebase Storage** — Ready for media/file uploads
- **State Management** — App-wide user state managed with Provider
- **Custom UI Components** — Reusable `CustomButton` and `CustomTextField` widgets with Twitch-themed styling
- **Named Routing** — Clean navigation between Onboarding, Login, Signup and Home screens

---

## Tech Stack

| Technology | Version | Purpose |
|---|---|---|
| Flutter | 3.x | Cross-platform UI framework |
| Dart | ≥ 3.11.1 | Programming language |
| Firebase Auth | ^6.3.0 | Email/password authentication |
| Cloud Firestore | ^6.2.0 | NoSQL database — user data |
| Firebase Storage | ^13.2.0 | Cloud file/media storage |
| Firebase Core | ^4.6.0 | Firebase SDK initialization |
| Provider | ^6.1.5 | State management (ChangeNotifier) |
| Firebase BoM | 34.11.0 | Dependency version alignment |

---

## Architecture

The project follows a **layered architecture** with a feature-based folder organization:

```
lib/
├── main.dart                  # App entry point & route definitions
├── models/                    # Data layer — plain Dart classes
│   └── user.dart
├── resources/                 # Service layer — Firebase API calls
│   └── auth_methods.dart
├── providers/                 # State layer — ChangeNotifier classes
│   └── user_provider.dart
├── screens/                   # Presentation layer — full-page widgets
│   ├── onboarding_screen.dart
│   ├── login_screen.dart
│   ├── signup_screen.dart
│   └── home_screen.dart
├── widgets/                   # Reusable UI components
│   ├── custom_button.dart
│   └── custom_textfield.dart
└── utils/                     # Constants and helper functions
    ├── colors.dart
    └── utils.dart
```

**Authentication flow:**

```
OnboardingScreen
    ├── → LoginScreen  → AuthMethods.loginUser()  → HomeScreen
    └── → SignupScreen → AuthMethods.signUpUser() → HomeScreen
                                ↓
                        UserProvider (global state)
```

---

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) ≥ 3.0
- [Dart SDK](https://dart.dev/get-dart) ≥ 3.11.1
- Android Studio / VS Code with Flutter extension
- A Firebase project (see [Firebase Setup](#firebase-setup))

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/Pontax02/Dart_Practice.git
cd Dart_Practice

# 2. Install dependencies
flutter pub get

# 3. Add your Firebase configuration file (see Firebase Setup below)

# 4. Run the app
flutter run
```

---

## Firebase Setup

This project requires a Firebase project with **Authentication**, **Firestore** and **Storage** enabled.

1. Go to the [Firebase Console](https://console.firebase.google.com) and create a new project.

2. Enable the following services:
   - **Authentication** → Sign-in method → Email/Password
   - **Firestore Database** → Start in test mode (lock rules before production)
   - **Storage** → Default bucket

3. Register your Android app:
   - Package name: `com.example.flutter_application_test`
   - Download the generated `google-services.json`

4. Place the file at:
   ```
   android/app/google-services.json
   ```

5. _(iOS only)_ Register the iOS app and place `GoogleService-Info.plist` at `ios/Runner/`.

6. Run the app:
   ```bash
   flutter run
   ```

---

## Environment & Security

`google-services.json` and `GoogleService-Info.plist` are listed in `.gitignore` and **must never be committed** to the repository, as they contain Firebase API keys.

Each developer must generate their own configuration files from the Firebase Console and place them locally as described above.

---

## Project Structure — File Reference

| File | Description |
|---|---|
| `lib/main.dart` | App bootstrap, MaterialApp, theme and route map |
| `lib/models/user.dart` | `User` entity with `toMap` / `fromMap` for Firestore |
| `lib/resources/auth_methods.dart` | `signUpUser`, `loginUser`, `getCurrentUser` — all Firebase calls |
| `lib/providers/user_provider.dart` | `UserProvider` — holds the authenticated `User` in memory |
| `lib/screens/onboarding_screen.dart` | Welcome screen with Login / Sign Up entry points |
| `lib/screens/login_screen.dart` | Email + password login UI |
| `lib/screens/signup_screen.dart` | Email + username + password registration UI |
| `lib/screens/home_screen.dart` | Post-auth landing screen _(in progress)_ |
| `lib/widgets/custom_button.dart` | Full-width ElevatedButton with Twitch purple theme |
| `lib/widgets/custom_textfield.dart` | Outlined TextField with purple focus border |
| `lib/utils/colors.dart` | Brand color constants (`#9147FF`, white, light gray, black) |
| `lib/utils/utils.dart` | `showSnackBar` helper |

---

## Roadmap

- [x] Project setup & Firebase integration
- [x] User model with Firestore serialization
- [x] Email/password sign-up with Firestore profile creation
- [x] Email/password login
- [x] Global user state with Provider
- [ ] Complete HomeScreen UI
- [ ] Wire up LoginScreen button to `AuthMethods.loginUser()`
- [ ] Parameterize `CustomTextField` label
- [ ] Add stream/live browsing feature
- [ ] User profile page
- [ ] Firestore security rules for production
- [ ] iOS Firebase configuration

---

## Contributing

Contributions are welcome. Please follow the steps below:

1. Fork the repository
2. Create a feature branch: `git checkout -b feat/your-feature`
3. Commit your changes using [Conventional Commits](https://www.conventionalcommits.org/): `git commit -m "feat: add your feature"`
4. Push to your fork: `git push origin feat/your-feature`
5. Open a Pull Request against `main`

---

## License

This project is licensed under the [MIT License](LICENSE).
