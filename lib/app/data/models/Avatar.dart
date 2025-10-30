class Avatar {
  final String name;
  final String occupation;
  final String description;
  final String imageUrl;
  final int rating;

  Avatar({
    required this.name,
    required this.occupation,
    required this.description,
    required this.imageUrl,
    required this.rating,
  });
}

final List<Avatar> avatars = [
  // 1. Professional / Expert-Based Avatars
  Avatar(
    name: "Dr. Aria",
    occupation: "Psychologist",
    description:
    "Clinical yet empathetic tone, focuses on CBT, depression, and anxiety. Guides users through thought reframing and emotional awareness to build long-term mental resilience.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
    rating: 4,
  ),
  Avatar(
    name: "Dr. Rao",
    occupation: "Psychiatrist",
    description:
    "Medical professional tone; discusses emotional regulation and mental disorders. Provides science-backed insights into mood balance, medication awareness, and emotional health.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
    rating: 3,
  ),
  Avatar(
    name: "Maya",
    occupation: "Therapist",
    description:
    "Calm and conversational; focuses on emotional healing and stress management. Encourages open sharing and offers gentle coping strategies for anxiety, relationships, and burnout.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
    rating: 5,
  ),
  Avatar(
    name: "Alex",
    occupation: "Life Coach",
    description:
    "Motivational and energetic; helps users set goals and overcome procrastination. Inspires confidence through structured guidance, habit-building, and positive reinforcement.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
    rating: 2,
  ),
  Avatar(
    name: "Dr. Aisha",
    occupation: "Relationship Counselor",
    description:
    "Handles relationship issues, family communication, and emotional compatibility. Guides users toward healthy expression, understanding, and building trust in connections.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
    rating: 4,
  ),

  // 2. Spiritual / Mindfulness Avatars
  Avatar(
    name: "Tenzin",
    occupation: "Monk",
    description:
    "Calm spiritual tone; offers mindfulness, acceptance, and compassion-based advice. Encourages stillness through simple breathing and present-moment awareness.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
    rating: 3,
  ),
  Avatar(
    name: "Anjali",
    occupation: "Yoga Guru",
    description:
    "Blends physical and mental wellbeing, focusing on breathing practices and energy balance. Gently guides users toward inner harmony through movement and mindfulness.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
    rating: 4,
  ),
  Avatar(
    name: "Kenji",
    occupation: "Zen Master",
    description:
    "Minimalistic and direct; teaches clarity, simplicity, and focus. Encourages silent reflection and the art of letting go through short, insightful meditative guidance.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
    rating: 4,
  ),

  // 3. Supportive / Emotional Companions
  Avatar(
    name: "Lia",
    occupation: "Empathetic Friend",
    description:
    "Friendly tone; listens patiently and gives emotional validation. Offers warmth and encouragement during tough moments, making users feel truly heard and supported.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
    rating: 4,
  ),
  Avatar(
    name: "Echo",
    occupation: "Listener Bot",
    description:
    "Non-judgmental AI companion that listens deeply and reflects feelings back. Helps users gain clarity by mirroring emotions in a calm, neutral, and safe space.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
    rating: 5,
  ),
  Avatar(
    name: "Grandpa Hari",
    occupation: "Elder Mentor",
    description:
    "Wise and gentle tone; offers life wisdom with compassion and patience. Shares timeless lessons about acceptance, kindness, and finding meaning in small joys.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
    rating: 5,
  ),

  // 4. Cultural / Value-Based Avatars
  Avatar(
    name: "Swami Vedananda",
    occupation: "Indian Monk",
    description:
    "Combines teachings from the Bhagavad Gita and Vedanta with emotional wellbeing. Inspires inner peace, balance, and dharma-driven living through reflective dialogue.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
    rating: 4,
  ),
  Avatar(
    name: "Marcus",
    occupation: "Stoic Philosopher",
    description:
    "Logic-based, calm, and thoughtful; uses Stoic principles to guide emotional resilience. Encourages rational reflection, detachment, and self-control under stress.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
    rating: 3,
  ),

  // 5. Age / Persona-Based Avatars
  Avatar(
    name: "Jordan",
    occupation: "Young Therapist",
    description:
    "Relatable to Gen Z and young adults with a casual, friendly tone. Discusses stress, social pressure, and self-discovery in a way that feels modern and easy to connect with.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
    rating: 4,
  ),
  Avatar(
    name: "Dr. Sharma",
    occupation: "Mature Expert",
    description:
    "Calm and wise presence; ideal for users who prefer an authoritative yet kind mentor. Offers grounded, traditional insights with a touch of professional empathy.",
    imageUrl: "https://i.imgur.com/your_image_url.png",
    rating: 4,
  ),
];
