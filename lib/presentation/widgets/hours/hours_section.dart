import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_content.dart';
import '../../../core/theme/app_theme.dart';

class HoursSection extends StatelessWidget {
  const HoursSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Container(
      color: AppTheme.white,
      child: isMobile
          ? Column(
              children: [
                _buildImage(),
                _buildHoursContent(),
              ],
            )
          : Row(
              children: [
                Expanded(child: _buildImage()),
                Expanded(child: _buildHoursContent()),
              ],
            ),
    );
  }

  Widget _buildImage() {
    return Image.network(
      AppContent.hoursImage,
      fit: BoxFit.cover,
      height: 500,
      width: double.infinity,
      errorBuilder: (_, __, ___) => Container(
        height: 500,
        color: AppTheme.primaryDark,
        child: const Icon(Icons.local_hospital,
            size: 80, color: Colors.white),
      ),
    );
  }

  Widget _buildHoursContent() {
    return Container(
      padding: const EdgeInsets.all(48),
      color: AppTheme.footerBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppContent.hoursSectionTitle,
            style: AppTheme.heading3
                .copyWith(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 8),
          Container(width: 48, height: 3, color: AppTheme.primaryLight),
          const SizedBox(height: 24),
          Text(
            AppContent.hoursSubtitle,
            style: AppTheme.heading2.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 12),
          Text(
            AppContent.hoursDescription,
            style: AppTheme.bodyMedium.copyWith(color: Colors.white60),
          ),
          const SizedBox(height: 32),
          ...AppContent.clinicHours.map((entry) => _HoursRow(
                day: entry['day']!,
                hours: entry['hours']!,
              )),
        ],
      ),
    );
  }
}

class _HoursRow extends StatelessWidget {
  final String day;
  final String hours;
  const _HoursRow({required this.day, required this.hours});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: GoogleFonts.lato(
                color: Colors.white70,
                fontWeight: FontWeight.w600,
                fontSize: 14),
          ),
          Text(
            hours,
            style: GoogleFonts.lato(
                color: AppTheme.primaryLight,
                fontWeight: FontWeight.w600,
                fontSize: 14),
          ),
        ],
      ),
    );
  }
}
