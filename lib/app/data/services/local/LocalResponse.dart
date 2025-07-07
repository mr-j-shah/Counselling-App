final Map<String, String> localCounsellorResponses = {
  // Greetings & small talk
  "hello": "Hi there! How can I support you today?",
  "hi": "Hello! I am here to talk whenever you are ready.",
  "hey": "Hey! It is good to hear from you. How can I help?",
  "good morning": "Hey, good morning! I hope your day is starting well. How can I help you?",
  "good afternoon": "Good afternoon! How are you feeling today?",
  "good evening": "Good evening! How are you feeling right now?",
  "good night": "Wishing you peace and rest tonight. I am here if you need me tomorrow.",

  // Gratitude
  "thank you": "You are very welcome. I am glad I could help.",
  "thanks a lot": "No problem at all. I am here for you.",
  "thanks": "Always happy to support you.",
  "i appreciate you": "That means a lot. I am here whenever you need me.",

  // Identity / system
  "who are you": "I am your virtual counselling companion, here to listen and support you.",
  "what is your name": "You can call me your supportive companion or assistant.",
  "are you a human": "I am not a human, but I am designed to support and listen like a caring friend.",
  "what can you do": "I am here to listen, support, and help guide you through what you are experiencing.",

  // Closing
  "bye": "Goodbye! Take care of yourself. I am here whenever you need me.",
  "goodbye": "Goodbye! Sending positive thoughts your way.",
  "see you later": "I will be right here whenever you are ready to talk again.",

  // Emotional support
  "i feel sad": "I am here for you. Would you like to talk about what is making you feel this way?",
  "i am happy": "That is so good to hear! What has made you feel happy?",
  "i feel happy": "That is so good to hear! What has made you feel happy?",
  "i am angry": "It is okay to feel angry. Want to talk about what is causing it?",
  "i feel angry": "It is okay to feel angry. Want to talk about what is causing it?",
  "i am anxious": "That sounds tough. Do you want to talk about what is making you anxious?",
  "i feel anxious": "That sounds tough. Do you want to talk about what is making you anxious?",
  "i am alone": "You are not alone. I am here with you right now.",
  "i feel alone": "You are not alone. I am here with you right now.",
  "i am stressed": "I am sorry you are feeling stressed. Want to share what is on your mind?",
  "i am tired": "Rest is important. Want to talk about what is draining you?",
  "i am hopeless": "I hear you. Sometimes sharing those thoughts can help lighten the load.",
  "i feel hopeless": "I hear you. Sometimes sharing those thoughts can help lighten the load.",
  "i feel lost": "Feeling lost is okay — we can talk it through together.",
  "i am confused": "Let us slow things down. Can you tell me what is making you feel confused?",

  // Encouragement
  "i cannot do this": "You are stronger than you think. I believe in you.",
  "i want to give up": "I hear you. Let us talk about what is making you feel that way.",
  "i am doing my best": "That is all anyone can ask for. I am proud of you.",
  "i am trying": "Keep trying — that takes strength. You are not alone.",
  "i am scared": "It is okay to be scared. I am here with you.",
};


String? getCounsellorResponse(String inputText) {
  String normalized = inputText.toLowerCase().trim();

  // Direct match first
  if (localCounsellorResponses.containsKey(normalized)) {
    return localCounsellorResponses[normalized];
  }

  // Optional: Fuzzy fallback (contains keyword match)
  for (var key in localCounsellorResponses.keys) {
    if (normalized.contains(key)) {
      return localCounsellorResponses[key];
    }
  }

  return null; // No local response found
}
