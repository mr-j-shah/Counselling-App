# 🧘 Project Counselling - AI-Powered Mental Wellness App

A compassionate and accessible mobile tool for emotional support and self-discovery, built with **Flutter**.

Project Counselling is a mobile application designed to provide a safe, non-judgmental space for users to explore their thoughts and feelings. Leveraging the power of modern AI, the app offers real-time, supportive conversations and guided wellness exercises to promote mental well-being.

## 📸 Application Screenshots

| Home Screen | Breathing Exercise | Live Voice Chat |
| :---: | :---: | :---: |
|  |  |  |
| **Saved Sessions** | **AI Persona Detail** | **Profile Management** |
|  |  |  |

---

## ✨ Core Features

This first phase of the project focuses on delivering immediate value through a set of core functionalities:

### 🗣️ Real-Time Voice Conversations with AI
* Engage in seamless, hands-free voice chats with AI personas.
* The app integrates a full pipeline: **Speech-to-Text** to capture the user's voice, **Google's Gemini API** to generate an intelligent and empathetic response, and **Text-to-Speech** to deliver the response in a natural voice.

### 🎭 AI Personas (Avatars)
* Choose from a variety of AI personas, each with a unique personality and background (e.g., a monk, a life coach).
* The AI's responses are custom-tailored to the selected persona, creating a more engaging and personalized experience.
* The list of available avatars is dynamically fetched from **Firebase Firestore**.

### 🌬️ Guided "Box Breathing" Exercise
* A powerful, animated tool to guide users through a **4-4-4 breathing cycle**, a proven technique to reduce stress and calm the nervous system.
* Features include selectable durations (2, 5, or 10 minutes), sound controls, and a motivating "Well Done!" pop-up upon completion.

### 📚 Session Management
* Users can save their chat conversations with a custom title for later review.
* A "My Sessions" screen allows users to review, revisit, or delete past conversations.
* The free tier includes a limit of **5 saved sessions**, managed via **Firestore**.

### 👤 User Profile & Authentication
* Secure user authentication using **Firebase Authentication** (Email/Password and Google Sign-In).
* A dedicated profile screen where users can view and update their personal information, securely stored in **Firestore**.

---

## 🚀 Technology Stack

This project is built using a modern, scalable technology stack:

| Category | Technology | Purpose |
| :--- | :--- | :--- |
| **Frontend** | `Flutter` | Cross-platform mobile development (iOS/Android). |
| **State Management** | `GetX` | Fast, powerful, and reactive state management. |
| **Backend & DB** | `Google Firebase` | User authentication, profile storage, and dynamic content. |
| **Core AI** | `Google Gemini Pro` | The powerful Large Language Model (LLM) for conversation generation. |
| **Voice Input** | `speech_to_text` | Real-time transcription of user voice input. |
| **Voice Output** | `flutter_tts` | Text-to-Speech conversion for AI responses. |
| **Architecture** | **Clean Architecture** | Separating UI (Views), business logic (Controllers), and data services (Repositories). |

---

## 🛠️ Getting Started

To get a local copy of this project up and running, follow these simple steps.

### Prerequisites

* **Flutter SDK** (version 3.x or higher)
* An IDE like **VS Code** or **Android Studio**
* A configured **Firebase project**

### Installation

1.  **Clone the repository:**
    ```sh
    git clone [https://github.com/your-username/project-counselling.git](https://github.com/your-username/project-counselling.git)
    cd project-counselling
    ```

2.  **Set up Firebase:**
    * Create a new project on the [Firebase Console](https://console.firebase.google.com/).
    * Add an **Android** and/or **iOS** app to your Firebase project.
    * Follow the instructions to add the Firebase configuration file to your project (e.g., `google-services.json` for Android, `GoogleService-Info.plist` for iOS).
    * In the Firebase console, enable:
        * **Authentication** (Email/Password and Google providers).
        * **Firestore Database**.

3.  **Configure API Keys:**
    * Create a `.env` file in the **root** of the project.
    * Add your Gemini API key to the file:
        ```toml
        GEMINI_API_KEY="YOUR_API_KEY_HERE"
        ```

4.  **Install dependencies:**
    ```sh
    flutter pub get
    ```

5.  **Run the app:**
    ```sh
    flutter run
    ```
