import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_content.dart';
import '../../core/theme/app_theme.dart';
import '../widgets/footer/footer_section.dart';
import '../widgets/map/map_iframe_widget.dart';
import '../widgets/navbar/navbar.dart';
import '../widgets/services/services_section.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = {
    '#home': GlobalKey(),
    '#services': GlobalKey(),
    '#doctors': GlobalKey(),
    '#appointment': GlobalKey(),
    '#about': GlobalKey(),
    '#contact': GlobalKey(),
    '#training': GlobalKey(),
    '#map': GlobalKey(),
    '#branches': GlobalKey(),
  };
  bool _showBackToTop = false;

  static final _branches = [
    AppContent.branch1Location,
    AppContent.branch2Location,
  ];

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
    final isMobile = width < 800;

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
            // ── Hero ──────────────────────────────────────
            _MapHero(isMobile: isMobile),

            // ── Intro strip ───────────────────────────────
            _LocationIntro(isMobile: isMobile),

            // ── Both branch maps ──────────────────────────
            SizedBox(
              key: _sectionKeys['#map'],
              child: _BranchMapsSection(
                  isMobile: isMobile, branches: _branches),
            ),

            // ── CTA ───────────────────────────────────────
            _LocationCTA(isMobile: isMobile),

            // ── Footer ────────────────────────────────────
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
class _MapHero extends StatelessWidget {
  final bool isMobile;
  const _MapHero({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: isMobile ? 220 : 300,
          child: Image.network(
            'https://awcbd.org/wp-content/uploads/2024/12/AWC-Website-Banner-03.webp',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                Container(color: AppTheme.primaryDark),
          ),
        ),
        Container(
          width: double.infinity,
          height: isMobile ? 220 : 300,
          color: AppTheme.heroOverlay,
        ),
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Our Locations',
                style: (isMobile ? AppTheme.heading2 : AppTheme.heading1)
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Home  /  Locations',
                style: AppTheme.bodyMedium
                    .copyWith(color: Colors.white70),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Intro strip ─────────────────────────────────────────────
class _LocationIntro extends StatelessWidget {
  final bool isMobile;
  const _LocationIntro({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.primary,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 28 : 120,
        vertical: 40,
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        spacing: 40,
        runSpacing: 24,
        children: const [
          _IntroStat(icon: Icons.location_city, value: '2', label: 'Branches'),
          _IntroStat(icon: Icons.location_on, value: 'Dhaka', label: 'City'),
          _IntroStat(
              icon: Icons.access_time,
              value: '4 PM – 10 PM',
              label: 'Open Daily'),
          _IntroStat(
              icon: Icons.phone,
              value: '01568099036',
              label: 'Call Us'),
        ],
      ),
    );
  }
}

class _IntroStat extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  const _IntroStat(
      {required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white70, size: 22),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value,
                style:
                    AppTheme.heading4.copyWith(color: Colors.white)),
            Text(label,
                style:
                    AppTheme.bodySmall.copyWith(color: Colors.white70)),
          ],
        ),
      ],
    );
  }
}

// ── Both branch maps ─────────────────────────────────────────
class _BranchMapsSection extends StatelessWidget {
  final bool isMobile;
  final List<Map<String, dynamic>> branches;
  const _BranchMapsSection(
      {required this.isMobile, required this.branches});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.lightGrey,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: 60,
      ),
      child: Column(
        children: [
          SectionHeader(
            label: 'Chamber Locations',
            title: 'Visit Us at Our Branches',
            subtitle:
                'Both branches are located in easily accessible areas of Dhaka.',
          ),
          const SizedBox(height: 48),
          isMobile
              ? Column(
                  children: List.generate(
                    branches.length,
                    (i) => Padding(
                      padding: EdgeInsets.only(
                          bottom: i < branches.length - 1 ? 40 : 0),
                      child: _FullBranchCard(
                          branch: branches[i],
                          mapIndex: i,
                          isMobile: true),
                    ),
                  ),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    branches.length,
                    (i) => Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: i > 0 ? 20 : 0,
                          right: i < branches.length - 1 ? 20 : 0,
                        ),
                        child: _FullBranchCard(
                            branch: branches[i],
                            mapIndex: i,
                            isMobile: false),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class _FullBranchCard extends StatelessWidget {
  final Map<String, dynamic> branch;
  final int mapIndex;
  final bool isMobile;
  const _FullBranchCard(
      {required this.branch,
      required this.mapIndex,
      required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final phone = branch['phone'] as String? ?? '';
    final email = branch['email'] as String? ?? '';
    final address = branch['address'] as String? ?? '';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 24,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Map
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(18)),
            child: SizedBox(
              height: 320,
              child: MapIframeWidget(
                lat: branch['lat'] as double,
                lng: branch['lng'] as double,
                zoom: branch['zoom'] as int,
                viewId: 'page-branch-$mapIndex',
              ),
            ),
          ),

          // Info
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Branch name badge
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppTheme.accent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Branch ${mapIndex + 1}',
                    style: AppTheme.caption.copyWith(
                      color: AppTheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(branch['name'] as String,
                    style: AppTheme.heading3),
                const SizedBox(height: 16),
                _DetailRow(Icons.place_outlined, address),
                if (phone.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  _DetailRow(Icons.phone_outlined, phone,
                      url: 'tel:$phone'),
                ],
                if (email.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  _DetailRow(Icons.email_outlined, email,
                      url: 'mailto:$email'),
                ],
                const SizedBox(height: 20),
                _GetDirectionsBtn(branch: branch),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? url;
  const _DetailRow(this.icon, this.text, {this.url});

  @override
  Widget build(BuildContext context) {
    Future<void> tap() async {
      if (url == null) return;
      final uri = Uri.parse(url!);
      if (await canLaunchUrl(uri)) await launchUrl(uri);
    }

    return GestureDetector(
      onTap: url != null ? tap : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: AppTheme.primary),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: AppTheme.bodyMedium.copyWith(
                color: url != null ? AppTheme.primary : AppTheme.darkGrey,
                decoration:
                    url != null ? TextDecoration.underline : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GetDirectionsBtn extends StatefulWidget {
  final Map<String, dynamic> branch;
  const _GetDirectionsBtn({required this.branch});

  @override
  State<_GetDirectionsBtn> createState() => _GetDirectionsBtnState();
}

class _GetDirectionsBtnState extends State<_GetDirectionsBtn> {
  bool _hovered = false;

  Future<void> _open() async {
    final lat = widget.branch['lat'] as double;
    final lng = widget.branch['lng'] as double;
    final uri = Uri.parse(
        'https://www.google.com/maps/dir/?api=1&destination=$lat,$lng');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: _open,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: _hovered ? AppTheme.primaryDark : AppTheme.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.directions, color: Colors.white, size: 18),
              const SizedBox(width: 8),
              Text('Get Directions', style: AppTheme.buttonText),
            ],
          ),
        ),
      ),
    );
  }
}

// ── CTA ─────────────────────────────────────────────────────
class _LocationCTA extends StatelessWidget {
  final bool isMobile;
  const _LocationCTA({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppTheme.dark,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 28 : 120,
        vertical: 56,
      ),
      child: Column(
        children: [
          Text(
            'Need Help Finding Us?',
            style: AppTheme.heading2.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            "Call us and we'll guide you to the nearest branch.",
            style: AppTheme.bodyLarge.copyWith(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.phone, color: Colors.white, size: 20),
              const SizedBox(width: 10),
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
