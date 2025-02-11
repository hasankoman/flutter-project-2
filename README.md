# Flutter E-commerce App

This project is a Flutter application for an e-commerce platform.  It allows users to browse products, view details, add items to a cart, and manage their account (login/registration). The app integrates with Firebase for authentication and Firestore for data storage.

## Project Structure

The project follows a standard Flutter structure with the following key directories:

- **android/**: Android-specific project files.
- **ios/**: iOS-specific project files.
- **lib/**: Dart source code for the application.
    - **models/**: Data models for products and other entities.
    - **providers/**: State management using the `provider` package.
    - **screens/**: UI screens for different parts of the application (login, home, product details, etc.)
- **test/**: Unit and widget tests.
- **.gitignore**: Specifies files and directories to exclude from version control.


## Tech Stack & Dependencies

- **Flutter:** The cross-platform UI framework.
- **Dart:** The programming language for Flutter.
- **Firebase:**  Backend services for authentication (Firebase Auth) and data storage (Firestore).
- **Provider:**  State management solution.
- **flutter_spinkit:**  Loading indicator package.


## Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone <repository_url>
   ```

2. **Install dependencies:**
   ```bash
   cd flutter_project_2
   flutter pub get
   ```

3. **Set up Firebase:**
   - Create a Firebase project in the Firebase console ([console.firebase.google.com](console.firebase.google.com)).
   - Add Firebase to your Flutter project following the instructions on the Firebase documentation. You'll need to configure the `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) files.

4. **Run the app:**
   ```bash
   flutter run
   ```


## Usage Guide

The app features a login/registration flow, leading to a home screen with product browsing capabilities. Users can add products to their cart and view their cart contents.  The `/cart` route displays the cart.  The `/profile` route displays the profile information.  The app is designed to be intuitive, following standard e-commerce patterns.

**Available Routes:**

- `/`: Splash screen (initial route).
- `/login`: Login screen.
- `/register`: Registration screen.
- `/home`: Home screen (product listing).
- `/product-details`: Product details screen (passed a `Product` object as an argument).
- `/cart`: Cart screen.
- `/profile`: Profile screen.


## Contribution Guidelines

Contributions are welcome! Please follow these guidelines:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them with clear and concise messages.
4. Push your branch to your forked repository.
5. Create a pull request to merge your changes into the main branch.


## License

[Specify License here, e.g., MIT License]


## Author Info

Developed by [Your Name/Team Name].  Contact: [Your Email/Contact Info]

