import 'package:flutter/material.dart';
import '../../core/constants/app_content.dart';
import '../../core/theme/app_theme.dart';
import '../widgets/footer/footer_section.dart';
import '../widgets/navbar/navbar.dart';
import '../widgets/services/services_section.dart';

class TrainingPage extends StatefulWidget {
  const TrainingPage({super.key});

  @override
  State<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = {
    '#home': GlobalKey(),
    '#services': GlobalKey(),
    '#doctors': GlobalKey(),
    '#appointment': GlobalKey(),
    '#about': GlobalKey(),
    '#contact': GlobalKey(),
    '#blog': GlobalKey(),
    '#training': GlobalKey(),
  };
  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final show = _scrollController.offset > 300;
      if (show != _showBackToTop) setState(() => _showBackToTop = show);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;

    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: NavBar(
        onAppointmentTap: () => Navigator.of(context).pop(),
        sectionKeys: _sectionKeys,
      ),
      floatingActionButton: _showBackToTop
          ? FloatingActionButton.small(
              backgroundColor: AppTheme.primary,
              foregroundColor: Colors.white,
              onPressed: () => _scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
              ),
              child: const Icon(Icons.keyboard_arrow_up),
            )
          : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // ── HERO BANNER ───────────────────────────────
            _TrainingHero(isMobile: isMobile),

            // ── INTRO ─────────────────────────────────────
            _TrainingIntro(isMobile: isMobile),

            // ── TRAINING CARDS ────────────────────────────
            SizedBox(
              key: _sectionKeys['#training'],
              child: _TrainingGrid(isMobile: isMobile),
            ),

            // ── CTA ───────────────────────────────────────
            _TrainingCTA(isMobile: isMobile),

            // ── FOOTER ────────────────────────────────────
            SizedBox(
              key: _sectionKeys['#contact'],
              child: const FooterSection(),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Hero ────────────────────────────────────────────────────
class _TrainingHero extends StatelessWidget {
  final bool isMobile;
  const _TrainingHero({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: isMobile ? 220 : 320,
          child: Image.network(
            'https://awcbd.org/wp-content/uploads/2024/11/AWC-Website-Banner-04.webp',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                Container(color: AppTheme.primaryDark),
          ),
        ),
        Container(
          width: double.infinity,
          height: isMobile ? 220 : 320,
          color: AppTheme.heroOverlay,
        ),
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Training Programs',
                style: (isMobile ? AppTheme.heading2 : AppTheme.heading1)
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Home  /  Training',
                style: AppTheme.bodyMedium.copyWith(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Intro ────────────────────────────────────────────────────
class _TrainingIntro extends StatelessWidget {
  final bool isMobile;
  const _TrainingIntro({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.sectionBg,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 120,
        vertical: 60,
      ),
      child: Column(
        children: [
          SectionHeader(
            label: 'Training',
            title: AppContent.trainingSectionTitle,
            subtitle: AppContent.trainingSectionSubtitle,
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 32,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: const [
              _StatBadge(icon: Icons.school, value: '4+', label: 'Courses'),
              _StatBadge(
                  icon: Icons.verified, value: 'Certified', label: 'Programs'),
              _StatBadge(
                  icon: Icons.people, value: '500+', label: 'Graduates'),
              _StatBadge(
                  icon: Icons.workspace_premium,
                  value: 'Expert',
                  label: 'Instructors'),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatBadge extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  const _StatBadge(
      {required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppTheme.accent,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppTheme.primary, size: 26),
        ),
        const SizedBox(height: 8),
        Text(value,
            style: AppTheme.heading4.copyWith(color: AppTheme.primary)),
        Text(label, style: AppTheme.bodySmall),
      ],
    );
  }
}

// ── Grid ────────────────────────────────────────────────────
class _TrainingGrid extends StatelessWidget {
  final bool isMobile;
  const _TrainingGrid({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = isMobile ? 1 : (width < 1100 ? 2 : 2);

    return Container(
      color: AppTheme.white,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 60,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 28,
          mainAxisSpacing: 28,
          childAspectRatio: isMobile ? 1.0 : 1.55,
        ),
        itemCount: AppContent.trainings.length,
        itemBuilder: (ctx, i) =>
            _FullTrainingCard(training: AppContent.trainings[i]),
      ),
    );
  }
}

class _FullTrainingCard extends StatefulWidget {
  final Map<String, dynamic> training;
  const _FullTrainingCard({required this.training});

  @override
  State<_FullTrainingCard> createState() => _FullTrainingCardState();
}

class _FullTrainingCardState extends State<_FullTrainingCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final t = widget.training;
    final highlights = t['highlights'] as List<dynamic>;
    final isMobile = MediaQuery.of(context).size.width < 700;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered ? AppTheme.primary : AppTheme.divider,
            width: _hovered ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _hovered ? 0.10 : 0.04),
              blurRadius: _hovered ? 30 : 14,
              offset: Offset(0, _hovered ? 12 : 4),
            ),
          ],
        ),
        child: isMobile
            ? _CardVertical(t: t, highlights: highlights)
            : _CardHorizontal(t: t, highlights: highlights),
      ),
    );
  }
}

