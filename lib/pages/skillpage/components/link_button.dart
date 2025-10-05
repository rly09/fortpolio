import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkButton extends StatefulWidget {
  const LinkButton({super.key, required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  State<LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<LinkButton> {
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