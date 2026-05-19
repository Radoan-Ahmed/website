// ============================================================
// 📝 APP CONTENT - Change all text & images here easily
// ============================================================

class AppContent {
  // ─── BRAND ────────────────────────────────────────────────
  static const String logoUrl =
      'https://awcbd.org/wp-content/uploads/2024/11/logo_hr-1.webp';
  static const String whiteLogoUrl =
      'https://awcbd.org/wp-content/uploads/2024/11/white_logo.webp';
  static const String faviconUrl =
      'https://awcbd.org/wp-content/uploads/2024/11/favicon.png';
  static const String clinicName = 'Acu Life Healthcare & Research';
  static const String clinicTagline =
      'The Integrative Health & Research Centre in Bangladesh';
  static const String phone = '01568099036';
  static const String email = 'awc.health@gmail.com';

  // ─── NAV LINKS ────────────────────────────────────────────
  static const List<Map<String, dynamic>> navLinks = [
    {'label': 'Home', 'url': '#home'},
    {'label': 'Our Services', 'url': '#services'},
    {'label': 'Doctors', 'url': '#doctors'},
    {'label': 'Training', 'url': '#training'},
    {'label': 'Opening Hours', 'url': '#hourseSection'},
    {
      'label': 'View Map',
      'url': '#branches',
    }, // scrolls to map section or navigates to /location
    {
      'label': 'About Us',
      'url': '#about',
      'children': [
        {'label': 'Meet Our Founder', 'url': '#founder'},
        {'label': 'Blog', 'url': '#blog'},
      ],
    },
    {'label': 'Contact Us', 'url': '#contact'},
  ];

  // ─── HERO SLIDES ─────────────────────────────────────────
  static const List<Map<String, String>> heroSlides = [
    {
      'title': 'সমন্বিত চিকিৎসা সেবা ও সুস্থ জীবন',
      'subtitle': 'The Integrative Health & Research Centre in Bangladesh',
      'buttonText': 'OUR SERVICES',
      'buttonUrl': '#services',
      'image':
          'https://awcbd.org/wp-content/uploads/2024/12/AWC-Website-Banner-03.webp',
    },
    {
      'title': 'Integrative Health & Research',
      'subtitle': 'Natural Healing Better Living',
      'buttonText': 'BOOK APPOINTMENT',
      'buttonUrl': '#appointment',
      'image':
          'https://awcbd.org/wp-content/uploads/2024/11/AWC-Website-Banner-04.webp',
    },
  ];

  // ─── FEATURES (3 cards below hero) ───────────────────────
  static const List<Map<String, String>> features = [
    {
      'icon':
          'https://finestwp.com/clinmedix/wp-content/uploads/2022/12/feature-1-1.png',
      'title': 'Values & Solutions',
      'description':
          'Experience care built on strong values, offering innovative solutions tailored to your unique health needs.',
      'linkText': 'Learn More',
      'url': '#services',
    },
    {
      'icon':
          'https://finestwp.com/clinmedix/wp-content/uploads/2022/12/feature-1-2.png',
      'title': 'Find A Doctor',
      'description':
          'Find trusted doctors easily, ensuring personalized, holistic care tailored to your health and wellness needs.',
      'linkText': 'Learn More',
      'url': '#doctors',
    },
    {
      'icon':
          'https://finestwp.com/clinmedix/wp-content/uploads/2022/12/feature-1-3.png',
      'title': 'Location & Support',
      'description':
          'Access convenient locations and dedicated support, ensuring seamless, personalized care for all your needs.',
      'linkText': 'Learn More',
      'url': '#contact',
    },
  ];

  // ─── ABOUT SECTION ────────────────────────────────────────
  static const String aboutTitle =
      'A Deeper, More Intentional Approach to Healthcare';
  static const String aboutBody =
      'In a world that often prioritizes quick fixes over lasting wellness, we invite you to experience a deeper, more intentional approach to healthcare. Our practice merges the wisdom of ancient traditions with a compassionate, modern understanding of the human body. Whether you are seeking relief from chronic pain, navigating a health challenge, or simply looking to optimize your energy, we provide a sanctuary for your recovery and growth.';
  static const String aboutImage =
      'https://awcbd.org/wp-content/uploads/2024/12/AWC-Website-Banner-03.webp';

