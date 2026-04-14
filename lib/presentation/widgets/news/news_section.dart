import 'package:flutter/material.dart';
import '../../../core/constants/app_content.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/models.dart';
import '../services/services_section.dart';

class NewsSection extends StatelessWidget {
  final List<NewsModel> news;
  const NewsSection({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;
    final crossAxisCount = isMobile ? 1 : (width < 1000 ? 2 : 3);

    return Container(
      color: AppTheme.lightGrey,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80, vertical: 70),
      child: Column(
        children: [
          SectionHeader(
            label: 'Blog & News',
            title: AppContent.newsSectionTitle,
            subtitle: AppContent.newsSectionSubtitle,
          ),
          const SizedBox(height: 48),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 0.9,
            ),
            itemCount: news.length,
            itemBuilder: (ctx, i) => _NewsCard(news: news[i]),
          ),
        ],
      ),
    );
  }
}

class _NewsCard extends StatefulWidget {
  final NewsModel news;
  const _NewsCard({required this.news});

  @override
  State<_NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<_NewsCard> {
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
              blurRadius: _hovered ? 30 : 12,
              offset: Offset(0, _hovered ? 12 : 4),
            ),
          ],
        ),
        transform: _hovered
            ? (Matrix4.identity()..translate(0.0, -6.0))
            : Matrix4.identity(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12)),
                  child: SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: Image.network(
                      widget.news.image,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: AppTheme.accent,
                        child: Icon(Icons.article,
                            size: 50, color: AppTheme.primary),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      widget.news.category,
                      style: AppTheme.caption.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_today_outlined,
                          size: 12, color: AppTheme.mediumGrey),
                      const SizedBox(width: 4),
                      Text(widget.news.date,
                          style: AppTheme.caption),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.news.title,
                    style: AppTheme.heading4.copyWith(fontSize: 15),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 14),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          'Read More',
                          style: AppTheme.bodySmall.copyWith(
                            color: _hovered
                                ? AppTheme.primary
                                : AppTheme.darkGrey,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(Icons.arrow_forward,
                            size: 14,
                            color: _hovered
                                ? AppTheme.primary
                                : AppTheme.darkGrey),
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
