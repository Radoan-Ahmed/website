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
    final crossAxisCount = isMobile ? 1 : (width < 1000 ? 2 : 4);

    return Container(
      color: AppTheme.lightGrey,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80, vertical: 70),
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
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.9,
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
              color: Colors.black.withOpacity(_hovered ? 0.12 : 0.05),
              blurRadius: _hovered ? 30 : 15,
              offset: Offset(0, _hovered ? 10 : 4),
            ),
          ],
        ),
        transform: _hovered
            ? (Matrix4.identity()..translate(0.0, -6.0))
            : Matrix4.identity(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12)),
              child: Container(
                height: 180,
                width: double.infinity,
                color: AppTheme.accent,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/doctor_image.jpeg',
                      fit: BoxFit.cover,
                    ),
                    if (_hovered)
                      Container(
                        color: AppTheme.primary.withOpacity(0.1),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.doctor.name,
                      style: AppTheme.heading4.copyWith(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.doctor.qualification,
                      style: AppTheme.bodySmall,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: 32,
                      height: 2,
                      color: _hovered
                          ? AppTheme.primary
                          : AppTheme.divider,
                    ),
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
