import 'package:flutter/material.dart';
import '../../../core/constants/app_content.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/models.dart';
import '../services/services_section.dart';

class DoctorsSection extends StatelessWidget {
  final List<DoctorModel> doctors;
  const DoctorsSection({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;
    final crossAxisCount = isMobile ? 1 : (width < 1000 ? 2 : 3);

    return Container(
      color: AppTheme.lightGrey,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 70,
      ),
      child: Column(
        children: [
          SectionHeader(
            label: 'Our Doctors',
            title: AppContent.doctorsSectionTitle,
            subtitle: AppContent.doctorsSectionSubtitle,
          ),
          const SizedBox(height: 48),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              mainAxisExtent: 620,
            ),
            itemCount: doctors.length,
            itemBuilder: (ctx, i) => _DoctorCard(doctor: doctors[i]),
          ),
        ],
      ),
    );
  }
}

class _DoctorCard extends StatefulWidget {
  final DoctorModel doctor;
  const _DoctorCard({required this.doctor});

  @override
  State<_DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<_DoctorCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final doc = widget.doctor;
    final qualLines = doc.qualification
        .split('\n')
        .where((l) => l.trim().isNotEmpty)
        .toList();
    final designLines = doc.designation
        .split('\n')
        .where((l) => l.trim().isNotEmpty)
        .toList();
    final roleLines = doc.role
        .split('\n')
        .where((l) => l.trim().isNotEmpty)
        .toList();

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _hovered ? 0.12 : 0.05),
              blurRadius: _hovered ? 32 : 14,
              offset: Offset(0, _hovered ? 12 : 4),
            ),
          ],
        ),
        transform: _hovered
            ? (Matrix4.identity()..translate(0.0, -6.0))
            : Matrix4.identity(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Image ──────────────────────────────────────
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Stack(
                children: [
                  Container(
                    height: 270,
                    width: double.infinity,
                    color: AppTheme.accent,
                    child: Image.asset(
                      doc.image,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => Container(
                        color: AppTheme.accent,
                        child: Icon(
                          Icons.person,
                          size: 64,
                          color: AppTheme.primary,
                        ),
                      ),
                    ),
                  ),
                  // Gradient overlay at bottom of image for smooth transition
                  // Positioned(
                  //   bottom: 0,
                  //   left: 0,
                  //   right: 0,
                  //   child: Container(
                  //     height: 60,
                  //     decoration: BoxDecoration(
                  //       gradient: LinearGradient(
                  //         begin: Alignment.topCenter,
                  //         end: Alignment.bottomCenter,
                  //         colors: [
                  //           Colors.transparent,
                  //           AppTheme.white.withValues(alpha: 0.95),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),

            // ── Info ───────────────────────────────────────
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    Text(
                      doc.name,
                      style: AppTheme.heading4.copyWith(
                        color: AppTheme.primary,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Qualifications block
                    if (qualLines.isNotEmpty) ...[
                      _BlockLabel(label: 'Qualifications'),
                      const SizedBox(height: 6),
                      ...qualLines.map(
                        (line) => _InfoLine(text: line),
                      ),
                      const SizedBox(height: 10),
                    ],

                    // Divider
                    _ThinDivider(),
                    const SizedBox(height: 10),

                    // Designation / Institution block
                    if (designLines.isNotEmpty) ...[
                      _BlockLabel(label: 'Position & Institution'),
                      const SizedBox(height: 6),
                      ...designLines.map(
                        (line) => _InfoLine(text: line),
                      ),
                      const SizedBox(height: 10),
                    ],

                    // Role at AcuLife block
                    if (roleLines.isNotEmpty) ...[
                      _ThinDivider(),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 3,
                            height: 36,
                            decoration: BoxDecoration(
                              color: AppTheme.primary,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: roleLines
                                  .map((line) => Text(
                                        line,
                                        style: AppTheme.bodySmall.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: AppTheme.dark,
                                          height: 1.6,
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Helpers ─────────────────────────────────────────────────
class _BlockLabel extends StatelessWidget {
  final String label;
  const _BlockLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: AppTheme.caption.copyWith(
        color: AppTheme.primary,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
        fontSize: 10,
      ),
    );
  }
}

class _InfoLine extends StatelessWidget {
  final String text;
  const _InfoLine({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                color: AppTheme.mediumGrey,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 7),
          Expanded(
            child: Text(
              text,
              style: AppTheme.bodySmall.copyWith(height: 1.55),
            ),
          ),
        ],
      ),
    );
  }
}

class _ThinDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.primary.withValues(alpha: 0.4), Colors.transparent],
        ),
      ),
    );
  }
}
