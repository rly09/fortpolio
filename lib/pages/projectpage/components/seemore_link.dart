import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SeeMoreLink extends StatefulWidget {
  const SeeMoreLink({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  State<SeeMoreLink> createState() => _SeeMoreLinkState();
}

class _SeeMoreLinkState extends State<SeeMoreLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.inter(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.4,
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.label, style: style),
            const SizedBox(width: 10),
            AnimatedContainer(
              duration: const Duration(milliseconds: 160),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withOpacity(_hover ? 1 : 0.85),
                  width: 1.4,
                ),
              ),
              alignment: Alignment.center,
              child: Icon(Icons.arrow_forward, size: 14, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}