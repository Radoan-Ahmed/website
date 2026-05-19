import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/app_content.dart';
import '../../../core/theme/app_theme.dart';
import '../services/services_section.dart';
import 'map_iframe_widget.dart';

class MapSection extends StatefulWidget {
  final VoidCallback? onViewFullMapTap;
  const MapSection({super.key, this.onViewFullMapTap});

  @override
  State<MapSection> createState() => _MapSectionState();
}

class _MapSectionState extends State<MapSection> {
  int _selectedBranch = 0;

  static final _branches = [
    AppContent.branch1Location,
    // AppContent.branch2Location,
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;
    final branch = _branches[_selectedBranch];

    return Container(
      color: AppTheme.sectionBg,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 70,
      ),
      child: Column(
        children: [
          SectionHeader(
            label: 'Our Locations',
            title: 'Find Our Chambers',
            subtitle:
                'We have two convenient branches in Dhaka. Select a branch to see its exact location on the map.',
          ),
          const SizedBox(height: 36),

          // ── Branch tabs ────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_branches.length, (i) {
              final selected = i == _selectedBranch;
              return GestureDetector(
                onTap: () => setState(() => _selectedBranch = i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 22, vertical: 10),
                  decoration: BoxDecoration(
                    color: selected ? AppTheme.primary : Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: selected ? AppTheme.primary : AppTheme.divider,
                    ),
                    boxShadow: selected
                        ? [
                            BoxShadow(
                              color: AppTheme.primary
                                  .withValues(alpha: 0.25),
                              blurRadius: 14,
                              offset: const Offset(0, 4),
                            )
                          ]
                        : [],
                  ),
                  child: Text(
                    _branches[i]['name'] as String,
                    style: AppTheme.bodyMedium.copyWith(
                      color: selected ? Colors.white : AppTheme.dark,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 32),

          // ── Map + Info ─────────────────────────────────────
          isMobile
              ? Column(
                  children: [
                    _MapFrame(branch: branch, mapIndex: _selectedBranch),
                    const SizedBox(height: 24),
                    _BranchInfoCard(branch: branch),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: _MapFrame(
                          branch: branch, mapIndex: _selectedBranch),
                    ),
                    const SizedBox(width: 28),
                    Expanded(
                      flex: 2,
                      child: _BranchInfoCard(branch: branch),
                    ),
                  ],
                ),
          const SizedBox(height: 32),

          // ── View full map button ───────────────────────────
          // _OutlineButton(
          //   label: 'View Full Map Page',
          //   icon: Icons.map_outlined,
          //   onTap: widget.onViewFullMapTap,
          // ),
        ],
      ),
    );
  }
}

// ── Map frame ───────────────────────────────────────────────
class _MapFrame extends StatelessWidget {
  final Map<String, dynamic> branch;
  final int mapIndex;
  const _MapFrame({required this.branch, required this.mapIndex});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 380,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.10),
              blurRadius: 24,
              offset: const Offset(0, 8),
            )
          ],
        ),
        child: MapIframeWidget(
          lat: branch['lat'] as double,
          lng: branch['lng'] as double,
          zoom: branch['zoom'] as int,
          viewId: 'section-branch-$mapIndex',
        ),
      ),
    );
  }
}

// ── Branch info card ─────────────────────────────────────────
class _BranchInfoCard extends StatelessWidget {
  final Map<String, dynamic> branch;
  const _BranchInfoCard({required this.branch});

  @override
  Widget build(BuildContext context) {
    final phone = branch['phone'] as String? ?? '';
    final email = branch['email'] as String? ?? '';
    final address = branch['address'] as String? ?? '';

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.divider),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 16,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.accent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.location_on,
                    color: AppTheme.primary, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(branch['name'] as String,
                    style: AppTheme.heading4),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _InfoRow(Icons.place_outlined, address),
          if (phone.isNotEmpty) ...[
            const SizedBox(height: 14),
            _InfoRow(Icons.phone_outlined, phone,
                onTap: () => _launch('tel:$phone')),
          ],
          if (email.isNotEmpty) ...[
            const SizedBox(height: 14),
            _InfoRow(Icons.email_outlined, email,
                onTap: () => _launch('mailto:$email')),
          ],
          const SizedBox(height: 24),
          _DirectionsButton(branch: branch),
        ],
      ),
    );
  }

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  const _InfoRow(this.icon, this.text, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: AppTheme.primary),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: AppTheme.bodyMedium.copyWith(
                color: onTap != null ? AppTheme.primary : AppTheme.darkGrey,
                decoration: onTap != null
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DirectionsButton extends StatefulWidget {
  final Map<String, dynamic> branch;
  const _DirectionsButton({required this.branch});

  @override
  State<_DirectionsButton> createState() => _DirectionsButtonState();
}

class _DirectionsButtonState extends State<_DirectionsButton> {
  bool _hovered = false;

  Future<void> _openDirections() async {
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
        onTap: _openDirections,
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

class _OutlineButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onTap;
  const _OutlineButton(
      {required this.label, required this.icon, this.onTap});

  @override
  State<_OutlineButton> createState() => _OutlineButtonState();
}

class _OutlineButtonState extends State<_OutlineButton> {
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
              const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
          decoration: BoxDecoration(
            color: _hovered ? AppTheme.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppTheme.primary, width: 2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon,
                  size: 18,
                  color: _hovered ? Colors.white : AppTheme.primary),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: AppTheme.buttonText.copyWith(
                  color: _hovered ? Colors.white : AppTheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
