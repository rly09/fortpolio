import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class _Stat {
  final String value;
  final String label;
  const _Stat(this.value, this.label);
}

class StatCard extends StatefulWidget {
  const StatCard({super.key, required this.value, required this.label});
  final String value;
  final String label;

  @override
  State<StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<StatCard> {
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
