import 'package:flutter/material.dart';
import '../../../core/constants/app_content.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/models.dart';
import '../about/about_section.dart';

class ServicesSection extends StatelessWidget {
  final List<ServiceModel> services;
  const ServicesSection({super.key, required this.services});

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
          _SectionHeader(
            label: 'Our Services',
            title: AppContent.servicesSectionTitle,
            subtitle: AppContent.servicesSectionSubtitle,
          ),
          const SizedBox(height: 48),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 0.85,
            ),
            itemCount: services.length,
            itemBuilder: (ctx, i) => _ServiceCard(service: services[i]),
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final ServiceModel service;
  const _ServiceCard({required this.service});

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_hovered ? 0.12 : 0.06),
              blurRadius: _hovered ? 30 : 15,
              offset: Offset(0, _hovered ? 12 : 5),
            ),
          ],
        ),
        transform:
            _hovered
                ? (Matrix4.identity()..translate(0.0, -6.0))
                : Matrix4.identity(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: SizedBox(
                height: 180,
                width: double.infinity,
                child: Image.network(
                  widget.service.image,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (_, __, ___) => Container(
                        color: AppTheme.accent,
                        child: Icon(
                          Icons.medical_services,
                          size: 50,
                          color: AppTheme.primary,
                        ),
                      ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.service.title, style: AppTheme.heading4),
                  const SizedBox(height: 10),
                  Text(
                    widget.service.description,
                    style: AppTheme.bodySmall,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 14),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text(
                            widget.service.title,
                            style: AppTheme.heading4,
                          ),
                          content: SingleChildScrollView(
                            child: Text(
                              widget.service.description,
                              style: AppTheme.bodyMedium,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text(
                                'Close',
                                style: TextStyle(color: AppTheme.primary),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          'Read More',
                          style: AppTheme.bodySmall.copyWith(
                            color: AppTheme.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward,
                          size: 14,
                          color: AppTheme.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Reusable Section Header ─────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String label;
  final String title;
  final String subtitle;

  const _SectionHeader({
    required this.label,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
            const SizedBox(width: 10),
            Container(width: 32, height: 2, color: AppTheme.primary),
          ],
        ),
        const SizedBox(height: 12),
        Text(title, style: AppTheme.heading2, textAlign: TextAlign.center),
        const SizedBox(height: 12),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Text(
            subtitle,
            style: AppTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

// Export for reuse
class SectionHeader extends _SectionHeader {
  const SectionHeader({
    required super.label,
    required super.title,
    required super.subtitle,
  });
}
