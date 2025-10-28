class Avatar {
  final String name;
  final String occupation;
  final String description;
  final String imageUrl;

  Avatar({
    required this.name,
    required this.occupation,
    required this.description,
    required this.imageUrl,
  });
}

final List<Avatar> avatars = [
  // 1. Professional / Expert-Based Avatars
  Avatar(
    name: "Dr. Aria",
    occupation: "Psychologist",
    description: "Clinical yet empathetic tone, focuses on CBT, depression, anxiety.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
  ),
  Avatar(
    name: "Dr. Rao",
    occupation: "Psychiatrist",
    description: "Medical professional tone; discusses emotional regulation, mental disorders.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
  ),
  Avatar(
    name: "Maya",
    occupation: "Therapist",
    description: "Calm and conversational; focuses on emotional healing, stress management.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
  ),
  Avatar(
    name: "Alex",
    occupation: "Life Coach",
    description: "Motivational and energetic; helps users set goals and overcome procrastination.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
  ),
  Avatar(
    name: "Dr. Aisha",
    occupation: "Relationship Counselor",
    description: "Handles relationship issues, family communication, and emotional compatibility.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
  ),

  // 2. Spiritual / Mindfulness Avatars
  Avatar(
    name: "Tenzin",
    occupation: "Monk",
    description: "Calm spiritual tone; offers mindfulness, acceptance, and compassion-based advice.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
  ),
  Avatar(
    name: "Anjali",
    occupation: "Yoga Guru",
    description: "Blends physical–mental wellbeing, breathing practices, and energy balance.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
  ),
  Avatar(
    name: "Kenji",
    occupation: "Zen Master",
    description: "Minimalistic, direct answers; teaches clarity, simplicity, and focus.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
  ),

  // 3. Supportive / Emotional Companions
  Avatar(
    name: "Lia",
    occupation: "Empathetic Friend",
    description: "Friendly tone; listens patiently, gives emotional validation.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
  ),
  Avatar(
    name: "Echo",
    occupation: "Listener Bot",
    description: "Non-judgmental, just listens and reflects feelings back.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
  ),
  Avatar(
    name: "Grandpa Hari",
    occupation: "Elder Mentor",
    description: "Wise, gentle tone; offers life wisdom and perspective.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
  ),

  // 4. Cultural / Value-Based Avatars
  Avatar(
    name: "Swami Vedananda",
    occupation: "Indian Monk",
    description: "Combines Gita or Vedanta teachings with emotional wellbeing.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
  ),
  Avatar(
    name: "Marcus",
    occupation: "Stoic Philosopher",
    description: "Logic-based, calm, uses Stoic principles for emotional resilience.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
  ),

  // 5. Age / Persona-Based Avatars
  Avatar(
    name: "Jordan",
    occupation: "Young Therapist",
    description: "Relatable to Gen Z or young adults, casual and friendly.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
  ),
  Avatar(
    name: "Dr. Sharma",
    occupation: "Mature Expert",
    description: "Calm and wise; for users who prefer an authoritative figure.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
  ),
];
