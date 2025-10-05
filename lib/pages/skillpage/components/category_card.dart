import 'package:flutter/material.dart';
import 'package:fortpolio/pages/skillpage/components/skill_progress.dart';
import 'package:google_fonts/google_fonts.dart';
import 'category_grid.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({super.key, required this.category});
  final SkillCategory category;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
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
              child: SkillProgress(name: s.name, value: s.level),
            )),
          ],
        ),
      ),
    );
  }
}