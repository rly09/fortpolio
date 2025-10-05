import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToolChip extends StatefulWidget {
  const ToolChip({super.key, required this.label, required this.accent});
  final String label;
  final Color accent;

  @override
  State<ToolChip> createState() => _ToolChipState();
}

class _ToolChipState extends State<ToolChip> {
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
