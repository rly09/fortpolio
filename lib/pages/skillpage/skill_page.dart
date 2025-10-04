import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                      _Header(accent: _accent, isDesktop: isDesktop),
                      const SizedBox(height: 32),
                      _CategoryGrid(categories: _categories),
                      const SizedBox(height: 28),
                      _Toolbox(toolbox: _toolbox, accent: _accent),
                      const SizedBox(height: 40),
                      _LinkButton(
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

/* ---------- Header ---------- */

class _Header extends StatelessWidget {
  const _Header({required this.accent, required this.isDesktop});

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

/* ---------- Stats Row ---------- */

class _Stat {
  final String value;
  final String label;
  const _Stat(this.value, this.label);
}

class _StatCard extends StatefulWidget {
  const _StatCard({required this.value, required this.label});
  final String value;
  final String label;

  @override
  State<_StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<_StatCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final valueStyle = GoogleFonts.inter(
      fontSize: 28,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    );
    final labelStyle = GoogleFonts.inter(
      fontSize: 14,
      color: Colors.black.withOpacity(0.7),
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12),
          boxShadow: _hover
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 18,
              offset: const Offset(0, 10),
            )
          ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.value, style: valueStyle),
            const SizedBox(width: 10),
            Text(widget.label, style: labelStyle),
          ],
        ),
      ),
    );
  }
}

/* ---------- Category Grid ---------- */

class SkillCategory {
  final String title;
  final IconData icon;
  final List<SkillItem> skills;
  SkillCategory({required this.title, required this.icon, required this.skills});
}

class SkillItem {
  final String name;
  final double level; // 0..1
  const SkillItem(this.name, this.level);
}

class _CategoryGrid extends StatelessWidget {
  const _CategoryGrid({required this.categories});
  final List<SkillCategory> categories;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final isTwoCol = c.maxWidth >= 900;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isTwoCol ? 2 : 1,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: isTwoCol ? 1.4 : 1.2,
          ),
          itemCount: categories.length,
          itemBuilder: (context, i) => _CategoryCard(category: categories[i]),
        );
      },
    );
  }
}

class _CategoryCard extends StatefulWidget {
  const _CategoryCard({required this.category});
  final SkillCategory category;

  @override
  State<_CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<_CategoryCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOut,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.black12),
          boxShadow: _hover
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 24,
              offset: const Offset(0, 14),
            )
          ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(widget.category.icon, color: Colors.black, size: 24),
                const SizedBox(width: 10),
                Text(widget.category.title, style: titleStyle),
              ],
            ),
            const SizedBox(height: 16),
            ...widget.category.skills.map((s) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: _SkillProgress(name: s.name, value: s.level),
            )),
          ],
        ),
      ),
    );
  }
}

class _SkillProgress extends StatelessWidget {
  const _SkillProgress({required this.name, required this.value});
  final String name;
  final double value;

  @override
  Widget build(BuildContext context) {
    final nameStyle = GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black.withOpacity(0.85),
    );
    final percentStyle = GoogleFonts.inter(
      fontSize: 12,
      color: Colors.black.withOpacity(0.7),
    );

    final perc = (value * 100).round();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text(name, style: nameStyle)),
            Text('$perc%', style: percentStyle),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: LinearProgressIndicator(
            value: value.clamp(0, 1),
            minHeight: 8,
            backgroundColor: Colors.black12,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          ),
        ),
      ],
    );
  }
}

/* ---------- Toolbox (chips) ---------- */

class _Toolbox extends StatelessWidget {
  const _Toolbox({required this.toolbox, required this.accent});
  final List<String> toolbox;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final title = GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Toolbelt', style: title),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: toolbox.map((t) => _ToolChip(label: t, accent: accent)).toList(),
        ),
      ],
    );
  }
}

class _ToolChip extends StatefulWidget {
  const _ToolChip({required this.label, required this.accent});
  final String label;
  final Color accent;

  @override
  State<_ToolChip> createState() => _ToolChipState();
}

class _ToolChipState extends State<_ToolChip> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final labelStyle = GoogleFonts.inter(
      fontSize: 13,
      fontWeight: FontWeight.w700,
      color: Colors.black.withOpacity(0.9),
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 140),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: _hover ? widget.accent.withOpacity(0.8) : widget.accent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black12),
          boxShadow: _hover
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 16,
              offset: const Offset(0, 10),
            )
          ]
              : [],
        ),
        child: Text(widget.label, style: labelStyle),
      ),
    );
  }
}

/* ---------- Link button (matches AboutPage vibe) ---------- */

class _LinkButton extends StatefulWidget {
  const _LinkButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  State<_LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<_LinkButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final color = _hover ? Colors.black : Colors.black87;

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: InkWell(
        onTap: widget.onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: color, width: 1.4),
              ),
              alignment: Alignment.center,
              child: Icon(Icons.arrow_forward, size: 16, color: color),
            ),
            const SizedBox(width: 12),
            Text(
              widget.label.toUpperCase(),
              style: GoogleFonts.inter(
                letterSpacing: 0.6,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}