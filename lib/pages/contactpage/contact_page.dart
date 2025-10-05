import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

import 'components/email_link.dart';
import 'components/model.dart';
import 'components/social_grid.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  static const Color _bg = Color(0xFF0B1020);
  static const Color _text = Colors.white;
  static const Color _muted = Color(0xCCFFFFFF);
  static const Color _accent = Colors.green;

  final String _email = 'yogiroshan2005@gmail.com.com';

  final List<Social> _socials = const [
    Social('LinkedIn', 'https://www.linkedin.com/in/roshan-lal-yogi-495569316'),
    Social('GitHub', 'https://github.com/rly09'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: LayoutBuilder(
                builder: (context, c) {
                  final bool isWide = c.maxWidth >= 900;

                  final titleStyle = GoogleFonts.inter(
                    color: _text,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                    height: 1.1,
                    fontSize: isWide ? 56 : 34,
                  );
                  final bigAccent = GoogleFonts.inter(
                    color: _accent,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                    height: 1.1,
                    fontSize: isWide ? 64 : 36,
                    decoration: TextDecoration.underline,
                    decorationColor: _accent,
                    decorationThickness: isWide ? 3 : 2,
                  );
                  final small = GoogleFonts.inter(
                    color: _muted,
                    fontSize: 13,
                    height: 1.6,
                  );

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Hero block
                      Text('Have a Cool Project idea?', style: titleStyle),
                      const SizedBox(height: 10),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 12,
                        runSpacing: 8,
                        children: [
                          EmailLink(
                            email: _email,
                            style: bigAccent,
                            accent: _accent,
                          ),
                          Icon(
                            Icons.arrow_right_alt_rounded,
                            color: _accent,
                            size: isWide ? 42 : 32,
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text('for collaborations.', style: titleStyle),
                      const SizedBox(height: 64),

                      isWide
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(width: 24),
                                Expanded(
                                  flex: 8,
                                  child: SocialsGrid(socials: _socials),
                                ),
                              ],
                            )
                          : SocialsGrid(socials: _socials),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}