  static const String visionTitle = 'Our Vision';
  static const String visionBody =
      'To be the global benchmark for integrative medicine, where ancient healing wisdom and modern scientific research converge to create a healthier, more balanced world. We envision a future where Acupuncture, Ayurveda, Cupping and Bio-Purification therapies are not merely "alternatives," but essential, evidence-based components of standard healthcare — accessible to all and respected by the global medical community.';

  static const String missionTitle = 'Mission Statement';
  static const String missionBody =
      'We search the root cause of illness and provide evidence-based integrative treatments designed to restore the body\'s natural rhythm and achieve long-term vitality. We achieve this through four core commitments:';
  static const List<Map<String, String>> missionCommitments = [
    {
      'icon': 'clinical',
      'title': 'Clinical Excellence',
      'description':
          'Delivering the highest standard of patient care through rigorous diagnostic protocols and personalized treatment plans.',
    },
    {
      'icon': 'scientific',
      'title': 'Scientific Rigor',
      'description':
          'Every therapy we offer is grounded in peer-reviewed evidence, ensuring safe and effective outcomes for our patients.',
    },
    {
      'icon': 'empathetic',
      'title': 'Empathetic Innovation',
      'description':
          'We continuously evolve our methods while keeping the patient\'s comfort, dignity, and well-being at the center of all we do.',
    },
    {
      'icon': 'educational',
      'title': 'Educational Leadership',
      'description':
          'Training and empowering the next generation of integrative health practitioners across Bangladesh and beyond.',
    },
  ];

  static const String advantageTitle =
      "Advantage of AcuLife Healthcare & Research";
  static const String advantageQuote =
      '"Beyond the needle, we find the solution. Experience the science of natural medicine at AcuLife Healthcare & Research — Dhaka\'s premier destination for integrative healing."';
  static const List<String> advantages = [
    "We don't just treat the pain — we listen to your body's internal signals.",
    'Modern Science, Traditional Wisdom — the best of both worlds.',
    'The "Pain-Free & Drug-Free" solution for lasting recovery.',
    'Relief without the side effects of medication.',
    'Every treatment plan is as unique as your pulse.',
  ];

  // ─── SERVICES ─────────────────────────────────────────────
  static const String servicesSectionTitle = 'Premium Medical Services';
  static const String servicesSectionSubtitle =
      'We are rated the best Integrative Center in Bangladesh.';

