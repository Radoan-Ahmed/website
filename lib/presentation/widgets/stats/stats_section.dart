import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/models.dart';

class StatsSection extends StatelessWidget {
  final List<StatModel> stats;
  const StatsSection({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;

    return Container(
      color: AppTheme.primary,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80, vertical: 50),
      child: isMobile
          ? Column(
              children: stats
                  .map((s) => Padding(
                        padding: const EdgeInsets.only(bottom: 28),
                        child: _StatCounter(stat: s),
                      ))
                  .toList(),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: stats
                  .map((s) => Expanded(child: _StatCounter(stat: s)))
                  .toList(),
            ),
    );
  }
}

class _StatCounter extends StatefulWidget {
  final StatModel stat;
  const _StatCounter({required this.stat});

  @override
  State<_StatCounter> createState() => _StatCounterState();
}

class _StatCounterState extends State<_StatCounter> {
  late int _displayValue;
  int _targetValue = 0;
  Timer? _timer;
  bool _started = false;

  @override
  void initState() {
    super.initState();
    _targetValue = int.tryParse(widget.stat.value) ?? 0;
    _displayValue = 0;
  }

  void _startCounting() {
    if (_started) return;
    _started = true;
    final steps = 60;
    final increment = _targetValue / steps;
    int step = 0;
    _timer = Timer.periodic(const Duration(milliseconds: 30), (t) {
      step++;
      if (step >= steps) {
        setState(() => _displayValue = _targetValue);
        t.cancel();
      } else {
        setState(() => _displayValue = (increment * step).round());
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('stat_${widget.stat.label}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.3) _startCounting();
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$_displayValue',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 52,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                widget.stat.suffix,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            widget.stat.label,
            style: GoogleFonts.lato(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
