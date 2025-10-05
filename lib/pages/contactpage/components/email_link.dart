import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailLink extends StatefulWidget {
  const EmailLink({required this.email, required this.style, required this.accent});
  final String email;
  final TextStyle style;
  final Color accent;

  @override
  State<EmailLink> createState() => _EmailLinkState();
}

class _EmailLinkState extends State<EmailLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final s = widget.style.copyWith(
      color: _hover ? widget.accent.withOpacity(0.9) : widget.accent,
      decorationColor: _hover ? widget.accent : widget.accent,
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: () async {
          final uri = Uri(
            scheme: 'mailto',
            path: widget.email,
            queryParameters: {'subject': 'Let’s collaborate'},
          );
          await launchUrl(uri);
        },
        onLongPress: () async {
          await Clipboard.setData(ClipboardData(text: widget.email));
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Email copied to clipboard', style: GoogleFonts.inter()),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.black87,
                duration: const Duration(seconds: 1),
              ),
            );
          }
        },
        child: Text(widget.email, style: s),
      ),
    );
  }
}