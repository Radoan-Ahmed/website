import 'package:flutter/material.dart';
import '../../../core/constants/app_content.dart';
import '../../../core/theme/app_theme.dart';
import '../services/services_section.dart';

class TrainingSection extends StatelessWidget {
  final VoidCallback? onViewAllTap;
  const TrainingSection({super.key, this.onViewAllTap});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;
    final crossAxisCount = isMobile ? 1 : (width < 1100 ? 2 : 4);

    return Container(
      color: AppTheme.white,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 70,
      ),
      child: Column(
        children: [
          SectionHeader(
            label: 'Training',
            title: AppContent.trainingSectionTitle,
            subtitle: AppContent.trainingSectionSubtitle,
          ),
          const SizedBox(height: 48),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: isMobile ? 1.1 : 0.72,
            ),
            itemCount: AppContent.trainings.length,
            itemBuilder: (ctx, i) =>
                _TrainingCard(training: AppContent.trainings[i]),
          ),
          const SizedBox(height: 40),
          // _ViewAllButton(onTap: onViewAllTap),
        ],
      ),
    );
  }
}

class _TrainingCard extends StatefulWidget {
  final Map<String, dynamic> training;
  const _TrainingCard({required this.training});

  @override
  State<_TrainingCard> createState() => _TrainingCardState();
}

class _TrainingCardState extends State<_TrainingCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final t = widget.training;
    final highlights = t['highlights'] as List<dynamic>;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: _hovered ? AppTheme.primary : AppTheme.divider,
            width: _hovered ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _hovered ? 0.12 : 0.05),
              blurRadius: _hovered ? 28 : 12,
              offset: Offset(0, _hovered ? 10 : 4),
            ),
          ],
        ),
        transform: _hovered
            ? (Matrix4.identity()..translate(0.0, -6.0))
            : Matrix4.identity(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(13)),
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: Image.network(
                  t['image'] as String,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: AppTheme.accent,
                    child: Icon(Icons.school,
                        size: 48, color: AppTheme.primary),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Meta chips
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [
                        _Chip(Icons.access_time_rounded, t['duration'] as String),
                        _Chip(Icons.signal_cellular_alt, t['level'] as String),
                        _Chip(Icons.event_seat_outlined, t['seats'] as String,
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
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Highlights preview
                    ...highlights.take(3).map(
                          (h) => Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.check_circle,
                                    size: 14, color: AppTheme.primary),
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
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => _showDetail(context),
                      child: Row(
                        children: [
                          Text(
                            'Learn More',
                            style: AppTheme.bodySmall.copyWith(
                              color: AppTheme.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(Icons.arrow_forward,
                              size: 14, color: AppTheme.primary),
                        ],
                      ),
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

  void _showDetail(BuildContext context) {
    final t = widget.training;
    final highlights = t['highlights'] as List<dynamic>;

    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                  child: SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: Image.network(
                      t['image'] as String,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: AppTheme.accent,
                        child: Icon(Icons.school,
                            size: 48, color: AppTheme.primary),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(t['title'] as String, style: AppTheme.heading3),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _Chip(Icons.access_time_rounded,
                              t['duration'] as String),
                          _Chip(Icons.signal_cellular_alt, t['level'] as String),
                          _Chip(Icons.event_seat_outlined, t['seats'] as String,
                              color: AppTheme.primary),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(t['description'] as String,
                          style: AppTheme.bodyMedium),
                      const SizedBox(height: 16),
                      Text('What You Will Learn',
                          style: AppTheme.heading4),
                      const SizedBox(height: 10),
                      ...highlights.map(
                        (h) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.check_circle,
                                  size: 16, color: AppTheme.primary),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(h as String,
                                    style: AppTheme.bodyMedium),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: TextButton.styleFrom(
                            foregroundColor: AppTheme.primary,
                          ),
                          child: const Text('Close'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  const _Chip(this.icon, this.label, {this.color});

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
              style: AppTheme.caption.copyWith(
                  color: c, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _ViewAllButton extends StatefulWidget {
  final VoidCallback? onTap;
  const _ViewAllButton({this.onTap});

  @override
  State<_ViewAllButton> createState() => _ViewAllButtonState();
}

class _ViewAllButtonState extends State<_ViewAllButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding:
              const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
          decoration: BoxDecoration(
            color: _hovered ? AppTheme.primaryDark : AppTheme.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text('View All Training Programs',
              style: AppTheme.buttonText.copyWith(fontSize: 14)),
        ),
      ),
    );
  }
}
