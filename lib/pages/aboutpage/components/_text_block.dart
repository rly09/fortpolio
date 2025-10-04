import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../about_page.dart';
import '_more_info_button.dart';

class TextBlock extends StatelessWidget {
  const TextBlock({super.key, required this.desktop});

  final bool desktop;

  static const String _name = 'Roshan Lal Yogi';
  static const String _bio =
      'A designer & developer based on planet Earth. I work as a freelancer with agencies, start-ups and individuals, helping them build products and achieve their goals. I have a fondness for clean design, subtle interactions and interactive development. Fun fact, I have a degree in pastry.';


  @override
  Widget build(BuildContext context) {
    final h1 = GoogleFonts.inter(
      fontSize: desktop ? 56 : 36,
      fontWeight: FontWeight.w700,
      height: 1.05,
      color: Colors.black,
    );

    final h1Name = GoogleFonts.inter(
      fontSize: desktop ? 64 : 42,
      fontWeight: FontWeight.w900,
      height: 1.05,
      color: Colors.black,
    );

    final body = GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      fontSize: desktop ? 18 : 16,
      height: 1.6,
      color: Colors.black.withOpacity(0.8),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hey, there 👋', style: h1),
        const SizedBox(height: 6),
        Text("I'm $_name", style: h1Name),
        const SizedBox(height: 24),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Text(_bio, style: body),
        ),
        const SizedBox(height: 28),
        const MoreInfoButton(label: 'More information'),
      ],
    );
  }
}