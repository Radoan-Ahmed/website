import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/models.dart';

class FeaturesSection extends StatelessWidget {
  final List<FeatureModel> features;
  const FeaturesSection({super.key, required this.features});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 40, vertical: 0),
      transform: Matrix4.translationValues(0, -40, 0),
      child: isMobile
          ? Column(
              children: features
                  .map((f) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _FeatureCard(feature: f),
                      ))
                  .toList(),
            )
          : Row(
              children: features
                  .map((f) => Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: features.indexOf(f) == 1 ? 12 : 0),
                          child: _FeatureCard(feature: f),
                        ),
                      ))
                  .toList(),
            ),
    );
  }
}

class _FeatureCard extends StatefulWidget {
  final FeatureModel feature;
  const _FeatureCard({required this.feature});

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: _hovered ? AppTheme.primary : AppTheme.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _hovered
                    ? Colors.white.withOpacity(0.2)
                    : AppTheme.accent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(
                widget.feature.icon,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Icon(
                  Icons.medical_services,
                  color: _hovered ? Colors.white : AppTheme.primary,
                  size: 28,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.feature.title,
                    style: AppTheme.heading4.copyWith(
                      color: _hovered ? Colors.white : AppTheme.dark,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.feature.description,
                    style: AppTheme.bodySmall.copyWith(
                      color: _hovered
                          ? Colors.white70
                          : AppTheme.darkGrey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      '${widget.feature.linkText} →',
                      style: AppTheme.bodySmall.copyWith(
                        color:
                            _hovered ? Colors.white : AppTheme.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
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
