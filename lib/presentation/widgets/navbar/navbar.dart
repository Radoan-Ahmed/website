import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_content.dart';
import '../../../core/theme/app_theme.dart';

class NavBar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback onAppointmentTap;
  final Map<String, GlobalKey> sectionKeys;

  const NavBar({
    super.key,
    required this.onAppointmentTap,
    required this.sectionKeys,
  });

  @override
  Size get preferredSize => const Size.fromHeight(120);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _isScrolled = false;
  bool _mobileMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Material(
      elevation: _isScrolled ? 4 : 0,
      color: AppTheme.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top bar
          Container(
            color: AppTheme.primary,
            padding:
                const EdgeInsets.symmetric(horizontal: 32, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppContent.clinicTagline,
                  style: GoogleFonts.lato(
                    fontSize: 12,
                    color: Colors.white70,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.phone, color: Colors.white, size: 14),
                    const SizedBox(width: 6),
                    Text(
                      AppContent.phone,
                      style: GoogleFonts.lato(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Main nav
          Container(
            color: AppTheme.white,
            padding:
                const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            child: Row(
              children: [
                // Logo
                Image.network(
                  AppContent.logoUrl,
                  height: 55,
                  errorBuilder: (_, __, ___) => Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppTheme.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.local_hospital,
                            color: Colors.white, size: 22),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'AWC',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                if (!isMobile)
                  Row(
                    children: [
                      ..._buildNavItems(),
                      const SizedBox(width: 20),
                      _AppointmentButton(
                          onTap: widget.onAppointmentTap),
                    ],
                  )
                else
                  Row(
                    children: [
                      _AppointmentButton(onTap: widget.onAppointmentTap),
                      const SizedBox(width: 12),
                      IconButton(
                        icon: Icon(
                          _mobileMenuOpen ? Icons.close : Icons.menu,
                          color: AppTheme.dark,
                        ),
                        onPressed: () => setState(
                            () => _mobileMenuOpen = !_mobileMenuOpen),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          if (isMobile && _mobileMenuOpen) _MobileMenu(sectionKeys: widget.sectionKeys),
        ],
      ),
    );
  }

  List<Widget> _buildNavItems() {
    return AppContent.navLinks.map((link) {
      final hasChildren = link['children'] != null;
      if (hasChildren) {
        return _DropdownNavItem(link: link);
      }
      return _NavItem(
        label: link['label']!,
        onTap: () => _scrollTo(link['url']!),
      );
    }).toList();
  }

  void _scrollTo(String url) {
    final key = widget.sectionKeys[url];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavItem({required this.label, required this.onTap});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: AppTheme.navLabel.copyWith(
                  color: _hovered ? AppTheme.primary : AppTheme.dark,
                ),
              ),
              const SizedBox(height: 2),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: _hovered ? 30 : 0,
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DropdownNavItem extends StatefulWidget {
  final Map<String, dynamic> link;
  const _DropdownNavItem({required this.link});

  @override
  State<_DropdownNavItem> createState() => _DropdownNavItemState();
}

class _DropdownNavItemState extends State<_DropdownNavItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Text(
                  widget.link['label'],
                  style: AppTheme.navLabel.copyWith(
                    color: _hovered ? AppTheme.primary : AppTheme.dark,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(Icons.keyboard_arrow_down,
                    size: 16,
                    color: _hovered ? AppTheme.primary : AppTheme.darkGrey),
              ],
            ),
          ),
          if (_hovered)
            Positioned(
              top: 36,
              left: 0,
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: (widget.link['children']
                            as List<Map<String, String>>)
                        .map((child) => _DropdownItem(label: child['label']!))
                        .toList(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _DropdownItem extends StatefulWidget {
  final String label;
  const _DropdownItem({required this.label});
  @override
  State<_DropdownItem> createState() => _DropdownItemState();
}

class _DropdownItemState extends State<_DropdownItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Container(
        width: 180,
        color: _hovered ? AppTheme.accent : Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Text(widget.label, style: AppTheme.bodyMedium),
      ),
    );
  }
}

class _AppointmentButton extends StatefulWidget {
  final VoidCallback onTap;
  const _AppointmentButton({required this.onTap});

  @override
  State<_AppointmentButton> createState() => _AppointmentButtonState();
}

class _AppointmentButtonState extends State<_AppointmentButton> {
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
              const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          decoration: BoxDecoration(
            color: _hovered ? AppTheme.primaryDark : AppTheme.primary,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text('Appointment', style: AppTheme.buttonText),
        ),
      ),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  final Map<String, GlobalKey> sectionKeys;
  const _MobileMenu({required this.sectionKeys});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: AppContent.navLinks.map((link) {
          return ListTile(
            dense: true,
            title: Text(link['label']!, style: AppTheme.navLabel),
            onTap: () {},
          );
        }).toList(),
      ),
    );
  }
}