class _CardHorizontal extends StatelessWidget {
  final Map<String, dynamic> t;
  final List<dynamic> highlights;
  const _CardHorizontal({required this.t, required this.highlights});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left image
        ClipRRect(
          borderRadius:
              const BorderRadius.horizontal(left: Radius.circular(15)),
          child: SizedBox(
            width: 200,
            height: double.infinity,
            child: Image.network(
              t['image'] as String,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: AppTheme.accent,
                child:
                    Icon(Icons.school, size: 48, color: AppTheme.primary),
              ),
            ),
          ),
        ),
        // Right content
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: _CardContent(t: t, highlights: highlights),
          ),
        ),
      ],
    );
  }
}

class _CardVertical extends StatelessWidget {
  final Map<String, dynamic> t;
  final List<dynamic> highlights;
  const _CardVertical({required this.t, required this.highlights});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius:
              const BorderRadius.vertical(top: Radius.circular(15)),
          child: SizedBox(
            height: 160,
            width: double.infinity,
            child: Image.network(
              t['image'] as String,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: AppTheme.accent,
                child:
                    Icon(Icons.school, size: 48, color: AppTheme.primary),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: _CardContent(t: t, highlights: highlights),
          ),
        ),
      ],
    );
  }
}

class _CardContent extends StatelessWidget {
  final Map<String, dynamic> t;
  final List<dynamic> highlights;
  const _CardContent({required this.t, required this.highlights});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 6,
          children: [
            _InfoChip(Icons.access_time_rounded, t['duration'] as String),
            _InfoChip(Icons.signal_cellular_alt, t['level'] as String),
            _InfoChip(Icons.event_seat_outlined, t['seats'] as String,
                color: AppTheme.primary),
          ],
        ),
        const SizedBox(height: 12),
        Text(t['title'] as String,
            style: AppTheme.heading4, maxLines: 2),
        const SizedBox(height: 8),
        Expanded(
          child: Text(
            t['description'] as String,
            style: AppTheme.bodySmall,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
        const SizedBox(height: 10),
        Text('What You Will Learn',
            style: AppTheme.bodySmall
                .copyWith(fontWeight: FontWeight.w700, color: AppTheme.dark)),
        const SizedBox(height: 6),
        ...highlights.take(4).map(
              (h) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.check_circle,
                        size: 13, color: AppTheme.primary),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(h as String,
                          style: AppTheme.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
            ),
        const SizedBox(height: 12),
        _EnrollButton(),
      ],
    );
  }
}

class _EnrollButton extends StatefulWidget {
  @override
  State<_EnrollButton> createState() => _EnrollButtonState();
}

class _EnrollButtonState extends State<_EnrollButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: _hovered ? AppTheme.primaryDark : AppTheme.primary,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text('Enroll Now', style: AppTheme.buttonText),
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  const _InfoChip(this.icon, this.label, {this.color});

  @override
  Widget build(BuildContext context) {
    final c = color ?? AppTheme.darkGrey;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.accent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 11, color: c),
          const SizedBox(width: 4),
          Text(label,
              style: AppTheme.caption
                  .copyWith(color: c, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

// ── CTA ─────────────────────────────────────────────────────
class _TrainingCTA extends StatelessWidget {
  final bool isMobile;
  const _TrainingCTA({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppTheme.primary,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 28 : 120,
        vertical: 60,
      ),
      child: Column(
        children: [
          Text(
            'Ready to Start Your Training Journey?',
            style: AppTheme.heading2.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 14),
          Text(
            'Contact us today to register or learn more about our upcoming batches.',
            style: AppTheme.bodyLarge.copyWith(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.phone, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              Text(
                AppContent.phone,
                style: AppTheme.heading4.copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
