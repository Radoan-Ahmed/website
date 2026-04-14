import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_content.dart';
import '../../../core/theme/app_theme.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Column(
      children: [
        Container(
          color: AppTheme.footerBg,
          padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 80, vertical: 60),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBrandCol(),
                    const SizedBox(height: 40),
                    _buildServicesCol(),
                    const SizedBox(height: 40),
                    _buildBranchCol(
                        'Dhanmondi Clinic', AppContent.footerBranch1),
                    const SizedBox(height: 40),
                    _buildBranchCol(
                        'Bashundhara R/A Clinic', AppContent.footerBranch2),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: _buildBrandCol()),
                    const SizedBox(width: 40),
                    Expanded(flex: 2, child: _buildServicesCol()),
                    const SizedBox(width: 40),
                    Expanded(
                        flex: 2,
                        child: _buildBranchCol(
                            'Dhanmondi Clinic', AppContent.footerBranch1)),
                    const SizedBox(width: 40),
                    Expanded(
                        flex: 2,
                        child: _buildBranchCol('Bashundhara R/A Clinic',
                            AppContent.footerBranch2)),
                  ],
                ),
        ),
        // Bottom bar
        Container(
          color: AppTheme.primaryDark,
          padding:
              const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppContent.copyright,
                  style: GoogleFonts.lato(
                      color: Colors.white54, fontSize: 13)),
              Text(AppContent.footerLicense,
                  style: GoogleFonts.lato(
                      color: Colors.white54, fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBrandCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          AppContent.whiteLogoUrl,
          height: 50,
          errorBuilder: (_, __, ___) => Text(
            AppContent.clinicName,
            style: GoogleFonts.playfairDisplay(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          AppContent.footerAbout,
          style: GoogleFonts.lato(
              color: Colors.white60, fontSize: 13, height: 1.7),
        ),
        const SizedBox(height: 20),
        Text(
          AppContent.footerLicense,
          style: GoogleFonts.lato(
              color: Colors.white38, fontSize: 11,
              fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 20),
        Row(
          children: AppContent.socialLinks
              .map((s) => _SocialButton(label: s['label']!, url: s['url']!))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildServicesCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FooterTitle('Services'),
        const SizedBox(height: 16),
        ...AppContent.footerServices
            .map((s) => _FooterLink(label: s['label']!)),
      ],
    );
  }

  Widget _buildBranchCol(
      String title, List<Map<String, String>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FooterTitle(title),
        const SizedBox(height: 16),
        ...items.map((item) => _FooterContactItem(
              icon: _iconFromType(item['icon']!),
              text: item['text']!,
            )),
      ],
    );
  }

  IconData _iconFromType(String type) {
    switch (type) {
      case 'email':
        return Icons.email_outlined;
      case 'phone':
        return Icons.phone_outlined;
      default:
        return Icons.location_on_outlined;
    }
  }
}

class _FooterTitle extends StatelessWidget {
  final String title;
  const _FooterTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.playfairDisplay(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Container(width: 36, height: 2, color: AppTheme.primaryLight),
      ],
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String label;
  const _FooterLink({required this.label});

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Icon(Icons.chevron_right,
                  size: 14,
                  color: _hovered
                      ? AppTheme.primaryLight
                      : Colors.white38),
              const SizedBox(width: 6),
              Text(
                widget.label,
                style: GoogleFonts.lato(
                  color:
                      _hovered ? AppTheme.primaryLight : Colors.white60,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterContactItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const _FooterContactItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 15, color: AppTheme.primaryLight),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.lato(
                  color: Colors.white60, fontSize: 13, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialButton extends StatefulWidget {
  final String label;
  final String url;
  const _SocialButton({required this.label, required this.url});

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _hovered = false;

  IconData get _icon {
    switch (widget.label.toLowerCase()) {
      case 'facebook':
        return Icons.facebook;
      case 'youtube':
        return Icons.play_circle_outline;
      case 'instagram':
        return Icons.camera_alt_outlined;
      case 'linkedin':
        return Icons.work_outline;
      default:
        return Icons.link;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: _hovered
                ? AppTheme.primaryLight
                : Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(_icon, color: Colors.white, size: 18),
        ),
      ),
    );
  }
}
