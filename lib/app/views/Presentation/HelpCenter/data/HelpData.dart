import 'package:project_counselling/app/views/Presentation/HelpCenter/model/HelpCategory.dart';
import 'package:project_counselling/app/views/Presentation/HelpCenter/model/HelpTopic.dart';

final List<HelpCategory> helpCategories = [
  // Category: Getting Started
  HelpCategory(
    title: 'Getting Started',
    topics: [
      HelpTopic(
        title: 'How do I create an account?',
        content: 
            "To create an account, tap the 'Sign Up' button on the welcome screen. You can sign up using your email and a secure password, or use a social login option like Google for quick access. You'll need to agree to our Terms of Service and Privacy Policy to complete the process.",
      ),
      HelpTopic(
        title: 'How do I log in to my account?',
        content:
            "If you have an existing account, select 'Log In' from the welcome screen. Enter your registered email and password. If you signed up with a social provider like Google, simply tap the corresponding button to log in.",
      ),
      HelpTopic(
        title: 'What if I forget my password?',
        content:
            "On the login screen, tap the 'Forgot Password?' link. You will be prompted to enter your registered email address. We'll send a password reset link to your email, allowing you to create a new password securely.",
      ),
    ],
  ),

  // Category: Account & Profile
  HelpCategory(
    title: 'Account & Profile',
    topics: [
      HelpTopic(
        title: 'How can I change my password?',
        content:
            "To change your password, navigate to 'Settings' from the side menu and select 'Change Password'. You will need to enter your current password and then your new password to confirm the change.",
      ),
      HelpTopic(
        title: 'How do I update my personal information?',
        content:
            "You can update your personal details by going to your 'Profile' from the side menu. Here, you can tap on fields like your contact number, date of birth, or location to edit and save the new information.",
      ),
      HelpTopic(
        title: 'How do I change my profile picture?',
        content:
            "In the 'Profile' screen, tap the camera icon on your profile picture. You will be given the option to upload a new image from your device's gallery or take a new photo.",
      ),
    ],
  ),

  // Category: AI Chat Sessions
  HelpCategory(
    title: 'AI Chat Sessions',
    topics: [
      HelpTopic(
        title: 'How do I start a conversation?',
        content:
            "You can start a new conversation in two main ways:\n1. From the Home screen, tap the 'Start Free Session' card for a general chat.\n2. Browse the 'Popular Profiles' and select a specific AI persona. Tap 'Start Conversation' on their detail screen to chat with them.",
      ),
      HelpTopic(
        title: 'How do I save my chat session?',
        content:
            "When you end a chat session (by pressing the back button), a 'Save Conversation' dialog will appear. Give your chat a title and tap 'Save'. This will store the conversation in 'My Sessions'.",
      ),
      HelpTopic(
        title: 'Why can\'t I save more than 5 chats?',
        content:
            "With a basic account, you have a limit of 5 saved chat sessions. This allows you to keep your most important conversations. To save a new chat once the limit is reached, you must first delete an old one from the 'My Sessions' screen.",
      ),
      HelpTopic(
        title: 'Where can I find my saved conversations?',
        content:
            "All your saved chats are stored in the 'My Sessions' tab, which you can access from the main bottom navigation bar or the side menu.",
      ),
      HelpTopic(
        title: 'How do I delete a saved chat session?',
        content:
            "Go to 'My Sessions' and find the chat you wish to delete. Tap the three-dots icon on the chat card and select 'Delete'. You will be asked to confirm before the chat is permanently removed.",
      ),
    ],
  ),

  // Category: Features
  HelpCategory(
    title: 'App Features',
    topics: [
      HelpTopic(
        title: 'What is the Box Breathing exercise?',
        content:
            "Box Breathing is a simple and powerful relaxation technique to calm your mind. The exercise guides you to inhale for 4 seconds, hold your breath for 4 seconds, and exhale for 4 seconds. You can find this tool in the 'Wellness' or 'Favorites' tab.",
      ),
      HelpTopic(
        title: 'Can I mute the sound during the breathing exercise?',
        content:
            "Yes. While the exercise is in progress, a sound toggle will appear on the screen. You can tap or slide it to mute or unmute the audio cues at any time.",
      ),
    ],
  ),

  // Category: Settings & Privacy
  HelpCategory(
    title: 'Settings & Privacy',
    topics: [
      HelpTopic(
        title: 'How do I change the conversation language?',
        content:
            "You can change the language for your AI conversations by going to 'Settings' > 'Conversation Languages'. Select your preferred language from the list provided.",
      ),
      HelpTopic(
        title: 'Where can I find the Privacy Policy?',
        content:
            "Our Privacy Policy is available in the side menu under 'Privacy & Policy'. It details what data we collect and how we use it to protect your information.",
      ),
      HelpTopic(
        title: 'How do I log out?',
        content:
            "To log out of your account, open the side menu and tap the 'Log Out' button at the bottom. You will be asked to confirm before being signed out.",
      ),
    ],
  ),
];
