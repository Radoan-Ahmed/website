import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:website/presentation/cubits/home_cubit.dart';
import 'package:website/presentation/cubits/home_state.dart';
import 'package:website/presentation/widgets/about/about_section.dart';
import 'package:website/presentation/widgets/appointment/appointment_section.dart';
import 'package:website/presentation/widgets/doctors/doctors_section.dart';
import 'package:website/presentation/widgets/features/features_section.dart';
import 'package:website/presentation/widgets/footer/footer_section.dart';
import 'package:website/presentation/widgets/hero/hero_section.dart';
import 'package:website/presentation/widgets/hours/hours_section.dart';
import 'package:website/presentation/widgets/navbar/navbar.dart';
import 'package:website/presentation/widgets/news/news_section.dart';
import 'package:website/presentation/widgets/services/services_section.dart';
import 'package:website/presentation/widgets/stats/stats_section.dart';
import 'package:website/presentation/widgets/testimonials/testimonials_section.dart';
import 'package:website/presentation/widgets/map/map_section.dart';
import 'package:website/presentation/widgets/training/training_section.dart';
import '../../../core/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  // Section keys for smooth scrolling
  final Map<String, GlobalKey> _sectionKeys = {
    '#home': GlobalKey(),
    '#services': GlobalKey(),
    '#doctors': GlobalKey(),
    '#appointment': GlobalKey(),
    '#about': GlobalKey(),
    '#contact': GlobalKey(),
    '#blog': GlobalKey(),
    '#training': GlobalKey(),
    '#branches': GlobalKey(),
    '#hourseSection': GlobalKey(),
  };

  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final show = _scrollController.offset > 400;
      if (show != _showBackToTop) setState(() => _showBackToTop = show);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(String key) {
    final gKey = _sectionKeys[key];
    if (gKey?.currentContext != null) {
      Scrollable.ensureVisible(
        gKey!.currentContext!,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      extendBodyBehindAppBar: false,
      appBar: NavBar(
        onAppointmentTap: () => _scrollToSection('#appointment'),
        sectionKeys: _sectionKeys,
      ),
      floatingActionButton:
          _showBackToTop
              ? FloatingActionButton.small(
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.white,
                onPressed:
                    () => _scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                    ),
                child: const Icon(Icons.keyboard_arrow_up),
              )
              : null,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (ctx, state) {
          if (state is! HomeLoaded) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // ── HERO ──────────────────────────────────
                SizedBox(
                  key: _sectionKeys['#home'],
                  child: HeroSection(
                    onServicesTap: () => _scrollToSection('#services'),
                    onAppointmentTap: () => _scrollToSection('#appointment'),
                  ),
                ),

                // ── FEATURE CARDS ─────────────────────────
                // FeaturesSection(features: state.features),

                // ── ABOUT ─────────────────────────────────
                SizedBox(
                  key: _sectionKeys['#about'],
                  child: const AboutSection(),
                ),

                // ── SERVICES ──────────────────────────────
                SizedBox(
                  key: _sectionKeys['#services'],
                  child: ServicesSection(services: state.services),
                ),

                // ── HOURS + IMAGE ─────────────────────────
                SizedBox(
                  key: _sectionKeys['#hourseSection'],
                  child: const HoursSection(),
                ),

                // ── APPOINTMENT ───────────────────────────
                SizedBox(
                  key: _sectionKeys['#appointment'],
                  child: const AppointmentSection(),
                ),

                // ── STATS ─────────────────────────────────
                // StatsSection(stats: state.stats),

                // ── TRAINING ──────────────────────────────
                SizedBox(
                  key: _sectionKeys['#training'],
                  child: TrainingSection(
                    onViewAllTap:
                        () => Navigator.of(context).pushNamed('/training'),
                  ),
                ),

                // ── DOCTORS ───────────────────────────────
                SizedBox(
                  key: _sectionKeys['#doctors'],
                  child: DoctorsSection(doctors: state.doctors),
                ),

                // ── MAP / BRANCHES ────────────────────────
                SizedBox(
                  key: _sectionKeys['#branches'],
                  child: MapSection(
                    onViewFullMapTap:
                        () => Navigator.of(context).pushNamed('/location'),
                  ),
                ),

                // ── TESTIMONIALS ──────────────────────────
                // TestimonialsSection(testimonials: state.testimonials),

                // ── NEWS ──────────────────────────────────
                // SizedBox(
                //   key: _sectionKeys['#blog'],
                //   child: NewsSection(news: state.news),
                // ),

                // ── FOOTER ────────────────────────────────
                SizedBox(
                  key: _sectionKeys['#contact'],
                  child: const FooterSection(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