  static const List<Map<String, String>> services = [
    {
      'image': 'https://awcbd.org/wp-content/uploads/2024/11/s_1.webp',
      'title': 'Acupuncture',
      'description': '''🩺 Acupuncture – A Natural Path to Healing

        Acupuncture is a time-tested therapeutic technique that involves inserting very fine, sterile needles into specific points on the body. It is widely used to relieve pain, restore balance, and support the body’s natural healing process.

        ### 🔬 How Does Acupuncture Work?

        Acupuncture stimulates specific points (acupoints) along the body’s energy pathways. This helps to—

        * Improve blood circulation
        * Regulate the nervous system
        * Reduce inflammation and pain
        * Promote natural healing and balance

        ### 🌿 Benefits of Acupuncture

        Acupuncture can be effective for a wide range of conditions, including:

        * Chronic pain (neck, back, shoulder, knee)
        * Migraine and tension headaches
        * Stress, anxiety, and insomnia
        * Digestive disorders (IBS, bloating, indigestion)
        * Hormonal imbalance and infertility support
        * Arthritis and joint problems
        * General fatigue and low energy

        ### 👩‍⚕️ Who Can Benefit?

        Acupuncture is suitable for most adults. However, you should consult a professional if you are:

        * Pregnant
        * Suffering from bleeding disorders
        * Using a pacemaker (in case of electro-acupuncture)
        * Extremely weak or medically unstable

        ### ⚠️ Safety & Hygiene

        All treatments are performed using *single-use, sterile, disposable needles* in a clean and hygienic environment to ensure maximum safety and comfort.

        ### 🏥 Why Choose Us?

        * Certified and experienced practitioners
        * Evidence-based and personalized care
        * Safe, painless, and effective techniques
        * Calm and comfortable treatment setting

        ### 📞 Book an Appointment

        Restore your body’s balance naturally. Contact us today to schedule your acupuncture session.''',
      'url': '#services',
    },

    {
      'image': 'https://awcbd.org/wp-content/uploads/2024/11/s_2.webp',
      'title': 'Cupping Therapy',
      'description': '''🩺 Benefit of Cupping (Hijama)
Hijama may help promote relaxation, support circulation, reduce muscle tension, and contribute to overall wellness when performed properly.

Who Can Take Hijama?
Suitable for adults seeking supportive care for stress, body discomfort, fatigue, or general well-being after professional consultation.

Why Choose Us?
Professional care • Hygienic procedure • Personalized approach • Patient comfort and safety first.''',
      'url': '#services',
    },
    {
      'image': 'https://awcbd.org/wp-content/uploads/2024/12/s_3.webp',
      'title': 'Bio-Purification',
      'description': '''🩺Bio-Purification Therapy – Detox & Restore Naturally

Bio-Purification Therapy is a holistic treatment approach designed to cleanse the body, eliminate toxins, and restore internal balance. It combines natural methods and therapeutic techniques to support the body’s own healing and detoxification processes.

🔬 How Does Bio-Purification Work?

Bio-Purification focuses on enhancing the body’s natural detox pathways. This therapy helps to—

Remove accumulated toxins from the body
Improve blood circulation and metabolism
Support liver and digestive function
Strengthen the immune system.🌿 Benefits of Bio-Purification

This therapy can be helpful for various conditions, including:

Chronic fatigue and low energy
Digestive disorders (gas, bloating, constipation)
Skin problems (acne, eczema, dull skin)
Hormonal imbalance
Stress and poor sleep
General body detox and wellness.wellness
👩‍⚕️ Who Can Benefit?

Bio-Purification Therapy is suitable for most individuals seeking natural detox and wellness support. However, consultation is recommended for:

Pregnant women
Patients with chronic or serious medical conditions
Individuals with severe weakness or nutritional deficiencies
⚠️ Safety & Approach

Our Bio-Purification programs are conducted in a safe, hygienic, and controlled environment using carefully selected natural methods. Each treatment plan is customized based on the patient’s condition and health goals.🏥 Why Choose Us?
Experienced and trained practitioners
Personalized detox programs
Integration of traditional and modern approaches
Comfortable and patient-friendly environment
📞 Book an Appointment

Cleanse your body and rejuvenate your health naturally. Contact us today to start your Bio-Purification journey.''',

      'url': '#services',
    },
    {
      'image': 'https://awcbd.org/wp-content/uploads/2024/12/s_4.webp',
      'title': 'Natural Medicine',
      'description': '''
🌿 Natural Medicine – Healing the Body the Natural Way

Natural Medicine is a holistic approach to healthcare that focuses on using natural therapies, lifestyle changes, and preventive care to restore and maintain health. It aims to treat the root cause of illness rather than just managing symptoms.

🔬 How Does Natural Medicine Work?

Natural Medicine supports the body’s innate healing ability through safe and effective methods. This approach helps to—

Strengthen the immune system
Restore internal balance
Improve digestion and metabolism
Enhance overall physical and mental well-being

It may include herbal remedies, nutrition, lifestyle guidance, and non-invasive therapeutic techniques.

🌿 Benefits of Natural Medicine

Natural Medicine can be beneficial for a wide range of conditions, such as:

Digestive disorders (gas, indigestion, IBS)
Hormonal imbalance and infertility support
Chronic fatigue and weakness
Stress, anxiety, and sleep disorders
Skin conditions (acne, eczema, allergies)
Joint pain and inflammation
👩‍⚕️ Who Can Benefit?

Natural Medicine is suitable for people of all ages who prefer a safe and holistic approach to health. It is especially helpful for those looking for long-term wellness and prevention.

However, professional consultation is recommended for:

Pregnant women
Patients with chronic or serious illnesses
Individuals taking long-term medications
⚠️ Safety & Approach

We follow a safe, evidence-informed, and patient-centered approach. All treatments are tailored to individual needs, ensuring effective and sustainable results.

🏥 Why Choose Us?
Experienced and qualified practitioners
Personalized treatment plans
Combination of traditional wisdom and modern understanding
Focus on long-term health and prevention
📞 Book an Appointment

Choose a natural path to better health. Contact us today to begin your journey toward balanced and healthy living.''',
      'url': '#services',
    },
    {
      'image': 'https://awcbd.org/wp-content/uploads/2024/12/s_5.webp',
      'title': 'Doctor Consultation',
      'description': '''🩺Doctor Consultation – Personalized Care You Can Trust

Doctor Consultation is the first and most important step toward accurate diagnosis and effective treatment. Our consultation service is designed to understand your health concerns in detail and provide a personalized care plan tailored to your needs.

🔬 What to Expect During Consultation?

During your consultation, our doctor will—

Listen carefully to your symptoms and medical history
Perform necessary clinical evaluation
Identify the root cause of your condition
Provide a clear diagnosis and treatment plan
Recommend suitable therapies and lifestyle guidance
🌿 Our Approach

We follow a holistic and patient-centered approach, combining clinical expertise with natural and supportive therapies. Our goal is not only to treat illness but also to improve your overall health and well-being.

👩‍⚕️ Conditions We Address

Our consultation covers a wide range of health concerns, including:

Digestive disorders (gas, acidity, IBS)
Pain management (neck, back, joints)
Hormonal imbalance and infertility support
Skin conditions
Stress, anxiety, and sleep disorders
General health and preventive care
⚠️ Why Consultation Matters

Proper consultation ensures—

Early detection of health issues
Accurate and safe treatment
Prevention of complications
Better long-term health outcomes
🏥 Why Choose Us?
Qualified and experienced doctor
Personalized treatment plans
Friendly and confidential environment
Integration of natural and modern therapies
📞 Book Your Consultation

Take control of your health today. Book your consultation and get expert guidance for a healthier life.''',
      'url': '#services',
    },
    // {
    //   'image': 'https://awcbd.org/wp-content/uploads/2024/12/s_6.webp',
    //   'title': 'Modern Acupuncture',
    //   'description':
    //       'Acupuncture is a nearly 2,000-year-old traditional Chinese medicine technique that stimulates specific points on the body.',
    //   'url': '#services',
    // },
  ];

