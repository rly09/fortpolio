import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextLink extends StatefulWidget {
  const TextLink({super.key, required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  State<TextLink> createState() => _TextLinkState();
}

class _TextLinkState extends State<TextLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.inter(
      color: _hover ? Colors.white : Colors.white70,
      fontWeight: FontWeight.w600,
      decoration: _hover ? TextDecoration.underline : TextDecoration.none,
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(widget.label, style: style),
      ),
    );
  }
}