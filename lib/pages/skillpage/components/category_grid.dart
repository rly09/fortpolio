import 'package:flutter/material.dart';

import 'category_card.dart';

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

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key, required this.categories});
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
          itemBuilder: (context, i) => CategoryCard(category: categories[i]),
        );
      },
    );
  }
}