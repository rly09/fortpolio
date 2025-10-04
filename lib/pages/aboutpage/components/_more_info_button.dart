import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoreInfoButton extends StatefulWidget {
  const MoreInfoButton({super.key, required this.label});

  final String label;

  @override
  State<MoreInfoButton> createState() => MoreInfoButtonState();
}

class MoreInfoButtonState extends State<MoreInfoButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final color = _hovering ? Colors.black : Colors.black87;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: InkWell(
        onTap: () {
          // Navigator.pushNamed(context, '/more');
        },
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
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}