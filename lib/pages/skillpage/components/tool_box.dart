import 'package:flutter/material.dart';
import 'package:fortpolio/pages/skillpage/components/tool_chip.dart';
import 'package:google_fonts/google_fonts.dart';

class Toolbox extends StatelessWidget {
  const Toolbox({super.key, required this.toolbox, required this.accent});
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
          children: toolbox.map((t) => ToolChip(label: t, accent: accent)).toList(),
        ),
      ],
    );
  }
}