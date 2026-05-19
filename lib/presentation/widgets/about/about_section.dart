import 'package:flutter/material.dart';
import '../../../core/constants/app_content.dart';
import '../../../core/theme/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _AboutIntroBlock(),
        _VisionBlock(),
        _MissionBlock(),
        _AdvantageBlock(),
      ],
    );
  }
}

// ── 1. About Us intro (two-column) ──────────────────────────
class _AboutIntroBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Container(
      color: AppTheme.white,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 70,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _textContent(),
                const SizedBox(height: 40),
                _image(),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: _textContent()),
                const SizedBox(width: 60),
                Expanded(child: _image()),
              ],
            ),
    );
  }

  Widget _textContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionLabel(label: 'About Us'),
        const SizedBox(height: 16),
        Text(AppContent.aboutTitle, style: AppTheme.heading2),
        const SizedBox(height: 20),
        Text(AppContent.aboutBody, style: AppTheme.bodyLarge),
      ],
    );
  }

  Widget _image() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        AppContent.aboutImage,
        fit: BoxFit.cover,
        height: 420,
        width: double.infinity,
        errorBuilder: (_, __, ___) => Container(
          height: 420,
          decoration: BoxDecoration(
            color: AppTheme.accent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(Icons.local_hospital, size: 80, color: AppTheme.primary),
        ),
      ),
    );
  }
}

// ── 2. Vision (full-width accent block) ──────────────────────
class _VisionBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Container(
      color: AppTheme.primary,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 28 : 120,
        vertical: 64,
      ),
      child: Column(
        children: [
          // Icon + label
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.visibility_outlined,
                color: Colors.white, size: 34),
          ),
          const SizedBox(height: 20),
          Text(
            AppContent.visionTitle.toUpperCase(),
            style: AppTheme.caption.copyWith(
              color: Colors.white70,
              letterSpacing: 3,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 820),
            child: Text(
              AppContent.visionBody,
              style: AppTheme.bodyLarge.copyWith(
                color: Colors.white,
                height: 1.85,
                fontSize: 17,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

// ── 3. Mission + 4 commitment cards ──────────────────────────
class _MissionBlock extends StatelessWidget {
  static const _icons = <String, IconData>{
    'clinical': Icons.verified_outlined,
    'scientific': Icons.biotech_outlined,
    'empathetic': Icons.favorite_border,
    'educational': Icons.school_outlined,
  };

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;
    final crossAxisCount = isMobile ? 1 : (width < 1100 ? 2 : 4);

    return Container(
      color: AppTheme.lightGrey,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 70,
      ),
      child: Column(
        children: [
          // Header
          _SectionLabel(label: 'Mission'),
          const SizedBox(height: 16),
          Text(AppContent.missionTitle, style: AppTheme.heading2),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Text(
              AppContent.missionBody,
              style: AppTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 48),

          // Commitment cards
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: isMobile ? 3.2 : 0.88,
            ),
            itemCount: AppContent.missionCommitments.length,
            itemBuilder: (ctx, i) {
              final c = AppContent.missionCommitments[i];
              final iconKey = c['icon'] ?? 'clinical';
              final icon = _icons[iconKey] ?? Icons.star_outline;
              return _CommitmentCard(
                icon: icon,
                title: c['title']!,
                description: c['description']!,
                index: i,
                isMobile: isMobile,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CommitmentCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final int index;
  final bool isMobile;

  const _CommitmentCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.index,
    required this.isMobile,
  });

  @override
  State<_CommitmentCard> createState() => _CommitmentCardState();
}

class _CommitmentCardState extends State<_CommitmentCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 240),
        decoration: BoxDecoration(
          color: _hovered ? AppTheme.primary : Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _hovered ? 0.12 : 0.05),
              blurRadius: _hovered ? 28 : 12,
              offset: Offset(0, _hovered ? 10 : 4),
            ),
          ],
        ),
        transform: _hovered
            ? (Matrix4.identity()..translate(0.0, -5.0))
            : Matrix4.identity(),
        padding: EdgeInsets.all(widget.isMobile ? 16 : 24),
        child: widget.isMobile
            ? Row(
                children: [
                  _iconBox(),
                  const SizedBox(width: 16),
                  Expanded(child: _textContent()),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _iconBox(),
                  const SizedBox(height: 20),
                  _textContent(),
                ],
              ),
      ),
    );
  }

  Widget _iconBox() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 240),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _hovered
            ? Colors.white.withValues(alpha: 0.15)
            : AppTheme.accent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(widget.icon,
          size: 26, color: _hovered ? Colors.white : AppTheme.primary),
    );
  }

  Widget _textContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppTheme.heading4.copyWith(
            color: _hovered ? Colors.white : AppTheme.dark,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.description,
          style: AppTheme.bodySmall.copyWith(
            color: _hovered
                ? Colors.white.withValues(alpha: 0.85)
                : AppTheme.mediumGrey,
            height: 1.6,
          ),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

// ── 4. Advantages ────────────────────────────────────────────
class _AdvantageBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Container(
      color: AppTheme.sectionBg,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 70,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _advantageText(isMobile),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _quotePanel()),
                const SizedBox(width: 60),
                Expanded(child: _advantageText(isMobile)),
              ],
            ),
    );
  }

  Widget _quotePanel() {
    return Container(
      padding: const EdgeInsets.all(36),
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.format_quote_rounded,
              color: Colors.white54, size: 48),
          const SizedBox(height: 16),
          Text(
            AppContent.advantageQuote,
            style: AppTheme.bodyLarge.copyWith(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              height: 1.9,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            width: 48,
            height: 3,
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            AppContent.clinicName,
            style: AppTheme.bodyMedium.copyWith(
              color: Colors.white70,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _advantageText(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionLabel(label: 'Why Choose Us'),
        const SizedBox(height: 14),
        Text(AppContent.advantageTitle, style: AppTheme.heading2),
        const SizedBox(height: 28),
        ...AppContent.advantages.asMap().entries.map(
              (e) => _AdvantageItem(text: e.value, index: e.key),
            ),
      ],
    );
  }
}

class _AdvantageItem extends StatelessWidget {
  final String text;
  final int index;
  const _AdvantageItem({required this.text, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppTheme.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '${index + 1}',
                style: AppTheme.caption.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(text, style: AppTheme.bodyMedium),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Shared helpers ───────────────────────────────────────────
class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 32, height: 2, color: AppTheme.primary),
        const SizedBox(width: 10),
        Text(
          label.toUpperCase(),
          style: AppTheme.caption.copyWith(
            color: AppTheme.primary,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }
}
