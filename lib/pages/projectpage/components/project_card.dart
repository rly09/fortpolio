import 'package:flutter/material.dart';
import 'package:fortpolio/pages/projectpage/components/tag.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ghost_button.dart';
import 'models.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key, required this.project});
  final Project project;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final subtitle = GoogleFonts.inter(
      fontSize: 12,
      color: Colors.white70,
      letterSpacing: 0.2,
    );
    final title = GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w800,
      color: Colors.white,
      height: 1.3,
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOut,
        transform: _hover ? Matrix4.translationValues(0, -4, 0) : Matrix4.identity(),
        child: GestureDetector(
          onTap: () {
            // TODO: open detail page or URL
            // if (widget.project.url != null) launchUrlString(widget.project.url!);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Screenshot
              AspectRatio(
                aspectRatio: 4 / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Image
                      Image.asset(
                        widget.project.imagePath,
                        fit: BoxFit.cover,
                      ),
                      // Subtle gradient overlay on hover
                      AnimatedOpacity(
                        opacity: _hover ? 1 : 0,
                        duration: const Duration(milliseconds: 160),
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Color(0xAA000000), Colors.transparent],
                            ),
                          ),
                        ),
                      ),
                      // CTA and tags on hover
                      AnimatedOpacity(
                        opacity: _hover ? 1 : 0,
                        duration: const Duration(milliseconds: 160),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                spacing: 6,
                                runSpacing: 6,
                                children: widget.project.tags
                                    .map((t) => Tag(label: t))
                                    .toList(),
                              ),
                              const Spacer(),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: GhostButton(
                                  label: 'View project',
                                  icon: Icons.arrow_outward_rounded,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(widget.project.subtitle, style: subtitle),
              const SizedBox(height: 6),
              Text(widget.project.title, style: title, maxLines: 2),
            ],
          ),
        ),
      ),
    );
  }
}