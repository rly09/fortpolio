import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.accent, required this.isDesktop});

  final Color accent;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    final h1 = GoogleFonts.inter(
      fontSize: isDesktop ? 56 : 36,
      fontWeight: FontWeight.w900,
      height: 1.05,
      color: Colors.black,
    );

    final sub = GoogleFonts.inter(
      fontSize: isDesktop ? 18 : 16,
      height: 1.6,
      color: Colors.black.withOpacity(0.8),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Skills & Tools', style: h1),
        const SizedBox(height: 12),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 780),
          child: Text(
            'I design and build interfaces with a focus on performance, '
                'accessibility and thoughtful micro-interactions. Here’s the stack I use every day.',
            style: sub,
          ),
        ),
      ],
    );
  }
}