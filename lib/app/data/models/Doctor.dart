class Doctor {
  final String name;
  final String degree;
  final String specialty;
  final bool canPrescribeMedicine;
  final double hourRate;
  final double rating;
  final String imageUrl;

  Doctor({
    required this.name,
    required this.degree,
    required this.specialty,
    required this.canPrescribeMedicine,
    required this.hourRate,
    required this.rating,
    required this.imageUrl,
  });
}

final List<Doctor> doctors = [
  Doctor(
    name: "Dr. Aria Mehta",
    degree: "Ph.D. in Clinical Psychology",
    specialty: "Cognitive Behavioral Therapy (CBT), Depression, Anxiety Disorders",
    canPrescribeMedicine: false,
    hourRate: 85.0,
    rating: 4.8,
    imageUrl: "https://i.imgur.com/your_image_url.png", // Replace with actual URL
  ),
  Doctor(
    name: "Dr. Rohan Rao",
    degree: "M.D. in Psychiatry",
    specialty: "Mental Disorders, Emotional Regulation, Stress-related Illnesses",
    canPrescribeMedicine: true,
    hourRate: 120.0,
    rating: 4.9,
    imageUrl: "https://i.imgur.com/your_image_url.png", // Replace with actual URL
  ),
  Doctor(
    name: "Dr. Aisha Patel",
    degree: "M.A. in Counselling Psychology",
    specialty: "Relationship and Family Therapy, Communication Issues",
    canPrescribeMedicine: false,
    hourRate: 75.0,
    rating: 4.7,
    imageUrl: "https://i.imgur.com/your_image_url.png", // Replace with actual URL
  ),
  Doctor(
    name: "Dr. Sameer Khanna",
    degree: "Psy.D. in Clinical Psychology",
    specialty: "Trauma Recovery, PTSD, Emotional Regulation",
    canPrescribeMedicine: false,
    hourRate: 90.0,
    rating: 4.8,
    imageUrl: "https://i.imgur.com/your_image_url.png", // Replace with actual URL
  ),
  Doctor(
    name: "Dr. Evelyn Ross",
    degree: "M.D. in Psychiatry",
    specialty: "Mood Disorders, Bipolar Disorder, Sleep-related Mental Health",
    canPrescribeMedicine: true,
    hourRate: 130.0,
    rating: 4.9,
    imageUrl: "https://i.imgur.com/your_image_url.png", // Replace with actual URL
  ),
  Doctor(
    name: "Dr. Neha Sharma",
    degree: "Ph.D. in Behavioural Psychology",
    specialty: "Behavioral Therapy, Habit Formation, Mindfulness-based Practices",
    canPrescribeMedicine: false,
    hourRate: 80.0,
    rating: 4.6,
    imageUrl: "https://i.imgur.com/your_image_url.png", // Replace with actual URL
  ),
  Doctor(
    name: "Dr. Michael Davis",
    degree: "M.D. in Psychiatry",
    specialty: "Substance Abuse, Addiction Recovery, Mental Wellness Programs",
    canPrescribeMedicine: true,
    hourRate: 150.0,
    rating: 4.9,
    imageUrl: "https://i.imgur.com/your_image_url.png", // Replace with actual URL
  ),
  Doctor(
    name: "Dr. Priya Nair",
    degree: "M.Sc. in Counselling Psychology",
    specialty: "Workplace Stress, Burnout, Life Transition Counselling",
    canPrescribeMedicine: false,
    hourRate: 70.0,
    rating: 4.5,
    imageUrl: "https://i.imgur.com/your_image_url.png", // Replace with actual URL
  ),
  Doctor(
    name: "Dr. Arjun Sen",
    degree: "Ph.D. in Neuropsychology",
    specialty: "Cognitive Rehabilitation, Brain Health, Focus Enhancement",
    canPrescribeMedicine: false,
    hourRate: 110.0,
    rating: 4.7,
    imageUrl: "https://i.imgur.com/your_image_url.png", // Replace with actual URL
  ),
  Doctor(
    name: "Dr. Lisa Fernandez",
    degree: "Psy.D. in Clinical Psychology",
    specialty: "Child & Adolescent Therapy, Anxiety, Family Dynamics",
    canPrescribeMedicine: false,
    hourRate: 95.0,
    rating: 4.8,
    imageUrl: "https://i.imgur.com/your_image_url.png", // Replace with actual URL
  ),
  Doctor(
    name: "Dr. Kenji Tanaka",
    degree: "M.D. in Geriatric Psychiatry",
    specialty: "Mental health in older adults, dementia, and related disorders.",
    canPrescribeMedicine: true,
    hourRate: 140.0,
    rating: 4.9,
    imageUrl: "https://i.imgur.com/your_image_url.png",
  ),
  Doctor(
    name: "Dr. Fatima Al-Jamil",
    degree: "Ph.D. in Cross-Cultural Psychology",
    specialty: "Cultural adjustment, identity, and multicultural counseling.",
    canPrescribeMedicine: false,
    hourRate: 88.0,
    rating: 4.7,
    imageUrl: "https://i.imgur.com/your_image_url.png",
  ),
   Doctor(
    name: "Dr. Benjamin Carter",
    degree: "M.D. in Sports Psychiatry",
    specialty: "Performance anxiety, athlete mental health, and post-injury recovery.",
    canPrescribeMedicine: true,
    hourRate: 160.0,
    rating: 4.9,
    imageUrl: "https://i.imgur.com/your_image_url.png",
  ),
];
