import 'package:project_counselling/app/views/Presentation/HelpCenter/model/HelpCategory.dart';
import 'package:project_counselling/app/views/Presentation/HelpCenter/model/HelpTopic.dart';

final List<HelpCategory> helpCategories = [
  HelpCategory(
    title: "I. Getting Started & Account Management",
    topics: [
      HelpTopic(
          title: "Creating Your Account",
          content: "To create your account, download the app and tap on \"Sign Up\". You\'ll be asked to provide your email address, create a password, and agree to our Terms of Service and Privacy Policy. Follow the on-screen instructions to complete your registration."),
      HelpTopic(
          title: "Logging In / Password Reset",
          content: "To log in, open the app and tap \"Log In\". Enter your registered email and password. If you\'ve forgotten your password, tap on the \"Forgot Password\" link on the login screen. You\'ll receive an email with instructions on how to reset it."),
      HelpTopic(
          title: "Updating Profile Information",
          content: "You can update your profile information by navigating to the \"Profile\" section from the side menu. Here you can edit your name, contact number, date of birth, and location. Make sure to save any changes you make."),
      HelpTopic(
          title: "Managing Notification Settings",
          content: "Manage your notification preferences in the \"Settings\" menu, usually found in the side menu or your profile page. You can choose which types of notifications you\'d like to receive, such as session reminders or new messages."),
      HelpTopic(
          title: "Understanding Your Dashboard/Home Screen",
          content: "Your dashboard or home screen is your main navigation hub. It typically shows upcoming sessions, quick access to start new conversations, and links to other important features like your journal, resources, or settings."),
      HelpTopic(
          title: "How to Verify Your Email/Phone",
          content: "Email verification is usually done by clicking a link sent to your email address after registration. For phone verification, you might receive an SMS code that you need to enter into the app. This helps secure your account."),
    ],
  ),
  HelpCategory(
    title: "II. Booking & Managing Sessions",
    topics: [
      HelpTopic(
          title: "Booking a New Session/Appointment",
          content: "To book a new session, navigate to the \"Book Session\" or \"New Appointment\" section. You may be able to choose a counsellor (if applicable), select a date and time that works for you, and confirm the session type (e.g., text, video, audio)."),
      HelpTopic(
          title: "Rescheduling an Existing Session",
          content: "To reschedule an existing session, go to your \"Upcoming Sessions\" list. Select the session you wish to change and look for a \"Reschedule\" option. You\'ll typically be able to pick a new date and time, subject to availability and any applicable policies."),
      HelpTopic(
          title: "Cancelling a Session",
          content: "To cancel a session, find it in your \"Upcoming Sessions\" list. Select the session and look for a \"Cancel\" option. Please be aware of our cancellation policy, which might include deadlines or fees for late cancellations."),
      HelpTopic(
          title: "Viewing Upcoming Sessions",
          content: "You can view all your scheduled upcoming sessions in the \"My Sessions\" or \"Upcoming Sessions\" section, usually accessible from your dashboard or side menu."),
      HelpTopic(
          title: "Viewing Past Session History",
          content: "Your past session history, including dates and possibly summaries or transcripts (depending on features and privacy settings), can be found in a section like \"Session History\" or \"Past Sessions\"."),
      HelpTopic(
          title: "Choosing a Counsellor/Therapist",
          content: "If our app allows you to choose a counsellor, you might find a directory or list of available professionals. Profiles may include specializations, experience, and user reviews to help you make an informed choice."),
      HelpTopic(
          title: "Understanding Session Types (e.g., text, video, audio)",
          content: "We may offer different types of sessions: \nText-based sessions allow for asynchronous messaging. \nVideo sessions are live, face-to-face consultations. \nAudio sessions are live voice calls. Choose the type that best suits your comfort and needs."),
    ],
  ),
  HelpCategory(
    title: "III. Using the App Features",
    topics: [
      HelpTopic(
          title: "How Online Consultations Work",
          content: "Online consultations connect you with our AI counsellor or a human therapist (if applicable) through the app. Depending on the session type, you\'ll communicate via text, audio, or video. Ensure you have a stable internet connection for the best experience."),
      HelpTopic(
          title: "Technical Requirements for Video/Audio Calls",
          content: "For video/audio calls, you\'ll need a smartphone or computer with a working camera, microphone, and a stable internet connection (Wi-Fi recommended). Ensure your app has the necessary permissions to access your camera and microphone."),
      HelpTopic(
          title: "Troubleshooting Call/Connection Issues",
          content: "If you experience call drops or poor quality: \n1. Check your internet connection (try switching between Wi-Fi and mobile data). \n2. Restart the app. \n3. Ensure your device\'s operating system and the app are updated. \n4. Close other apps that might be using bandwidth. \n5. Contact support if issues persist."),
      HelpTopic(
          title: "Using the In-App Messaging/Chat",
          content: "Our in-app messaging allows you to communicate with your AI counsellor or therapist. You can send text messages, and sometimes images or files if the feature is supported. All communications are typically encrypted for privacy."),
      HelpTopic(
          title: "Accessing Journaling Features",
          content: "If journaling is available, you can usually find it in a dedicated section of the app. Use it to record your thoughts, feelings, and reflections. Entries are private and can be a valuable tool for your mental well-being journey."),
      HelpTopic(
          title: "Using Mood Tracking Tools",
          content: "Mood tracking tools, if available, allow you to log your mood regularly. This can help you and your counsellor identify patterns and triggers. Look for a \"Mood Tracker\" or similar section in the app."),
      HelpTopic(
          title: "Finding Resources or Articles",
          content: "Our app may provide a library of resources, articles, or exercises related to mental health and well-being. These can usually be found in a \"Resources\", \"Library\", or \"Learn\" section."),
    ],
  ),
  HelpCategory(
    title: "IV. Payments & Subscriptions",
    topics: [
      HelpTopic(
          title: "Making a Payment",
          content: "Payments for sessions or subscriptions can typically be made within the app using a credit/debit card or other supported payment methods. Navigate to the \"Payments\" or \"Subscription\" section to manage your payment details."),
      HelpTopic(
          title: "Understanding Subscription Plans",
          content: "If we offer subscription plans, details about what each plan includes (e.g., number of sessions, access to premium features) and the cost will be outlined in the \"Subscription\" section. Review these carefully before subscribing."),
      HelpTopic(
          title: "Updating Payment Methods",
          content: "You can update your payment method (e.g., add a new card, remove an old one) in the \"Payments\" or \"Account Settings\" section of the app."),
      HelpTopic(
          title: "Viewing Payment History/Invoices",
          content: "Your payment history and any invoices can usually be found in your account settings under a section like \"Payment History\" or \"Billing\"."),
      HelpTopic(
          title: "Requesting a Refund",
          content: "Our refund policy will be detailed in our Terms of Service. If you believe you are eligible for a refund, please contact our customer support with the details of your request. Provide as much information as possible, including session dates and reasons for the refund."),
    ],
  ),
  HelpCategory(
    title: "V. Privacy & Security",
    topics: [
      HelpTopic(
          title: "Our Privacy Policy",
          content: "You can find our full Privacy Policy in the app, usually under \"Settings\" or \"Legal\". It details how we collect, use, and protect your personal information. We encourage you to read it carefully."),
      HelpTopic(
          title: "How We Protect Your Data",
          content: "We use various security measures to protect your data, including encryption for data in transit and at rest, secure servers, and access controls. For more details, please refer to our Privacy Policy."),
      HelpTopic(
          title: "Confidentiality of Sessions",
          content: "Your sessions are confidential, with exceptions as outlined by law and ethical guidelines (e.g., risk of harm to self or others). Our Privacy Policy and Terms of Service provide more details on confidentiality."),
      HelpTopic(
          title: "Reporting a Security Concern",
          content: "If you believe you have found a security vulnerability or have a concern about your account\'s security, please contact us immediately through the support channels provided in the app or on our website. Please do not disclose the issue publicly until we have had a chance to address it."),
    ],
  ),
  HelpCategory(
    title: "VI. Support & Feedback",
    topics: [
      HelpTopic(
          title: "Providing Feedback About a Session",
          content: "After a session, you may be prompted to provide feedback. You can also usually find a feedback option within the session details or in a general \"Feedback\" section. Your input helps us improve our services."),
      HelpTopic(
          title: "Providing Feedback About the App",
          content: "We welcome your feedback about the app! You can typically submit app feedback through a \"Contact Support\" or \"Send Feedback\" option in the settings or help section."),
      HelpTopic(
          title: "Reporting a Technical Issue",
          content: "If you encounter a technical issue, please report it to our support team. Provide as much detail as possible, including what you were doing when the issue occurred, your device type, OS version, and screenshots if possible."),
      HelpTopic(
          title: "Contacting Customer Support",
          content: "You can contact customer support through the app, usually via a \"Help\", \"Support\", or \"Contact Us\" section. We aim to respond to inquiries as quickly as possible."),
      HelpTopic(
          title: "Suggesting a New Feature",
          content: "Have an idea for a new feature? We\'d love to hear it! Please submit your suggestions through our feedback channels or customer support."),
      HelpTopic(
          title: "Frequently Asked Questions (FAQ)",
          content: "This Help Center serves as our FAQ! If you can\'t find an answer here, please contact customer support."),
    ],
  ),
  HelpCategory(
    title: "VII. Specific Concerns/Situations",
    topics: [
      HelpTopic(
          title: "What to Do in a Crisis",
          content: "IMPORTANT: This app is NOT for crisis situations. If you are in immediate danger, experiencing a severe mental health crisis, or thinking about harming yourself or others, please call emergency services (e.g., 911, 999, 112) or a crisis hotline immediately. We may provide links to such resources in the app for quick access."),
      HelpTopic(
          title: "Understanding the Role of AI Counsellors",
          content: "Our AI counsellor is designed to provide supportive conversations, offer general guidance based on common therapeutic principles, and help you explore your thoughts and feelings. It is not a human therapist and cannot provide medical diagnoses, treatment plans, or crisis intervention. It\'s a tool to support your well-being journey."),
      HelpTopic(
          title: "When to Seek In-Person Help",
          content: "This app can be a valuable support tool, but it is not a replacement for in-person professional help when needed. Consider seeking help from a qualified mental health professional if: \n- You are in a crisis. \n- Your symptoms are severe or worsening. \n- You need a diagnosis or medication. \n- You feel the app is not sufficient for your needs."),
    ],
  ),
];