  // ─── CLINIC HOURS ─────────────────────────────────────────
  static const String hoursSectionTitle =
      'Clean, Caring & Friendly Environment';
  static const String hoursSubtitle = 'Clinic Opening Hours';
  static const String hoursDescription =
      'Our friendly receptionist is ready to assist you during our working hours.';
  static const List<Map<String, String>> clinicHours = [
    {'day': 'Sunday', 'hours': '02:00 pm - 10:00 pm'},
    {'day': 'Monday', 'hours': '02:00 pm - 10:00 pm'},
    {'day': 'Tuesday', 'hours': '02:00 pm - 10:00 pm'},
    {'day': 'Wednesday', 'hours': '02:00 pm - 10:00 pm'},
    {'day': 'Thursday', 'hours': '02:00 pm - 10:00 pm'},
    {'day': 'Friday', 'hours': '02:00 pm - 10:00 pm'},
    {'day': 'Saturday', 'hours': '02:00 pm - 10:00 pm'},
  ];
  static const String hoursImage =
      'https://awcbd.org/wp-content/uploads/2024/11/AWC-Website-Banner-04.webp';

  // ─── APPOINTMENT ──────────────────────────────────────────
  static const String appointmentTitle = 'Need an Advice from Expert Doctor?';
  static const String appointmentSubtitle = 'Get An Appointment Today!';
  static const String appointmentCallText =
      'To speak with a representative, Call us';
  static const String appointmentPhone = '01568099036';

