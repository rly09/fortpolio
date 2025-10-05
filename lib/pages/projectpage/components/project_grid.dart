import 'package:flutter/material.dart';
import 'package:fortpolio/pages/projectpage/components/project_card.dart';

import 'models.dart';

class ProjectGrid extends StatelessWidget {
  const ProjectGrid({super.key, required this.projects});
  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        int cross;
        if (c.maxWidth >= 1100) {
          cross = 3;
        } else if (c.maxWidth >= 700) {
          cross = 2;
        } else {
          cross = 1;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: cross,
            crossAxisSpacing: 24,
            mainAxisSpacing: 32,
            childAspectRatio: cross == 1 ? 0.90 : 0.98,
          ),
          itemCount: projects.length,
          itemBuilder: (_, i) => ProjectCard(project: projects[i]),
        );
      },
    );
  }
}