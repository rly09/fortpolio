import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'components/models.dart';
import 'components/project_grid.dart';
import 'components/seemore_link.dart';
import 'components/ticker_headline.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  // Dark theme to match the screenshot
  static const Color _bg = Color(0xFF0B1020); // deep navy
  static const Color _text = Colors.white;
  static const Color _muted = Color(0xCCFFFFFF);
  static const Color _accent = Color(0xFFFFE6D9); // matches your About/Skills accent

  final List<Project> _projects = const [
    Project(
      title: 'Fintech Website Design',
      subtitle: 'Product Design / 2023',
      imagePath: 'assets/profile/profile.jpg',
      tags: ['Website', 'UI/UX', 'Design System'],
      url: null, // e.g., 'https://dribbble.com/your-shot'
    ),
    Project(
      title: 'Career Verse',
      subtitle: 'AI Career navigation app',
      imagePath: 'assets/project/career verse.png',
      tags: ['Web App', 'Product', 'Mobile-first'],
      url: null,
    ),
    Project(
      title: 'eCommerce App Design',
      subtitle: 'Product Design / 2019',
      imagePath: 'assets/profile/profile.jpg',
      tags: ['eCommerce', 'Prototype', 'Checkout'],
      url: null,
    ),
    Project(
      title: 'Sale Managements Design',
      subtitle: 'Product Design / 2019',
      imagePath: 'assets/profile/profile.jpg',
      tags: ['Dashboard', 'Analytics', 'B2B'],
      url: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final body = GoogleFonts.inter(color: _text);

    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: DefaultTextStyle(
                style: body,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TickerHeadline(),
                    const SizedBox(height: 24),
                    ProjectGrid(projects: _projects),
                    const SizedBox(height: 36),
                    SeeMoreLink(
                      label: 'See more',
                      onTap: () {
                        launchUrlString('https://github.com/rly09');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}