  // ─── STATS ────────────────────────────────────────────────
  static const List<Map<String, String>> stats = [
    {'value': '5000', 'suffix': '+', 'label': 'Clinic Reviews'},
    {'value': '20', 'suffix': '+', 'label': 'Doctors'},
    {'value': '100', 'suffix': 'K', 'label': 'Organic Medicine'},
    {'value': '99', 'suffix': '%', 'label': 'Good Result'},
  ];

  // ─── DOCTORS ──────────────────────────────────────────────
  static const String doctorsSectionTitle = 'Meet our Doctors';
  static const String doctorsSectionSubtitle =
      'We have the best certified naturopathic doctors registered by Directorate General of Health Services(DGHS)';

  static const List<Map<String, String>> doctors = [
    {
      'name': 'Dr. Shurab Hossain',
      'qualification':
          'PhD (JU), M.Phil (Pharm), FCPA (India)\n'
          'MPH (Com. Med), BAMS (DU)\n'
          'Advanced Diploma in Acupuncture\n'
          'Advanced training in AMC (Sri Lanka)',
      'designation':
          'Assistant Professor (AC)\n'
          'Department of Ayurvedic Medicine\n'
          'Govt. Unani & Ayurvedic Medical College & Hospital, Dhaka',
      'role': 'Chief Consultant \nAcuLife Healthcare & Research',
      'image': 'assets/images/doctor_image.jpeg',
      'url': '#doctors',
    },
    {
      'name': 'Dr. Nazrin Sultana',
      'qualification': 'BUMS (DU), CMU\nMS (Microbiology)',
      'designation': 'Senior Lecturer, Hakim Said Eastern Medical College and Hospital, Dhaka',
      'role': 'Chairman\nAcuLife Healthcare & Research',
      'image': 'assets/images/female_doctor_image.jpg',
      'url': '#doctors',
    },
    {
      'name': 'Dr. Rakibul Hasan',
      'qualification': 'BUMS (DU)',
      'designation': 'Medical officer and Coordinator',
      'role': 'Medical officer\nAcuLife Healthcare & Research',
      'image': 'assets/images/rakib_doctor_image.jpeg',
      'url': '#doctors',
    },
  ];

  // ─── TESTIMONIALS ─────────────────────────────────────────
  static const List<Map<String, String>> testimonials = [
    {
      'title': 'A Truly Transformative Experience!',
      'review':
          'I had been struggling with chronic pain for years and tried various treatments with no lasting relief. When I found Acu Life Health Care, I was amazed at how different their approach was. Their integrative treatments combine the best of modern medicine with holistic therapies, all tailored to my specific needs. After just a few sessions, I started feeling better physically and mentally.',
      'name': 'Ayesha S.',
      'location': 'Dhaka',
      'avatar': 'https://awcbd.org/wp-content/uploads/2024/12/user.png',
    },
    {
      'title': 'A Unique and Holistic Approach to Wellness',
      'review':
          'As someone who has always valued both traditional and alternative health practices, I was excited to find the Acu Life Health Care. Their personalized care has exceeded my expectations in every way. Whether it\'s acupuncture, chiropractic care, or nutritional counseling, every service is top-notch. I\'ve experienced significant improvements in my energy levels and overall health.',
      'name': 'Ruhul Amin',
      'location': 'Chittagong',
      'avatar': 'https://awcbd.org/wp-content/uploads/2024/12/user.png',
    },
    {
      'title': 'স্বাস্থ্য পরিবর্তনের অভিজ্ঞতা',
      'review':
          'আমি অনেক বছর ধরে দীর্ঘমেয়াদী ব্যথা ও অস্বস্তিতে ভুগছিলাম। আমেরিকান ওয়েলনেস সেন্টারে চিকিৎসা নেওয়ার পর আমার জীবন পাল্টে গেছে। এখানকার চিকিৎসা পদ্ধতি আধুনিক মেডিসিন এবং holistic থেরাপির সমন্বয়ে, যা আমার শরীরের উপযুক্ত ছিল। ধন্যবাদ আমেরিকান ওয়েলনেস সেন্টারকে!',
      'name': 'রোশনা আক্তার',
      'location': 'ঢাকা',
      'avatar': 'https://awcbd.org/wp-content/uploads/2024/12/user.png',
    },
  ];

