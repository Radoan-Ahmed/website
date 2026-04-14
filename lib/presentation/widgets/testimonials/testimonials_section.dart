import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/models.dart';

class TestimonialsSection extends StatefulWidget {
  final List<TestimonialModel> testimonials;
  const TestimonialsSection({super.key, required this.testimonials});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goTo(int index) {
    setState(() => _currentIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;

    return Container(
      color: AppTheme.white,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80, vertical: 70),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 32, height: 2, color: AppTheme.primary),
              const SizedBox(width: 10),
              Text(
                'TESTIMONIALS',
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
          Text('What Our Patients Say', style: AppTheme.heading2),
          const SizedBox(height: 48),
          SizedBox(
            height: isMobile ? 320 : 260,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.testimonials.length,
              onPageChanged: (i) => setState(() => _currentIndex = i),
              itemBuilder: (ctx, i) =>
                  _TestimonialCard(testimonial: widget.testimonials[i]),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _NavBtn(
                icon: Icons.arrow_back,
                onTap: _currentIndex > 0
                    ? () => _goTo(_currentIndex - 1)
                    : null,
              ),
              const SizedBox(width: 12),
              ...List.generate(
                widget.testimonials.length,
                (i) => GestureDetector(
                  onTap: () => _goTo(i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentIndex == i ? 28 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentIndex == i
                          ? AppTheme.primary
                          : AppTheme.divider,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              _NavBtn(
                icon: Icons.arrow_forward,
                onTap: _currentIndex < widget.testimonials.length - 1
                    ? () => _goTo(_currentIndex + 1)
                    : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  final TestimonialModel testimonial;
  const _TestimonialCard({required this.testimonial});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 40),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppTheme.lightGrey,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\u201C',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 60,
                  color: AppTheme.primary,
                  height: 0.8,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(testimonial.title,
                        style: AppTheme.heading4
                            .copyWith(color: AppTheme.primary)),
                    const SizedBox(height: 10),
                    Text(
                      testimonial.review,
                      style: AppTheme.bodyMedium,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: AppTheme.primary.withOpacity(0.15),
                child: Icon(Icons.person,
                    color: AppTheme.primary, size: 24),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(testimonial.name,
                      style: AppTheme.heading4.copyWith(fontSize: 14)),
                  Text(testimonial.location,
                      style: AppTheme.bodySmall),
                ],
              ),
              const Spacer(),
              Row(
                children: List.generate(
                    5,
                    (_) => const Icon(Icons.star,
                        color: Colors.amber, size: 16)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavBtn extends StatefulWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const _NavBtn({required this.icon, this.onTap});

  @override
  State<_NavBtn> createState() => _NavBtnState();
}

class _NavBtnState extends State<_NavBtn> {
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
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: (_hovered && widget.onTap != null)
                ? AppTheme.primary
                : AppTheme.lightGrey,
            border: Border.all(color: AppTheme.divider),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(
            widget.icon,
            size: 18,
            color: (_hovered && widget.onTap != null)
                ? Colors.white
                : (widget.onTap != null
                    ? AppTheme.dark
                    : AppTheme.divider),
          ),
        ),
      ),
    );
  }
}
