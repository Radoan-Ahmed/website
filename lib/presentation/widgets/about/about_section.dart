import 'package:flutter/material.dart';
import '../../../core/constants/app_content.dart';
import '../../../core/theme/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80, vertical: 60),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextContent(),
                const SizedBox(height: 40),
                _buildImage(),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: _buildTextContent()),
                const SizedBox(width: 60),
                Expanded(child: _buildImage()),
              ],
            ),
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionLabel(label: 'About Us'),
        const SizedBox(height: 16),
        Text(AppContent.aboutTitle, style: AppTheme.heading2),
        const SizedBox(height: 20),
        Text(AppContent.aboutBody, style: AppTheme.bodyLarge),
        const SizedBox(height: 24),
        // Text(AppContent.aboutSubtitle,
        //     style: AppTheme.heading4.copyWith(color: AppTheme.primary)),
        // const SizedBox(height: 16),
        // _FeatureGrid(features: AppContent.aboutFeatures),
      ],
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        AppContent.aboutImage,
        fit: BoxFit.cover,
        height: 400,
        width: double.infinity,
        errorBuilder: (_, __, ___) => Container(
          height: 400,
          decoration: BoxDecoration(
            color: AppTheme.accent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(Icons.local_hospital,
              size: 80, color: AppTheme.primary),
        ),
      ),
    );
  }
}

class _FeatureGrid extends StatelessWidget {
  final List<String> features;
  const _FeatureGrid({required this.features});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 12,
      children: features
          .map((f) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: AppTheme.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(f, style: AppTheme.bodyMedium),
                ],
              ))
          .toList(),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 2,
          color: AppTheme.primary,
        ),
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