  // ─── BLOG / NEWS ──────────────────────────────────────────
  static const String newsSectionTitle = 'Latest Medical News';
  static const String newsSectionSubtitle =
      'Stay updated with the latest breakthroughs and advancements in healthcare.';

  static const List<Map<String, String>> newsItems = [
    {
      'title': 'Excepteur sint occaecat cupidatat non proident, sunt mollit',
      'date': 'December 15, 2024',
      'category': 'Health',
      'image': 'https://awcbd.org/wp-content/uploads/2024/11/s_1.webp',
      'url': '#blog',
    },
    {
      'title': 'Consectetur adipisicing elit. Architecto, voluptatem! abitas',
      'date': 'December 10, 2024',
      'category': 'Wellness',
      'image': 'https://awcbd.org/wp-content/uploads/2024/11/s_2.webp',
      'url': '#blog',
    },
    {
      'title': 'Eiusmod tempor incididunt labore sed at dolore magna aliqua',
      'date': 'December 5, 2024',
      'category': 'Medicine',
      'image': 'https://awcbd.org/wp-content/uploads/2024/12/s_3.webp',
      'url': '#blog',
    },
  ];

  // ─── LOCATION / MAP ───────────────────────────────────────
  // ✏ Change lat/lng here to update the embedded map instantly.
  // Tip: open Google Maps, right-click your location → "What's here?" to copy coordinates.

  static const Map<String, dynamic> branch1Location = {
    'name': 'Mirpur-10 Branch',
    'address':
        'Save On Health Care, Mirpur-10\nOpposite Mirpur Girls Ideal High School, Dhaka',
    'phone': '01568099036',
    'email': '',
    'lat': 23.8057, // ← change latitude here
    'lng': 90.3707, // ← change longitude here
    'zoom': 17, // ← 1 (world) – 20 (building). 16-18 is ideal for a clinic
  };

  static const Map<String, dynamic> branch2Location = {
    'name': 'Bashundhara Branch',
    'address': 'Bashundhara Main Gate\nSouth Side of Jamuna Future Park, Dhaka',
    'phone': '09639-670670',
    'email': 'awc.health@gmail.com',
    'lat': 23.8130, // ← change latitude here
    'lng': 90.4202, // ← change longitude here
    'zoom': 17,
  };

  // ─── TRAINING ─────────────────────────────────────────────
  static const String trainingSectionTitle = 'Professional Training Programs';
  static const String trainingSectionSubtitle =
      'Advance your career with our certified training courses in integrative and natural medicine.';

