import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillProgress extends StatelessWidget {
  const SkillProgress({super.key, required this.name, required this.value});
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