import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/category_card.dart';
import 'components/category_grid.dart';
import 'components/header.dart';
import 'components/link_button.dart';
import 'components/tool_box.dart';
import 'components/tool_chip.dart';

class SkillPage extends StatefulWidget {
  const SkillPage({super.key});

  @override
  State<SkillPage> createState() => _SkillPageState();
}

class _SkillPageState extends State<SkillPage> {
  static const Color _accent = Color(0xFFFFE6D9);

  final List<SkillCategory> _categories = [
    SkillCategory(
      title: 'Frontend & Mobile',
      icon: Icons.flutter_dash,
      skills: const [
        SkillItem('Flutter', 0.92),
        SkillItem('Dart', 0.90),
      ],
    ),
    SkillCategory(
      title: 'Backend',
      icon: Icons.storage_rounded,
      skills: const [
        SkillItem('FastAPI', 0.75),
        SkillItem('Supabase', 0.83),
        SkillItem('Firebase', 0.65),
        SkillItem('Django', 0.70),
      ],
    ),
    SkillCategory(
      title: 'Design',
      icon: Icons.draw_rounded,
      skills: const [
        SkillItem('UI/UX', 0.78),
        SkillItem('Figma', 0.82),
        SkillItem('Prototyping', 0.70),
        SkillItem('Accessibility', 0.65),
      ],
    ),
    SkillCategory(
      title: 'Tools & Workflow',
      icon: Icons.build_rounded,
      skills: const [
        SkillItem('Git & GitHub', 0.86),
        SkillItem('CI/CD', 0.64),
        SkillItem('Docker', 0.52),
        SkillItem('Testing', 0.62),
      ],
    ),
  ];

  final List<String> _toolbox = const [
    'Flutter', 'Dart', 'Riverpod', 'Bloc',
    'Firebase', 'Supabase', 'SQLite',
    'FastAPI',
    'REST', 'GraphQL',
    'Git', 'GitHub Actions',
    'Docker',
    'Figma',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isDesktop = constraints.maxWidth >= 900;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Header(accent: _accent, isDesktop: isDesktop),
                      const SizedBox(height: 32),
                      CategoryGrid(categories: _categories),
                      const SizedBox(height: 28),
                      Toolbox(toolbox: _toolbox, accent: _accent),
                      const SizedBox(height: 40),
                      LinkButton(
                        label: 'View résumé',
                        onTap: () {
                          // TODO: open your resume link or route
                          // launchUrlString('https://your-resume-link.com');
                          // or Navigator.pushNamed(context, '/resume');
                        },
                      ),
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