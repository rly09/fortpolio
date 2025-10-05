/* ---------------- Header (auto-scrolling marquee) ---------------- */
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class TickerHeadline extends StatefulWidget {
  const TickerHeadline();

  @override
  State<TickerHeadline> createState() => _TickerHeadlineState();
}

class _TickerHeadlineState extends State<TickerHeadline> with SingleTickerProviderStateMixin {
  final ScrollController _controller = ScrollController();
  final GlobalKey _segmentKey = GlobalKey();

  late final Ticker _ticker;
  Duration _last = Duration.zero;

  bool _paused = false;
  double _segmentWidth = 0;
  final double _speed = 70; // px per second (tweak to taste)

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_onTick);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _measureSegment();
      _ticker.start();
    });
  }

  void _onTick(Duration elapsed) {
    final double dt = (elapsed - _last).inMicroseconds / 1e6;
    _last = elapsed;

    if (_paused || !_controller.hasClients || _segmentWidth == 0) return;

    double next = _controller.offset + _speed * dt;

    // Seamless loop: when we've scrolled past one segment, wrap back by one segment width
    if (next >= _segmentWidth) {
      next -= _segmentWidth;
    }
    // jumpTo is fine here because movement is tiny each frame
    _controller.jumpTo(next);
  }

  void _measureSegment() {
    final ctx = _segmentKey.currentContext;
    if (ctx != null) {
      final box = ctx.findRenderObject() as RenderBox?;
      if (box != null) {
        setState(() => _segmentWidth = box.size.width);
      }
    }
  }

  @override
  void dispose() {
    _ticker.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final headline = GoogleFonts.inter(
      fontSize: 34,
      fontWeight: FontWeight.w800,
      color: Colors.white,
      height: 1.1,
      letterSpacing: -0.5,
    );

    return SizedBox(
      height: 56,
      child: MouseRegion(
        onEnter: (_) => setState(() => _paused = true),
        onExit: (_) => setState(() => _paused = false),
        child: ListView(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const SizedBox(width: 12),
            _TickerSegment(key: _segmentKey, textStyle: headline),
            // Duplicate segments to enable seamless wrap-around
            _TickerSegment(textStyle: headline),
            _TickerSegment(textStyle: headline),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}

class _TickerSegment extends StatelessWidget {
  const _TickerSegment({super.key, required this.textStyle});
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    // One segment = multiple tiles. Duplicate of this segment is placed side-by-side.
    const tiles = 8; // adjust if you want denser/sparser repeats
    return Row(
      children: List.generate(
        tiles,
            (i) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            children: [
              Text('⚙', style: textStyle.copyWith(color: Colors.white70)),
              const SizedBox(width: 10),
              Text('Selected Projects', style: textStyle),
            ],
          ),
        ),
      ),
    );
  }
}