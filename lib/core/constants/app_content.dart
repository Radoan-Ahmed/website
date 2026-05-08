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
    {'label': 'Services', 'url': '#services'},
    {'label': 'Branches', 'url': '#branches'},
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
      'subtitle': 'Modern Medicine meets Natural Functional Healing',
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
      "We're Setting the New Standards in Medical Research & Clinical Care";
  static const String aboutBody =
      "We search the root cause of illness with a comprehensive full-body physical exam and analyze lab results and reports. Then, We advise an integrative approach with modern allopathic medicine as well as evidence-based natural functional medicine to recover the malfunctioning of the body organs with an integrated approach. We also guide individualized diet and lifestyle modification to regain perfect health.";
  static const String aboutSubtitle = 'ClinMedix Special Features';
  static const List<String> aboutFeatures = [
    'Patient Experience',
    'Infection Prevention',
    'Quality of Care Services',
    'High-Risk Procedures',
    'Better Safety Measures',
    'Standards of Treatment',
  ];
  static const String aboutImage =
      'https://awcbd.org/wp-content/uploads/2024/12/AWC-Website-Banner-03.webp';

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
      'description': '''🩺 Hijama (Cupping Therapy) – A Natural Healing Method

Hijama, also known as Cupping Therapy, is an ancient and effective treatment method used to promote natural healing. It involves placing special cups on specific points of the body to create suction, which helps improve blood circulation and remove harmful toxins.

🔬 How Does Hijama Work?

Hijama works by creating negative pressure on the skin using suction cups. This process—

Enhances blood circulation
Helps eliminate toxins from the body
Relieves muscle tension and pain
Stimulates the body’s natural healing process.🌿 Benefits of Hijama

Hijama can be beneficial for a variety of health conditions, including:

Chronic headaches and migraines
Neck, shoulder, and lower back pain
Joint pain and arthritis
Digestive issues (gas, indigestion, IBS)
High blood pressure (as supportive care)
Stress, anxiety, and insomnia
Skin conditions (acne, eczema)👩‍⚕️ Who Can Take Hijama?

Hijama is suitable for both men and women. However, it is recommended to consult a healthcare professional if you are:

Pregnant
Severely weak or underweight
Suffering from anemia or certain medical conditions
⚠️ Safety & Hygiene

We ensure that all Hijama procedures are performed in a completely sterile and hygienic environment. Disposable cups and blades are used for every session to eliminate any risk of infection.🏥 Why Choose Us?
Trained and experienced practitioners
Safe and modern equipment
Personalized treatment plans
Comfortable and private environment
📞 Book an Appointment

Take a step toward natural healing. Contact us today to book your Hijama session and experience the benefits.''',
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
    {'day': 'Sunday', 'hours': '04:00 pm - 10:00 pm'},
    {'day': 'Monday', 'hours': '04:00 pm - 10:00 pm'},
    {'day': 'Tuesday', 'hours': '04:00 pm - 10:00 pm'},
    {'day': 'Wednesday', 'hours': '04:00 pm - 10:00 pm'},
    {'day': 'Thursday', 'hours': '04:00 pm - 10:00 pm'},
    {'day': 'Friday', 'hours': '04:00 pm - 10:00 pm'},
    {'day': 'Saturday', 'hours': '04:00 pm - 10:00 pm'},
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
      'qualification': 'PhD(F),Mphil,FCPA(India)MPH(NHFR&I),BAMS(DU)',
      'image': 'https://awcbd.org/wp-content/uploads/2024/11/favicon.png',
      'url': '#doctors',
    }
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

  // ─── FOOTER ───────────────────────────────────────────────
  static const String footerAbout =
      'We offer alternative functional medicine consultation, regenerative therapies, and evidence-based Nutrition in addition to Modern Medicine to complete the reverse of your health conditions.';
  static const String footerLicense =
      '';

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
      'text': 'Save On Health Care,Mirpur-10 Opposite of Mirpur Girls Ideal High School',
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
