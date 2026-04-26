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
  static const String clinicName = 'American Wellness Center';
  static const String clinicTagline =
      'The First and Only Integrative Center In Bangladesh';
  static const String phone = '+8809666-747470';
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
      ]
    },
    {'label': 'Contact Us', 'url': '#contact'},
  ];

  // ─── HERO SLIDES ─────────────────────────────────────────
  static const List<Map<String, String>> heroSlides = [
    {
      'title': 'ঔষুধ মুক্ত, সুস্থ জীবন',
      'subtitle': 'The First and Only Integrative Center In Bangladesh',
      'buttonText': 'OUR SERVICES',
      'buttonUrl': '#services',
      'image':
          'https://awcbd.org/wp-content/uploads/2024/12/AWC-Website-Banner-03.webp',
    },
    {
      'title': 'Holistic Health & Wellness',
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
      'We are rated the best Integrative and Functional Medicine clinic in the United States of America.';

  static const List<Map<String, String>> services = [
    {
      'image': 'https://awcbd.org/wp-content/uploads/2024/11/s_1.webp',
      'title': 'Vitamin Shots',
      'description':
          'IM vitamin therapy is a way of delivering nourishing vitamins, minerals, antioxidants, amino acids, and more, right to a person\'s bloodstream.',
      'url': '#services',
    },
    {
      'image': 'https://awcbd.org/wp-content/uploads/2024/11/s_2.webp',
      'title': 'Ozone Therapies',
      'description':
          'Medical Ozone Therapy is used to detox, kill infection treat disease, boost the immune system and improve the body\'s intake and use of oxygen.',
      'url': '#services',
    },
    {
      'image': 'https://awcbd.org/wp-content/uploads/2024/12/s_3.webp',
      'title': 'Treatment Plan',
      'description':
          'A personalized treatment plan is like a customized roadmap to recovery, giving guidance and direction tailored to your needs.',
      'url': '#services',
    },
    {
      'image': 'https://awcbd.org/wp-content/uploads/2024/12/s_4.webp',
      'title': 'Naturopathy',
      'description':
          'With proper nutritional counseling and supplementation we assist the body\'s healing process through natural means without surgery or drugs.',
      'url': '#services',
    },
    {
      'image': 'https://awcbd.org/wp-content/uploads/2024/12/s_5.webp',
      'title': 'Natural Supplementation',
      'description':
          'Natural supplements have been gaining popularity as more people are looking for ways to improve their health and wellbeing.',
      'url': '#services',
    },
    {
      'image': 'https://awcbd.org/wp-content/uploads/2024/12/s_6.webp',
      'title': 'Modern Acupuncture',
      'description':
          'Acupuncture is a nearly 2,000-year-old traditional Chinese medicine technique that stimulates specific points on the body.',
      'url': '#services',
    },
  ];

  // ─── CLINIC HOURS ─────────────────────────────────────────
  static const String hoursSectionTitle = 'Clean, Caring & Friendly Environment';
  static const String hoursSubtitle = 'Clinic Opening Hours';
  static const String hoursDescription =
      'Our friendly receptionist is ready to assist you during our working hours.';
  static const List<Map<String, String>> clinicHours = [
    {'day': 'Sunday', 'hours': '09:00 am - 19:00 pm'},
    {'day': 'Monday', 'hours': '09:00 am - 19:00 pm'},
    {'day': 'Tuesday', 'hours': '09:00 am - 19:00 pm'},
    {'day': 'Wednesday', 'hours': '09:00 am - 19:00 pm'},
    {'day': 'Thursday', 'hours': '09:00 am - 19:00 pm'},
    {'day': 'Friday', 'hours': '09:00 am - 19:00 pm'},
    {'day': 'Saturday', 'hours': '09:00 am - 19:00 pm'},
  ];
  static const String hoursImage =
      'https://awcbd.org/wp-content/uploads/2024/11/AWC-Website-Banner-04.webp';

  // ─── APPOINTMENT ──────────────────────────────────────────
  static const String appointmentTitle =
      'Need an Advice from Expert Doctor?';
  static const String appointmentSubtitle = 'Get An Appointment Today!';
  static const String appointmentCallText =
      'To speak with a representative, Call us';
  static const String appointmentPhone = '+8809666-747470';

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
      'We have the best board-certified naturopathic doctors and licensed by Guardian of Ecclesial Medical Association (GEMA)';

  static const List<Map<String, String>> doctors = [
    {
      'name': 'Dr. Atiqul Haq Mazumder',
      'qualification': 'MBBS, MD (Psychiatry), PhD (Psychiatry)',
      'image': 'https://awcbd.org/wp-content/uploads/2024/11/favicon.png',
      'url': '#doctors',
    },
    {
      'name': 'Dr. Shaiful Islam Patwary',
      'qualification': 'MBBS, MD (BSMMU), CCD (BIRDEM); C-Card (NHF), UIH (USA)',
      'image': 'https://awcbd.org/wp-content/uploads/2024/11/favicon.png',
      'url': '#doctors',
    },
    {
      'name': 'Dr. Ejaj Mahamud',
      'qualification': 'BAMS (DU), CMU (Ultra), CIN (USA)',
      'image': 'https://awcbd.org/wp-content/uploads/2024/11/favicon.png',
      'url': '#doctors',
    },
    {
      'name': 'Dr. Mahamuda Akhter',
      'qualification':
          'MBBS, CCD, DMU (Ultra), Trained in Integrative Treatment and Functional Medicine',
      'image': 'https://awcbd.org/wp-content/uploads/2024/11/favicon.png',
      'url': '#doctors',
    },
    {
      'name': 'Dr. Md. Ariful Islam',
      'qualification': 'BAMS (DU), MPH (NSU), CHN (USA)',
      'image': 'https://awcbd.org/wp-content/uploads/2024/11/favicon.png',
      'url': '#doctors',
    },
    {
      'name': 'Dr. Md Moshfiqur Rahman',
      'qualification':
          'Acupuncture Specialist, BUMS (DU), DDCM&V (WAUCM), MD-Acupuncture (China)',
      'image': 'https://awcbd.org/wp-content/uploads/2024/11/favicon.png',
      'url': '#doctors',
    },
    {
      'name': 'Dr. Pijush Sarkar',
      'qualification':
          'Physiotherapist, BPT (DU), ACMT (INDIA), Trained in Integrative & Functional Medicine (USA)',
      'image': 'https://awcbd.org/wp-content/uploads/2024/11/favicon.png',
      'url': '#doctors',
    },
    {
      'name': 'Dr. S M Anowar Hossen',
      'qualification': 'MBBS, FCPS (Medicine), BCS (Health)',
      'image': 'https://awcbd.org/wp-content/uploads/2024/11/favicon.png',
      'url': '#doctors',
    },
  ];

  // ─── TESTIMONIALS ─────────────────────────────────────────
  static const List<Map<String, String>> testimonials = [
    {
      'title': 'A Truly Transformative Experience!',
      'review':
          'I had been struggling with chronic pain for years and tried various treatments with no lasting relief. When I found American Wellness Center, I was amazed at how different their approach was. Their integrative treatments combine the best of modern medicine with holistic therapies, all tailored to my specific needs. After just a few sessions, I started feeling better physically and mentally.',
      'name': 'Ayesha S.',
      'location': 'Dhaka',
      'avatar': 'https://awcbd.org/wp-content/uploads/2024/12/user.png',
    },
    {
      'title': 'A Unique and Holistic Approach to Wellness',
      'review':
          'As someone who has always valued both traditional and alternative health practices, I was excited to find the American Wellness Center. Their personalized care has exceeded my expectations in every way. Whether it\'s acupuncture, chiropractic care, or nutritional counseling, every service is top-notch. I\'ve experienced significant improvements in my energy levels and overall health.',
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
      'title':
          'Excepteur sint occaecat cupidatat non proident, sunt mollit',
      'date': 'December 15, 2024',
      'category': 'Health',
      'image':
          'https://awcbd.org/wp-content/uploads/2024/11/s_1.webp',
      'url': '#blog',
    },
    {
      'title':
          'Consectetur adipisicing elit. Architecto, voluptatem! abitas',
      'date': 'December 10, 2024',
      'category': 'Wellness',
      'image':
          'https://awcbd.org/wp-content/uploads/2024/11/s_2.webp',
      'url': '#blog',
    },
    {
      'title':
          'Eiusmod tempor incididunt labore sed at dolore magna aliqua',
      'date': 'December 5, 2024',
      'category': 'Medicine',
      'image':
          'https://awcbd.org/wp-content/uploads/2024/12/s_3.webp',
      'url': '#blog',
    },
  ];

  // ─── FOOTER ───────────────────────────────────────────────
  static const String footerAbout =
      'We offer alternative functional medicine consultation, regenerative therapies, and evidence-based Nutrition in addition to Modern Medicine to complete the reverse of your health conditions.';
  static const String footerLicense =
      'Trade License Number: TRAD/DNCC/033876/2025';

  static const List<Map<String, String>> socialLinks = [
    {'label': 'Facebook', 'url': 'https://www.facebook.com/awc.health'},
    {
      'label': 'Youtube',
      'url': 'https://www.youtube.com/channel/UCcXjY_VSZGQvmuhJMg7hzLw'
    },
    {'label': 'Instagram', 'url': 'https://www.instagram.com/awcbd.health/'},
    {
      'label': 'Linkedin',
      'url': 'https://www.linkedin.com/in/american-wellness-center-bd/'
    },
  ];

  static const List<Map<String, String>> footerServices = [
    {'label': 'Hospital', 'url': '#branches'},
    {'label': 'Medicine Shop', 'url': '#services'},
    {'label': 'Doctor', 'url': '#doctors'},
    {'label': 'Green Kitchen', 'url': '#services'},
    {'label': 'Privacy Policy', 'url': '#privacy'},
    {'label': 'Terms & Conditions', 'url': '#terms'},
    {'label': 'Returns & Exchanges', 'url': '#returns'},
  ];

  static const List<Map<String, String>> footerBranch1 = [
    {
      'icon': 'location',
      'text':
          'Islam Tower, Shukrabad Bus Stand, Dhaka, Bangladesh'
    },
    {'icon': 'email', 'text': 'awc.health@gmail.com'},
    {'icon': 'phone', 'text': '+8809666-747470'},
  ];

  static const List<Map<String, String>> footerBranch2 = [
    {
      'icon': 'location',
      'text':
          'Bashundhara Main Gate, South Side of Jamuna Future Park, Dhaka'
    },
    {'icon': 'email', 'text': 'awc.health@gmail.com'},
    {'icon': 'phone', 'text': '09639-670670'},
  ];

  static const String copyright = '© 2024 AWCBD. All rights reserved';
}
