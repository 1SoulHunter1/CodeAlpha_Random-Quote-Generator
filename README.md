# 🔮 Quote Generator - A Modern Flutter App

A sleek, modern, and animated quote generator app built with Flutter. It fetches inspirational quotes from a live API and presents them in a beautiful, minimalist UI with smooth fade-in animations.

### ✨ App Preview

*(Here is where you should add a GIF of your app in action! A GIF is the best way to make your README stand out.)*

## ⭐ Features

- **Live Data:** Fetches quotes from the [API Ninjas](https://api-ninjas.com/api/quotes) REST API.
- **Modern UI:** A beautiful gradient background with elegant, custom-bundled fonts.
- **Smooth Animations:** Quotes seamlessly cross-fade into view using Flutter's `AnimatedSwitcher`.
- **Robust & Offline-Ready:** Bundles font files locally so the app works perfectly offline and loads instantly.
- **Error Handling:** Displays user-friendly messages if the API call fails.
- **Responsive Layout:** The UI adapts to different screen sizes, and long quotes are scrollable to prevent overflow errors.

## 🛠️ Tech Stack & Dependencies

- **Framework:** [Flutter](https://flutter.dev/)
- **Language:** [Dart](https://dart.dev/)
- **API:** [API Ninjas Quotes API](https://api-ninjas.com/api/quotes)
- **Key Packages:**
  - `http`: For making network requests to the API.
- **Fonts:**
  - `Lora` & `Lato` (Bundled locally for performance and offline access).

## 🚀 Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

Make sure you have the Flutter SDK installed on your machine.
- [Flutter installation guide](https://flutter.dev/docs/get-started/install)

### Installation

1. **Clone the repo**
   ```sh
   git clone [https://github.com/your-username/your-repository-name.git](https://github.com/your-username/your-repository-name.git)
   
2. **Navigate to the project directory**
   ```sh
   cd quote_generator
   
3. **Install dependencies**
   ```sh
   flutter pub get
   
4. **Enter your API Key** :
    
    Open the file lib/quote_screen.dart and replace the placeholder 'YOUR_API_KEY_HERE' with your actual API key from API Ninjas.
   ```sh
   final String _apiKey = 'YOUR_API_KEY_HERE'; // <-- ADD YOUR KEY HERE
   
6. **Run the app**
   ```sh
   flutter run

## 🤝 Contributing
Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/1SoulHunter1/CodeAlpha_Random-Quote-Generator/issues).

## 📜 Acknowledgements
This project was developed as a task for the virtual internship program provided by CodeAlpha.

## Show your support
Give a ⭐️ if this project helped you!
  