  static const List<Map<String, dynamic>> trainings = [
    {
      'icon': 'acupuncture',
      'image': 'https://awcbd.org/wp-content/uploads/2024/11/s_1.webp',
      'title': 'Acupuncture Training',
      'duration': '6 Months',
      'level': 'Beginner – Advanced',
      'seats': 'Limited Seats',
      'description':
          'A comprehensive hands-on training program covering traditional acupuncture theory, meridian systems, needle techniques, and clinical applications. Participants will gain the knowledge and practical skills to safely perform acupuncture therapy.',
      'highlights': [
        'Meridian & acupoint theory',
        'Needle insertion techniques',
        'Pain management protocols',
        'Clinical case studies',
        'Certificate upon completion',
      ],
    },
    {
      'icon': 'cupping',
      'image': 'https://awcbd.org/wp-content/uploads/2024/11/s_2.webp',
      'title': 'Hijama / Cupping Therapy Training',
      'duration': '6 Month',
      'level': 'All Levels',
      'seats': 'Limited Seats',
      'description':
          'Learn the ancient art of Hijama (wet cupping) and dry cupping therapy in a safe, hygienic, and professional setting. This course covers the historical roots, therapeutic benefits, safety protocols, and step-by-step clinical procedures.',
      'highlights': [
        'History & Islamic perspective of Hijama',
        'Dry & wet cupping techniques',
        'Hygiene & sterilisation standards',
        'Point selection for common conditions',
        'Hands-on practical sessions',
        'Certificate upon completion',
      ],
    },
    {
      'icon': 'natural',
      'image': 'https://awcbd.org/wp-content/uploads/2024/12/s_4.webp',
      'title': 'Natural & Functional Medicine',
      'duration': '6 Months',
      'level': 'Intermediate',
      'seats': 'Limited Seats',
      'description':
          'Explore the principles of functional and integrative medicine, including nutrition therapy, herbal remedies, detoxification, and lifestyle modification strategies. Designed for healthcare practitioners seeking a holistic approach.',
      'highlights': [
        'Functional medicine fundamentals',
        'Nutritional & herbal therapy',
        'Gut health & detox protocols',
        'Patient assessment tools',
        'Evidence-based approach',
        'Certificate upon completion',
      ],
    },
    {
      'icon': 'bio',
      'image': 'https://awcbd.org/wp-content/uploads/2024/12/s_3.webp',
      'title': 'Bio-Purification Therapy Training',
      'duration': '6 Months',
      'level': 'Beginner',
      'seats': 'Limited Seats',
      'description':
          'Master the methods of bio-purification and detoxification therapy. This training covers holistic detox principles, therapeutic protocols, and practical techniques used to cleanse and restore the body naturally.',
      'highlights': [
        'Detox pathways & physiology',
        'Therapeutic techniques',
        'Diet & lifestyle guidance',
        'Practical demonstrations',
        'Certificate upon completion',
      ],
    },
  ];

  // ─── FOOTER ───────────────────────────────────────────────
  static const String footerAbout =
      'We offer alternative functional medicine consultation, regenerative therapies, and evidence-based Nutrition in addition to Modern Medicine to complete the reverse of your health conditions.';
  static const String footerLicense = '';

  static const List<Map<String, String>> socialLinks = [
    {'label': 'Facebook', 'url': 'https://www.facebook.com/awc.health'},
    {
      'label': 'Youtube',
      'url': 'https://www.youtube.com/channel/UCcXjY_VSZGQvmuhJMg7hzLw',
    },
    {'label': 'Instagram', 'url': 'https://www.instagram.com/awcbd.health/'},
    {
      'label': 'Linkedin',
      'url': 'https://www.linkedin.com/in/american-wellness-center-bd/',
    },
  ];

  static const List<Map<String, String>> footerServices = [
    {'label': 'Acupuncture', 'url': '#branches'},
    {'label': 'Cupping Therapy', 'url': '#services'},
    {'label': 'Bio-Purification', 'url': '#doctors'},
    {'label': 'Natural Medicine', 'url': '#services'},
    {'label': '''Doctor's Consultation''', 'url': '#privacy'},
  ];

  static const List<Map<String, String>> footerBranch1 = [
    {
      'icon': 'location',
      'text':
          'Save On Health Care,Mirpur-10 Opposite of Mirpur Girls Ideal High School',
    },
    // {'icon': 'email', 'text': ''},
    {'icon': 'phone', 'text': '01568099036'},
  ];

  static const List<Map<String, String>> footerBranch2 = [
    {
      'icon': 'location',
      'text': 'Bashundhara Main Gate, South Side of Jamuna Future Park, Dhaka',
    },
    {'icon': 'email', 'text': 'awc.health@gmail.com'},
    {'icon': 'phone', 'text': '09639-670670'},
  ];

  static const String copyright = '';
}
