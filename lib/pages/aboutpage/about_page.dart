import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/_portrait_card.dart';
import 'components/_text_block.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 100),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 900;
                return isMobile ? _buildMobile(context) : _buildDesktop(context);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left: Headline + bio
        Expanded(
          flex: 6,
          child: TextBlock(desktop: true),
        ),
        const SizedBox(width: 40),
        // Right: Portrait card
        Expanded(
          flex: 5,
          child: PortraitCard(),
        ),
      ],
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        PortraitCard(height: 360),
        SizedBox(height: 24),
        TextBlock(desktop: false),
      ],
    );
  }
}

